import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'bottom_navigation_bar_state.dart';

@lazySingleton
class BottomNavigationBarCubit extends Cubit<BottomBarNavigationState> {
  BottomNavigationBarCubit() : super(const BottomBarNavigationState(currentItem: BottomBarItems.home));

  void changeItem(BottomBarItems item) {
    if (item == state.currentItem) return;
    emit(state.copyWith(currentItem: item));
  }

  void markNavigateOutsideShell(bool isNavigatedOutsideShell) {
    if (isNavigatedOutsideShell == state.isNavigatedOutsideShell) return;
    emit(state.copyWith(isNavigatedOutsideShell: isNavigatedOutsideShell));
  }
}
