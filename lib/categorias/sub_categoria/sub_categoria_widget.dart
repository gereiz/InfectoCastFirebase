import '/backend/api_requests/api_calls.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sub_categoria_model.dart';
export 'sub_categoria_model.dart';

class SubCategoriaWidget extends StatefulWidget {
  const SubCategoriaWidget({
    super.key,
    this.idCategoria,
    required this.icon,
    required this.title,
  });

  final int? idCategoria;
  final String? icon;
  final String? title;

  @override
  State<SubCategoriaWidget> createState() => _SubCategoriaWidgetState();
}

class _SubCategoriaWidgetState extends State<SubCategoriaWidget> {
  late SubCategoriaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubCategoriaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.topBarModel,
              updateCallback: () => setState(() {}),
              child: TopBarWidget(),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FutureBuilder<ApiCallResponse>(
                          future: InfectoCastGroup.listaSubCategoriasCall.call(
                            idCategory: widget!.idCategoria,
                            authToken: FFAppState().authtoken,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final gridViewListaSubCategoriasResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final subCatList = getJsonField(
                                  gridViewListaSubCategoriasResponse.jsonBody,
                                  r'''$''',
                                ).toList();

                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 6.0,
                                    childAspectRatio: 1.8,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: subCatList.length,
                                  itemBuilder: (context, subCatListIndex) {
                                    final subCatListItem =
                                        subCatList[subCatListIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'topicos',
                                          queryParameters: {
                                            'title': serializeParam(
                                              '',
                                              ParamType.String,
                                            ),
                                            'idSubCategoria': serializeParam(
                                              getJsonField(
                                                subCatListItem,
                                                r'''$.id''',
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 10.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF4F4F4),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x6E74746C),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  'https://infectoadm.ibitweb.com.br/storage/imgcat/${widget!.icon}',
                                                  width: 30.0,
                                                  height: 30.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  subCatListItem,
                                                  r'''$.title''',
                                                ).toString(),
                                                maxLines: 3,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xFF1D1D1B),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
