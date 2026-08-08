import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_field_model.dart';
export 'text_field_model.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    String? label,
    bool? labelPresent,
    String? helper,
    bool? helperPresent,
    this.leadingIcon,
    bool? leadingIconPresent,
    this.trailingIcon,
    bool? trailingIconPresent,
    String? hint,
    String? value,
    String? onChange,
    String? onSubmit,
    String? variant,
    bool? error,
  })  : label = label ?? 'Mobile Number',
        labelPresent = labelPresent ?? true,
        helper = helper ?? 'We\'ll send a 6-digit OTP for verification',
        helperPresent = helperPresent ?? true,
        leadingIconPresent = leadingIconPresent ?? false,
        trailingIconPresent = trailingIconPresent ?? false,
        hint = hint ?? '98765 43210',
        value = value ?? '',
        onChange = onChange ?? '',
        onSubmit = onSubmit ?? '',
        variant = variant ?? 'ghost',
        error = error ?? false;

  final String label;
  final bool labelPresent;
  final String helper;
  final bool helperPresent;
  final Widget? leadingIcon;
  final bool leadingIconPresent;
  final Widget? trailingIcon;
  final bool trailingIconPresent;
  final String hint;
  final String value;
  final String onChange;
  final String onSubmit;
  final String variant;
  final bool error;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldModel());

    _model.inputTextController ??= TextEditingController(text: widget.value);
    _model.inputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (valueOrDefault<bool>(
            widget.labelPresent,
            true,
          ))
            Text(
              valueOrDefault<String>(
                widget.label,
                'Mobile Number',
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget.error,
                        false,
                      )
                          ? FlutterFlowTheme.of(context).error
                          : FlutterFlowTheme.of(context).primaryText,
                      FlutterFlowTheme.of(context).primaryText,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    lineHeight: 1.3,
                  ),
            ),
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                () {
                  if (valueOrDefault<String>(
                        widget.variant,
                        'ghost',
                      ) ==
                      'filled') {
                    return FlutterFlowTheme.of(context).secondaryBackground;
                  } else if (valueOrDefault<String>(
                        widget.variant,
                        'ghost',
                      ) ==
                      'ghost') {
                    return Colors.transparent;
                  } else {
                    return Colors.transparent;
                  }
                }(),
                Colors.transparent,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(valueOrDefault<double>(
                  () {
                    if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'filled') {
                      return 6.0;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'ghost') {
                      return 6.0;
                    } else {
                      return 6.0;
                    }
                  }(),
                  6.0,
                )),
                topRight: Radius.circular(valueOrDefault<double>(
                  () {
                    if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'filled') {
                      return 6.0;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'ghost') {
                      return 6.0;
                    } else {
                      return 6.0;
                    }
                  }(),
                  6.0,
                )),
                bottomLeft: Radius.circular(valueOrDefault<double>(
                  () {
                    if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'filled') {
                      return 6.0;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'ghost') {
                      return 6.0;
                    } else {
                      return 6.0;
                    }
                  }(),
                  6.0,
                )),
                bottomRight: Radius.circular(valueOrDefault<double>(
                  () {
                    if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'filled') {
                      return 6.0;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'ghost') {
                      return 6.0;
                    } else {
                      return 6.0;
                    }
                  }(),
                  6.0,
                )),
              ),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: valueOrDefault<Color>(
                  () {
                    if (valueOrDefault<bool>(
                      widget.error,
                      false,
                    )) {
                      return FlutterFlowTheme.of(context).error;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'filled') {
                      return Colors.transparent;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'ghost') {
                      return Colors.transparent;
                    } else {
                      return FlutterFlowTheme.of(context).alternate;
                    }
                  }(),
                  Colors.transparent,
                ),
                width: valueOrDefault<double>(
                  () {
                    if (valueOrDefault<bool>(
                      widget.error,
                      false,
                    )) {
                      return 1.0;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'filled') {
                      return 1.0;
                    } else if (valueOrDefault<String>(
                          widget.variant,
                          'ghost',
                        ) ==
                        'ghost') {
                      return 0.0;
                    } else {
                      return 1.0;
                    }
                  }(),
                  0.0,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    () {
                      if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'filled') {
                        return 8.0;
                      } else if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'ghost') {
                        return 8.0;
                      } else {
                        return 8.0;
                      }
                    }(),
                    8.0,
                  ),
                  valueOrDefault<double>(
                    () {
                      if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'filled') {
                        return 8.0;
                      } else if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'ghost') {
                        return 8.0;
                      } else {
                        return 8.0;
                      }
                    }(),
                    8.0,
                  ),
                  valueOrDefault<double>(
                    () {
                      if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'filled') {
                        return 8.0;
                      } else if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'ghost') {
                        return 8.0;
                      } else {
                        return 8.0;
                      }
                    }(),
                    8.0,
                  ),
                  valueOrDefault<double>(
                    () {
                      if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'filled') {
                        return 8.0;
                      } else if (valueOrDefault<String>(
                            widget.variant,
                            'ghost',
                          ) ==
                          'ghost') {
                        return 8.0;
                      } else {
                        return 8.0;
                      }
                    }(),
                    8.0,
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (valueOrDefault<bool>(
                    widget.leadingIconPresent,
                    false,
                  ))
                    widget.leadingIcon!,
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _model.inputTextController,
                      focusNode: _model.inputFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: valueOrDefault<String>(
                          widget.hint,
                          '98765 43210',
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
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
                              color: valueOrDefault<Color>(
                                () {
                                  if (valueOrDefault<String>(
                                        widget.variant,
                                        'ghost',
                                      ) ==
                                      'filled') {
                                    return FlutterFlowTheme.of(context).accent3;
                                  } else if (valueOrDefault<String>(
                                        widget.variant,
                                        'ghost',
                                      ) ==
                                      'ghost') {
                                    return FlutterFlowTheme.of(context).accent3;
                                  } else {
                                    return FlutterFlowTheme.of(context).accent3;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).accent3,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: valueOrDefault<Color>(
                              () {
                                if (valueOrDefault<String>(
                                      widget.variant,
                                      'ghost',
                                    ) ==
                                    'filled') {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                } else if (valueOrDefault<String>(
                                      widget.variant,
                                      'ghost',
                                    ) ==
                                    'ghost') {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                } else {
                                  return FlutterFlowTheme.of(context)
                                      .primaryText;
                                }
                              }(),
                              FlutterFlowTheme.of(context).primaryText,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                      validator: _model.inputTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  if (valueOrDefault<bool>(
                    widget.trailingIconPresent,
                    false,
                  ))
                    widget.trailingIcon!,
                ],
              ),
            ),
          ),
          if (valueOrDefault<bool>(
            widget.helperPresent,
            true,
          ))
            Text(
              valueOrDefault<String>(
                widget.helper,
                'We\'ll send a 6-digit OTP for verification',
              ),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodySmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget.error,
                        false,
                      )
                          ? FlutterFlowTheme.of(context).error
                          : FlutterFlowTheme.of(context).secondaryText,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodySmall.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                    lineHeight: 1.4,
                  ),
            ),
        ].divide(const SizedBox(height: 6.0)),
    );
  }
}
