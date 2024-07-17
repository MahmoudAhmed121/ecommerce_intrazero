enum RegisStateStatus {
  initial,
  loading,
  suscess,
  error,
}

class RegisState {
  final RegisStateStatus? status;
  final String? errorMessage;

  RegisState._({
    this.status,
    this.errorMessage,
  });

  static RegisState initial = RegisState._(
    status: RegisStateStatus.initial,
    errorMessage: null,
  );

  RegisState init() => copyWith(status: RegisStateStatus.initial);

  RegisState loading() => copyWith(status: RegisStateStatus.loading);

  RegisState suscess() => copyWith(status: RegisStateStatus.suscess);

  RegisState error() => copyWith(status: RegisStateStatus.error);

  RegisState copyWith({
    RegisStateStatus? status,
    String? errorMessage,
  }) {
    return RegisState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() => 'RegisState(status: $status)';
}
