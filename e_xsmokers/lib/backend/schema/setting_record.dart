import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingRecord extends FirestoreRecord {
  SettingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_open" field.
  bool? _notificationOpen;
  bool get notificationOpen => _notificationOpen ?? false;
  bool hasNotificationOpen() => _notificationOpen != null;

  // "public_post" field.
  bool? _publicPost;
  bool get publicPost => _publicPost ?? false;
  bool hasPublicPost() => _publicPost != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _notificationOpen = snapshotData['notification_open'] as bool?;
    _publicPost = snapshotData['public_post'] as bool?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('setting');

  static Stream<SettingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingRecord.fromSnapshot(s));

  static Future<SettingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingRecord.fromSnapshot(s));

  static SettingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingRecordData({
  bool? notificationOpen,
  bool? publicPost,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_open': notificationOpen,
      'public_post': publicPost,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class SettingRecordDocumentEquality implements Equality<SettingRecord> {
  const SettingRecordDocumentEquality();

  @override
  bool equals(SettingRecord? e1, SettingRecord? e2) {
    return e1?.notificationOpen == e2?.notificationOpen &&
        e1?.publicPost == e2?.publicPost &&
        e1?.user == e2?.user;
  }

  @override
  int hash(SettingRecord? e) =>
      const ListEquality().hash([e?.notificationOpen, e?.publicPost, e?.user]);

  @override
  bool isValidKey(Object? o) => o is SettingRecord;
}
