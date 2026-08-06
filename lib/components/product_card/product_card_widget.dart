import '/components/button/button_widget.dart';
import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_card_model.dart';
export 'product_card_model.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    String? imageDesc,
    String? name,
    String? price,
    String? weight,
    bool? inStock,
  })  : this.imageDesc = imageDesc ??
            'https://dimg.dreamflow.cloud/v1/image/bag%20of%20long%20grain%20rice',
        this.name = name ?? 'Premium Basmati Rice',
        this.price = price ?? '₹110',
        this.weight = weight ?? '1 kg',
        this.inStock = inStock ?? false;

  final String imageDesc;
  final String name;
  final String price;
  final String weight;
  final bool inStock;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late ProductCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(6.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 0),
                    fadeOutDuration: Duration(milliseconds: 0),
                    imageUrl: valueOrDefault<String>(
                      widget!.imageDesc,
                      'https://dimg.dreamflow.cloud/v1/image/bag%20of%20long%20grain%20rice',
                    ),
                    fit: BoxFit.cover,
                    alignment: Alignment(0.0, 0.0),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.name,
                      'Premium Basmati Rice',
                    ),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1.5,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget!.weight,
                      '1 kg',
                    ),
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
                ].divide(SizedBox(height: 4.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.price,
                      '₹110',
                    ),
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                          lineHeight: 1.4,
                        ),
                  ),
                  Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      final cartItemIndex = cart.items.indexWhere((item) => item.product.id == widget!.name);
                      final isInCart = cartItemIndex >= 0;
                      final quantity = isInCart ? cart.items[cartItemIndex].quantity : 0;

                      if (isInCart) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 4.0,
                              buttonSize: 32.0,
                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                              icon: Icon(
                                Icons.remove,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              onPressed: () => cart.decrementItem(widget!.name),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '$quantity',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(fontWeight: FontWeight.bold),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 4.0,
                              buttonSize: 32.0,
                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              onPressed: () {
                                final product = Product(
                                  id: widget!.name,
                                  name: widget!.name,
                                  description: widget!.weight,
                                  price: double.tryParse(widget!.price.replaceAll('₹', '').replaceAll(',', '')) ?? 0.0,
                                  imageUrl: widget!.imageDesc,
                                  category: '',
                                );
                                cart.addItem(product);
                              },
                            ),
                          ],
                        );
                      }

                      return InkWell(
                        onTap: valueOrDefault<bool>(
                          widget!.inStock,
                          false,
                        )
                            ? () {
                                final product = Product(
                                  id: widget!.name,
                                  name: widget!.name,
                                  description: widget!.weight,
                                  price: double.tryParse(widget!.price
                                          .replaceAll('₹', '')
                                          .replaceAll(',', '')) ??
                                      0.0,
                                  imageUrl: widget!.imageDesc,
                                  category: '',
                                );
                                cart.addItem(product);
                              }
                            : null,
                        child: wrapWithModel(
                          model: _model.buttonModel,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            iconPresent: false,
                            iconEndPresent: false,
                            content: 'Add',
                            variant: 'outline',
                            size: 'small',
                            fullWidth: false,
                            loading: false,
                            disabled: valueOrDefault<bool>(
                              valueOrDefault<bool>(
                                widget!.inStock,
                                false,
                              )
                                  ? false
                                  : true,
                              true,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
