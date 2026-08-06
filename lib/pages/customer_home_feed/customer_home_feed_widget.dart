import '/components/bottom_nav/bottom_nav_widget.dart';
import '../../providers/address_provider.dart';
import '../../models/address_model.dart';
import '/components/bottom_nav_child/bottom_nav_child_widget.dart';
import '/components/button/button_widget.dart';
import '/components/category_item/category_item_widget.dart';
import '/components/store_card/store_card_widget.dart';
import '/components/text_field/text_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'customer_home_feed_model.dart';
export 'customer_home_feed_model.dart';

class CustomerHomeFeedWidget extends StatefulWidget {
  const CustomerHomeFeedWidget({super.key});

  static String routeName = 'CustomerHomeFeed';
  static String routePath = '/customerHomeFeed';

  @override
  State<CustomerHomeFeedWidget> createState() => _CustomerHomeFeedWidgetState();
}

class _CustomerHomeFeedWidgetState extends State<CustomerHomeFeedWidget> {
  late CustomerHomeFeedModel _model;
  final List<Map<String, String>> allStores = [
    {
      'name': 'Degloor Fresh Mart',
      'category': 'Grocery • Fruits • Vegetables',
      'image':
          'https://dimg.dreamflow.cloud/v1/image/modern%20grocery%20store%20interior',
      'rating': '4.8',
      'time': '20-30 min',
    },
    {
      'name': 'City Bakery & Sweets',
      'category': 'Bakery • Snacks • Desserts',
      'image':
          'https://dimg.dreamflow.cloud/v1/image/delicious%20pastries%20in%20a%20display%20case',
      'rating': '4.5',
      'time': '15-25 min',
    },
    {
      'name': 'Nanded Pharma',
      'category': 'Medicines • Wellness',
      'image':
          'https://dimg.dreamflow.cloud/v1/image/clean%20pharmacy%20shelves',
      'rating': '4.9',
      'time': '10-15 min',
    },
  ];
  List<Map<String, String>> filteredStores = [];
  String? selectedCategory;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _showAddAddressDialog(BuildContext context) {
    final labelController = TextEditingController();
    final addressController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Address'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: labelController,
              decoration: const InputDecoration(labelText: 'Label (e.g. Home, Office)'),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Full Address'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              if (labelController.text.isNotEmpty && addressController.text.isNotEmpty) {
                final newAddress = Address(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  label: labelController.text,
                  fullAddress: addressController.text,
                );
                Provider.of<AddressProvider>(context, listen: false).addAddress(newAddress);
                Navigator.pop(context);
                showSnackbar(context, 'Address added successfully!');
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _filterStores() {
    final query =
        _model.textFieldModel.inputTextController?.text.toLowerCase() ?? '';
    safeSetState(() {
      filteredStores = allStores.where((store) {
        final matchesQuery = store['name']!.toLowerCase().contains(query) ||
            store['category']!.toLowerCase().contains(query);
        final matchesCategory = selectedCategory == null ||
            selectedCategory == 'More' ||
            store['category']!.contains(selectedCategory!);
        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomerHomeFeedModel());
    filteredStores = allStores;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _model.textFieldModel.inputTextController?.addListener(_filterStores);
    });
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final addressProvider = Provider.of<AddressProvider>(context, listen: false);
                                      await showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Select Delivery Address',
                                                style: FlutterFlowTheme.of(context).titleMedium,
                                              ),
                                              const SizedBox(height: 16.0),
                                              ...addressProvider.addresses.asMap().entries.map((entry) {
                                                final index = entry.key;
                                                final address = entry.value;
                                                return ListTile(
                                                  title: Text(address.label),
                                                  subtitle: Text(address.fullAddress),
                                                  trailing: addressProvider.selectedIndex == index
                                                      ? Icon(Icons.check_circle, color: FlutterFlowTheme.of(context).primary)
                                                      : null,
                                                  onTap: () {
                                                    addressProvider.selectAddress(index);
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              }),
                                              const Divider(),
                                              ListTile(
                                                leading: Icon(Icons.add, color: FlutterFlowTheme.of(context).primary),
                                                title: Text('Add New Address', style: TextStyle(color: FlutterFlowTheme.of(context).primary, fontWeight: FontWeight.bold)),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  _showAddAddressDialog(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 18.0,
                                        ),
                                        Consumer<AddressProvider>(
                                          builder: (context, ap, _) => Text(
                                            ap.selectedAddress.label == 'Home' ? 'Degloor, Nanded' : ap.selectedAddress.label,
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .titleSmall
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                        const Icon(Icons.keyboard_arrow_down, size: 18.0),
                                      ].divide(const SizedBox(width: 4.0)),
                                    ),
                                  ),
                                  Text(
                                    'Delivering to your doorstep',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 9999.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: const Icon(
                                  Icons.person_outline_rounded,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('UserProfile');
                                },
                              ),
                            ],
                          ),
                          wrapWithModel(
                            model: _model.textFieldModel,
                            updateCallback: () => safeSetState(() {}),
                            child: TextFieldWidget(
                              label: '',
                              labelPresent: false,
                              helper: '',
                              helperPresent: false,
                              leadingIcon: Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              leadingIconPresent: true,
                              trailingIconPresent: false,
                              hint: 'Search for grocery, food, or pharmacy...',
                              value: '',
                              onChange: '',
                              onSubmit: '',
                              variant: 'filled',
                              error: false,
                            ),
                          ),
                        ].divide(const SizedBox(height: 16.0)),
                      ),
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
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 160.0,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: Container(
                                    child: Container(
                                      height: 128.0,
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Container(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: 340.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            24.0),
                                                        child: Container(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Fresh Vegetables',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .onPrimary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.3,
                                                                    ),
                                                              ),
                                                              Text(
                                                                'Directly from local farms',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .onPrimary80,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .buttonModel1,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    const ButtonWidget(
                                                                  iconPresent:
                                                                      false,
                                                                  iconEndPresent:
                                                                      false,
                                                                  content:
                                                                      'Order Now',
                                                                  variant:
                                                                      'secondary',
                                                                  size: 'small',
                                                                  fullWidth:
                                                                      false,
                                                                  loading:
                                                                      false,
                                                                  disabled:
                                                                      false,
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 340.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        shape:
                                                            BoxShape.rectangle,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            24.0),
                                                        child: Container(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Daily Essentials',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .onPrimary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.3,
                                                                    ),
                                                              ),
                                                              Text(
                                                                'Get 20% off on first order',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .onPrimary80,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .buttonModel2,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    const ButtonWidget(
                                                                  iconPresent:
                                                                      false,
                                                                  iconEndPresent:
                                                                      false,
                                                                  content:
                                                                      'View Offers',
                                                                  variant:
                                                                      'secondary',
                                                                  size: 'small',
                                                                  fullWidth:
                                                                      false,
                                                                  loading:
                                                                      false,
                                                                  disabled:
                                                                      false,
                                                                ),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 16.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Categories',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                    GridView(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 16.0,
                                        mainAxisSpacing: 16.0,
                                        childAspectRatio: 1.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        {
                                          'label': 'Grocery',
                                          'icon': Icons.shopping_basket_rounded,
                                          'tone': FlutterFlowTheme.of(context).primary,
                                        },
                                        {
                                          'label': 'Fruits',
                                          'icon': Icons.help,
                                          'tone': FlutterFlowTheme.of(context).tertiary,
                                        },
                                        {
                                          'label': 'Pharmacy',
                                          'icon': Icons.medical_services_rounded,
                                          'tone': FlutterFlowTheme.of(context).secondary,
                                        },
                                        {
                                          'label': 'Restaurant',
                                          'icon': Icons.restaurant_rounded,
                                          'tone': FlutterFlowTheme.of(context).primary,
                                        },
                                        {
                                          'label': 'Bakery',
                                          'icon': Icons.cake_rounded,
                                          'tone': FlutterFlowTheme.of(context).tertiary,
                                        },
                                        {
                                          'label': 'Water',
                                          'icon': Icons.water_drop_rounded,
                                          'tone': FlutterFlowTheme.of(context).secondary,
                                        },
                                        {
                                          'label': 'Hardware',
                                          'icon': Icons.home_repair_service_rounded,
                                          'tone': FlutterFlowTheme.of(context).primary,
                                        },
                                        {
                                          'label': 'More',
                                          'icon': Icons.apps_rounded,
                                          'tone': FlutterFlowTheme.of(context).secondaryText,
                                        },
                                      ].map((cat) {
                                        return CategoryItemWidget(
                                          icon: Icon(
                                            cat['icon'] as IconData,
                                            color: FlutterFlowTheme.of(context).primary,
                                            size: 28.0,
                                          ),
                                          label: cat['label'] as String,
                                          tone: cat['tone'] as Color,
                                          onTap: () {
                                            selectedCategory = cat['label'] as String;
                                            _filterStores();
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Featured Stores in Degloor',
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                        wrapWithModel(
                                          model: _model.buttonModel3,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: const ButtonWidget(
                                            iconPresent: false,
                                            iconEndPresent: false,
                                            content: 'See All',
                                            variant: 'ghost',
                                            size: 'small',
                                            fullWidth: false,
                                            loading: false,
                                            disabled: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: filteredStores.map((store) {
                                        return StoreCardWidget(
                                          category: store['category']!,
                                          imageDesc: store['image']!,
                                          name: store['name']!,
                                          rating: store['rating']!,
                                          time: store['time']!,
                                          onTap: () {
                                            context.pushNamed(
                                              'StoreStorefront',
                                              queryParameters: {
                                                'name': store['name'],
                                                'rating': store['rating'],
                                                'time': store['time'],
                                                'image': store['image'],
                                                'category': store['category'],
                                              }.withoutNulls,
                                            );
                                          },
                                        );
                                      }).toList().divide(const SizedBox(height: 16.0)),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                            ].divide(const SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: Container(
                child: wrapWithModel(
                  model: _model.bottomNavModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BottomNavWidget(
                    child: () => const BottomNavChildWidget(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
