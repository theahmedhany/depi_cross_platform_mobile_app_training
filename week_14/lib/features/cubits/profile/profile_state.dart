import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  final Map<String, dynamic>? profile;
  const ProfileLoaded(this.profile);

  @override
  List<Object?> get props => [profile ?? {}];
}

class ProfileFailure extends ProfileState {
  final String error;
  const ProfileFailure(this.error);

  @override
  List<Object?> get props => [error];
}
