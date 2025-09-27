import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileInitial());

  Future<void> loadProfile() async {
    emit(const ProfileLoading());
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('No user logged in');
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      emit(ProfileLoaded(doc.data()));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }

  Future<String?> _uploadImage(XFile image, String userId) async {
    try {
      final file = File(image.path);

      if (!await file.exists()) {
        throw Exception('Image file not found');
      }

      final fileSize = await file.length();
      if (fileSize > 5 * 1024 * 1024) {
        throw Exception(
          'Image file is too large. Please choose a smaller image.',
        );
      }

      try {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_pictures')
            .child('$userId.jpg');

        final uploadTask = storageRef.putFile(
          file,
          SettableMetadata(
            contentType: 'image/jpeg',
            customMetadata: {
              'uploaded_by': userId,
              'uploaded_at': DateTime.now().toIso8601String(),
            },
          ),
        );

        final snapshot = await uploadTask;
        final downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } on FirebaseException catch (storageError) {
        if (storageError.code == 'object-not-found' ||
            storageError.code == 'bucket-not-found' ||
            storageError.message?.contains('404') == true) {
          final bytes = await file.readAsBytes();
          final base64Image = base64Encode(bytes);

          await FirebaseFirestore.instance
              .collection('user_images')
              .doc(userId)
              .set({
                'image_data': base64Image,
                'uploaded_at': FieldValue.serverTimestamp(),
                'content_type': 'image/jpeg',
              });

          return 'base64://$userId';
        } else {
          rethrow;
        }
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'unauthorized':
          throw Exception('You don\'t have permission to upload images');
        case 'canceled':
          throw Exception('Upload was canceled');
        case 'unknown':
          throw Exception('An unknown error occurred during upload');
        default:
          throw Exception('Upload failed: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to upload image: ${e.toString()}');
    }
  }

  Future<void> updateProfile({
    required String name,
    required String bio,
    XFile? image,
  }) async {
    emit(const ProfileLoading());
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('No user logged in');

      String? imageUrl;
      if (image != null) {
        imageUrl = await _uploadImage(image, user.uid);
      }

      final profileData = {'name': name, 'bio': bio, 'email': user.email};

      if (imageUrl != null) {
        profileData['profilePicture'] = imageUrl;
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(profileData, SetOptions(merge: true));

      await loadProfile();
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}
