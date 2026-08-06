import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'radio_model.dart';
export 'radio_model.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({
    super.key,
    String? label,
    String? subtitle,
    Color? color,
    bool? isSelected,
    bool? hasSubtitle,
    bool? disabled,
    this.onTap,
  })  : label = label ?? 'PhonePe / Google Pay',
        subtitle = subtitle ?? 'Pay securely via UPI',
        color = color ?? const Color(0x00000000),
        isSelected = isSelected ?? true,
        hasSubtitle = hasSubtitle ?? true,
        disabled = disabled ?? false;

  final String label;
  final String subtitle;
  final Color color;
  final bool isSelected;
  final bool hasSubtitle;
  final bool disabled;
  final VoidCallback? onTap;

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  late RadioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disabled ? null : widget.onTap,
      child: Opacity(
        opacity: valueOrDefault<double>(
          valueOrDefault<bool>(
            widget.disabled,
            false,
          )
              ? 0.55
              : 1.0,
          1.0,
        ),
        child: Container(
          child: Container(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          valueOrDefault<bool>(widget.hasSubtitle, true) ? 3.0 : 0.0,
                          0.0,
                          0.0),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<bool>(widget.isSelected, true)
                              ? FlutterFlowTheme.of(context).primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999.0),
                          border: Border.all(
                            color: valueOrDefault<bool>(widget.isSelected, true)
                                ? Colors.transparent
                                : FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Visibility(
                          visible: valueOrDefault<bool>(widget.isSelected, true),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).onPrimary,
                              borderRadius: BorderRadius.circular(999.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.label,
                              'PhonePe / Google Pay',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (valueOrDefault<bool>(widget.hasSubtitle, true))
                            Text(
                              valueOrDefault<String>(
                                widget.subtitle,
                                'Pay securely via UPI',
                              ),
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .fontStyle,
                                    lineHeight: 1.4,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
