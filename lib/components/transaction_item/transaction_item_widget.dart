import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'transaction_item_model.dart';
export 'transaction_item_model.dart';

class TransactionItemWidget extends StatefulWidget {
  const TransactionItemWidget({
    super.key,
    String? amount,
    String? date,
    String? title,
    bool? isCredit,
  })  : amount = amount ?? '50.00',
        date = date ?? 'Oct 24, 2023 • 11:20 AM',
        title = title ?? 'Cashback Received',
        isCredit = isCredit ?? true;

  final String amount;
  final String date;
  final String title;
  final bool isCredit;

  @override
  State<TransactionItemWidget> createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  late TransactionItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        valueOrDefault<bool>(
                          widget.isCredit,
                          true,
                        )
                            ? const Color(0xFFE8F5E9)
                            : const Color(0xFFFFEBEE),
                        const Color(0xFFE8F5E9),
                      ),
                      borderRadius: BorderRadius.circular(9999.0),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          if (valueOrDefault<bool>(
                            valueOrDefault<bool>(
                              widget.isCredit,
                              true,
                            )
                                ? true
                                : false,
                            true,
                          ))
                            Icon(
                              Icons.add_rounded,
                              color: valueOrDefault<Color>(
                                valueOrDefault<bool>(
                                  widget.isCredit,
                                  true,
                                )
                                    ? FlutterFlowTheme.of(context).success
                                    : FlutterFlowTheme.of(context).error,
                                FlutterFlowTheme.of(context).success,
                              ),
                              size: 20.0,
                            ),
                          if (valueOrDefault<bool>(
                            valueOrDefault<bool>(
                              widget.isCredit,
                              true,
                            )
                                ? false
                                : true,
                            false,
                          ))
                            Icon(
                              Icons.remove_rounded,
                              color: valueOrDefault<Color>(
                                valueOrDefault<bool>(
                                  widget.isCredit,
                                  true,
                                )
                                    ? FlutterFlowTheme.of(context).success
                                    : FlutterFlowTheme.of(context).error,
                                FlutterFlowTheme.of(context).success,
                              ),
                              size: 20.0,
                            ),
                        ],
                      ),
                    ),
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
                            widget.title,
                            'Cashback Received',
                          ),
                          maxLines: 1,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.5,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.date,
                            'Oct 24, 2023 • 11:20 AM',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      '{${widget.isCredit.toString()} ? + : -} ₹${widget.amount}',
                      '{true ? + : -} ₹50.00',
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: valueOrDefault<Color>(
                            valueOrDefault<bool>(
                              widget.isCredit,
                              true,
                            )
                                ? FlutterFlowTheme.of(context).success
                                : FlutterFlowTheme.of(context).error,
                            FlutterFlowTheme.of(context).success,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          lineHeight: 1.4,
                        ),
                  ),
                ].divide(const SizedBox(width: 16.0)),
              ),
            ),
          Container(
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              shape: BoxShape.rectangle,
            ),
          ),
        ],
      ),
    );
  }
}
