import '/backend/backend.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
      onTap: () => FocusScope.of(context).unfocus(),
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
                StreamBuilder<List<TopicsRecord>>(
                  stream: queryTopicsRecord(
                    queryBuilder: (topicsRecord) => topicsRecord.where(
                      'title',
                      isEqualTo: widget.title,
                    ),
                    singleRecord: true,
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
                    List<TopicsRecord> containerTopicsRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerTopicsRecord =
                        containerTopicsRecordList.isNotEmpty
                            ? containerTopicsRecordList.first
                            : null;

                    return Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.67,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                    containerTopicsRecord
                                                        ?.content)!,
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.96,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.61,
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
                            ].addToEnd(const SizedBox(height: 20.0)),
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
