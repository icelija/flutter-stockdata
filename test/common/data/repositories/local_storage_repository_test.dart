import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockdata/common/data/repositories/local_storage_repository.dart';

import '../../../test_variables.dart';

//ignore: prefer-match-file-name
class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences sharedPreferences;
  late LocalStorageRepository localStorageRepository;

  setUpAll(() async {
    sharedPreferences = MockSharedPreferences();

    localStorageRepository = LocalStorageRepositoryImpl(
      sharedPreferences,
    );
  });

  test('setSearchData({required SearchEntity searchEntity}) success', () async {
    when(() => sharedPreferences.setString(LocalStorageKey.emptySearch.key,
        jsonEncode(testSearchEntity.toJson()))).thenAnswer((_) async => true);
    await localStorageRepository.setSearchData(searchEntity: testSearchEntity);
    verify(() => sharedPreferences.setString(LocalStorageKey.emptySearch.key,
        jsonEncode(testSearchEntity.toJson())));
  });

  test('getSearchData()', () async {
    when(() => sharedPreferences.getString(LocalStorageKey.emptySearch.key))
        .thenAnswer((_) => jsonEncode(testSearchEntity.toJson()));
    final value = await localStorageRepository.getSearchData();
    expect(value, testSearchEntity);
  });

  test('make sure provider returns same repository instance', () async {
    when(sharedPreferences.clear).thenAnswer((_) async => true);
    when(() => sharedPreferences.setBool('hasRunBefore', true))
        .thenAnswer((_) async => true);
    final providerContainer = ProviderContainer(overrides: [
      sharedPreferencesProvider.overrideWithValue(sharedPreferences)
    ]);
    final value = providerContainer.read(localStorageProvider);
    final value2 = providerContainer.read(localStorageProvider);
    expect(value, value2);
  });
}
