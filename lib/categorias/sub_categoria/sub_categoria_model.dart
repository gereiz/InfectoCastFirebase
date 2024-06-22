import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sub_categoria_widget.dart' show SubCategoriaWidget;
import 'package:flutter/material.dart';

class SubCategoriaModel extends FlutterFlowModel<SubCategoriaWidget> {
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
