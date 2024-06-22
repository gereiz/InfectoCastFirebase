import '/flutter_flow/flutter_flow_util.dart';
import 'atualizacoes_recentes_widget.dart' show AtualizacoesRecentesWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AtualizacoesRecentesModel
    extends FlutterFlowModel<AtualizacoesRecentesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
  }
}
