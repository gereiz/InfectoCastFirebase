// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TopicsStruct extends FFFirebaseStruct {
  TopicsStruct({
    int? id,
    String? title,
    String? content,
    int? idSubcategory,
    int? idUser,
    int? free,
    int? gold,
    int? premium,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _content = content,
        _idSubcategory = idSubcategory,
        _idUser = idUser,
        _free = free,
        _gold = gold,
        _premium = premium,
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

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "id_subcategory" field.
  int? _idSubcategory;
  int get idSubcategory => _idSubcategory ?? 0;
  set idSubcategory(int? val) => _idSubcategory = val;

  void incrementIdSubcategory(int amount) =>
      idSubcategory = idSubcategory + amount;

  bool hasIdSubcategory() => _idSubcategory != null;

  // "id_user" field.
  int? _idUser;
  int get idUser => _idUser ?? 0;
  set idUser(int? val) => _idUser = val;

  void incrementIdUser(int amount) => idUser = idUser + amount;

  bool hasIdUser() => _idUser != null;

  // "Free" field.
  int? _free;
  int get free => _free ?? 0;
  set free(int? val) => _free = val;

  void incrementFree(int amount) => free = free + amount;

  bool hasFree() => _free != null;

  // "Gold" field.
  int? _gold;
  int get gold => _gold ?? 0;
  set gold(int? val) => _gold = val;

  void incrementGold(int amount) => gold = gold + amount;

  bool hasGold() => _gold != null;

  // "Premium" field.
  int? _premium;
  int get premium => _premium ?? 0;
  set premium(int? val) => _premium = val;

  void incrementPremium(int amount) => premium = premium + amount;

  bool hasPremium() => _premium != null;

  static TopicsStruct fromMap(Map<String, dynamic> data) => TopicsStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        content: data['content'] as String?,
        idSubcategory: castToType<int>(data['id_subcategory']),
        idUser: castToType<int>(data['id_user']),
        free: castToType<int>(data['Free']),
        gold: castToType<int>(data['Gold']),
        premium: castToType<int>(data['Premium']),
      );

  static TopicsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TopicsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'content': _content,
        'id_subcategory': _idSubcategory,
        'id_user': _idUser,
        'Free': _free,
        'Gold': _gold,
        'Premium': _premium,
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
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'id_subcategory': serializeParam(
          _idSubcategory,
          ParamType.int,
        ),
        'id_user': serializeParam(
          _idUser,
          ParamType.int,
        ),
        'Free': serializeParam(
          _free,
          ParamType.int,
        ),
        'Gold': serializeParam(
          _gold,
          ParamType.int,
        ),
        'Premium': serializeParam(
          _premium,
          ParamType.int,
        ),
      }.withoutNulls;

  static TopicsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TopicsStruct(
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
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        idSubcategory: deserializeParam(
          data['id_subcategory'],
          ParamType.int,
          false,
        ),
        idUser: deserializeParam(
          data['id_user'],
          ParamType.int,
          false,
        ),
        free: deserializeParam(
          data['Free'],
          ParamType.int,
          false,
        ),
        gold: deserializeParam(
          data['Gold'],
          ParamType.int,
          false,
        ),
        premium: deserializeParam(
          data['Premium'],
          ParamType.int,
          false,
        ),
      );

  static TopicsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TopicsStruct(
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
        content: convertAlgoliaParam(
          data['content'],
          ParamType.String,
          false,
        ),
        idSubcategory: convertAlgoliaParam(
          data['id_subcategory'],
          ParamType.int,
          false,
        ),
        idUser: convertAlgoliaParam(
          data['id_user'],
          ParamType.int,
          false,
        ),
        free: convertAlgoliaParam(
          data['Free'],
          ParamType.int,
          false,
        ),
        gold: convertAlgoliaParam(
          data['Gold'],
          ParamType.int,
          false,
        ),
        premium: convertAlgoliaParam(
          data['Premium'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TopicsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopicsStruct &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        idSubcategory == other.idSubcategory &&
        idUser == other.idUser &&
        free == other.free &&
        gold == other.gold &&
        premium == other.premium;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, title, content, idSubcategory, idUser, free, gold, premium]);
}

TopicsStruct createTopicsStruct({
  int? id,
  String? title,
  String? content,
  int? idSubcategory,
  int? idUser,
  int? free,
  int? gold,
  int? premium,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopicsStruct(
      id: id,
      title: title,
      content: content,
      idSubcategory: idSubcategory,
      idUser: idUser,
      free: free,
      gold: gold,
      premium: premium,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopicsStruct? updateTopicsStruct(
  TopicsStruct? topics, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topics
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopicsStructData(
  Map<String, dynamic> firestoreData,
  TopicsStruct? topics,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topics == null) {
    return;
  }
  if (topics.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && topics.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topicsData = getTopicsFirestoreData(topics, forFieldValue);
  final nestedData = topicsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = topics.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopicsFirestoreData(
  TopicsStruct? topics, [
  bool forFieldValue = false,
]) {
  if (topics == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topics.toMap());

  // Add any Firestore field values
  topics.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopicsListFirestoreData(
  List<TopicsStruct>? topicss,
) =>
    topicss?.map((e) => getTopicsFirestoreData(e, true)).toList() ?? [];
