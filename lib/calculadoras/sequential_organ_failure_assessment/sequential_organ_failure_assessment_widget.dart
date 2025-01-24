import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'sequential_organ_failure_assessment_model.dart';
export 'sequential_organ_failure_assessment_model.dart';

class SequentialOrganFailureAssessmentWidget extends StatefulWidget {
  const SequentialOrganFailureAssessmentWidget({super.key});

  @override
  State<SequentialOrganFailureAssessmentWidget> createState() =>
      _SequentialOrganFailureAssessmentWidgetState();
}

class _SequentialOrganFailureAssessmentWidgetState
    extends State<SequentialOrganFailureAssessmentWidget> {
  late SequentialOrganFailureAssessmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => SequentialOrganFailureAssessmentModel());

    _model.pao2TextController ??= TextEditingController();
    _model.pao2FocusNode ??= FocusNode();
    _model.pao2FocusNode!.addListener(() => safeSetState(() {}));
    _model.fio2TextController ??= TextEditingController();
    _model.fio2FocusNode ??= FocusNode();
    _model.fio2FocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF2B5EA6),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.topBarModel,
                updateCallback: () => safeSetState(() {}),
                child: const TopBarWidget(),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.66,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sequential Organ Failure Assessment (SOFA) Score',
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                'Fira Sans Extra Condensed',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 12.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 98.0,
                                child: Form(
                                  key: _model.formKey,
                                  autovalidateMode: AutovalidateMode.disabled,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              child: TextFormField(
                                                controller:
                                                    _model.pao2TextController,
                                                focusNode: _model.pao2FocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Pao₂ (mm Hg)',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Fira Sans Extra Condensed',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFFCAF23),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFFF5963),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFFF5963),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: const Color(0xFFF1F4F8),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans Extra Condensed',
                                                          color:
                                                              const Color(0xFF101213),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                validator: _model
                                                    .pao2TextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              child: TextFormField(
                                                controller:
                                                    _model.fio2TextController,
                                                focusNode: _model.fio2FocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Fio₂ (%)',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Fira Sans Extra Condensed',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFFCAF23),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFFF5963),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFFF5963),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: const Color(0xFFF1F4F8),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Fira Sans Extra Condensed',
                                                          color:
                                                              const Color(0xFF101213),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                validator: _model
                                                    .fio2TextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Em ventilação mecânica:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.flagVentilacao ==
                                                    true)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.flagVentilacao =
                                                          false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.2,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.04,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Sim',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (_model.flagVentilacao ==
                                                    false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.flagVentilacao =
                                                          true;
                                                      safeSetState(() {});
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.2,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.04,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Não',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ].divide(const SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowDropDown<int>(
                                        controller:
                                            _model.sofa1ValueController ??=
                                                FormFieldController<int>(null),
                                        options:
                                            List<int>.from([0, 1, 2, 3, 4]),
                                        optionLabels: const [
                                          '≥150',
                                          '100-149',
                                          '50-99',
                                          '20-49',
                                          '<20'
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.sofa1Value = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.89,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'Fira Sans Extra Condensed',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'Plaquetas, ×10³/µL',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .warning,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      FlutterFlowDropDown<int>(
                                        controller:
                                            _model.sofa2ValueController ??=
                                                FormFieldController<int>(null),
                                        options:
                                            List<int>.from([0, 1, 2, 3, 4]),
                                        optionLabels: const [
                                          '15',
                                          '13-14',
                                          '10-12',
                                          '6-9',
                                          '<6'
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.sofa2Value = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.89,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'Fira Sans Extra Condensed',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'Escala de coma de Glasgow',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .warning,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      FlutterFlowDropDown<int>(
                                        controller:
                                            _model.sofa3ValueController ??=
                                                FormFieldController<int>(null),
                                        options:
                                            List<int>.from([0, 1, 2, 3, 4]),
                                        optionLabels: const [
                                          '<1,2 (<20)',
                                          '1,2–1,9 (20-32)',
                                          '2,0–5,9 (33-101)',
                                          '6,0–11,9 (102-204)',
                                          '≥12,0 (>204)'
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.sofa3Value = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.89,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'Fira Sans Extra Condensed',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText: 'Bilirrubina, mg/dL (μmol/L)',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .warning,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      FlutterFlowDropDown<int>(
                                        controller:
                                            _model.sofa4ValueController ??=
                                                FormFieldController<int>(null),
                                        options:
                                            List<int>.from([0, 1, 2, 3, 4]),
                                        optionLabels: const [
                                          'Sem hipotensão',
                                          'PAM <70 mmHg',
                                          'DOPamina ≤5 ou DOBUTamina (qualquer dose)',
                                          'DOPamina >5, EPINEFrina ≤0,1 ou norEPINEFrina ≤0,1',
                                          'DOPamina >15, EPINEFrina >0,1 ou norEPINEFrina >0,1'
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.sofa4Value = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.89,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'Fira Sans Extra Condensed',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText:
                                            'P. A. média OU administração de agentes vasoativos necessária',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .warning,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      FlutterFlowDropDown<int>(
                                        controller:
                                            _model.sofa5ValueController ??=
                                                FormFieldController<int>(null),
                                        options:
                                            List<int>.from([0, 1, 2, 3, 4]),
                                        optionLabels: const [
                                          '<1,2 (<110)',
                                          '1,2–1,9 (110-170)',
                                          '2,0–3,4 (171-299)',
                                          '3,5–4,9 (300-440) ou UOP <500 mL/dia',
                                          '≥5,0 (>440) ou UOP <200 mL/dia'
                                        ],
                                        onChanged: (val) => safeSetState(
                                            () => _model.sofa5Value = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.89,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  'Fira Sans Extra Condensed',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        hintText:
                                            'Creatinina, mg/dL (μmol/L) (ou débito urinário)',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .warning,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if ((_model.sofa1Value != null) &&
                                                (_model.sofa2Value != null) &&
                                                (_model.sofa3Value != null) &&
                                                (_model.sofa4Value != null) &&
                                                (_model.sofa5Value != null)) {
                                              if (_model.flagVentilacao ==
                                                  true) {
                                                _model.resultadoPao02 =
                                                    await actions
                                                        .calculoPao2Fio2(
                                                  double.parse(_model
                                                      .pao2TextController.text),
                                                  double.parse(_model
                                                      .fio2TextController.text),
                                                );
                                                if (_model.resultadoPao02! >=
                                                    400.0) {
                                                  _model.resultAddPo2 = 0;
                                                  safeSetState(() {});
                                                } else {
                                                  if ((_model.resultadoPao02! <=
                                                          399.0) &&
                                                      (_model.resultadoPao02! >=
                                                          300.0)) {
                                                    _model.resultAddPo2 = 1;
                                                    safeSetState(() {});
                                                  } else {
                                                    if ((_model.resultadoPao02! <=
                                                            299.0) &&
                                                        (_model.resultadoPao02! >=
                                                            200.0)) {
                                                      _model.resultAddPo2 = 2;
                                                      safeSetState(() {});
                                                    } else {
                                                      if ((_model.resultadoPao02! <=
                                                              199.0) &&
                                                          (_model.resultadoPao02! >=
                                                              100.0)) {
                                                        _model.resultAddPo2 = 3;
                                                        safeSetState(() {});
                                                      } else {
                                                        if ((_model.resultadoPao02! <
                                                                100.0) &&
                                                            (_model.resultadoPao02! >=
                                                                0.0)) {
                                                          _model.resultAddPo2 =
                                                              4;
                                                          safeSetState(() {});
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: const Text(
                                                                      'Resultado:'),
                                                                  content: const Text(
                                                                      'Erro ao calcular! por favor, tente novamente.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      }
                                                    }
                                                  }
                                                }

                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Resultado: ${(_model.resultAddPo2!.toDouble() + (_model.sofa1Value!) + (_model.sofa2Value!) + (_model.sofa3Value!) + (_model.sofa4Value!) + (_model.sofa5Value!)).toString()}'),
                                                        content: Text(functions
                                                            .calculoSofaTotal(
                                                                _model
                                                                    .resultAddPo2!,
                                                                _model
                                                                    .sofa1Value!,
                                                                _model
                                                                    .sofa2Value!,
                                                                _model
                                                                    .sofa3Value!,
                                                                _model
                                                                    .sofa4Value!,
                                                                _model
                                                                    .sofa5Value!)!),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                _model.resultadoPao02Off =
                                                    await actions
                                                        .calculoPao2Fio2(
                                                  double.parse(_model
                                                      .pao2TextController.text),
                                                  double.parse(_model
                                                      .fio2TextController.text),
                                                );
                                                if (_model.resultadoPao02Off! >=
                                                    400.0) {
                                                  _model.resultAddPo2 = 0;
                                                } else {
                                                  if ((_model.resultadoPao02Off! <=
                                                          399.0) &&
                                                      (_model.resultadoPao02Off! >=
                                                          300.0)) {
                                                    _model.resultAddPo2 = 1;
                                                  } else {
                                                    if ((_model.resultadoPao02Off! <=
                                                            299.0) &&
                                                        (_model.resultadoPao02Off! >=
                                                            0.0)) {
                                                      _model.resultAddPo2 = 2;
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: const Text(
                                                                  'Resultado:'),
                                                              content: const Text(
                                                                  'Erro ao calcular! por favor, tente novamente.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }
                                                }

                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Resultado: ${(_model.resultAddPo2!.toDouble() + (_model.sofa1Value!) + (_model.sofa2Value!) + (_model.sofa3Value!) + (_model.sofa4Value!) + (_model.sofa5Value!)).toString()}'),
                                                        content: Text(functions
                                                            .calculoSofaTotal(
                                                                _model
                                                                    .resultAddPo2!,
                                                                _model
                                                                    .sofa1Value!,
                                                                _model
                                                                    .sofa2Value!,
                                                                _model
                                                                    .sofa3Value!,
                                                                _model
                                                                    .sofa4Value!,
                                                                _model
                                                                    .sofa5Value!)!),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: const Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text('Atenção!'),
                                                      content: const Text(
                                                          'Todos os campos são obrigatórios!'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Calcular',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            height: 44.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFFFCAF23),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily:
                                                          'Fira Sans Extra Condensed',
                                                      color: Colors.white,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(
                                      'https://www.mdcalc.com/calc/691/sequential-organ-failure-assessment-sofa-score');
                                },
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Referência',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
