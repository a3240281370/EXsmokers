import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BackgroundIconMediaRecord extends FirestoreRecord {
  BackgroundIconMediaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('background_icon_media');

  static Stream<BackgroundIconMediaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BackgroundIconMediaRecord.fromSnapshot(s));

  static Future<BackgroundIconMediaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BackgroundIconMediaRecord.fromSnapshot(s));

  static BackgroundIconMediaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BackgroundIconMediaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BackgroundIconMediaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BackgroundIconMediaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BackgroundIconMediaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BackgroundIconMediaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBackgroundIconMediaRecordData({
  String? image,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class BackgroundIconMediaRecordDocumentEquality
    implements Equality<BackgroundIconMediaRecord> {
  const BackgroundIconMediaRecordDocumentEquality();

  @override
  bool equals(BackgroundIconMediaRecord? e1, BackgroundIconMediaRecord? e2) {
    return e1?.image == e2?.image && e1?.title == e2?.title;
  }

  @override
  int hash(BackgroundIconMediaRecord? e) =>
      const ListEquality().hash([e?.image, e?.title]);

  @override
  bool isValidKey(Object? o) => o is BackgroundIconMediaRecord;
}
