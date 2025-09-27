import 'package:equatable/equatable.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {
  const UsersInitial();
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersLoaded extends UsersState {
  final List<Map<String, dynamic>> users;
  const UsersLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class UsersFailure extends UsersState {
  final String error;
  const UsersFailure(this.error);

  @override
  List<Object?> get props => [error];
}
