import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'steroid_conversion_calculator_widget.dart'
    show SteroidConversionCalculatorWidget;
import 'package:flutter/material.dart';

class SteroidConversionCalculatorModel
    extends FlutterFlowModel<SteroidConversionCalculatorWidget> {
  ///  Local state fields for this page.

  double? esteroide1;

  double? esteroide2;

  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for tipoEsteroide1 widget.
  double? tipoEsteroide1Value;
  FormFieldController<double>? tipoEsteroide1ValueController;
  // State field(s) for dosagem widget.
  FocusNode? dosagemFocusNode;
  TextEditingController? dosagemTextController;
  String? Function(BuildContext, String?)? dosagemTextControllerValidator;
  // State field(s) for tipoEsteroide2 widget.
  double? tipoEsteroide2Value;
  FormFieldController<double>? tipoEsteroide2ValueController;

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
