import 'package:company_insight_app/core/services/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

main() {
  late AppSharedPreferences appSharedPreferences;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    appSharedPreferences = AppSharedPreferences();
    await appSharedPreferences.init();
  });

  group(AppSharedPreferences, () {
    group('SharedPreferences initial values', () {
      test('Initial value of isFirstEnter should false', () async {
        final isFirstEnter = await appSharedPreferences.getIsFirstEnter();
        expect(isFirstEnter, false);
      });
      test('Initial value of hasSeenSearchingHint should false', () async {
        final hasSeenSearchingHint = await appSharedPreferences.getHasSeenSearchingHint();
        expect(hasSeenSearchingHint, false);
      });
      test('Initial value of hasSkippedOnboarding should false', () async {
        final hasSkippedOnboarding = await appSharedPreferences.getHasSkippedOnboarding();
        expect(hasSkippedOnboarding, false);
      });

      test('Initial value of hasSeenFavoriteHint should false', () async {
        final hasSeenFavoriteHint = await appSharedPreferences.getHasSeenFavoriteHint();
        expect(hasSeenFavoriteHint, false);
      });
    });

    group('SharedPreferences testing set values', () {
      test('Value isFirstEnter should be possible to set', () async {
        await appSharedPreferences.setIsFirstEnter(true);
        bool isFirstEnter = await appSharedPreferences.getIsFirstEnter();
        expect(isFirstEnter, true);
        await appSharedPreferences.setIsFirstEnter(false);
        isFirstEnter = await appSharedPreferences.getIsFirstEnter();
        expect(isFirstEnter, false);
      });
      test('Value of hasSeenSearchingHint  should be possible to set', () async {
        await appSharedPreferences.setHasSeenSearchingHint(true);
        bool hasSeenSearchingHint = await appSharedPreferences.getHasSeenSearchingHint();
        expect(hasSeenSearchingHint, true);
        await appSharedPreferences.setHasSeenSearchingHint(false);
        hasSeenSearchingHint = await appSharedPreferences.getHasSeenSearchingHint();
        expect(hasSeenSearchingHint, false);
      });
      test('Value of hasSkippedOnboarding  should be possible to set', () async {
        await appSharedPreferences.setHasSkippedOnboarding(true);
        bool hasSkippedOnboarding = await appSharedPreferences.getHasSkippedOnboarding();
        expect(hasSkippedOnboarding, true);
        await appSharedPreferences.setHasSkippedOnboarding(false);
        hasSkippedOnboarding = await appSharedPreferences.getHasSkippedOnboarding();
        expect(hasSkippedOnboarding, false);
      });

      test('Value of hasSeenFavoriteHint  should be possible to set', () async {
        await appSharedPreferences.setHasSeenFavoriteHint(true);
        bool hasSeenFavoriteHint = await appSharedPreferences.getHasSeenFavoriteHint();
        expect(hasSeenFavoriteHint, true);
        await appSharedPreferences.setHasSeenFavoriteHint(false);
        hasSeenFavoriteHint = await appSharedPreferences.getHasSeenFavoriteHint();
        expect(hasSeenFavoriteHint, false);
      });
    });
  });
}
