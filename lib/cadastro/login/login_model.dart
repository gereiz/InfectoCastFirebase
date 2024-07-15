import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for seuEmail widget.
  FocusNode? seuEmailFocusNode;
  TextEditingController? seuEmailTextController;
  String? Function(BuildContext, String?)? seuEmailTextControllerValidator;
  // State field(s) for suaSenha widget.
  FocusNode? suaSenhaFocusNode;
  TextEditingController? suaSenhaTextController;
  late bool suaSenhaVisibility;
  String? Function(BuildContext, String?)? suaSenhaTextControllerValidator;
  // Stores action output result for [Backend Call - API (Login)] action in btnLogin widget.
  ApiCallResponse? loginMysql;

  @override
  void initState(BuildContext context) {
    suaSenhaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    seuEmailFocusNode?.dispose();
    seuEmailTextController?.dispose();

    suaSenhaFocusNode?.dispose();
    suaSenhaTextController?.dispose();
  }
}
