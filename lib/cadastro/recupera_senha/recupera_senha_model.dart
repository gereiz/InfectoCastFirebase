import '/flutter_flow/flutter_flow_util.dart';
import 'recupera_senha_widget.dart' show RecuperaSenhaWidget;
import 'package:flutter/material.dart';

class RecuperaSenhaModel extends FlutterFlowModel<RecuperaSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
