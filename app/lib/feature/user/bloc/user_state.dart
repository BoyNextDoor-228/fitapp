part of 'user_bloc.dart';

class UserState extends Equatable {
  factory UserState.initial() => const UserState._(
        status: UserStatus.initial,
        presence: UserPresence.absent,
        user: null,
      );

  factory UserState.loading({
    required User? user,
  }) =>
      UserState._(
        status: UserStatus.loading,
        presence: user == null ? UserPresence.absent : UserPresence.present,
        user: user,
      );

  factory UserState.success({required User? user}) => UserState._(
        status: UserStatus.success,
        presence: user == null ? UserPresence.absent : UserPresence.present,
        user: user,
      );

  factory UserState.error({
    required User? user,
    required String errorMessage,
  }) =>
      UserState._(
        status: UserStatus.error,
        presence: user == null ? UserPresence.absent : UserPresence.present,
        user: user,
        errorMessage: errorMessage,
      );

  const UserState._({
    required this.status,
    required this.user,
    required this.presence,
    this.errorMessage,
  });

  final UserStatus status;
  final User? user;
  final String? errorMessage;
  final UserPresence presence;

  @override
  List<Object?> get props => [user, status, presence];
}

enum UserStatus { initial, loading, success, error }

enum UserPresence { absent, present }
