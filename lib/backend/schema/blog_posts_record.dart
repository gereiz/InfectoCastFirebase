import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogPostsRecord extends FirestoreRecord {
  BlogPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "post_order" field.
  int? _postOrder;
  int get postOrder => _postOrder ?? 0;
  bool hasPostOrder() => _postOrder != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  void _initializeFields() {
    _author = snapshotData['author'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _content = snapshotData['content'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _postOrder = castToType<int>(snapshotData['post_order']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blog_posts');

  static Stream<BlogPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogPostsRecord.fromSnapshot(s));

  static Future<BlogPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogPostsRecord.fromSnapshot(s));

  static BlogPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlogPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogPostsRecord._(reference, mapFromFirestore(data));

  static BlogPostsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BlogPostsRecord.getDocumentFromData(
        {
          'author': convertAlgoliaParam(
            snapshot.data['author'],
            ParamType.DocumentReference,
            false,
          ),
          'title': snapshot.data['title'],
          'image': snapshot.data['image'],
          'date': convertAlgoliaParam(
            snapshot.data['date'],
            ParamType.DateTime,
            false,
          ),
          'content': snapshot.data['content'],
          'status': convertAlgoliaParam(
            snapshot.data['status'],
            ParamType.int,
            false,
          ),
          'post_order': convertAlgoliaParam(
            snapshot.data['post_order'],
            ParamType.int,
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
        },
        BlogPostsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BlogPostsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'blog_posts',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'BlogPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogPostsRecordData({
  DocumentReference? author,
  String? title,
  String? image,
  DateTime? date,
  String? content,
  int? status,
  int? postOrder,
  DateTime? createdTime,
  DateTime? updatedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'title': title,
      'image': image,
      'date': date,
      'content': content,
      'status': status,
      'post_order': postOrder,
      'created_time': createdTime,
      'updated_time': updatedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogPostsRecordDocumentEquality implements Equality<BlogPostsRecord> {
  const BlogPostsRecordDocumentEquality();

  @override
  bool equals(BlogPostsRecord? e1, BlogPostsRecord? e2) {
    return e1?.author == e2?.author &&
        e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.date == e2?.date &&
        e1?.content == e2?.content &&
        e1?.status == e2?.status &&
        e1?.postOrder == e2?.postOrder &&
        e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime;
  }

  @override
  int hash(BlogPostsRecord? e) => const ListEquality().hash([
        e?.author,
        e?.title,
        e?.image,
        e?.date,
        e?.content,
        e?.status,
        e?.postOrder,
        e?.createdTime,
        e?.updatedTime
      ]);

  @override
  bool isValidKey(Object? o) => o is BlogPostsRecord;
}
