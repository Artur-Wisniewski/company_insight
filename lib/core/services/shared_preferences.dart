import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AppSharedPreferences {
  late final SharedPreferences _preferences;

  @PostConstruct(preResolve: true)
  Future<void> init() async => _preferences = await SharedPreferences.getInstance();

  Future<bool> getIsFirstEnter() async => _preferences.getBool('IsFirstEnter') ?? false;

  Future<void> setIsFirstEnter(bool value) async => _preferences.setBool('IsFirstEnter', value);

  Future<bool> getHasSeenSearchingHint() async => _preferences.getBool('HasSeenSearchingHint') ?? false;

  Future<void> setHasSeenSearchingHint(bool value) async => _preferences.setBool('HasSeenSearchingHint', value);

  Future<bool> getHasSeenFavoriteHint() async => _preferences.getBool('HasSeenFavoriteHint') ?? false;

  Future<void> setHasSeenFavoriteHint(bool value) async => _preferences.setBool('HasSeenFavoriteHint', value);

  Future<void> setHasSkippedOnboarding(bool value) async => _preferences.setBool('HasSkippedOnboarding', value);

  Future<bool> getHasSkippedOnboarding() async => _preferences.getBool('HasSkippedOnboarding') ?? false;
}
