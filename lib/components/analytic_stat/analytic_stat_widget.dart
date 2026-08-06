import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'analytic_stat_model.dart';
export 'analytic_stat_model.dart';

class AnalyticStatWidget extends StatefulWidget {
  const AnalyticStatWidget({
    super.key,
    this.icon,
    String? label,
    String? trend,
    String? value,
    bool? isUp,
  })  : this.label = label ?? 'Total Revenue',
        this.trend = trend ?? '12.5%',
        this.value = value ?? '₹42.8k',
        this.isUp = isUp ?? false;

  final Widget? icon;
  final String label;
  final String trend;
  final String value;
  final bool isUp;

  @override
  State<AnalyticStatWidget> createState() => _AnalyticStatWidgetState();
}

class _AnalyticStatWidgetState extends State<AnalyticStatWidget> {
  late AnalyticStatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticStatModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget!.icon!,
                  Container(
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        valueOrDefault<bool>(
                          widget!.isUp,
                          false,
                        )
                            ? FlutterFlowTheme.of(context).success10
                            : FlutterFlowTheme.of(context).error10,
                        FlutterFlowTheme.of(context).error10,
                      ),
                      borderRadius: BorderRadius.circular(9999.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 12.0,
                              height: 12.0,
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  if (valueOrDefault<bool>(
                                    valueOrDefault<bool>(
                                      widget!.isUp,
                                      false,
                                    )
                                        ? true
                                        : false,
                                    false,
                                  ))
                                    Icon(
                                      Icons.arrow_upward_rounded,
                                      color: valueOrDefault<Color>(
                                        valueOrDefault<bool>(
                                          widget!.isUp,
                                          false,
                                        )
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .error,
                                        FlutterFlowTheme.of(context).error,
                                      ),
                                      size: 12.0,
                                    ),
                                  if (valueOrDefault<bool>(
                                    valueOrDefault<bool>(
                                      widget!.isUp,
                                      false,
                                    )
                                        ? false
                                        : true,
                                    true,
                                  ))
                                    Icon(
                                      Icons.arrow_downward_rounded,
                                      color: valueOrDefault<Color>(
                                        valueOrDefault<bool>(
                                          widget!.isUp,
                                          false,
                                        )
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .error,
                                        FlutterFlowTheme.of(context).error,
                                      ),
                                      size: 12.0,
                                    ),
                                ],
                              ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget!.trend,
                                '12.5%',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: valueOrDefault<Color>(
                                      valueOrDefault<bool>(
                                        widget!.isUp,
                                        false,
                                      )
                                          ? FlutterFlowTheme.of(context).success
                                          : FlutterFlowTheme.of(context).error,
                                      FlutterFlowTheme.of(context).error,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                valueOrDefault<String>(
                  widget!.value,
                  '₹42.8k',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                      lineHeight: 1.25,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.label,
                  'Total Revenue',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.2,
                    ),
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ),
    );
  }
}
