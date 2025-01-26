import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'steroid_conversion_calculator_model.dart';
export 'steroid_conversion_calculator_model.dart';

class SteroidConversionCalculatorWidget extends StatefulWidget {
  const SteroidConversionCalculatorWidget({super.key});

  @override
  State<SteroidConversionCalculatorWidget> createState() =>
      _SteroidConversionCalculatorWidgetState();
}

class _SteroidConversionCalculatorWidgetState
    extends State<SteroidConversionCalculatorWidget> {
  late SteroidConversionCalculatorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SteroidConversionCalculatorModel());

    _model.dosagemTextController ??= TextEditingController();
    _model.dosagemFocusNode ??= FocusNode();
    _model.dosagemFocusNode!.addListener(() => safeSetState(() {}));
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
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
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
                                      'Steroid Conversion Calculator',
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
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Convertendo de:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 14.0),
                                      child: FlutterFlowDropDown<double>(
                                        controller: _model
                                                .tipoEsteroide1ValueController ??=
                                            FormFieldController<double>(null),
                                        options: List<double>.from([
                                          75.0,
                                          25.0,
                                          0.75,
                                          20.0,
                                          400.0,
                                          500.0,
                                          5.0,
                                          4.0
                                        ]),
                                        optionLabels: const [
                                          'Betametasona (IV)',
                                          'Cortisona (PO)',
                                          'Dexametasona (IV ou VO)',
                                          'Hidrocortisona (IV ou PO)',
                                          'MetilPrednisoLONE (IV ou PO)',
                                          'Prednisona LONE (PO)',
                                          'PredniSONA (PO)',
                                          'Triancinolona (IV)'
                                        ],
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.tipoEsteroide1Value = val);
                                          if ((_model.tipoEsteroide1Value ==
                                                  75.0) ||
                                              (_model.tipoEsteroide1Value ==
                                                  400.0) ||
                                              (_model.tipoEsteroide1Value ==
                                                  500.0)) {
                                            _model.esteroide1 =
                                                (_model.tipoEsteroide1Value!) /
                                                    100;
                                          } else {
                                            _model.esteroide1 =
                                                _model.tipoEsteroide1Value;
                                          }
                                        },
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
                                        hintText: 'Selecione',
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        child: TextFormField(
                                          controller:
                                              _model.dosagemTextController,
                                          focusNode: _model.dosagemFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                'Dosagem do medicamento em mg',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      fontSize: 15.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFFCAF23),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xFFF1F4F8),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: const Color(0xFF101213),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .dosagemTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Convertendo para:',
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 14.0),
                                      child: FlutterFlowDropDown<double>(
                                        controller: _model
                                                .tipoEsteroide2ValueController ??=
                                            FormFieldController<double>(null),
                                        options: List<double>.from([
                                          75.0,
                                          25.0,
                                          0.75,
                                          20.0,
                                          400.0,
                                          500.0,
                                          5.0,
                                          4.0
                                        ]),
                                        optionLabels: const [
                                          'Betametasona (IV)',
                                          'Cortisona (PO)',
                                          'Dexametasona (IV ou VO)',
                                          'Hidrocortisona (IV ou PO)',
                                          'MetilPrednisoLONE (IV ou PO)',
                                          'Prednisona LONE (PO)',
                                          'PredniSONA (PO)',
                                          'Triancinolona (IV)'
                                        ],
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.tipoEsteroide2Value = val);
                                          if ((_model.tipoEsteroide2Value ==
                                                  75.0) ||
                                              (_model.tipoEsteroide2Value ==
                                                  400.0) ||
                                              (_model.tipoEsteroide2Value ==
                                                  500.0)) {
                                            _model.esteroide2 =
                                                (_model.tipoEsteroide2Value!) /
                                                    100;
                                            safeSetState(() {});
                                          } else {
                                            _model.esteroide2 =
                                                _model.tipoEsteroide2Value;
                                            safeSetState(() {});
                                          }
                                        },
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
                                        hintText: 'Selecione',
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'Resultado: ${formatNumber(
                                                    ((_model.esteroide2!) *
                                                            double.parse(_model
                                                                .dosagemTextController
                                                                .text)) /
                                                        (_model.esteroide1!),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '##0.00 mg',
                                                    locale: '',
                                                  )}'),
                                                  content: Text(
                                                      'Equivalência aproximada de: ${() {
                                                    if (_model
                                                            .tipoEsteroide2Value ==
                                                        75.0) {
                                                      return 'Betametasona';
                                                    } else if (_model
                                                            .tipoEsteroide2Value ==
                                                        25.0) {
                                                      return 'Cortisona';
                                                    } else if (_model
                                                            .tipoEsteroide2Value ==
                                                        0.75) {
                                                      return 'Dexametasona (Decadron)';
                                                    } else if (_model
                                                            .tipoEsteroide2Value ==
                                                        20.0) {
                                                      return 'Hidrocortisona';
                                                    } else if (_model
                                                            .tipoEsteroide2Value ==
                                                        400.0) {
                                                      return 'MetilPrednisoLONE';
                                                    } else if (_model
                                                            .tipoEsteroide2Value ==
                                                        500.0) {
                                                      return 'PrednisonaLONE';
                                                    } else if (_model
                                                            .tipoEsteroide2Value ==
                                                        5.0) {
                                                      return 'PredniSONE';
                                                    } else if (_model
                                                            .tipoEsteroide2Value ==
                                                        4.0) {
                                                      return 'Triancinolona';
                                                    } else {
                                                      return '';
                                                    }
                                                  }()} a: ${_model.dosagemTextController.text}mg de: ${() {
                                                    if (_model
                                                            .tipoEsteroide1Value ==
                                                        75.0) {
                                                      return 'Betametasona';
                                                    } else if (_model
                                                            .tipoEsteroide1Value ==
                                                        25.0) {
                                                      return 'Cortisona';
                                                    } else if (_model
                                                            .tipoEsteroide1Value ==
                                                        0.75) {
                                                      return 'Dexametasona (Decadron)';
                                                    } else if (_model
                                                            .tipoEsteroide1Value ==
                                                        20.0) {
                                                      return 'Hidrocortisona';
                                                    } else if (_model
                                                            .tipoEsteroide1Value ==
                                                        400.0) {
                                                      return 'MetilPrednisoLONE';
                                                    } else if (_model
                                                            .tipoEsteroide1Value ==
                                                        500.0) {
                                                      return 'PrednisonaLONE';
                                                    } else if (_model
                                                            .tipoEsteroide1Value ==
                                                        5.0) {
                                                      return 'PredniSONE';
                                                    } else if (_model
                                                            .tipoEsteroide1Value ==
                                                        4.0) {
                                                      return 'Triancinolona';
                                                    } else {
                                                      return '';
                                                    }
                                                  }()}'),
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
                                        },
                                        text: 'Calcular',
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
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
                                  ],
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
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(
                                      'https://www.mdcalc.com/calc/2040/steroid-conversion-calculator#evidence');
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
                      ].divide(const SizedBox(height: 16.0)),
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
