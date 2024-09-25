import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppVersionRecord extends FirestoreRecord {
  AppVersionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "version" field.
  int? _version;
  int get version => _version ?? 0;
  bool hasVersion() => _version != null;

  void _initializeFields() {
    _version = castToType<int>(snapshotData['version']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_version');

  static Stream<AppVersionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppVersionRecord.fromSnapshot(s));

  static Future<AppVersionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppVersionRecord.fromSnapshot(s));

  static AppVersionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppVersionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppVersionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppVersionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppVersionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppVersionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppVersionRecordData({
  int? version,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'version': version,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppVersionRecordDocumentEquality implements Equality<AppVersionRecord> {
  const AppVersionRecordDocumentEquality();

  @override
  bool equals(AppVersionRecord? e1, AppVersionRecord? e2) {
    return e1?.version == e2?.version;
  }

  @override
  int hash(AppVersionRecord? e) => const ListEquality().hash([e?.version]);

  @override
  bool isValidKey(Object? o) => o is AppVersionRecord;
}
