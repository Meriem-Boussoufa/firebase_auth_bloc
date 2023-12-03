part of 'signin_cubit.dart';

enum SigninStatus {
  initial,
  submitting,
  sucess,
  error,
}

class SigninState extends Equatable {
  final SigninStatus signinStatus;
  final CustomError error;
  const SigninState({
    required this.signinStatus,
    required this.error,
  });

  factory SigninState.initial() {
    return const SigninState(
      signinStatus: SigninStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [signinStatus, error];

  @override
  bool get stringify => true;

  SigninState copyWith({
    SigninStatus? signinStatus,
    CustomError? error,
  }) {
    return SigninState(
      signinStatus: signinStatus ?? this.signinStatus,
      error: error ?? this.error,
    );
  }
}
