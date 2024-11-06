import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/top_bar_g_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'busca_global_widget.dart' show BuscaGlobalWidget;
import 'package:flutter/material.dart';

class BuscaGlobalModel extends FlutterFlowModel<BuscaGlobalWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = false;

  ///  State fields for stateful widgets in this page.

  // Model for topBarG component.
  late TopBarGModel topBarGModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (categories)] action in TextField widget.
  ApiCallResponse? categoryResults;
  // Stores action output result for [Backend Call - API (subcategories)] action in TextField widget.
  ApiCallResponse? subcatResults;
  // Stores action output result for [Backend Call - API (topics)] action in TextField widget.
  ApiCallResponse? topicResults;
  // Stores action output result for [Firestore Query - Query a collection] action in ctnTopico widget.
  CategoriesRecord? categoriaAtual;
  // Stores action output result for [Firestore Query - Query a collection] action in ctnTopico widget.
  SubcategoriesRecord? subcategoriaAtual;
  // Stores action output result for [Firestore Query - Query a collection] action in ctnTopico widget.
  TopicsRecord? topicoAtual;

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
