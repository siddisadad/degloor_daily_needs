import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tracking_step_model.dart';
export 'tracking_step_model.dart';

class TrackingStepWidget extends StatefulWidget {
  const TrackingStepWidget({
    super.key,
    String? label,
    String? time,
    bool? completed,
    bool? isLast,
  })  : label = label ?? 'Order Confirmed',
        time = time ?? '11:30 AM',
        completed = completed ?? true,
        isLast = isLast ?? false;

  final String label;
  final String time;
  final bool completed;
  final bool isLast;

  @override
  State<TrackingStepWidget> createState() => _TrackingStepWidgetState();
}

class _TrackingStepWidgetState extends State<TrackingStepWidget> {
  late TrackingStepModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingStepModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  valueOrDefault<bool>(
                    widget.completed,
                    true,
                  )
                      ? FlutterFlowTheme.of(context).success
                      : FlutterFlowTheme.of(context).alternate,
                  FlutterFlowTheme.of(context).success,
                ),
                borderRadius: BorderRadius.circular(9999.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: valueOrDefault<Color>(
                    valueOrDefault<bool>(
                      widget.completed,
                      true,
                    )
                        ? FlutterFlowTheme.of(context).success
                        : FlutterFlowTheme.of(context).alternate,
                    FlutterFlowTheme.of(context).success,
                  ),
                  width: valueOrDefault<double>(
                    valueOrDefault<bool>(
                      widget.completed,
                      true,
                    )
                        ? 2.0
                        : 2.0,
                    2.0,
                  ),
                ),
              ),
            ),
            if (valueOrDefault<bool>(
              valueOrDefault<bool>(
                widget.isLast,
                false,
              )
                  ? false
                  : true,
              true,
            ))
              Container(
                width: 2.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    valueOrDefault<bool>(
                      widget.completed,
                      true,
                    )
                        ? FlutterFlowTheme.of(context).success
                        : FlutterFlowTheme.of(context).alternate,
                    FlutterFlowTheme.of(context).success,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
          ],
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.label,
                  'Order Confirmed',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        valueOrDefault<bool>(
                          widget.completed,
                          true,
                        )
                            ? FlutterFlowTheme.of(context).primaryText
                            : FlutterFlowTheme.of(context).secondaryText,
                        FlutterFlowTheme.of(context).primaryText,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      lineHeight: 1.5,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.time,
                  '11:30 AM',
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
            ].divide(const SizedBox(height: 4.0)),
          ),
        ),
      ].divide(const SizedBox(width: 16.0)),
    );
  }
}
