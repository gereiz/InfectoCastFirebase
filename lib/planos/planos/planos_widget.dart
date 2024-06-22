import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'planos_model.dart';
export 'planos_model.dart';

class PlanosWidget extends StatefulWidget {
  const PlanosWidget({super.key});

  @override
  State<PlanosWidget> createState() => _PlanosWidgetState();
}

class _PlanosWidgetState extends State<PlanosWidget> {
  late PlanosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: const TopBarWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.69,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: StreamBuilder<List<PlansRecord>>(
                    stream: queryPlansRecord(),
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
                      List<PlansRecord> listViewPlansRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPlansRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPlansRecord =
                              listViewPlansRecordList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 32.0),
                                        child: Text(
                                          listViewPlansRecord.name,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 32.0),
                                        child: Text(
                                          'R\$ ${listViewPlansRecord.price.toString()}/mês',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 28.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                      Html(
                                        data: listViewPlansRecord.description,
                                        onLinkTap: (url, _, __, ___) =>
                                            launchURL(url!),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final paymentResponse =
                                                  await processStripePayment(
                                                context,
                                                amount:
                                                    (listViewPlansRecord.price *
                                                            100)
                                                        .round(),
                                                currency: 'BRL',
                                                customerEmail: currentUserEmail,
                                                customerName:
                                                    currentUserDisplayName,
                                                description: listViewPlansRecord
                                                    .description,
                                                allowGooglePay: true,
                                                allowApplePay: true,
                                                themeStyle: ThemeMode.system,
                                                buttonColor: const Color(0xFFFCAF23),
                                                buttonTextColor: Colors.white,
                                              );
                                              if (paymentResponse.paymentId ==
                                                      null &&
                                                  paymentResponse
                                                          .errorMessage !=
                                                      null) {
                                                showSnackbar(
                                                  context,
                                                  'Error: ${paymentResponse.errorMessage}',
                                                );
                                              }
                                              _model.paymentId =
                                                  paymentResponse.paymentId ??
                                                      '';

                                              if (_model.paymentId != '0') {
                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  plan:
                                                      listViewPlansRecord.name,
                                                ));

                                                context.pushNamed(
                                                    'planoContratado');
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: const Text('Erro'),
                                                        content: const Text(
                                                            'Erro ao processar pagamento!'),
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

                                              setState(() {});
                                            },
                                            text: 'Contratar Plano',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFFCAF23),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                        },
                      );
                    },
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
