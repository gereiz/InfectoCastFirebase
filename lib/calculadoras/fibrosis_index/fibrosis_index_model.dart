import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fibrosis_index_widget.dart' show FibrosisIndexWidget;
import 'package:flutter/material.dart';

class FibrosisIndexModel extends FlutterFlowModel<FibrosisIndexWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeTextController;
  String? Function(BuildContext, String?)? idadeTextControllerValidator;
  // State field(s) for ast widget.
  FocusNode? astFocusNode;
  TextEditingController? astTextController;
  String? Function(BuildContext, String?)? astTextControllerValidator;
  // State field(s) for alt widget.
  FocusNode? altFocusNode;
  TextEditingController? altTextController;
  String? Function(BuildContext, String?)? altTextControllerValidator;
  // State field(s) for contagemPlaquetas widget.
  FocusNode? contagemPlaquetasFocusNode;
  TextEditingController? contagemPlaquetasTextController;
  String? Function(BuildContext, String?)?
      contagemPlaquetasTextControllerValidator;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    idadeFocusNode?.dispose();
    idadeTextController?.dispose();

    astFocusNode?.dispose();
    astTextController?.dispose();

    altFocusNode?.dispose();
    altTextController?.dispose();

    contagemPlaquetasFocusNode?.dispose();
    contagemPlaquetasTextController?.dispose();
  }
}
