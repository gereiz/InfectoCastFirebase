import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'topico_copy_widget.dart' show TopicoCopyWidget;
import 'package:flutter/material.dart';

class TopicoCopyModel extends FlutterFlowModel<TopicoCopyWidget> {
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