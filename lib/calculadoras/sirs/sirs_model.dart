import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sirs_widget.dart' show SirsWidget;
import 'package:flutter/material.dart';

class SirsModel extends FlutterFlowModel<SirsWidget> {
  ///  Local state fields for this page.

  bool temp = false;

  bool freqC = false;

  bool freqR = false;

  bool wbc = false;

  List<bool> bloco1 = [];
  void addToBloco1(bool item) => bloco1.add(item);
  void removeFromBloco1(bool item) => bloco1.remove(item);
  void removeAtIndexFromBloco1(int index) => bloco1.removeAt(index);
  void insertAtIndexInBloco1(int index, bool item) =>
      bloco1.insert(index, item);
  void updateBloco1AtIndex(int index, Function(bool) updateFn) =>
      bloco1[index] = updateFn(bloco1[index]);

  bool bloco2 = false;

  bool bloco3 = false;

  bool bloco4 = false;

  bool bloco5 = false;

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
