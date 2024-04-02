import 'package:company_insight_app/core/widgets/app_bottom_navigation_bar/manager/bottom_navigation_bar_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('BottomNavigationBarCubit', () {
    test('Initial bottom bar item should be home', () {
      final initialState = BottomNavigationBarCubit().state;
      expect(initialState.currentItem, BottomBarItems.home);
    });

    test('Initial isNavigatedOutsideShell should be false', () {
      final initialState = BottomNavigationBarCubit().state;
      expect(initialState.isNavigatedOutsideShell, false);
    });

    blocTest<BottomNavigationBarCubit, BottomBarNavigationState>(
      'Emit BottomBarNavigationState with favorites item',
      build: () => BottomNavigationBarCubit(),
      act: (bloc) => bloc.changeItem(BottomBarItems.favorites),
      expect: () => <BottomBarNavigationState>[const BottomBarNavigationState(currentItem: BottomBarItems.favorites)],
    );

    blocTest<BottomNavigationBarCubit, BottomBarNavigationState>(
      'Emit BottomBarNavigationState with home item',
      seed: () => const BottomBarNavigationState(currentItem: BottomBarItems.favorites),
      build: () => BottomNavigationBarCubit(),
      act: (bloc) => bloc.changeItem(BottomBarItems.home),
      expect: () => <BottomBarNavigationState>[const BottomBarNavigationState(currentItem: BottomBarItems.home)],
    );

    blocTest<BottomNavigationBarCubit, BottomBarNavigationState>(
      'Emit BottomBarNavigationState with home item and not changed isNavigatedOutsideShell',
      seed: () => const BottomBarNavigationState(currentItem: BottomBarItems.favorites, isNavigatedOutsideShell: true),
      build: () => BottomNavigationBarCubit(),
      act: (bloc) => bloc.changeItem(BottomBarItems.home),
      expect: () => <BottomBarNavigationState>[
        const BottomBarNavigationState(currentItem: BottomBarItems.home, isNavigatedOutsideShell: true)
      ],
    );

    blocTest<BottomNavigationBarCubit, BottomBarNavigationState>(
      'Emit nothing when changing to the same item',
      build: () => BottomNavigationBarCubit(),
      act: (bloc) => bloc.changeItem(BottomBarItems.home),
      expect: () => <BottomBarNavigationState>[],
    );

    blocTest<BottomNavigationBarCubit, BottomBarNavigationState>(
      'Emit nothing on markNavigateOutsideShell with the same value',
      build: () => BottomNavigationBarCubit(),
      act: (bloc) => bloc.markNavigateOutsideShell(false),
      expect: () => <BottomBarNavigationState>[],
    );
  });
}
