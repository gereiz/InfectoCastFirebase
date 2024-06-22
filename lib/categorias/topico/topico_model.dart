import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'topico_widget.dart' show TopicoWidget;
import 'package:flutter/material.dart';

class TopicoModel extends FlutterFlowModel<TopicoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topBar component.
  late TopBarModel topBarModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    topBarModel.dispose();
  }
}
