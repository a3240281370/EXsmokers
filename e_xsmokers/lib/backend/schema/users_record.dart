import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

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

  // "isFollowed" field.
  bool? _isFollowed;
  bool get isFollowed => _isFollowed ?? false;
  bool hasIsFollowed() => _isFollowed != null;

  // "hobbies" field.
  List<String>? _hobbies;
  List<String> get hobbies => _hobbies ?? const [];
  bool hasHobbies() => _hobbies != null;

  // "quit_days" field.
  int? _quitDays;
  int get quitDays => _quitDays ?? 0;
  bool hasQuitDays() => _quitDays != null;

  // "continuous_quit_days" field.
  int? _continuousQuitDays;
  int get continuousQuitDays => _continuousQuitDays ?? 0;
  bool hasContinuousQuitDays() => _continuousQuitDays != null;

  // "cigar_quantity" field.
  int? _cigarQuantity;
  int get cigarQuantity => _cigarQuantity ?? 0;
  bool hasCigarQuantity() => _cigarQuantity != null;

  // "cigar_price" field.
  int? _cigarPrice;
  int get cigarPrice => _cigarPrice ?? 0;
  bool hasCigarPrice() => _cigarPrice != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "sex" field.
  String? _sex;
  String get sex => _sex ?? '';
  bool hasSex() => _sex != null;

  // "last_login_time" field.
  DateTime? _lastLoginTime;
  DateTime? get lastLoginTime => _lastLoginTime;
  bool hasLastLoginTime() => _lastLoginTime != null;

  // "following" field.
  List<DocumentReference>? _following;
  List<DocumentReference> get following => _following ?? const [];
  bool hasFollowing() => _following != null;

  // "isQuitToday" field.
  bool? _isQuitToday;
  bool get isQuitToday => _isQuitToday ?? false;
  bool hasIsQuitToday() => _isQuitToday != null;

  // "lastStartQuitingDate" field.
  DateTime? _lastStartQuitingDate;
  DateTime? get lastStartQuitingDate => _lastStartQuitingDate;
  bool hasLastStartQuitingDate() => _lastStartQuitingDate != null;

  // "isSmoke" field.
  bool? _isSmoke;
  bool get isSmoke => _isSmoke ?? false;
  bool hasIsSmoke() => _isSmoke != null;

  // "expected_save_money" field.
  double? _expectedSaveMoney;
  double get expectedSaveMoney => _expectedSaveMoney ?? 0.0;
  bool hasExpectedSaveMoney() => _expectedSaveMoney != null;

  // "lastPressIsTodayQuitButton" field.
  DateTime? _lastPressIsTodayQuitButton;
  DateTime? get lastPressIsTodayQuitButton => _lastPressIsTodayQuitButton;
  bool hasLastPressIsTodayQuitButton() => _lastPressIsTodayQuitButton != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isFollowed = snapshotData['isFollowed'] as bool?;
    _hobbies = getDataList(snapshotData['hobbies']);
    _quitDays = castToType<int>(snapshotData['quit_days']);
    _continuousQuitDays = castToType<int>(snapshotData['continuous_quit_days']);
    _cigarQuantity = castToType<int>(snapshotData['cigar_quantity']);
    _cigarPrice = castToType<int>(snapshotData['cigar_price']);
    _age = castToType<int>(snapshotData['age']);
    _sex = snapshotData['sex'] as String?;
    _lastLoginTime = snapshotData['last_login_time'] as DateTime?;
    _following = getDataList(snapshotData['following']);
    _isQuitToday = snapshotData['isQuitToday'] as bool?;
    _lastStartQuitingDate = snapshotData['lastStartQuitingDate'] as DateTime?;
    _isSmoke = snapshotData['isSmoke'] as bool?;
    _expectedSaveMoney =
        castToType<double>(snapshotData['expected_save_money']);
    _lastPressIsTodayQuitButton =
        snapshotData['lastPressIsTodayQuitButton'] as DateTime?;
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
  String? displayName,
  String? email,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isFollowed,
  int? quitDays,
  int? continuousQuitDays,
  int? cigarQuantity,
  int? cigarPrice,
  int? age,
  String? sex,
  DateTime? lastLoginTime,
  bool? isQuitToday,
  DateTime? lastStartQuitingDate,
  bool? isSmoke,
  double? expectedSaveMoney,
  DateTime? lastPressIsTodayQuitButton,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isFollowed': isFollowed,
      'quit_days': quitDays,
      'continuous_quit_days': continuousQuitDays,
      'cigar_quantity': cigarQuantity,
      'cigar_price': cigarPrice,
      'age': age,
      'sex': sex,
      'last_login_time': lastLoginTime,
      'isQuitToday': isQuitToday,
      'lastStartQuitingDate': lastStartQuitingDate,
      'isSmoke': isSmoke,
      'expected_save_money': expectedSaveMoney,
      'lastPressIsTodayQuitButton': lastPressIsTodayQuitButton,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isFollowed == e2?.isFollowed &&
        listEquality.equals(e1?.hobbies, e2?.hobbies) &&
        e1?.quitDays == e2?.quitDays &&
        e1?.continuousQuitDays == e2?.continuousQuitDays &&
        e1?.cigarQuantity == e2?.cigarQuantity &&
        e1?.cigarPrice == e2?.cigarPrice &&
        e1?.age == e2?.age &&
        e1?.sex == e2?.sex &&
        e1?.lastLoginTime == e2?.lastLoginTime &&
        listEquality.equals(e1?.following, e2?.following) &&
        e1?.isQuitToday == e2?.isQuitToday &&
        e1?.lastStartQuitingDate == e2?.lastStartQuitingDate &&
        e1?.isSmoke == e2?.isSmoke &&
        e1?.expectedSaveMoney == e2?.expectedSaveMoney &&
        e1?.lastPressIsTodayQuitButton == e2?.lastPressIsTodayQuitButton;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isFollowed,
        e?.hobbies,
        e?.quitDays,
        e?.continuousQuitDays,
        e?.cigarQuantity,
        e?.cigarPrice,
        e?.age,
        e?.sex,
        e?.lastLoginTime,
        e?.following,
        e?.isQuitToday,
        e?.lastStartQuitingDate,
        e?.isSmoke,
        e?.expectedSaveMoney,
        e?.lastPressIsTodayQuitButton
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
