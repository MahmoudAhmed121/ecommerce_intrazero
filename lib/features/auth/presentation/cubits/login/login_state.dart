enum LoginStateStatus {
  initial,
  loading,
  suscess,
  error,
}

class LoginState {
  final LoginStateStatus? status;
  final String? errorMessage;

  LoginState._({
    this.status,
    this.errorMessage,
  });

  static LoginState initial = LoginState._(
    status: LoginStateStatus.initial,
    errorMessage: null,
  );

  LoginState init() => copyWith(status: LoginStateStatus.initial);

  LoginState loading() => copyWith(status: LoginStateStatus.loading);

  LoginState suscess() => copyWith(status: LoginStateStatus.suscess);

  LoginState error() => copyWith(status: LoginStateStatus.error);

  LoginState copyWith({
    LoginStateStatus? status,
    String? errorMessage,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() => 'LoginState(status: $status)';
}
