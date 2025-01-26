import '/backend/api_requests/api_calls.dart';
import '/componentes/lista_videos/lista_videos_widget.dart';
import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'topico_model.dart';
export 'topico_model.dart';

class TopicoWidget extends StatefulWidget {
  const TopicoWidget({
    super.key,
    required this.idTopico,
    required this.title,
  });

  final DocumentReference? idTopico;
  final String? title;

  @override
  State<TopicoWidget> createState() => _TopicoWidgetState();
}

class _TopicoWidgetState extends State<TopicoWidget> {
  late TopicoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopicoModel());

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
                FutureBuilder<ApiCallResponse>(
                  future: LinksInfectoGroup.topicoCall.call(
                    id: widget.idTopico?.id,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return const Center(
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
                      height: MediaQuery.sizeOf(context).height * 0.66,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.98,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.64,
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    AutoSizeText(
                                                      valueOrDefault<String>(
                                                        widget.title,
                                                        'title',
                                                      ),
                                                      minFontSize: 14.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                  content: functions
                                                      .setHtmlWithFiraSans(
                                                          LinksInfectoGroup
                                                              .topicoCall
                                                              .conteudo(
                                                    containerTopicoResponse
                                                        .jsonBody,
                                                  ))!,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.96,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.57,
                                                  verticalScroll: true,
                                                  horizontalScroll: false,
                                                  html: true,
                                                ),
                                              ].divide(const SizedBox(height: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.98, 1.01),
                                      child: Builder(
                                        builder: (context) =>
                                            FlutterFlowIconButton(
                                          borderRadius: 100.0,
                                          buttonSize: 30.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          hoverColor: const Color(0xBDDC2732),
                                          icon: FaIcon(
                                            FontAwesomeIcons.youtube,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 13.0,
                                          ),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      const AlignmentDirectional(
                                                              0.0, 1.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: SizedBox(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.6,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.98,
                                                        child:
                                                            ListaVideosWidget(
                                                          titulo:
                                                              widget.title!,
                                                          topicoRef:
                                                              widget.idTopico!,
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
    );
  }
}
