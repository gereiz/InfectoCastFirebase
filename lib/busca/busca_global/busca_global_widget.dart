import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/componentes/top_bar_g/top_bar_g_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'busca_global_model.dart';
export 'busca_global_model.dart';

class BuscaGlobalWidget extends StatefulWidget {
  const BuscaGlobalWidget({super.key});

  @override
  State<BuscaGlobalWidget> createState() => _BuscaGlobalWidgetState();
}

class _BuscaGlobalWidgetState extends State<BuscaGlobalWidget> {
  late BuscaGlobalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuscaGlobalModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF2B5EA6),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.topBarGModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TopBarGWidget(),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 61.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF2B5EA6),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 8.0),
                    child: Container(
                      width: 138.0,
                      height: 46.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(56.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: Color(0xFF57636C),
                              size: 24.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 200.0,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 500),
                                      () async {
                                        _model.categoryResults =
                                            await AlgoliaGroup.categoriesCall
                                                .call(
                                          titulo: _model.textController.text,
                                        );

                                        if ((_model
                                                .categoryResults?.succeeded ??
                                            true)) {
                                          _model.subcatResults =
                                              await AlgoliaGroup
                                                  .subcategoriesCall
                                                  .call(
                                            titulo: _model.textController.text,
                                          );

                                          if ((_model.topicResults?.succeeded ??
                                              true)) {
                                            _model.topicResults =
                                                await AlgoliaGroup.topicsCall
                                                    .call(
                                              titulo:
                                                  _model.textController.text,
                                            );

                                            if (!(_model
                                                    .topicResults?.succeeded ??
                                                true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Erro ao realizar consulta.',
                                                    style: GoogleFonts.getFont(
                                                      'Fira Sans Extra Condensed',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .warning,
                                                ),
                                              );
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Erro ao realizar consulta.',
                                                  style: GoogleFonts.getFont(
                                                    'Fira Sans Extra Condensed',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                              ),
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Erro ao realizar consulta.',
                                                style: GoogleFonts.getFont(
                                                  'Fira Sans Extra Condensed',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Pesquisar',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.transparent,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 10.0, 0.0),
                                      suffixIcon: _model
                                              .textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                _model.categoryResults =
                                                    await AlgoliaGroup
                                                        .categoriesCall
                                                        .call(
                                                  titulo: _model
                                                      .textController.text,
                                                );

                                                if ((_model.categoryResults
                                                        ?.succeeded ??
                                                    true)) {
                                                  _model.subcatResults =
                                                      await AlgoliaGroup
                                                          .subcategoriesCall
                                                          .call(
                                                    titulo: _model
                                                        .textController.text,
                                                  );

                                                  if ((_model.topicResults
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.topicResults =
                                                        await AlgoliaGroup
                                                            .topicsCall
                                                            .call(
                                                      titulo: _model
                                                          .textController.text,
                                                    );

                                                    if (!(_model.topicResults
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Erro ao realizar consulta.',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Fira Sans Extra Condensed',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .warning,
                                                        ),
                                                      );
                                                    }
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Erro ao realizar consulta.',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Fira Sans Extra Condensed',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .warning,
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Erro ao realizar consulta.',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Fira Sans Extra Condensed',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                    ),
                                                  );
                                                }

                                                safeSetState(() {});
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 12.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              'Fira Sans Extra Condensed',
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                    maxLines: null,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.67,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.textController.text != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final categoriesList =
                                            AlgoliaGroup.categoriesCall
                                                    .hits(
                                                      (_model.categoryResults
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    ?.toList() ??
                                                [];

                                        return ListView.builder(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            2.0,
                                            0,
                                            0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: categoriesList.length,
                                          itemBuilder:
                                              (context, categoriesListIndex) {
                                            final categoriesListItem =
                                                categoriesList[
                                                    categoriesListIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 8.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.categoriaAtual =
                                                      await queryCategoriesRecordOnce(
                                                    queryBuilder:
                                                        (categoriesRecord) =>
                                                            categoriesRecord
                                                                .where(
                                                      'title',
                                                      isEqualTo: getJsonField(
                                                        categoriesListItem,
                                                        r'''$.title''',
                                                      ).toString(),
                                                    ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);

                                                  context.pushNamed(
                                                    'subCategoria',
                                                    queryParameters: {
                                                      'idCategoria':
                                                          serializeParam(
                                                        _model.categoriaAtual
                                                            ?.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'icon': serializeParam(
                                                        _model.categoriaAtual
                                                            ?.icon,
                                                        ParamType.String,
                                                      ),
                                                      'title': serializeParam(
                                                        _model.categoriaAtual
                                                            ?.title,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  safeSetState(() {});
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF4F4F4),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              categoriesListItem,
                                                              r'''$.title''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                  maxChars: 45,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Fira Sans Extra Condensed',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Categoria',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Fira Sans Extra Condensed',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (_model.textController.text != '')
                                  Builder(
                                    builder: (context) {
                                      final subcategoriesList =
                                          AlgoliaGroup.subcategoriesCall
                                                  .hits(
                                                    (_model.subcatResults
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toList() ??
                                              [];

                                      return ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          2.0,
                                          0,
                                          0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: subcategoriesList.length,
                                        itemBuilder:
                                            (context, subcategoriesListIndex) {
                                          final subcategoriesListItem =
                                              subcategoriesList[
                                                  subcategoriesListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.subcategoriaAtual =
                                                    await querySubcategoriesRecordOnce(
                                                  queryBuilder:
                                                      (subcategoriesRecord) =>
                                                          subcategoriesRecord
                                                              .where(
                                                    'title',
                                                    isEqualTo: getJsonField(
                                                      subcategoriesListItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);

                                                context.pushNamed(
                                                  'topicos',
                                                  queryParameters: {
                                                    'title': serializeParam(
                                                      _model.subcategoriaAtual
                                                          ?.title,
                                                      ParamType.String,
                                                    ),
                                                    'idSubCategoria':
                                                        serializeParam(
                                                      _model.subcategoriaAtual
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                safeSetState(() {});
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF4F4F4),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            subcategoriesListItem,
                                                            r'''$.title''',
                                                          )
                                                              .toString()
                                                              .maybeHandleOverflow(
                                                                maxChars: 45,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans Extra Condensed',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Subategoria',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Fira Sans Extra Condensed',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                if (_model.textController.text != '')
                                  Builder(
                                    builder: (context) {
                                      final topicsList = AlgoliaGroup.topicsCall
                                              .hits(
                                                (_model.topicResults
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              ?.toList() ??
                                          [];

                                      return ListView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          2.0,
                                          0,
                                          0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: topicsList.length,
                                        itemBuilder:
                                            (context, topicsListIndex) {
                                          final topicsListItem =
                                              topicsList[topicsListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.topicoAtual =
                                                    await queryTopicsRecordOnce(
                                                  queryBuilder:
                                                      (topicsRecord) =>
                                                          topicsRecord.where(
                                                    'title',
                                                    isEqualTo: getJsonField(
                                                      topicsListItem,
                                                      r'''$.title''',
                                                    ).toString(),
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);

                                                context.pushNamed(
                                                  'topico',
                                                  queryParameters: {
                                                    'idTopico': serializeParam(
                                                      _model.topicoAtual
                                                          ?.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                    'title': serializeParam(
                                                      _model.topicoAtual?.title,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                safeSetState(() {});
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF4F4F4),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            topicsListItem,
                                                            r'''$.title''',
                                                          )
                                                              .toString()
                                                              .maybeHandleOverflow(
                                                                maxChars: 45,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Fira Sans Extra Condensed',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Tópico',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Fira Sans Extra Condensed',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
