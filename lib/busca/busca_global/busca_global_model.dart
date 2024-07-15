import '/backend/api_requests/api_calls.dart';
import '/components/top_bar_g_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'busca_global_widget.dart' show BuscaGlobalWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BuscaGlobalModel extends FlutterFlowModel<BuscaGlobalWidget> {
  ///  Local state fields for this page.

  dynamic teste;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
    topBarGModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
