import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_blog_widget.dart' show PostBlogWidget;
import 'package:flutter/material.dart';

class PostBlogModel extends FlutterFlowModel<PostBlogWidget> {
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
