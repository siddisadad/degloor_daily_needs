import '/components/button/button_widget.dart';
import '/components/inventory_item/inventory_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'store_owner_inventory_widget.dart' show StoreOwnerInventoryWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoreOwnerInventoryModel
    extends FlutterFlowModel<StoreOwnerInventoryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for InventoryItem.
  late InventoryItemModel inventoryItemModel1;
  // Model for InventoryItem.
  late InventoryItemModel inventoryItemModel2;
  // Model for InventoryItem.
  late InventoryItemModel inventoryItemModel3;
  // Model for InventoryItem.
  late InventoryItemModel inventoryItemModel4;
  // Model for InventoryItem.
  late InventoryItemModel inventoryItemModel5;
  // Model for InventoryItem.
  late InventoryItemModel inventoryItemModel6;
  // Model for InventoryItem.
  late InventoryItemModel inventoryItemModel7;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    inventoryItemModel1 = createModel(context, () => InventoryItemModel());
    inventoryItemModel2 = createModel(context, () => InventoryItemModel());
    inventoryItemModel3 = createModel(context, () => InventoryItemModel());
    inventoryItemModel4 = createModel(context, () => InventoryItemModel());
    inventoryItemModel5 = createModel(context, () => InventoryItemModel());
    inventoryItemModel6 = createModel(context, () => InventoryItemModel());
    inventoryItemModel7 = createModel(context, () => InventoryItemModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    inventoryItemModel1.dispose();
    inventoryItemModel2.dispose();
    inventoryItemModel3.dispose();
    inventoryItemModel4.dispose();
    inventoryItemModel5.dispose();
    inventoryItemModel6.dispose();
    inventoryItemModel7.dispose();
    buttonModel.dispose();
  }
}
