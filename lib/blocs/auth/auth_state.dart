// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

enum AuthStatus {
  unknow,
  authentificated,
  unauthentificated,
}

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final fb_auth.User? user;
  const AuthState({
    required this.authStatus,
    this.user,
  });

  factory AuthState.unknown() {
    return const AuthState(authStatus: AuthStatus.unknow);
  }

  @override
  List<Object?> get props => [authStatus, user];

  @override
  bool get stringify => true;

  AuthState copyWith({
    AuthStatus? authStatus,
    fb_auth.User? user,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }
}
