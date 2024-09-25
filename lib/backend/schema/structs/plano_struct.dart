// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PlanoStruct extends FFFirebaseStruct {
  PlanoStruct({
    int? id,
    String? name,
    double? price,
    String? description,
    String? priceId,
    int? isActive,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _price = price,
        _description = description,
        _priceId = priceId,
        _isActive = isActive,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "price_id" field.
  String? _priceId;
  String get priceId => _priceId ?? '';
  set priceId(String? val) => _priceId = val;

  bool hasPriceId() => _priceId != null;

  // "is_active" field.
  int? _isActive;
  int get isActive => _isActive ?? 0;
  set isActive(int? val) => _isActive = val;

  void incrementIsActive(int amount) => isActive = isActive + amount;

  bool hasIsActive() => _isActive != null;

  static PlanoStruct fromMap(Map<String, dynamic> data) => PlanoStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        description: data['description'] as String?,
        priceId: data['price_id'] as String?,
        isActive: castToType<int>(data['is_active']),
      );

  static PlanoStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlanoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'price': _price,
        'description': _description,
        'price_id': _priceId,
        'is_active': _isActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'price_id': serializeParam(
          _priceId,
          ParamType.String,
        ),
        'is_active': serializeParam(
          _isActive,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlanoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        priceId: deserializeParam(
          data['price_id'],
          ParamType.String,
          false,
        ),
        isActive: deserializeParam(
          data['is_active'],
          ParamType.int,
          false,
        ),
      );

  static PlanoStruct fromAlgoliaData(Map<String, dynamic> data) => PlanoStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: convertAlgoliaParam(
          data['price'],
          ParamType.double,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        priceId: convertAlgoliaParam(
          data['price_id'],
          ParamType.String,
          false,
        ),
        isActive: convertAlgoliaParam(
          data['is_active'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlanoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlanoStruct &&
        id == other.id &&
        name == other.name &&
        price == other.price &&
        description == other.description &&
        priceId == other.priceId &&
        isActive == other.isActive;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, price, description, priceId, isActive]);
}

PlanoStruct createPlanoStruct({
  int? id,
  String? name,
  double? price,
  String? description,
  String? priceId,
  int? isActive,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanoStruct(
      id: id,
      name: name,
      price: price,
      description: description,
      priceId: priceId,
      isActive: isActive,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanoStruct? updatePlanoStruct(
  PlanoStruct? plano, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    plano
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanoStructData(
  Map<String, dynamic> firestoreData,
  PlanoStruct? plano,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (plano == null) {
    return;
  }
  if (plano.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && plano.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planoData = getPlanoFirestoreData(plano, forFieldValue);
  final nestedData = planoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = plano.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanoFirestoreData(
  PlanoStruct? plano, [
  bool forFieldValue = false,
]) {
  if (plano == null) {
    return {};
  }
  final firestoreData = mapToFirestore(plano.toMap());

  // Add any Firestore field values
  plano.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanoListFirestoreData(
  List<PlanoStruct>? planos,
) =>
    planos?.map((e) => getPlanoFirestoreData(e, true)).toList() ?? [];
