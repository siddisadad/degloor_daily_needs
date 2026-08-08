import 'package:collection/collection.dart';
import '../../providers/order_provider.dart';
import '../../models/order_model.dart';
import '/components/bottom_nav/bottom_nav_widget.dart';
import '/components/bottom_nav_child/bottom_nav_child_widget.dart';
import '/components/button/button_widget.dart';
import '/components/tracking_step/tracking_step_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'live_order_tracking_model.dart';
export 'live_order_tracking_model.dart';

class LiveOrderTrackingWidget extends StatefulWidget {
  const LiveOrderTrackingWidget({
    super.key,
    this.orderId,
  });

  final String? orderId;

  static String routeName = 'LiveOrderTracking';
  static String routePath = '/liveOrderTracking';

  @override
  State<LiveOrderTrackingWidget> createState() =>
      _LiveOrderTrackingWidgetState();
}

class _LiveOrderTrackingWidgetState extends State<LiveOrderTrackingWidget> {
  late LiveOrderTrackingModel _model;
  Timer? _timer;
  double _progress = 0.0;
  LatLng _currentPosition = const LatLng(18.4140, 77.5860);

  final LatLng _storePos = const LatLng(18.4140, 77.5860);
  final LatLng _customerPos = const LatLng(18.4100, 77.5820);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveOrderTrackingModel());

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final orderProvider = Provider.of<OrderProvider>(context, listen: false);
      final trackingOrder = widget.orderId != null
          ? orderProvider.orders.firstWhereOrNull((o) => o.id == widget.orderId)
          : (orderProvider.orders.isNotEmpty ? orderProvider.orders.first : null);

      if (trackingOrder != null && trackingOrder.status == OrderStatus.pickedUp) {
        setState(() {
          _progress += 0.05;
          if (_progress > 1.0) _progress = 1.0;

          _currentPosition = LatLng(
            _storePos.latitude + (_customerPos.latitude - _storePos.latitude) * _progress,
            _storePos.longitude + (_customerPos.longitude - _storePos.longitude) * _progress,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final trackingOrder = widget.orderId != null
        ? orderProvider.orders.firstWhereOrNull((o) => o.id == widget.orderId)
        : (orderProvider.orders.isNotEmpty ? orderProvider.orders.first : null);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: const AlignmentDirectional(-1.0, -1.0),
          children: [
            FlutterFlowGoogleMap(
              controller: _model.mapGoogleMapsController,
              onCameraIdle: (latLng) => _model.mapGoogleMapsCenter = latLng,
              initialLocation: _model.mapGoogleMapsCenter ??=
                  const LatLng(18.4116, 77.5842),
              markers: [
                FlutterFlowMarker('delivery_boy', _currentPosition),
                FlutterFlowMarker('store', _storePos),
                FlutterFlowMarker('customer', _customerPos),
              ],
              markerColor: GoogleMarkerColor.violet,
              mapType: MapType.normal,
              style: GoogleMapStyle.standard,
              initialZoom: 15.0,
              allowInteraction: true,
              allowZoom: true,
              showZoomControls: false,
              showLocation: false,
              showCompass: false,
              showMapToolbar: false,
              showTraffic: false,
              centerMapOnMarkerTap: true,
              mapTakesGesturePreference: false,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 8.0,
                    sigmaY: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).surface90,
                      borderRadius: BorderRadius.circular(12.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.goNamed(CustomerHomeFeedWidget.routeName);
                            },
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                trackingOrder != null
                                    ? 'Order #${trackingOrder.id}'
                                    : 'No Active Order',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                      lineHeight: 1.4,
                                    ),
                              ),
                              Text(
                                trackingOrder != null
                                    ? (trackingOrder.status ==
                                            OrderStatus.delivered
                                        ? 'Delivered'
                                        : (trackingOrder.status ==
                                                OrderStatus.pickedUp
                                            ? 'Arriving in ${(12 * (1 - _progress)).toStringAsFixed(0)} mins'
                                            : 'Arriving in 12 mins'))
                                    : 'Check back later',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ],
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.help_outline_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                  CustomerSupportChatWidget.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 48.0,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).success10,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'RK',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          fontSize: 18.24,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                    overflow: TextOverflow.clip,
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
                                        'Rahul Kumar',
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            size: 14.0,
                                          ),
                                          Text(
                                            '4.9 • Delivery Partner',
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ].divide(const SizedBox(height: 4.0)),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderRadius: 9999.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).success,
                                      icon: const Icon(
                                        Icons.call_rounded,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      onPressed: () {},
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 9999.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .surfaceVariant,
                                      icon: Icon(
                                        Icons.chat_bubble_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.goNamed(
                                            CustomerSupportChatWidget.routeName);
                                      },
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ].divide(const SizedBox(width: 16.0)),
                            ),
                            Divider(
                              height: 16.0,
                              thickness: 1.0,
                              indent: 0.0,
                              endIndent: 0.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TrackingStepWidget(
                                  label: 'Order Confirmed',
                                  time: trackingOrder != null
                                      ? dateTimeFormat(
                                          'hh:mm a', trackingOrder.timestamp)
                                      : '11:30 AM',
                                  completed: trackingOrder != null &&
                                      trackingOrder.status.index >=
                                          OrderStatus.pending.index,
                                  isLast: false,
                                ),
                                TrackingStepWidget(
                                  label: 'Order Accepted',
                                  time: 'Pending',
                                  completed: trackingOrder != null &&
                                      trackingOrder.status.index >=
                                          OrderStatus.accepted.index,
                                  isLast: false,
                                ),
                                TrackingStepWidget(
                                  label: 'Picked up from Store',
                                  time: 'In Progress',
                                  completed: trackingOrder != null &&
                                      trackingOrder.status.index >=
                                          OrderStatus.pickedUp.index,
                                  isLast: false,
                                ),
                                TrackingStepWidget(
                                  label: 'Delivered',
                                  time: 'Expected',
                                  completed: trackingOrder != null &&
                                      trackingOrder.status.index >=
                                          OrderStatus.delivered.index,
                                  isLast: true,
                                ),
                              ].divide(const SizedBox(height: 0.0)),
                            ),
                          ].divide(const SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.buttonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const ButtonWidget(
                        iconPresent: false,
                        iconEndPresent: false,
                        content: 'Cancel Order',
                        variant: 'ghost',
                        size: 'medium',
                        fullWidth: true,
                        loading: false,
                        disabled: false,
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.bottomNavModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavWidget(
                  child: () => const BottomNavChildWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
