import '/components/button/button_widget.dart';
import '/components/category_tab/category_tab_widget.dart';
import '/components/product_card/product_card_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'store_storefront_widget.dart' show StoreStorefrontWidget;
import 'package:flutter/material.dart';

class StoreStorefrontModel extends FlutterFlowModel<StoreStorefrontWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for CategoryTab.
  late CategoryTabModel categoryTabModel1;
  // Model for CategoryTab.
  late CategoryTabModel categoryTabModel2;
  // Model for CategoryTab.
  late CategoryTabModel categoryTabModel3;
  // Model for CategoryTab.
  late CategoryTabModel categoryTabModel4;
  // Model for CategoryTab.
  late CategoryTabModel categoryTabModel5;
  // Model for CategoryTab.
  late CategoryTabModel categoryTabModel6;
  // Model for ProductCard.
  late ProductCardModel productCardModel1;
  // Model for ProductCard.
  late ProductCardModel productCardModel2;
  // Model for ProductCard.
  late ProductCardModel productCardModel3;
  // Model for ProductCard.
  late ProductCardModel productCardModel4;
  // Model for ProductCard.
  late ProductCardModel productCardModel5;
  // Model for ProductCard.
  late ProductCardModel productCardModel6;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    categoryTabModel1 = createModel(context, () => CategoryTabModel());
    categoryTabModel2 = createModel(context, () => CategoryTabModel());
    categoryTabModel3 = createModel(context, () => CategoryTabModel());
    categoryTabModel4 = createModel(context, () => CategoryTabModel());
    categoryTabModel5 = createModel(context, () => CategoryTabModel());
    categoryTabModel6 = createModel(context, () => CategoryTabModel());
    productCardModel1 = createModel(context, () => ProductCardModel());
    productCardModel2 = createModel(context, () => ProductCardModel());
    productCardModel3 = createModel(context, () => ProductCardModel());
    productCardModel4 = createModel(context, () => ProductCardModel());
    productCardModel5 = createModel(context, () => ProductCardModel());
    productCardModel6 = createModel(context, () => ProductCardModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    categoryTabModel1.dispose();
    categoryTabModel2.dispose();
    categoryTabModel3.dispose();
    categoryTabModel4.dispose();
    categoryTabModel5.dispose();
    categoryTabModel6.dispose();
    productCardModel1.dispose();
    productCardModel2.dispose();
    productCardModel3.dispose();
    productCardModel4.dispose();
    productCardModel5.dispose();
    productCardModel6.dispose();
    buttonModel.dispose();
  }
}
