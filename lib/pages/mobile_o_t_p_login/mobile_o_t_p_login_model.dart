import '/components/button/button_widget.dart';
import '/components/login_header/login_header_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mobile_o_t_p_login_widget.dart' show MobileOTPLoginWidget;
import 'package:flutter/material.dart';

class MobileOTPLoginModel extends FlutterFlowModel<MobileOTPLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for LoginHeader.
  late LoginHeaderModel loginHeaderModel;
  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    loginHeaderModel = createModel(context, () => LoginHeaderModel());
    textFieldModel = createModel(context, () => TextFieldModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    loginHeaderModel.dispose();
    textFieldModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
