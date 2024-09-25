import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PodcastsRecord extends FirestoreRecord {
  PodcastsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _link = snapshotData['link'] as String?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('podcasts');

  static Stream<PodcastsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PodcastsRecord.fromSnapshot(s));

  static Future<PodcastsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PodcastsRecord.fromSnapshot(s));

  static PodcastsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PodcastsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PodcastsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PodcastsRecord._(reference, mapFromFirestore(data));

  static PodcastsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PodcastsRecord.getDocumentFromData(
        {
          'titulo': snapshot.data['titulo'],
          'link': snapshot.data['link'],
          'id_user': convertAlgoliaParam(
            snapshot.data['id_user'],
            ParamType.DocumentReference,
            false,
          ),
        },
        PodcastsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PodcastsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'podcasts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PodcastsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PodcastsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPodcastsRecordData({
  String? titulo,
  String? link,
  DocumentReference? idUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'link': link,
      'id_user': idUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class PodcastsRecordDocumentEquality implements Equality<PodcastsRecord> {
  const PodcastsRecordDocumentEquality();

  @override
  bool equals(PodcastsRecord? e1, PodcastsRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.link == e2?.link &&
        e1?.idUser == e2?.idUser;
  }

  @override
  int hash(PodcastsRecord? e) =>
      const ListEquality().hash([e?.titulo, e?.link, e?.idUser]);

  @override
  bool isValidKey(Object? o) => o is PodcastsRecord;
}
