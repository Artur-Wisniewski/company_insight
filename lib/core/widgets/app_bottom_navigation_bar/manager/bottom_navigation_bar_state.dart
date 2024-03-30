part of 'bottom_navigation_bar_cubit.dart';

enum BottomBarItems {
  home,
  favorites,
  profile,
}

class BottomBarNavigationState extends Equatable {
  const BottomBarNavigationState({required this.currentItem, this.isNavigatedOutsideShell = false});

  final BottomBarItems currentItem;

  final bool isNavigatedOutsideShell;

  BottomBarNavigationState copyWith({
    BottomBarItems? currentItem,
    bool? isNavigatedOutsideShell,
  }) {
    return BottomBarNavigationState(
      currentItem: currentItem ?? this.currentItem,
      isNavigatedOutsideShell: isNavigatedOutsideShell ?? this.isNavigatedOutsideShell,
    );
  }

  @override
  List<Object?> get props => [currentItem, isNavigatedOutsideShell];
}
