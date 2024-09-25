import '/components/top_bar_g_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'busca_global_widget.dart' show BuscaGlobalWidget;
import 'package:flutter/material.dart';

class BuscaGlobalModel extends FlutterFlowModel<BuscaGlobalWidget> {
  ///  Local state fields for this page.

  dynamic teste;

  ///  State fields for stateful widgets in this page.

  // Model for topBarG component.
  late TopBarGModel topBarGModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    topBarGModel = createModel(context, () => TopBarGModel());
  }

  @override
  void dispose() {
    topBarGModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
