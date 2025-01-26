import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _msgNotification =
          await secureStorage.getStringList('ff_msgNotification') ??
              _msgNotification;
    });
    await _safeInitAsync(() async {
      _authtoken = await secureStorage.getString('ff_authtoken') ?? _authtoken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _msgNotification = [];
  List<String> get msgNotification => _msgNotification;
  set msgNotification(List<String> value) {
    _msgNotification = value;
    secureStorage.setStringList('ff_msgNotification', value);
  }

  void deleteMsgNotification() {
    secureStorage.delete(key: 'ff_msgNotification');
  }

  void addToMsgNotification(String value) {
    msgNotification.add(value);
    secureStorage.setStringList('ff_msgNotification', _msgNotification);
  }

  void removeFromMsgNotification(String value) {
    msgNotification.remove(value);
    secureStorage.setStringList('ff_msgNotification', _msgNotification);
  }

  void removeAtIndexFromMsgNotification(int index) {
    msgNotification.removeAt(index);
    secureStorage.setStringList('ff_msgNotification', _msgNotification);
  }

  void updateMsgNotificationAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    msgNotification[index] = updateFn(_msgNotification[index]);
    secureStorage.setStringList('ff_msgNotification', _msgNotification);
  }

  void insertAtIndexInMsgNotification(int index, String value) {
    msgNotification.insert(index, value);
    secureStorage.setStringList('ff_msgNotification', _msgNotification);
  }

  String _authtoken = '';
  String get authtoken => _authtoken;
  set authtoken(String value) {
    _authtoken = value;
    secureStorage.setString('ff_authtoken', value);
  }

  void deleteAuthtoken() {
    secureStorage.delete(key: 'ff_authtoken');
  }

  int _localAppVersion = 6;
  int get localAppVersion => _localAppVersion;
  set localAppVersion(int value) {
    _localAppVersion = value;
  }

  bool _Premium = false;
  bool get Premium => _Premium;
  set Premium(bool value) {
    _Premium = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
