import '/components/button/button_widget.dart';
import '/components/tracking_step/tracking_step_widget.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'live_order_tracking_widget.dart' show LiveOrderTrackingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LiveOrderTrackingModel extends FlutterFlowModel<LiveOrderTrackingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Map Google Map widget.
  LatLng? mapGoogleMapsCenter;
  final mapGoogleMapsController = Completer<GoogleMapController>();
  // Model for TrackingStep.
  late TrackingStepModel trackingStepModel1;
  // Model for TrackingStep.
  late TrackingStepModel trackingStepModel2;
  // Model for TrackingStep.
  late TrackingStepModel trackingStepModel3;
  // Model for TrackingStep.
  late TrackingStepModel trackingStepModel4;
  // Model for Button.
  late ButtonModel buttonModel;
  // Model for BottomNav.
  late BottomNavModel bottomNavModel;

  @override
  void initState(BuildContext context) {
    trackingStepModel1 = createModel(context, () => TrackingStepModel());
    trackingStepModel2 = createModel(context, () => TrackingStepModel());
    trackingStepModel3 = createModel(context, () => TrackingStepModel());
    trackingStepModel4 = createModel(context, () => TrackingStepModel());
    buttonModel = createModel(context, () => ButtonModel());
    bottomNavModel = createModel(context, () => BottomNavModel());
  }

  @override
  void dispose() {
    trackingStepModel1.dispose();
    trackingStepModel2.dispose();
    trackingStepModel3.dispose();
    trackingStepModel4.dispose();
    buttonModel.dispose();
    bottomNavModel.dispose();
  }
}
