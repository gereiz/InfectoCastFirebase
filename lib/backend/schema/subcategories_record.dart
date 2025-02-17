import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubcategoriesRecord extends FirestoreRecord {
  SubcategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "id_category" field.
  DocumentReference? _idCategory;
  DocumentReference? get idCategory => _idCategory;
  bool hasIdCategory() => _idCategory != null;

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

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _idCategory = snapshotData['id_category'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subcategories');

  static Stream<SubcategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubcategoriesRecord.fromSnapshot(s));

  static Future<SubcategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubcategoriesRecord.fromSnapshot(s));

  static SubcategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubcategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubcategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubcategoriesRecord._(reference, mapFromFirestore(data));

  static SubcategoriesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      SubcategoriesRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'id_category': convertAlgoliaParam(
            snapshot.data['id_category'],
            ParamType.DocumentReference,
            false,
          ),
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
        },
        SubcategoriesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<SubcategoriesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'subcategories',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'SubcategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubcategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubcategoriesRecordData({
  String? title,
  DocumentReference? idCategory,
  DateTime? createdTime,
  DateTime? updatedTime,
  DocumentReference? idUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'id_category': idCategory,
      'created_time': createdTime,
      'updated_time': updatedTime,
      'id_user': idUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubcategoriesRecordDocumentEquality
    implements Equality<SubcategoriesRecord> {
  const SubcategoriesRecordDocumentEquality();

  @override
  bool equals(SubcategoriesRecord? e1, SubcategoriesRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.idCategory == e2?.idCategory &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.idUser == e2?.idUser;
  }

  @override
  int hash(SubcategoriesRecord? e) => const ListEquality().hash(
      [e?.title, e?.idCategory, e?.createdTime, e?.updatedTime, e?.idUser]);

  @override
  bool isValidKey(Object? o) => o is SubcategoriesRecord;
}
