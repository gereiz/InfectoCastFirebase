import 'dart:async';

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

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "recurrence" field.
  int? _recurrence;
  int get recurrence => _recurrence ?? 0;
  bool hasRecurrence() => _recurrence != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "is_active" field.
  int? _isActive;
  int get isActive => _isActive ?? 0;
  bool hasIsActive() => _isActive != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _icon = snapshotData['icon'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _type = castToType<int>(snapshotData['type']);
    _recurrence = castToType<int>(snapshotData['recurrence']);
    _description = snapshotData['description'] as String?;
    _isActive = castToType<int>(snapshotData['is_active']);
    _idUser = snapshotData['id_user'] as DocumentReference?;
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
  int? type,
  int? recurrence,
  String? description,
  int? isActive,
  DocumentReference? idUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'icon': icon,
      'price': price,
      'type': type,
      'recurrence': recurrence,
      'description': description,
      'is_active': isActive,
      'id_user': idUser,
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
        e1?.type == e2?.type &&
        e1?.recurrence == e2?.recurrence &&
        e1?.description == e2?.description &&
        e1?.isActive == e2?.isActive &&
        e1?.idUser == e2?.idUser;
  }

  @override
  int hash(PlansRecord? e) => const ListEquality().hash([
        e?.name,
        e?.icon,
        e?.price,
        e?.type,
        e?.recurrence,
        e?.description,
        e?.isActive,
        e?.idUser
      ]);

  @override
  bool isValidKey(Object? o) => o is PlansRecord;
}
