import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicsRecord extends FirestoreRecord {
  TopicsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "id_subcategory" field.
  DocumentReference? _idSubcategory;
  DocumentReference? get idSubcategory => _idSubcategory;
  bool hasIdSubcategory() => _idSubcategory != null;

  // "Free" field.
  int? _free;
  int get free => _free ?? 0;
  bool hasFree() => _free != null;

  // "Premium" field.
  int? _premium;
  int get premium => _premium ?? 0;
  bool hasPremium() => _premium != null;

  // "Gold" field.
  int? _gold;
  int get gold => _gold ?? 0;
  bool hasGold() => _gold != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _idSubcategory = snapshotData['id_subcategory'] as DocumentReference?;
    _free = castToType<int>(snapshotData['Free']);
    _premium = castToType<int>(snapshotData['Premium']);
    _gold = castToType<int>(snapshotData['Gold']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topics');

  static Stream<TopicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicsRecord.fromSnapshot(s));

  static Future<TopicsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicsRecord.fromSnapshot(s));

  static TopicsRecord fromSnapshot(DocumentSnapshot snapshot) => TopicsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicsRecord._(reference, mapFromFirestore(data));

  static TopicsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TopicsRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'content': snapshot.data['content'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'updated_time': convertAlgoliaParam(
            snapshot.data['updated_time'],
            ParamType.DateTime,
            false,
          ),
          'id_user': convertAlgoliaParam(
            snapshot.data['id_user'],
            ParamType.DocumentReference,
            false,
          ),
          'id_subcategory': convertAlgoliaParam(
            snapshot.data['id_subcategory'],
            ParamType.DocumentReference,
            false,
          ),
          'Free': convertAlgoliaParam(
            snapshot.data['Free'],
            ParamType.int,
            false,
          ),
          'Premium': convertAlgoliaParam(
            snapshot.data['Premium'],
            ParamType.int,
            false,
          ),
          'Gold': convertAlgoliaParam(
            snapshot.data['Gold'],
            ParamType.int,
            false,
          ),
        },
        TopicsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TopicsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'topics',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TopicsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicsRecordData({
  String? title,
  String? content,
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? idUser,
  DocumentReference? idSubcategory,
  int? free,
  int? premium,
  int? gold,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'content': content,
      'created_time': createdTime,
      'updated_time': updatedTime,
      'id_user': idUser,
      'id_subcategory': idSubcategory,
      'Free': free,
      'Premium': premium,
      'Gold': gold,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicsRecordDocumentEquality implements Equality<TopicsRecord> {
  const TopicsRecordDocumentEquality();

  @override
  bool equals(TopicsRecord? e1, TopicsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.idUser == e2?.idUser &&
        e1?.idSubcategory == e2?.idSubcategory &&
        e1?.free == e2?.free &&
        e1?.premium == e2?.premium &&
        e1?.gold == e2?.gold;
  }

  @override
  int hash(TopicsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.content,
        e?.createdTime,
        e?.updatedTime,
        e?.idUser,
        e?.idSubcategory,
        e?.free,
        e?.premium,
        e?.gold
      ]);

  @override
  bool isValidKey(Object? o) => o is TopicsRecord;
}
