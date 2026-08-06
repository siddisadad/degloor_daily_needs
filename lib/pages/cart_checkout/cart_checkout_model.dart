import '/components/button/button_widget.dart';
import '/components/checkout_item/checkout_item_widget.dart';
import '/components/radio/radio_widget.dart';
import '/components/section_header/section_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cart_checkout_widget.dart' show CartCheckoutWidget;
import 'package:flutter/material.dart';

class CartCheckoutModel extends FlutterFlowModel<CartCheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel1;
  // Model for CheckoutItem.
  late CheckoutItemModel checkoutItemModel1;
  // Model for CheckoutItem.
  late CheckoutItemModel checkoutItemModel2;
  // Model for CheckoutItem.
  late CheckoutItemModel checkoutItemModel3;
  // Model for SectionHeader.
  late SectionHeaderModel sectionHeaderModel2;
  // Model for Radio.
  late RadioModel radioModel1;
  // Model for Radio.
  late RadioModel radioModel2;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    sectionHeaderModel1 = createModel(context, () => SectionHeaderModel());
    checkoutItemModel1 = createModel(context, () => CheckoutItemModel());
    checkoutItemModel2 = createModel(context, () => CheckoutItemModel());
    checkoutItemModel3 = createModel(context, () => CheckoutItemModel());
    sectionHeaderModel2 = createModel(context, () => SectionHeaderModel());
    radioModel1 = createModel(context, () => RadioModel());
    radioModel2 = createModel(context, () => RadioModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    sectionHeaderModel1.dispose();
    checkoutItemModel1.dispose();
    checkoutItemModel2.dispose();
    checkoutItemModel3.dispose();
    sectionHeaderModel2.dispose();
    radioModel1.dispose();
    radioModel2.dispose();
    buttonModel.dispose();
  }
}
