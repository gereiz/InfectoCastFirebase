import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

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
