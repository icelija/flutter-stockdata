import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockdata/features/search/domain/entities/search_entity.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final localStorageProvider = Provider<LocalStorageRepository>(
  (ref) => LocalStorageRepositoryImpl(
    ref.read(sharedPreferencesProvider),
  ).._clearSecureStorageOnReinstall(),
);

abstract class LocalStorageRepository {
  Future<void> deleteAllSharedPrefs();
  Future<SearchEntity?> getSearchData();
  Future<void> setSearchData({required SearchEntity searchEntity});
}

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final SharedPreferences _sharedPreferences;

  LocalStorageRepositoryImpl(this._sharedPreferences);

  @override
  Future<void> deleteAllSharedPrefs() async => _sharedPreferences.clear();

  @override
  Future<void> setSearchData({required SearchEntity searchEntity}) async {
    _sharedPreferences.setString(
        LocalStorageKey.emptySearch.key, jsonEncode(searchEntity.toJson()));
  }

  @override
  Future<SearchEntity?> getSearchData() async {
    final searchDataString =
        _sharedPreferences.getString(LocalStorageKey.emptySearch.key);
    if (searchDataString != null) {
      return SearchEntity.fromJson(jsonDecode(searchDataString));
    }
    return null;
  }

  ///Necessary because of https://github.com/mogol/flutter_secure_storage/issues/88
  Future<void> _clearSecureStorageOnReinstall() async {
    const key = 'hasRunBefore';
    if (_sharedPreferences.getBool(key) != true) {
      await deleteAllSharedPrefs();
      await _sharedPreferences.setBool(key, true);
    }
  }
}

enum LocalStorageKey {
  emptySearch('emptySearch');

  final String key;
  const LocalStorageKey(this.key);
}
