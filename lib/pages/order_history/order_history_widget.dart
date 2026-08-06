import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/providers/order_provider.dart';
import '/models/order_model.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/bottom_nav_child/bottom_nav_child_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_history_model.dart';
export 'order_history_model.dart';

class OrderHistoryWidget extends StatefulWidget {
  const OrderHistoryWidget({super.key});

  static String routeName = 'OrderHistory';
  static String routePath = '/orderHistory';

  @override
  State<OrderHistoryWidget> createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends State<OrderHistoryWidget> {
  late OrderHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderHistoryModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Your Orders',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<OrderProvider>(
              builder: (context, orderProvider, child) {
                if (orderProvider.orders.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined, size: 64, color: FlutterFlowTheme.of(context).secondaryText),
                        SizedBox(height: 16),
                        Text('No orders yet', style: FlutterFlowTheme.of(context).titleMedium),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: orderProvider.orders.length,
                  itemBuilder: (context, index) {
                    final order = orderProvider.orders[index];
                    return _buildOrderCard(order);
                  },
                );
              },
            ),
          ),
          Container(
            child: wrapWithModel(
              model: BottomNavModel(),
              updateCallback: () => setState(() {}),
              child: BottomNavWidget(
                child: () => BottomNavChildWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(OrderModel order) {
    Color statusColor;
    switch (order.status) {
      case OrderStatus.delivered:
        statusColor = FlutterFlowTheme.of(context).success;
        break;
      case OrderStatus.cancelled:
        statusColor = FlutterFlowTheme.of(context).error;
        break;
      default:
        statusColor = FlutterFlowTheme.of(context).primary;
    }

    return InkWell(
      onTap: () {
        context.pushNamed(
          'LiveOrderTracking',
          queryParameters: {'orderId': order.id}.withoutNulls,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: FlutterFlowTheme.of(context).alternate),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#${order.id}',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                        ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      order.status.name.toUpperCase(),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                            color: statusColor,
                          ),
                    ),
                  ),
                ],
              ),
              Divider(height: 24),
              Text(
                order.storeName,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    ),
              ),
              SizedBox(height: 4),
              Text(
                '${order.items.length} items • ₹${order.totalAmount.toStringAsFixed(0)}',
                style: FlutterFlowTheme.of(context).labelSmall,
              ),
              SizedBox(height: 8),
              Text(
                dateTimeFormat('MMM d, hh:mm a', order.timestamp),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
