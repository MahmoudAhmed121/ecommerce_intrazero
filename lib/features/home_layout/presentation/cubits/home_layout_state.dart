enum HomeLayoutStateStatus {
  initial,
  loading,
  success,
  failure,
}

class HomeLayoutState {
  final HomeLayoutStateStatus? status;
  int? currentIndex;

  static HomeLayoutState initial = HomeLayoutState._(
    status: HomeLayoutStateStatus.initial,
  );

  HomeLayoutState._({
    this.status,
    this.currentIndex,
  });

  HomeLayoutState init() => copyWith(status: HomeLayoutStateStatus.initial);

  HomeLayoutState loading() => copyWith(status: HomeLayoutStateStatus.loading);

  HomeLayoutState error() => copyWith(status: HomeLayoutStateStatus.failure);

  HomeLayoutState success() => copyWith(status: HomeLayoutStateStatus.success);

  HomeLayoutState copyWith({
    HomeLayoutStateStatus? status,
    int? currentIndex,
    String? fcmToken,
  }) {
    return HomeLayoutState._(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  String toString() =>
      'HomeLayoutState(status: $status , currentIndex: $currentIndex )';
}
