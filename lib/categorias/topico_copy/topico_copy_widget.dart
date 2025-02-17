import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'topico_copy_model.dart';
export 'topico_copy_model.dart';

class TopicoCopyWidget extends StatefulWidget {
  const TopicoCopyWidget({
    super.key,
    required this.idTopico,
    required this.title,
  });

  final DocumentReference? idTopico;
  final String? title;

  @override
  State<TopicoCopyWidget> createState() => _TopicoCopyWidgetState();
}

class _TopicoCopyWidgetState extends State<TopicoCopyWidget>
    with TickerProviderStateMixin {
  late TopicoCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopicoCopyModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: Offset(0, 1.396),
            end: Offset(0, 0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 350.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.222, 0),
            end: Offset(0, 0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 40.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return YoutubeFullScreenWrapper(
      child: GestureDetector(
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
                    model: _model.topBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TopBarWidget(),
                  ),
                  FutureBuilder<ApiCallResponse>(
                    future: LinksInfectoGroup.topicoCall.call(
                      id: widget.idTopico?.id,
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
                      final containerTopicoResponse = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.67,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 10.0, 5.0, 10.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  valueOrDefault<String>(
                                                    widget.title,
                                                    'title',
                                                  ),
                                                  minFontSize: 14.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Fira Sans Extra Condensed',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            FlutterFlowWebView(
                                              content:
                                                  functions.setHtmlWithFiraSans(
                                                      LinksInfectoGroup
                                                          .topicoCall
                                                          .conteudo(
                                                containerTopicoResponse
                                                    .jsonBody,
                                              ))!,
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.96,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.6,
                                              verticalScroll: true,
                                              horizontalScroll: false,
                                              html: true,
                                            ),
                                            if (!FFAppState().Premium)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Somente usuários Premium podem visualizar os vídeos!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .displaySmall
                                                            .override(
                                                              fontFamily:
                                                                  'Fira Sans Extra Condensed',
                                                              fontSize: 24.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textOnPageLoadAnimation']!),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'planos');
                                                      },
                                                      text: 'Seja Premium',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 48.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFFCAF23),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Fira Sans Extra Condensed',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'buttonOnPageLoadAnimation']!),
                                                  ),
                                                ],
                                              ),
                                            if (FFAppState().Premium)
                                              StreamBuilder<List<TopicsRecord>>(
                                                stream: queryTopicsRecord(
                                                  queryBuilder:
                                                      (topicsRecord) =>
                                                          topicsRecord.where(
                                                    'title',
                                                    isEqualTo: widget.title,
                                                  ),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            SpinKitFadingFour(
                                                          color:
                                                              Color(0xFFFCAF23),
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TopicsRecord>
                                                      listViewTopicsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final listViewTopicsRecord =
                                                      listViewTopicsRecordList
                                                              .isNotEmpty
                                                          ? listViewTopicsRecordList
                                                              .first
                                                          : null;

                                                  return Builder(
                                                    builder: (context) {
                                                      final topicVideos =
                                                          listViewTopicsRecord
                                                                  ?.videos
                                                                  .toList() ??
                                                              [];

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            topicVideos.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            topicVideosIndex) {
                                                          final topicVideosItem =
                                                              topicVideos[
                                                                  topicVideosIndex];
                                                          return FlutterFlowYoutubePlayer(
                                                            url:
                                                                '${topicVideosItem}',
                                                            autoPlay: false,
                                                            looping: true,
                                                            mute: false,
                                                            showControls: false,
                                                            showFullScreen:
                                                                true,
                                                            strictRelatedVideos:
                                                                true,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                          ].divide(SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ].addToEnd(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
