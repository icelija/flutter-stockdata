import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';

final localStorageProvider = Provider<LocalStorageRepository>(
  (_) => LocalStorageRepositoryImpl(
    SharedPreferences.getInstance(),
  ),
);

abstract class LocalStorageRepository {
  Future<void> deleteAllSharedPrefs();
  Future<SearchEntity?> getSearchData();
  Future<void> setSearchData({required SearchEntity searchEntity});
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final Future<SharedPreferences> _sharedPreferencesFuture;
  SharedPreferences? _sharedPreferencesInstance;

  LocalStorageRepositoryImpl(
    this._sharedPreferencesFuture,
  ) {
    _clearSecureStorageOnReinstall();
  }

  Future<SharedPreferences> get _sharedPrefs async {
    return _sharedPreferencesInstance ??= await _sharedPreferencesFuture;
  }

  @override
  Future<void> deleteAllSharedPrefs() async => (await _sharedPrefs).clear();

  @override
  Future<void> setSearchData({required SearchEntity searchEntity}) async {
    (await _sharedPrefs).setString(
        LocalStorageKey.emptySearch.key, jsonEncode(searchEntity.toJson()));
  }

  @override
  Future<SearchEntity?> getSearchData() async {
    final searchDataString =
        (await _sharedPrefs).getString(LocalStorageKey.emptySearch.key);
    if (searchDataString != null) {
      return SearchEntity.fromJson(jsonDecode(searchDataString));
    }
    return null;
  }

  Future<void> write({
    required LocalStorageKey key,
    required String value,
  }) async {
    (await _sharedPrefs).setString(key.key, value);
  }

  Future<T?> read<T>(LocalStorageKey key) async =>
      (await _sharedPrefs).get(key.key) as T?;

  Future<void> delete(LocalStorageKey key) async =>
      (await _sharedPrefs).remove(key.key);

  ///Necessary because of https://github.com/mogol/flutter_secure_storage/issues/88
  Future<void> _clearSecureStorageOnReinstall() async {
    const key = 'hasRunBefore';
    final sharedPreferences = await _sharedPrefs;
    if (sharedPreferences.getBool(key) != true) {
      await deleteAllSharedPrefs();
      await sharedPreferences.setBool(key, true);
    }
  }
}

enum LocalStorageKey {
  emptySearch('emptySearch');

  final String key;
  const LocalStorageKey(this.key);
}
