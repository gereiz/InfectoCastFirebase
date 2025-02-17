import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'meld_na_widget.dart' show MeldNaWidget;
import 'package:flutter/material.dart';

class MeldNaModel extends FlutterFlowModel<MeldNaWidget> {
  ///  Local state fields for this page.

  bool dialise = false;

  double totalValue = 0.0;

  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for creatinina widget.
  FocusNode? creatininaFocusNode;
  TextEditingController? creatininaTextController;
  String? Function(BuildContext, String?)? creatininaTextControllerValidator;
  // State field(s) for bilirrubina widget.
  FocusNode? bilirrubinaFocusNode;
  TextEditingController? bilirrubinaTextController;
  String? Function(BuildContext, String?)? bilirrubinaTextControllerValidator;
  // State field(s) for inr widget.
  FocusNode? inrFocusNode;
  TextEditingController? inrTextController;
  String? Function(BuildContext, String?)? inrTextControllerValidator;
  // State field(s) for sodio widget.
  FocusNode? sodioFocusNode;
  TextEditingController? sodioTextController;
  String? Function(BuildContext, String?)? sodioTextControllerValidator;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    creatininaFocusNode?.dispose();
    creatininaTextController?.dispose();

    bilirrubinaFocusNode?.dispose();
    bilirrubinaTextController?.dispose();

    inrFocusNode?.dispose();
    inrTextController?.dispose();

    sodioFocusNode?.dispose();
    sodioTextController?.dispose();
  }
}
