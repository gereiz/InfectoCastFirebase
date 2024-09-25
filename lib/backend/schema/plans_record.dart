import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansRecord extends FirestoreRecord {
  PlansRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "is_active" field.
  int? _isActive;
  int get isActive => _isActive ?? 0;
  bool hasIsActive() => _isActive != null;

  // "priceId" field.
  String? _priceId;
  String get priceId => _priceId ?? '';
  bool hasPriceId() => _priceId != null;

  // "planId" field.
  int? _planId;
  int get planId => _planId ?? 0;
  bool hasPlanId() => _planId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _icon = snapshotData['icon'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _isActive = castToType<int>(snapshotData['is_active']);
    _priceId = snapshotData['priceId'] as String?;
    _planId = castToType<int>(snapshotData['planId']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plans');

  static Stream<PlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlansRecord.fromSnapshot(s));

  static Future<PlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlansRecord.fromSnapshot(s));

  static PlansRecord fromSnapshot(DocumentSnapshot snapshot) => PlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlansRecord._(reference, mapFromFirestore(data));

  static PlansRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PlansRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'icon': snapshot.data['icon'],
          'price': convertAlgoliaParam(
            snapshot.data['price'],
            ParamType.double,
            false,
          ),
          'description': snapshot.data['description'],
          'id_user': convertAlgoliaParam(
            snapshot.data['id_user'],
            ParamType.DocumentReference,
            false,
          ),
          'is_active': convertAlgoliaParam(
            snapshot.data['is_active'],
            ParamType.int,
            false,
          ),
          'priceId': snapshot.data['priceId'],
          'planId': convertAlgoliaParam(
            snapshot.data['planId'],
            ParamType.int,
            false,
          ),
        },
        PlansRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PlansRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'plans',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlansRecordData({
  String? name,
  String? icon,
  double? price,
  String? description,
  DocumentReference? idUser,
  int? isActive,
  String? priceId,
  int? planId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'icon': icon,
      'price': price,
      'description': description,
      'id_user': idUser,
      'is_active': isActive,
      'priceId': priceId,
      'planId': planId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlansRecordDocumentEquality implements Equality<PlansRecord> {
  const PlansRecordDocumentEquality();

  @override
  bool equals(PlansRecord? e1, PlansRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.icon == e2?.icon &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        e1?.idUser == e2?.idUser &&
        e1?.isActive == e2?.isActive &&
        e1?.priceId == e2?.priceId &&
        e1?.planId == e2?.planId;
  }

  @override
  int hash(PlansRecord? e) => const ListEquality().hash([
        e?.name,
        e?.icon,
        e?.price,
        e?.description,
        e?.idUser,
        e?.isActive,
        e?.priceId,
        e?.planId
      ]);

  @override
  bool isValidKey(Object? o) => o is PlansRecord;
}
