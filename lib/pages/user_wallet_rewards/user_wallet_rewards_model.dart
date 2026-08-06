import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/bottom_nav_child3/bottom_nav_child3_widget.dart';
import '/components/button/button_widget.dart';
import '/components/reward_badge/reward_badge_widget.dart';
import '/components/transaction_item/transaction_item_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'user_wallet_rewards_widget.dart' show UserWalletRewardsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserWalletRewardsModel extends FlutterFlowModel<UserWalletRewardsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for RewardBadge.
  late RewardBadgeModel rewardBadgeModel1;
  // Model for RewardBadge.
  late RewardBadgeModel rewardBadgeModel2;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel1;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel2;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel3;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel4;
  // Model for TransactionItem.
  late TransactionItemModel transactionItemModel5;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    rewardBadgeModel1 = createModel(context, () => RewardBadgeModel());
    rewardBadgeModel2 = createModel(context, () => RewardBadgeModel());
    buttonModel = createModel(context, () => ButtonModel());
    transactionItemModel1 = createModel(context, () => TransactionItemModel());
    transactionItemModel2 = createModel(context, () => TransactionItemModel());
    transactionItemModel3 = createModel(context, () => TransactionItemModel());
    transactionItemModel4 = createModel(context, () => TransactionItemModel());
    transactionItemModel5 = createModel(context, () => TransactionItemModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    rewardBadgeModel1.dispose();
    rewardBadgeModel2.dispose();
    buttonModel.dispose();
    transactionItemModel1.dispose();
    transactionItemModel2.dispose();
    transactionItemModel3.dispose();
    transactionItemModel4.dispose();
    transactionItemModel5.dispose();
    bottomNavModel.dispose();
  }
}
