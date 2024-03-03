import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'all_chats_page_model.dart';
export 'all_chats_page_model.dart';

class AllChatsPageWidget extends StatefulWidget {
  const AllChatsPageWidget({Key? key}) : super(key: key);

  @override
  _AllChatsPageWidgetState createState() => _AllChatsPageWidgetState();
}

class _AllChatsPageWidgetState extends State<AllChatsPageWidget> {
  late AllChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllChatsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        backgroundColor: Color(0xFF242424),
        automaticallyImplyLeading: false,
        title: Text(
          '聊天室',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Noto Serif',
                color: FlutterFlowTheme.of(context).background,
                fontSize: 24.0,
                letterSpacing: 5.0,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Color(0xFF242424),
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            fillColor: Color(0xFF242424),
            icon: Icon(
              Icons.person_add,
              color: FlutterFlowTheme.of(context).tertiary,
              size: 24.0,
            ),
            onPressed: () async {
              context.pushNamed('invitechat');
            },
          ),
        ],
        centerTitle: true,
        elevation: 4.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
          child: PagedListView<DocumentSnapshot<Object?>?, ChatsRecord>(
            pagingController: _model.setListViewController(
              ChatsRecord.collection
                  .where(
                    'users',
                    arrayContains: currentUserReference,
                  )
                  .orderBy('last_message_time', descending: true),
            ),
            padding: EdgeInsets.zero,
            reverse: false,
            scrollDirection: Axis.vertical,
            builderDelegate: PagedChildBuilderDelegate<ChatsRecord>(
              // Customize what your widget looks like when it's loading the first page.
              firstPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
              // Customize what your widget looks like when it's loading another page.
              newPageProgressIndicatorBuilder: (_) => Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),

              itemBuilder: (context, _, listViewIndex) {
                final listViewChatsRecord =
                    _model.listViewPagingController!.itemList![listViewIndex];
                return StreamBuilder<FFChatInfo>(
                  stream: FFChatManager.instance
                      .getChatInfo(chatRecord: listViewChatsRecord),
                  builder: (context, snapshot) {
                    final chatInfo =
                        snapshot.data ?? FFChatInfo(listViewChatsRecord);
                    return FFChatPreview(
                      onTap: () => context.pushNamed(
                        'ChatPage',
                        queryParameters: {
                          'chatUser': serializeParam(
                            chatInfo.otherUsers.length == 1
                                ? chatInfo.otherUsersList.first
                                : null,
                            ParamType.Document,
                          ),
                          'chatRef': serializeParam(
                            chatInfo.chatRecord.reference,
                            ParamType.DocumentReference,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'chatUser': chatInfo.otherUsers.length == 1
                              ? chatInfo.otherUsersList.first
                              : null,
                        },
                      ),
                      lastChatText: chatInfo.chatPreviewMessage(),
                      lastChatTime: listViewChatsRecord.lastMessageTime,
                      seen: listViewChatsRecord.lastMessageSeenBy!
                          .contains(currentUserReference),
                      title: chatInfo.chatPreviewTitle(),
                      userProfilePic: chatInfo.chatPreviewPic(),
                      color: Color(0xFF242424),
                      unreadColor: Colors.blue,
                      titleTextStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                fontFamily: 'Noto Serif',
                                color: Colors.white,
                              ),
                      dateTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: FlutterFlowTheme.of(context).accent2,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      previewTextStyle: GoogleFonts.getFont(
                        'DM Sans',
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      borderRadius: BorderRadius.circular(0.0),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
