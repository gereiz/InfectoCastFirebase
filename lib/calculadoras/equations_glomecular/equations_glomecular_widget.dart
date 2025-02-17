import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'equations_glomecular_model.dart';
export 'equations_glomecular_model.dart';

class EquationsGlomecularWidget extends StatefulWidget {
  const EquationsGlomecularWidget({super.key});

  @override
  State<EquationsGlomecularWidget> createState() =>
      _EquationsGlomecularWidgetState();
}

class _EquationsGlomecularWidgetState extends State<EquationsGlomecularWidget> {
  late EquationsGlomecularModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EquationsGlomecularModel());

    _model.idadeTextController ??= TextEditingController();
    _model.idadeFocusNode ??= FocusNode();
    _model.idadeFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.sexoValueController?.value = '0';
        });
      },
    );
    _model.creatininaSericaTextController ??= TextEditingController();
    _model.creatininaSericaFocusNode ??= FocusNode();
    _model.creatininaSericaFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.sexoValueController?.value = '0';
        });
      },
    );
    _model.creatininaCSericaTextController ??= TextEditingController();
    _model.creatininaCSericaFocusNode ??= FocusNode();
    _model.creatininaCSericaFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.sexoValueController?.value = '0';
        });
      },
    );
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
        backgroundColor: Color(0xFF2B5EA6),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.topBarModel,
                updateCallback: () => safeSetState(() {}),
                child: TopBarWidget(),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.68,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
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
                                      'CKD-EPI Equations for Glomerular Filtration Rate (GFR)',
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
                                  ].divide(SizedBox(height: 12.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 14.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .tipoCreatininaValueController ??=
                                          FormFieldController<String>(
                                        _model.tipoCreatininaValue ??=
                                            'Creatinina CKD-EPI 2021',
                                      ),
                                      options: [
                                        'Creatinina CKD-EPI 2021',
                                        '2021 CKD-EPI Creatinina-Cistatina C',
                                        'Creatinina CKD-EPI 2009',
                                        '2012 CKD-EPI Cistatina C',
                                        '2012 CKD-EPI Creatinina–Cistatina C'
                                      ],
                                      onChanged: (val) => safeSetState(() =>
                                          _model.tipoCreatininaValue = val),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.89,
                                      height: 56.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                'Fira Sans Extra Condensed',
                                            color: FlutterFlowTheme.of(context)
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
                                      fillColor:
                                          FlutterFlowTheme.of(context).warning,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 14.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: TextFormField(
                                        controller: _model.idadeTextController,
                                        focusNode: _model.idadeFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Idade: ',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily:
                                                        'Fira Sans Extra Condensed',
                                                    color: Color(0xFF57636C),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
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
                                            borderSide: BorderSide(
                                              color: Color(0xFFFCAF23),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF5963),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFF1F4F8),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  'Fira Sans Extra Condensed',
                                              color: Color(0xFF101213),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        keyboardType: const TextInputType
                                            .numberWithOptions(decimal: true),
                                        validator: _model
                                            .idadeTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller: _model.sexoValueController ??=
                                        FormFieldController<String>(
                                      _model.sexoValue ??= 'Feminino',
                                    ),
                                    options: ['Feminino', 'Masculino'],
                                    onChanged: (val) => safeSetState(
                                        () => _model.sexoValue = val),
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.89,
                                    height: 56.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              'Fira Sans Extra Condensed',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hintText: 'Sexo',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                  if ((_model.tipoCreatininaValue !=
                                          '2012 CKD-EPI Cistatina C') &&
                                      (_model.tipoCreatininaValue !=
                                          '2012 CKD-EPI Cistatina C'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 14.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        child: TextFormField(
                                          controller: _model
                                              .creatininaSericaTextController,
                                          focusNode:
                                              _model.creatininaSericaFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Creatinina sérica',
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
                                              borderSide: BorderSide(
                                                color: Color(0xFFFCAF23),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0xFFF1F4F8),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF101213),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .creatininaSericaTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  if ((_model.tipoCreatininaValue !=
                                          'Creatinina CKD-EPI 2021') &&
                                      (_model.tipoCreatininaValue !=
                                          'Creatinina CKD-EPI 2009'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 14.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        child: TextFormField(
                                          controller: _model
                                              .creatininaCSericaTextController,
                                          focusNode:
                                              _model.creatininaCSericaFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Creatinina C sérica',
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
                                              borderSide: BorderSide(
                                                color: Color(0xFFFCAF23),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFFFF5963),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0xFFF1F4F8),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF101213),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .creatininaCSericaTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  if ((_model.tipoCreatininaValue !=
                                          'Creatinina CKD-EPI 2021') &&
                                      (_model.tipoCreatininaValue !=
                                          '2021 CKD-EPI Creatinina-Cistatina C') &&
                                      (_model.tipoCreatininaValue !=
                                          '2012 CKD-EPI Cistatina C'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 14.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.etniaValueController ??=
                                                FormFieldController<String>(
                                          _model.etniaValue ??= 'Negro',
                                        ),
                                        options: ['Negro', 'Outros'],
                                        onChanged: (val) => safeSetState(
                                            () => _model.etniaValue = val),
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
                                        hintText: 'Etnia',
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
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.resultValue = functions.equationsforGlomerularFiltration(
                                            int.parse(_model
                                                .idadeTextController.text),
                                            _model.sexoValue!,
                                            _model.creatininaSericaTextController.text !=
                                                        ''
                                                ? double.parse(_model
                                                    .creatininaSericaTextController
                                                    .text)
                                                : 0.0,
                                            _model.tipoCreatininaValue,
                                            _model.creatininaCSericaTextController.text != ''
                                                ? double.parse(_model.creatininaCSericaTextController.text)
                                                : 0.0,
                                            _model.etniaValue != null && _model.etniaValue != '' ? _model.etniaValue! : 'Negro')!;
                                        safeSetState(() {});
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text('${formatNumber(
                                                  functions.equationsforGlomerularFiltration(
                                                      int.parse(_model
                                                          .idadeTextController
                                                          .text),
                                                      _model.sexoValue!,
                                                      _model.creatininaSericaTextController.text != ''
                                                          ? double.parse(_model
                                                              .creatininaSericaTextController
                                                              .text)
                                                          : 0.0,
                                                      _model
                                                          .tipoCreatininaValue,
                                                      _model.creatininaCSericaTextController.text !=
                                                                  ''
                                                          ? double.parse(_model
                                                              .creatininaCSericaTextController
                                                              .text)
                                                          : 0.0,
                                                      _model.etniaValue != null &&
                                                              _model.etniaValue != ''
                                                          ? _model.etniaValue!
                                                          : 'Negro'),
                                                  formatType: FormatType.custom,
                                                  format: '##',
                                                  locale: 'pt_BR',
                                                )} ml/min/1.73 m²'),
                                                content: Text(() {
                                                  if (_model.resultValue >=
                                                      90.0) {
                                                    return 'Estágio I ';
                                                  } else if (_model
                                                          .resultValue >=
                                                      60.0) {
                                                    return 'Estágio II';
                                                  } else if (_model
                                                          .resultValue >=
                                                      45.0) {
                                                    return 'Estagio III';
                                                  } else if (_model
                                                          .resultValue >=
                                                      30.0) {
                                                    return 'Estagio IV';
                                                  } else if (_model
                                                          .resultValue >=
                                                      15.0) {
                                                    return 'Estagio V';
                                                  } else if (_model
                                                          .resultValue >=
                                                      0.0) {
                                                    return 'Estagio VI';
                                                  } else {
                                                    return 'Erro';
                                                  }
                                                }()),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFFCAF23),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  'Fira Sans Extra Condensed',
                                              color: Colors.white,
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 40.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await launchURL(
                                                'https://www.mdcalc.com/calc/3939/ckd-epi-equations-glomerular-filtration-rate-gfr#evidence');
                                          },
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Referência',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 12.0)),
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
