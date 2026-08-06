import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/providers/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  static String routeName = 'UserProfile';
  static String routePath = '/userProfile';

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: FlutterFlowTheme.of(context).primaryText),
          onPressed: () => context.safePop(),
        ),
        title: Text(
          'Profile',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22.0,
              ),
        ),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      child: const Text('R', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 16),
                    Text('Rajesh Kumar', style: FlutterFlowTheme.of(context).titleLarge),
                    Text('+91 98765 43210', style: FlutterFlowTheme.of(context).bodySmall),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Account Settings'),
                    _buildMenuItem(Icons.shopping_bag_outlined, 'My Orders', onTap: () => context.pushNamed('OrderHistory')),
                    _buildMenuItem(Icons.account_balance_wallet_outlined, 'Wallet & Rewards', onTap: () => context.pushNamed('UserWalletRewards')),
                    _buildMenuItem(Icons.location_on_outlined, 'Saved Addresses', subtitle: '${addressProvider.addresses.length} Addresses'),

                    const SizedBox(height: 24),
                    _buildSectionHeader('Support & Feedback'),
                    _buildMenuItem(Icons.chat_bubble_outline_rounded, 'Help Center', onTap: () => context.pushNamed('CustomerSupportChat')),
                    _buildMenuItem(Icons.info_outline, 'About Degloor Daily Needs'),

                    const SizedBox(height: 24),
                    _buildMenuItem(
                      Icons.logout_rounded,
                      'Logout',
                      textColor: FlutterFlowTheme.of(context).error,
                      onTap: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content: const Text('Are you sure you want to logout?'),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                              TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Logout')),
                            ],
                          ),
                        );
                        if (confirm == true) AppStateNotifier.instance.logout();
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: FlutterFlowTheme.of(context).labelSmall.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.bold),
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {String? subtitle, VoidCallback? onTap, Color? textColor}) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: FlutterFlowTheme.of(context).secondaryBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: textColor ?? FlutterFlowTheme.of(context).primary),
        title: Text(title, style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: const Icon(Icons.chevron_right, size: 20),
      ),
    );
  }
}
