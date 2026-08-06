import '/components/analytic_stat/analytic_stat_widget.dart';
import '/components/button/button_widget.dart';
import '/components/pie_chart/pie_chart_widget.dart';
import '/components/zone_row/zone_row_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'admin_analytics_portal_widget.dart' show AdminAnalyticsPortalWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAnalyticsPortalModel
    extends FlutterFlowModel<AdminAnalyticsPortalWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AnalyticStat.
  late AnalyticStatModel analyticStatModel1;
  // Model for AnalyticStat.
  late AnalyticStatModel analyticStatModel2;
  // Model for AnalyticStat.
  late AnalyticStatModel analyticStatModel3;
  // Model for AnalyticStat.
  late AnalyticStatModel analyticStatModel4;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for ZoneRow.
  late ZoneRowModel zoneRowModel1;
  // Model for ZoneRow.
  late ZoneRowModel zoneRowModel2;
  // Model for ZoneRow.
  late ZoneRowModel zoneRowModel3;
  // Model for ZoneRow.
  late ZoneRowModel zoneRowModel4;
  // Model for PieChart.
  late PieChartModel pieChartModel;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    analyticStatModel1 = createModel(context, () => AnalyticStatModel());
    analyticStatModel2 = createModel(context, () => AnalyticStatModel());
    analyticStatModel3 = createModel(context, () => AnalyticStatModel());
    analyticStatModel4 = createModel(context, () => AnalyticStatModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    zoneRowModel1 = createModel(context, () => ZoneRowModel());
    zoneRowModel2 = createModel(context, () => ZoneRowModel());
    zoneRowModel3 = createModel(context, () => ZoneRowModel());
    zoneRowModel4 = createModel(context, () => ZoneRowModel());
    pieChartModel = createModel(context, () => PieChartModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    analyticStatModel1.dispose();
    analyticStatModel2.dispose();
    analyticStatModel3.dispose();
    analyticStatModel4.dispose();
    buttonModel1.dispose();
    zoneRowModel1.dispose();
    zoneRowModel2.dispose();
    zoneRowModel3.dispose();
    zoneRowModel4.dispose();
    pieChartModel.dispose();
    buttonModel2.dispose();
  }
}
