import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopicVIdeosRecord extends FirestoreRecord {
  TopicVIdeosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Topic" field.
  DocumentReference? _topic;
  DocumentReference? get topic => _topic;
  bool hasTopic() => _topic != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "Premium" field.
  bool? _premium;
  bool get premium => _premium ?? false;
  bool hasPremium() => _premium != null;

  void _initializeFields() {
    _topic = snapshotData['Topic'] as DocumentReference?;
    _video = snapshotData['Video'] as String?;
    _premium = snapshotData['Premium'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topicVIdeos');

  static Stream<TopicVIdeosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopicVIdeosRecord.fromSnapshot(s));

  static Future<TopicVIdeosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopicVIdeosRecord.fromSnapshot(s));

  static TopicVIdeosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TopicVIdeosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopicVIdeosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopicVIdeosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopicVIdeosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopicVIdeosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopicVIdeosRecordData({
  DocumentReference? topic,
  String? video,
  bool? premium,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Topic': topic,
      'Video': video,
      'Premium': premium,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopicVIdeosRecordDocumentEquality implements Equality<TopicVIdeosRecord> {
  const TopicVIdeosRecordDocumentEquality();

  @override
  bool equals(TopicVIdeosRecord? e1, TopicVIdeosRecord? e2) {
    return e1?.topic == e2?.topic &&
        e1?.video == e2?.video &&
        e1?.premium == e2?.premium;
  }

  @override
  int hash(TopicVIdeosRecord? e) =>
      const ListEquality().hash([e?.topic, e?.video, e?.premium]);

  @override
  bool isValidKey(Object? o) => o is TopicVIdeosRecord;
}
