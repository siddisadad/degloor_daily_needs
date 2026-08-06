import '/components/button/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'section_header_model.dart';
export 'section_header_model.dart';

class SectionHeaderWidget extends StatefulWidget {
  const SectionHeaderWidget({
    super.key,
    String? actionLabel,
    String? title,
    this.onAction,
  })  : this.actionLabel = actionLabel ?? 'Action Label',
        this.title = title ?? 'Delivery Address';

  final String actionLabel;
  final String title;
  final VoidCallback? onAction;

  @override
  State<SectionHeaderWidget> createState() => _SectionHeaderWidgetState();
}

class _SectionHeaderWidgetState extends State<SectionHeaderWidget> {
  late SectionHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            valueOrDefault<String>(
              widget!.title,
              'Delivery Address',
            ),
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  lineHeight: 1.4,
                ),
          ),
          InkWell(
            onTap: widget.onAction,
            child: wrapWithModel(
              model: _model.buttonModel,
              updateCallback: () => safeSetState(() {}),
              child: ButtonWidget(
                iconPresent: false,
                iconEndPresent: false,
                content: valueOrDefault<String>(
                  widget!.actionLabel,
                  'Action Label',
                ),
                variant: 'ghost',
                size: 'small',
                fullWidth: false,
                loading: false,
                disabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
