import 'dart:io';

String readJsonString(String name) =>
    File('test/json/$name').readAsStringSync();
