import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "is_support" field.
  bool? _isSupport;
  bool get isSupport => _isSupport ?? false;
  bool hasIsSupport() => _isSupport != null;

  // "stripe_cust_id" field.
  String? _stripeCustId;
  String get stripeCustId => _stripeCustId ?? '';
  bool hasStripeCustId() => _stripeCustId != null;

  // "paidMember" field.
  bool? _paidMember;
  bool get paidMember => _paidMember ?? false;
  bool hasPaidMember() => _paidMember != null;

  // "Free" field.
  int? _free;
  int get free => _free ?? 0;
  bool hasFree() => _free != null;

  // "Gold" field.
  int? _gold;
  int get gold => _gold ?? 0;
  bool hasGold() => _gold != null;

  // "Premium" field.
  int? _premium;
  int get premium => _premium ?? 0;
  bool hasPremium() => _premium != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _isSupport = snapshotData['is_support'] as bool?;
    _stripeCustId = snapshotData['stripe_cust_id'] as String?;
    _paidMember = snapshotData['paidMember'] as bool?;
    _free = castToType<int>(snapshotData['Free']);
    _gold = castToType<int>(snapshotData['Gold']);
    _premium = castToType<int>(snapshotData['Premium']);
    _isAdmin = snapshotData['is_admin'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  bool? isSupport,
  String? stripeCustId,
  bool? paidMember,
  int? free,
  int? gold,
  int? premium,
  bool? isAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'is_support': isSupport,
      'stripe_cust_id': stripeCustId,
      'paidMember': paidMember,
      'Free': free,
      'Gold': gold,
      'Premium': premium,
      'is_admin': isAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.isSupport == e2?.isSupport &&
        e1?.stripeCustId == e2?.stripeCustId &&
        e1?.paidMember == e2?.paidMember &&
        e1?.free == e2?.free &&
        e1?.gold == e2?.gold &&
        e1?.premium == e2?.premium &&
        e1?.isAdmin == e2?.isAdmin;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.isSupport,
        e?.stripeCustId,
        e?.paidMember,
        e?.free,
        e?.gold,
        e?.premium,
        e?.isAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
