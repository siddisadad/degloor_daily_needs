import '/components/faq_chip/faq_chip_widget.dart';
import '/components/support_bubble/support_bubble_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'customer_support_chat_widget.dart' show CustomerSupportChatWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomerSupportChatModel
    extends FlutterFlowModel<CustomerSupportChatWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SupportBubble.
  late SupportBubbleModel supportBubbleModel1;
  // Model for FaqChip.
  late FaqChipModel faqChipModel1;
  // Model for FaqChip.
  late FaqChipModel faqChipModel2;
  // Model for FaqChip.
  late FaqChipModel faqChipModel3;
  // Model for FaqChip.
  late FaqChipModel faqChipModel4;
  // Model for SupportBubble.
  late SupportBubbleModel supportBubbleModel2;
  // Model for SupportBubble.
  late SupportBubbleModel supportBubbleModel3;
  // Model for SupportBubble.
  late SupportBubbleModel supportBubbleModel4;
  // Model for TextField.
  late TextFieldModel textFieldModel;

  @override
  void initState(BuildContext context) {
    supportBubbleModel1 = createModel(context, () => SupportBubbleModel());
    faqChipModel1 = createModel(context, () => FaqChipModel());
    faqChipModel2 = createModel(context, () => FaqChipModel());
    faqChipModel3 = createModel(context, () => FaqChipModel());
    faqChipModel4 = createModel(context, () => FaqChipModel());
    supportBubbleModel2 = createModel(context, () => SupportBubbleModel());
    supportBubbleModel3 = createModel(context, () => SupportBubbleModel());
    supportBubbleModel4 = createModel(context, () => SupportBubbleModel());
    textFieldModel = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    supportBubbleModel1.dispose();
    faqChipModel1.dispose();
    faqChipModel2.dispose();
    faqChipModel3.dispose();
    faqChipModel4.dispose();
    supportBubbleModel2.dispose();
    supportBubbleModel3.dispose();
    supportBubbleModel4.dispose();
    textFieldModel.dispose();
  }
}
