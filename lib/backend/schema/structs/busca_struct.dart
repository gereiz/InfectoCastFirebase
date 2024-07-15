// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuscaStruct extends FFFirebaseStruct {
  BuscaStruct({
    int? id,
    String? title,
    String? tableName,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _tableName = tableName,
        _icon = icon,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "table_name" field.
  String? _tableName;
  String get tableName => _tableName ?? '';
  set tableName(String? val) => _tableName = val;

  bool hasTableName() => _tableName != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static BuscaStruct fromMap(Map<String, dynamic> data) => BuscaStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        tableName: data['table_name'] as String?,
        icon: data['icon'] as String?,
      );

  static BuscaStruct? maybeFromMap(dynamic data) =>
      data is Map ? BuscaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'table_name': _tableName,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'table_name': serializeParam(
          _tableName,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static BuscaStruct fromSerializableMap(Map<String, dynamic> data) =>
      BuscaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        tableName: deserializeParam(
          data['table_name'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  static BuscaStruct fromAlgoliaData(Map<String, dynamic> data) => BuscaStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        tableName: convertAlgoliaParam(
          data['table_name'],
          ParamType.String,
          false,
        ),
        icon: convertAlgoliaParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'BuscaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BuscaStruct &&
        id == other.id &&
        title == other.title &&
        tableName == other.tableName &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title, tableName, icon]);
}

BuscaStruct createBuscaStruct({
  int? id,
  String? title,
  String? tableName,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BuscaStruct(
      id: id,
      title: title,
      tableName: tableName,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BuscaStruct? updateBuscaStruct(
  BuscaStruct? busca, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    busca
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBuscaStructData(
  Map<String, dynamic> firestoreData,
  BuscaStruct? busca,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (busca == null) {
    return;
  }
  if (busca.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && busca.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final buscaData = getBuscaFirestoreData(busca, forFieldValue);
  final nestedData = buscaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = busca.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBuscaFirestoreData(
  BuscaStruct? busca, [
  bool forFieldValue = false,
]) {
  if (busca == null) {
    return {};
  }
  final firestoreData = mapToFirestore(busca.toMap());

  // Add any Firestore field values
  busca.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBuscaListFirestoreData(
  List<BuscaStruct>? buscas,
) =>
    buscas?.map((e) => getBuscaFirestoreData(e, true)).toList() ?? [];
