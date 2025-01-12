import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'equations_glomecular_widget.dart' show EquationsGlomecularWidget;
import 'package:flutter/material.dart';

class EquationsGlomecularModel
    extends FlutterFlowModel<EquationsGlomecularWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for tipoCreatinina widget.
  String? tipoCreatininaValue;
  FormFieldController<String>? tipoCreatininaValueController;
  // State field(s) for idade widget.
  FocusNode? idadeFocusNode;
  TextEditingController? idadeTextController;
  String? Function(BuildContext, String?)? idadeTextControllerValidator;
  // State field(s) for sexo widget.
  String? sexoValue;
  FormFieldController<String>? sexoValueController;
  // State field(s) for creatininaSerica widget.
  FocusNode? creatininaSericaFocusNode;
  TextEditingController? creatininaSericaTextController;
  String? Function(BuildContext, String?)?
      creatininaSericaTextControllerValidator;
  // State field(s) for creatininaCSerica widget.
  FocusNode? creatininaCSericaFocusNode;
  TextEditingController? creatininaCSericaTextController;
  String? Function(BuildContext, String?)?
      creatininaCSericaTextControllerValidator;
  // State field(s) for corrida widget.
  FocusNode? corridaFocusNode;
  TextEditingController? corridaTextController;
  String? Function(BuildContext, String?)? corridaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    idadeFocusNode?.dispose();
    idadeTextController?.dispose();

    creatininaSericaFocusNode?.dispose();
    creatininaSericaTextController?.dispose();

    creatininaCSericaFocusNode?.dispose();
    creatininaCSericaTextController?.dispose();

    corridaFocusNode?.dispose();
    corridaTextController?.dispose();
  }
}
