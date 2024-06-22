import '/flutter_flow/flutter_flow_util.dart';
import 'exclui_conta_widget.dart' show ExcluiContaWidget;
import 'package:flutter/material.dart';

class ExcluiContaModel extends FlutterFlowModel<ExcluiContaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
