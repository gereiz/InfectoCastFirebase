// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoriasStruct extends FFFirebaseStruct {
  CategoriasStruct({
    int? id,
    String? title,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
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

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static CategoriasStruct fromMap(Map<String, dynamic> data) =>
      CategoriasStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        icon: data['icon'] as String?,
      );

  static CategoriasStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
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
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static CategoriasStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriasStruct(
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
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  static CategoriasStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CategoriasStruct(
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
  String toString() => 'CategoriasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriasStruct &&
        id == other.id &&
        title == other.title &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title, icon]);
}

CategoriasStruct createCategoriasStruct({
  int? id,
  String? title,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoriasStruct(
      id: id,
      title: title,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoriasStruct? updateCategoriasStruct(
  CategoriasStruct? categorias, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categorias
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoriasStructData(
  Map<String, dynamic> firestoreData,
  CategoriasStruct? categorias,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categorias == null) {
    return;
  }
  if (categorias.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categorias.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoriasData = getCategoriasFirestoreData(categorias, forFieldValue);
  final nestedData = categoriasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categorias.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoriasFirestoreData(
  CategoriasStruct? categorias, [
  bool forFieldValue = false,
]) {
  if (categorias == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categorias.toMap());

  // Add any Firestore field values
  categorias.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoriasListFirestoreData(
  List<CategoriasStruct>? categoriass,
) =>
    categoriass?.map((e) => getCategoriasFirestoreData(e, true)).toList() ?? [];
