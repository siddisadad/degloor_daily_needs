import '/components/nav_item/nav_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_child_model.dart';
export 'bottom_nav_child_model.dart';

class BottomNavChildWidget extends StatefulWidget {
  const BottomNavChildWidget({super.key});

  @override
  State<BottomNavChildWidget> createState() => _BottomNavChildWidgetState();
}

class _BottomNavChildWidgetState extends State<BottomNavChildWidget> {
  late BottomNavChildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavChildModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).name ?? '';

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        wrapWithModel(
          model: _model.navItemModel1,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded,
              color: currentRoute == 'CustomerHomeFeed'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            target: 'CustomerHomeFeed',
            selected: currentRoute == 'CustomerHomeFeed',
            onTap: () => context.goNamed('CustomerHomeFeed'),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel2,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Stores',
            icon: Icon(
              Icons.store_rounded,
              color: currentRoute == 'StoreStorefront'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            target: 'StoreStorefront',
            selected: currentRoute == 'StoreStorefront',
            onTap: () => context.goNamed('StoreStorefront'),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel3,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Cart',
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: currentRoute == 'CartCheckout'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            target: 'CartCheckout',
            selected: currentRoute == 'CartCheckout',
            onTap: () => context.goNamed('CartCheckout'),
          ),
        ),
        wrapWithModel(
          model: _model.navItemModel4,
          updateCallback: () => safeSetState(() {}),
          child: NavItemWidget(
            label: 'Orders',
            icon: Icon(
              Icons.local_shipping_rounded,
              color: currentRoute == 'OrderHistory' || currentRoute == 'LiveOrderTracking'
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            target: 'OrderHistory',
            selected: currentRoute == 'OrderHistory' || currentRoute == 'LiveOrderTracking',
            onTap: () => context.goNamed('OrderHistory'),
          ),
        ),
        NavItemWidget(
          label: 'Wallet',
          icon: Icon(
            Icons.account_balance_wallet_rounded,
            color: currentRoute == 'UserWalletRewards'
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          target: 'UserWalletRewards',
          selected: currentRoute == 'UserWalletRewards',
          onTap: () => context.goNamed('UserWalletRewards'),
        ),
      ],
    );
  }
}
