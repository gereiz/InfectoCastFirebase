// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ItemPesquisadoStruct extends FFFirebaseStruct {
  ItemPesquisadoStruct({
    DateTime? updatedTime,
    DateTime? createdTime,
    String? icon,
    String? cmsUploads,
    DocumentReference? idUser,
    double? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _updatedTime = updatedTime,
        _createdTime = createdTime,
        _icon = icon,
        _cmsUploads = cmsUploads,
        _idUser = idUser,
        _title = title,
        super(firestoreUtilData);

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  set updatedTime(DateTime? val) => _updatedTime = val;

  bool hasUpdatedTime() => _updatedTime != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "cms_uploads" field.
  String? _cmsUploads;
  String get cmsUploads => _cmsUploads ?? '';
  set cmsUploads(String? val) => _cmsUploads = val;

  bool hasCmsUploads() => _cmsUploads != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  set idUser(DocumentReference? val) => _idUser = val;

  bool hasIdUser() => _idUser != null;

  // "title" field.
  double? _title;
  double get title => _title ?? 0.0;
  set title(double? val) => _title = val;

  void incrementTitle(double amount) => title = title + amount;

  bool hasTitle() => _title != null;

  static ItemPesquisadoStruct fromMap(Map<String, dynamic> data) =>
      ItemPesquisadoStruct(
        updatedTime: data['updated_time'] as DateTime?,
        createdTime: data['created_time'] as DateTime?,
        icon: data['icon'] as String?,
        cmsUploads: data['cms_uploads'] as String?,
        idUser: data['id_user'] as DocumentReference?,
        title: castToType<double>(data['title']),
      );

  static ItemPesquisadoStruct? maybeFromMap(dynamic data) => data is Map
      ? ItemPesquisadoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'updated_time': _updatedTime,
        'created_time': _createdTime,
        'icon': _icon,
        'cms_uploads': _cmsUploads,
        'id_user': _idUser,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'updated_time': serializeParam(
          _updatedTime,
          ParamType.DateTime,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'cms_uploads': serializeParam(
          _cmsUploads,
          ParamType.String,
        ),
        'id_user': serializeParam(
          _idUser,
          ParamType.DocumentReference,
        ),
        'title': serializeParam(
          _title,
          ParamType.double,
        ),
      }.withoutNulls;

  static ItemPesquisadoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemPesquisadoStruct(
        updatedTime: deserializeParam(
          data['updated_time'],
          ParamType.DateTime,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        cmsUploads: deserializeParam(
          data['cms_uploads'],
          ParamType.String,
          false,
        ),
        idUser: deserializeParam(
          data['id_user'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        title: deserializeParam(
          data['title'],
          ParamType.double,
          false,
        ),
      );

  static ItemPesquisadoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ItemPesquisadoStruct(
        updatedTime: convertAlgoliaParam(
          data['updated_time'],
          ParamType.DateTime,
          false,
        ),
        createdTime: convertAlgoliaParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        icon: convertAlgoliaParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        cmsUploads: convertAlgoliaParam(
          data['cms_uploads'],
          ParamType.String,
          false,
        ),
        idUser: convertAlgoliaParam(
          data['id_user'],
          ParamType.DocumentReference,
          false,
        ),
        title: convertAlgoliaParam(
          data['title'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ItemPesquisadoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemPesquisadoStruct &&
        updatedTime == other.updatedTime &&
        createdTime == other.createdTime &&
        icon == other.icon &&
        cmsUploads == other.cmsUploads &&
        idUser == other.idUser &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([updatedTime, createdTime, icon, cmsUploads, idUser, title]);
}

ItemPesquisadoStruct createItemPesquisadoStruct({
  DateTime? updatedTime,
  DateTime? createdTime,
  String? icon,
  String? cmsUploads,
  DocumentReference? idUser,
  double? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemPesquisadoStruct(
      updatedTime: updatedTime,
      createdTime: createdTime,
      icon: icon,
      cmsUploads: cmsUploads,
      idUser: idUser,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemPesquisadoStruct? updateItemPesquisadoStruct(
  ItemPesquisadoStruct? itemPesquisado, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemPesquisado
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemPesquisadoStructData(
  Map<String, dynamic> firestoreData,
  ItemPesquisadoStruct? itemPesquisado,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemPesquisado == null) {
    return;
  }
  if (itemPesquisado.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemPesquisado.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemPesquisadoData =
      getItemPesquisadoFirestoreData(itemPesquisado, forFieldValue);
  final nestedData =
      itemPesquisadoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemPesquisado.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemPesquisadoFirestoreData(
  ItemPesquisadoStruct? itemPesquisado, [
  bool forFieldValue = false,
]) {
  if (itemPesquisado == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemPesquisado.toMap());

  // Add any Firestore field values
  itemPesquisado.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemPesquisadoListFirestoreData(
  List<ItemPesquisadoStruct>? itemPesquisados,
) =>
    itemPesquisados
        ?.map((e) => getItemPesquisadoFirestoreData(e, true))
        .toList() ??
    [];
