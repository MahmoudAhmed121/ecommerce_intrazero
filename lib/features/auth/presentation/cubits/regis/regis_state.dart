enum RegisStateStatus {
  initial,
  loading,
  suscess,
  error,

}

class RegisState {
  final RegisStateStatus? status;

  RegisState._({
    this.status,
  });

  static RegisState initial = RegisState._(
    status: RegisStateStatus.initial,
  );

  RegisState init() => copyWith(status: RegisStateStatus.initial);

  RegisState loading() => copyWith(status: RegisStateStatus.loading);

  RegisState error() => copyWith(status: RegisStateStatus.error);

  RegisState copyWith({
    RegisStateStatus? status,
  }) {
    return RegisState._(
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'RegisState(status: $status)';
}
