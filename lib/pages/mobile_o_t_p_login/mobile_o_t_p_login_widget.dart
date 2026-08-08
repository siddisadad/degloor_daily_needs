import '/components/button/button_widget.dart';
import '/components/login_header/login_header_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mobile_o_t_p_login_model.dart';
export 'mobile_o_t_p_login_model.dart';

class MobileOTPLoginWidget extends StatefulWidget {
  const MobileOTPLoginWidget({super.key});

  static String routeName = 'MobileOTPLogin';
  static String routePath = '/mobileOTPLogin';

  @override
  State<MobileOTPLoginWidget> createState() => _MobileOTPLoginWidgetState();
}

class _MobileOTPLoginWidgetState extends State<MobileOTPLoginWidget> {
  late MobileOTPLoginModel _model;
  bool _showOTP = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MobileOTPLoginModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 40.0,
              ),
              wrapWithModel(
                model: _model.loginHeaderModel,
                updateCallback: () => safeSetState(() {}),
                child: const LoginHeaderWidget(
                  subtitle:
                      'Enter your mobile number to get started with fast delivery in Degloor.',
                  title: 'Welcome to DDNDS',
                ),
              ),
              if (!_showOTP)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '+91',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                  Container(
                                    width: 1.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 4.0)),
                              ),
                              Expanded(
                                flex: 1,
                                child: wrapWithModel(
                                  model: _model.textFieldModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const TextFieldWidget(
                                    label: 'Mobile Number',
                                    labelPresent: true,
                                    helper:
                                        'We\'ll send a 6-digit OTP for verification',
                                    helperPresent: true,
                                    leadingIconPresent: false,
                                    trailingIconPresent: false,
                                    hint: '98765 43210',
                                    value: '',
                                    onChange: '',
                                    onSubmit: '',
                                    variant: 'ghost',
                                    error: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
              if (_showOTP)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Enter the 6-digit code sent to your mobile',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            6,
                            (index) => Container(
                                  width: 45,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '0', // Placeholder
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ),
                                )),
                      ),
                    ),
                  ],
                ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (!_showOTP) {
                    setState(() => _showOTP = true);
                    showSnackbar(context, 'OTP sent to your mobile number');
                  } else {
                    AppStateNotifier.instance.login();
                  }
                },
                child: wrapWithModel(
                  model: _model.buttonModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: ButtonWidget(
                    iconPresent: false,
                    iconEndPresent: false,
                    content: _showOTP ? 'Verify OTP' : 'Send OTP',
                    variant: 'primary',
                    size: 'large',
                    fullWidth: true,
                    loading: false,
                    disabled: false,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Divider(
                          height: 16.0,
                          thickness: 1.0,
                          indent: 0.0,
                          endIndent: 0.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      Text(
                        'OR',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                      Expanded(
                        flex: 1,
                        child: Divider(
                          height: 16.0,
                          thickness: 1.0,
                          indent: 0.0,
                          endIndent: 0.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
                  wrapWithModel(
                    model: _model.buttonModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ButtonWidget(
                      icon: Icon(
                        Icons.login_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      iconPresent: true,
                      iconEndPresent: false,
                      content: 'Continue with Google',
                      variant: 'outline',
                      size: 'medium',
                      fullWidth: true,
                      loading: false,
                      disabled: false,
                    ),
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'By continuing, you agree to our',
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                          lineHeight: 1.2,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Terms of Service',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              decoration: TextDecoration.underline,
                              lineHeight: 1.2,
                            ),
                      ),
                      Text(
                        '&',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
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
                      Text(
                        'Privacy Policy',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primary,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                              decoration: TextDecoration.underline,
                              lineHeight: 1.2,
                            ),
                      ),
                    ].divide(const SizedBox(width: 4.0)),
                  ),
                ].divide(const SizedBox(height: 4.0)),
              ),
              Container(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'DEVELOPER QUICK ACCESS',
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildRoleButton(context, 'Store', Icons.storefront),
                        _buildRoleButton(context, 'Delivery', Icons.delivery_dining),
                        _buildRoleButton(context, 'Admin', Icons.admin_panel_settings),
                      ],
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String role, IconData icon) {
    return InkWell(
      onTap: () => AppStateNotifier.instance.login(role: role),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          Text(role, style: const TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
