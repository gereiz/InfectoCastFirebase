import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sequential_organ_failure_assessment_widget.dart'
    show SequentialOrganFailureAssessmentWidget;
import 'package:flutter/material.dart';

class SequentialOrganFailureAssessmentModel
    extends FlutterFlowModel<SequentialOrganFailureAssessmentWidget> {
  ///  Local state fields for this page.

  bool flagVentilacao = false;

  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for pao2 widget.
  FocusNode? pao2FocusNode;
  TextEditingController? pao2TextController;
  String? Function(BuildContext, String?)? pao2TextControllerValidator;
  // State field(s) for fio2 widget.
  FocusNode? fio2FocusNode;
  TextEditingController? fio2TextController;
  String? Function(BuildContext, String?)? fio2TextControllerValidator;
  // State field(s) for tipoEsteroide1 widget.
  String? tipoEsteroide1Value1;
  FormFieldController<String>? tipoEsteroide1ValueController1;
  // State field(s) for tipoEsteroide1 widget.
  String? tipoEsteroide1Value2;
  FormFieldController<String>? tipoEsteroide1ValueController2;
  // State field(s) for tipoEsteroide1 widget.
  String? tipoEsteroide1Value3;
  FormFieldController<String>? tipoEsteroide1ValueController3;
  // State field(s) for tipoEsteroide1 widget.
  String? tipoEsteroide1Value4;
  FormFieldController<String>? tipoEsteroide1ValueController4;
  // State field(s) for tipoEsteroide1 widget.
  String? tipoEsteroide1Value5;
  FormFieldController<String>? tipoEsteroide1ValueController5;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    pao2FocusNode?.dispose();
    pao2TextController?.dispose();

    fio2FocusNode?.dispose();
    fio2TextController?.dispose();
  }
}
