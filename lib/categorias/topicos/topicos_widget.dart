import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'topicos_model.dart';
export 'topicos_model.dart';

class TopicosWidget extends StatefulWidget {
  const TopicosWidget({
    super.key,
    required this.title,
    required this.idSubCategoria,
  });

  final String? title;
  final DocumentReference? idSubCategoria;

  @override
  State<TopicosWidget> createState() => _TopicosWidgetState();
}

class _TopicosWidgetState extends State<TopicosWidget> {
  late TopicosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopicosModel());

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
                  padding: EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: StreamBuilder<List<TopicsRecord>>(
                            stream: queryTopicsRecord(
                              queryBuilder: (topicsRecord) => topicsRecord
                                  .where(
                                    'id_subcategory',
                                    isEqualTo: widget.idSubCategoria,
                                  )
                                  .orderBy('title'),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingFour(
                                      color: Color(0xFFFCAF23),
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<TopicsRecord> listViewTopicsRecordList =
                                  snapshot.data!;

                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  2.0,
                                  0,
                                  20.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewTopicsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewTopicsRecord =
                                      listViewTopicsRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if ((listViewTopicsRecord.premium ==
                                                0) &&
                                            (listViewTopicsRecord.gold == 0)) {
                                          context.pushNamed(
                                            'topico',
                                            queryParameters: {
                                              'idTopico': serializeParam(
                                                listViewTopicsRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'title': serializeParam(
                                                listViewTopicsRecord.title,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                                  currentUserDocument?.isAdmin,
                                                  false) ==
                                              true) {
                                            context.pushNamed(
                                              'topico',
                                              queryParameters: {
                                                'idTopico': serializeParam(
                                                  listViewTopicsRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'title': serializeParam(
                                                  listViewTopicsRecord.title,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            final isEntitled =
                                                await revenue_cat.isEntitled(
                                                        'usuarioPremium') ??
                                                    false;
                                            if (!isEntitled) {
                                              await revenue_cat.loadOfferings();
                                            }

                                            if (isEntitled) {
                                              context.pushNamed(
                                                'topico',
                                                queryParameters: {
                                                  'idTopico': serializeParam(
                                                    listViewTopicsRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'title': serializeParam(
                                                    listViewTopicsRecord.title,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              context.pushNamed('planos');
                                            }
                                          }
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF4F4F4),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  listViewTopicsRecord.title,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'Fira Sans Extra Condensed',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if ((listViewTopicsRecord
                                                                .premium ==
                                                            0) &&
                                                        (listViewTopicsRecord
                                                                .gold ==
                                                            0))
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/202404221054free.png',
                                                          width: 20.0,
                                                          height: 20.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    if (listViewTopicsRecord
                                                            .premium ==
                                                        1)
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/premium.png',
                                                          width: 20.0,
                                                          height: 20.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    if (listViewTopicsRecord
                                                            .gold ==
                                                        1)
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/202404221103gold.png',
                                                          width: 20.0,
                                                          height: 20.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
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
                      ],
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
