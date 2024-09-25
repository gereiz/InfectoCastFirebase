import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'planos_widget.dart' show PlanosWidget;
import 'package:flutter/material.dart';

class PlanosModel extends FlutterFlowModel<PlanosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? isPurchaseSuccessful;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
  }
}
