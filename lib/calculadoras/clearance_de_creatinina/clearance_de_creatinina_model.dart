import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'clearance_de_creatinina_widget.dart' show ClearanceDeCreatininaWidget;
import 'package:flutter/material.dart';

class ClearanceDeCreatininaModel
    extends FlutterFlowModel<ClearanceDeCreatininaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeTextController;
  String? Function(BuildContext, String?)? idadeTextControllerValidator;
  // State field(s) for peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  // State field(s) for creatinina widget.
  FocusNode? creatininaFocusNode;
  TextEditingController? creatininaTextController;
  String? Function(BuildContext, String?)? creatininaTextControllerValidator;
  // State field(s) for sexo widget.
  String? sexoValue;
  FormFieldController<String>? sexoValueController;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    idadeFocusNode?.dispose();
    idadeTextController?.dispose();

    pesoFocusNode?.dispose();
    pesoTextController?.dispose();

    creatininaFocusNode?.dispose();
    creatininaTextController?.dispose();
  }
}
