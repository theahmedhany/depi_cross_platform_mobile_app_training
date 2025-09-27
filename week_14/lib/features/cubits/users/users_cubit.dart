import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersInitial());

  Future<void> loadUsers() async {
    emit(const UsersLoading());
    try {
      final query = await FirebaseFirestore.instance.collection('users').get();
      final users = query.docs.map((doc) => doc.data()).toList();
      emit(UsersLoaded(users));
    } catch (e) {
      emit(UsersFailure(e.toString()));
    }
  }
}
