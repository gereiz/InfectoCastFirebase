import '/flutter_flow/flutter_flow_util.dart';
import 'termos_widget.dart' show TermosWidget;
import 'package:flutter/material.dart';

class TermosModel extends FlutterFlowModel<TermosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
