import '/flutter_flow/flutter_flow_util.dart';
import 'lista_plataformas_widget.dart' show ListaPlataformasWidget;
import 'package:flutter/material.dart';

class ListaPlataformasModel extends FlutterFlowModel<ListaPlataformasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
