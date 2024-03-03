import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_post_widget.dart' show EditPostWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPostModel extends FlutterFlowModel<EditPostWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for content widget.
  FocusNode? contentFocusNode1;
  TextEditingController? contentController1;
  String? Function(BuildContext, String?)? contentController1Validator;
  // State field(s) for content widget.
  FocusNode? contentFocusNode2;
  TextEditingController? contentController2;
  String? Function(BuildContext, String?)? contentController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    contentFocusNode1?.dispose();
    contentController1?.dispose();

    contentFocusNode2?.dispose();
    contentController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
