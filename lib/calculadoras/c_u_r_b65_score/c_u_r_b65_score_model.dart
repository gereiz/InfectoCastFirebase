import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'c_u_r_b65_score_widget.dart' show CURB65ScoreWidget;
import 'package:flutter/material.dart';

class CURB65ScoreModel extends FlutterFlowModel<CURB65ScoreWidget> {
  ///  Local state fields for this page.

  int confusao = 0;

  int bun19 = 0;

  int taxaResp = 0;

  int paSis = 0;

  int idade65 = 0;

  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
  }
}
