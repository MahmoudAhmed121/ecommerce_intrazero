enum LoginStateStatus {
  initial,
  loading,
  suscess,
  error,

}

class LoginState {
  final LoginStateStatus? status;

  LoginState._({
    this.status,
  });

  static LoginState initial = LoginState._(
    status: LoginStateStatus.initial,
  );

  LoginState init() => copyWith(status: LoginStateStatus.initial);

  LoginState loading() => copyWith(status: LoginStateStatus.loading);

  LoginState error() => copyWith(status: LoginStateStatus.error);

  LoginState copyWith({
    LoginStateStatus? status,
  }) {
    return LoginState._(
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'LoginState(status: $status)';
}
