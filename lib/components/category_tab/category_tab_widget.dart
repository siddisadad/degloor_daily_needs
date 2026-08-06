import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category_tab_model.dart';
export 'category_tab_model.dart';

class CategoryTabWidget extends StatefulWidget {
  const CategoryTabWidget({
    super.key,
    String? label,
    bool? selected,
    this.onTap,
  })  : label = label ?? 'All Items',
        selected = selected ?? true;

  final String label;
  final bool selected;
  final VoidCallback? onTap;

  @override
  State<CategoryTabWidget> createState() => _CategoryTabWidgetState();
}

class _CategoryTabWidgetState extends State<CategoryTabWidget> {
  late CategoryTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryTabModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: widget.selected ? Border(bottom: BorderSide(color: FlutterFlowTheme.of(context).primary, width: 2.0)) : null,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 8.0, 16.0),
          child: Text(
            valueOrDefault<String>(
              widget.label,
              'All Items',
            ),
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        widget.selected ? FontWeight.bold : FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
                  color: valueOrDefault<Color>(
                    valueOrDefault<bool>(
                      widget.selected,
                      true,
                    )
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).secondaryText,
                    FlutterFlowTheme.of(context).primary,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      widget.selected ? FontWeight.bold : FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  lineHeight: 1.3,
                ),
          ),
        ),
      ),
    );
  }
}
