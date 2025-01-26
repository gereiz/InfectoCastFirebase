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

  int? resultAddPo2;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for topBar component.
  late TopBarModel topBarModel;
  // State field(s) for pao2 widget.
  FocusNode? pao2FocusNode;
  TextEditingController? pao2TextController;
  String? Function(BuildContext, String?)? pao2TextControllerValidator;
  String? _pao2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Pao₂ (mm Hg) é obrigatório';
    }

    return null;
  }

  // State field(s) for fio2 widget.
  FocusNode? fio2FocusNode;
  TextEditingController? fio2TextController;
  String? Function(BuildContext, String?)? fio2TextControllerValidator;
  String? _fio2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Fio₂ (%) é obrigatório';
    }

    return null;
  }

  // State field(s) for sofa1 widget.
  int? sofa1Value;
  FormFieldController<int>? sofa1ValueController;
  // State field(s) for sofa2 widget.
  int? sofa2Value;
  FormFieldController<int>? sofa2ValueController;
  // State field(s) for sofa3 widget.
  int? sofa3Value;
  FormFieldController<int>? sofa3ValueController;
  // State field(s) for sofa4 widget.
  int? sofa4Value;
  FormFieldController<int>? sofa4ValueController;
  // State field(s) for sofa5 widget.
  int? sofa5Value;
  FormFieldController<int>? sofa5ValueController;
  // Stores action output result for [Custom Action - calculoPao2Fio2] action in btnCalc widget.
  double? resultadoPao02;
  // Stores action output result for [Custom Action - calculoPao2Fio2] action in btnCalc widget.
  double? resultadoPao02Off;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    pao2TextControllerValidator = _pao2TextControllerValidator;
    fio2TextControllerValidator = _fio2TextControllerValidator;
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
