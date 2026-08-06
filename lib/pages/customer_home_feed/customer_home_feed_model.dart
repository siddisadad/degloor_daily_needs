import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/category_item/category_item_widget.dart';
import '/components/store_card/store_card_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'customer_home_feed_widget.dart' show CustomerHomeFeedWidget;
import 'package:flutter/material.dart';

class CustomerHomeFeedModel extends FlutterFlowModel<CustomerHomeFeedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel1;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel2;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel3;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel4;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel5;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel6;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel7;
  // Model for CategoryItem.
  late CategoryItemModel categoryItemModel8;
  // Model for Button.
  late ButtonModel buttonModel3;
  // Model for StoreCard.
  late StoreCardModel storeCardModel1;
  // Model for StoreCard.
  late StoreCardModel storeCardModel2;
  // Model for StoreCard.
  late StoreCardModel storeCardModel3;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    categoryItemModel1 = createModel(context, () => CategoryItemModel());
    categoryItemModel2 = createModel(context, () => CategoryItemModel());
    categoryItemModel3 = createModel(context, () => CategoryItemModel());
    categoryItemModel4 = createModel(context, () => CategoryItemModel());
    categoryItemModel5 = createModel(context, () => CategoryItemModel());
    categoryItemModel6 = createModel(context, () => CategoryItemModel());
    categoryItemModel7 = createModel(context, () => CategoryItemModel());
    categoryItemModel8 = createModel(context, () => CategoryItemModel());
    buttonModel3 = createModel(context, () => ButtonModel());
    storeCardModel1 = createModel(context, () => StoreCardModel());
    storeCardModel2 = createModel(context, () => StoreCardModel());
    storeCardModel3 = createModel(context, () => StoreCardModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
    categoryItemModel1.dispose();
    categoryItemModel2.dispose();
    categoryItemModel3.dispose();
    categoryItemModel4.dispose();
    categoryItemModel5.dispose();
    categoryItemModel6.dispose();
    categoryItemModel7.dispose();
    categoryItemModel8.dispose();
    buttonModel3.dispose();
    storeCardModel1.dispose();
    storeCardModel2.dispose();
    storeCardModel3.dispose();
    bottomNavModel.dispose();
  }
}
