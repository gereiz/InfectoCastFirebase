import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'steroid_conversion_calculator_widget.dart'
    show SteroidConversionCalculatorWidget;
import 'package:flutter/material.dart';

class SteroidConversionCalculatorModel
    extends FlutterFlowModel<SteroidConversionCalculatorWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for tipoEsteroide1 widget.
  String? tipoEsteroide1Value;
  FormFieldController<String>? tipoEsteroide1ValueController;
  // State field(s) for dosagem widget.
  FocusNode? dosagemFocusNode;
  TextEditingController? dosagemTextController;
  String? Function(BuildContext, String?)? dosagemTextControllerValidator;
  // State field(s) for tipoEsteroide2 widget.
  String? tipoEsteroide2Value;
  FormFieldController<String>? tipoEsteroide2ValueController;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    dosagemFocusNode?.dispose();
    dosagemTextController?.dispose();
  }
}
