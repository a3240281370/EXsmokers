import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HobbiesRecord extends FirestoreRecord {
  HobbiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hobby" field.
  String? _hobby;
  String get hobby => _hobby ?? '';
  bool hasHobby() => _hobby != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _hobby = snapshotData['hobby'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hobbies');

  static Stream<HobbiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HobbiesRecord.fromSnapshot(s));

  static Future<HobbiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HobbiesRecord.fromSnapshot(s));

  static HobbiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HobbiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HobbiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HobbiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HobbiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HobbiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHobbiesRecordData({
  String? hobby,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hobby': hobby,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class HobbiesRecordDocumentEquality implements Equality<HobbiesRecord> {
  const HobbiesRecordDocumentEquality();

  @override
  bool equals(HobbiesRecord? e1, HobbiesRecord? e2) {
    return e1?.hobby == e2?.hobby && e1?.user == e2?.user;
  }

  @override
  int hash(HobbiesRecord? e) => const ListEquality().hash([e?.hobby, e?.user]);

  @override
  bool isValidKey(Object? o) => o is HobbiesRecord;
}
