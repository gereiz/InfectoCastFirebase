import '/backend/api_requests/api_calls.dart';
import '/componentes/top_bar_g/top_bar_g_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'busca_global_copy_widget.dart' show BuscaGlobalCopyWidget;
import 'package:flutter/material.dart';

class BuscaGlobalCopyModel extends FlutterFlowModel<BuscaGlobalCopyWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = false;

  ///  State fields for stateful widgets in this page.

  // Model for topBarG component.
  late TopBarGModel topBarGModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Multi Index)] action in TextField widget.
  ApiCallResponse? searchResult;

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
