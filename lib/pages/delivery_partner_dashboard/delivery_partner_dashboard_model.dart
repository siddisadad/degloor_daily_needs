import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/button/button_widget.dart';
import '/components/driver_metric/driver_metric_widget.dart';
import '/components/order_request/order_request_widget.dart';
import '/components/switch_component/switch_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'delivery_partner_dashboard_widget.dart'
    show DeliveryPartnerDashboardWidget;
import 'package:flutter/material.dart';

class DeliveryPartnerDashboardModel
    extends FlutterFlowModel<DeliveryPartnerDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Switch.
  late SwitchComponentModel switchModel;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for DriverMetric.
  late DriverMetricModel driverMetricModel1;
  // Model for DriverMetric.
  late DriverMetricModel driverMetricModel2;
  // Model for DriverMetric.
  late DriverMetricModel driverMetricModel3;
  // Model for OrderRequest.
  late OrderRequestModel orderRequestModel1;
  // Model for OrderRequest.
  late OrderRequestModel orderRequestModel2;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    switchModel = createModel(context, () => SwitchComponentModel());
    buttonModel = createModel(context, () => ButtonModel());
    driverMetricModel1 = createModel(context, () => DriverMetricModel());
    driverMetricModel2 = createModel(context, () => DriverMetricModel());
    driverMetricModel3 = createModel(context, () => DriverMetricModel());
    orderRequestModel1 = createModel(context, () => OrderRequestModel());
    orderRequestModel2 = createModel(context, () => OrderRequestModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    switchModel.dispose();
    buttonModel.dispose();
    driverMetricModel1.dispose();
    driverMetricModel2.dispose();
    driverMetricModel3.dispose();
    orderRequestModel1.dispose();
    orderRequestModel2.dispose();
    bottomNavModel.dispose();
  }
}
