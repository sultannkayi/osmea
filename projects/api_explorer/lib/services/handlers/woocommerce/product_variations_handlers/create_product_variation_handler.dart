import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/variations/abstract/product_variations_service.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart'; // Added for json.decode

class CreateProductVariationHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Product ID to create variation for (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'regular_price',
            label: 'Regular Price',
            hint: 'Variation regular price (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'description',
            label: 'Description',
            hint: 'Variation description (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'sku',
            label: 'SKU',
            hint: 'Variation SKU (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'manage_stock',
            label: 'Manage Stock',
            hint: 'Whether to manage stock (true/false)',
            isRequired: false,
          ),
          const ApiField(
            name: 'stock_quantity',
            label: 'Stock Quantity',
            hint: 'Stock quantity (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'stock_status',
            label: 'Stock Status',
            hint: 'Stock status (instock, outofstock, onbackorder)',
            isRequired: false,
          ),
          const ApiField(
            name: 'backorders',
            label: 'Backorders',
            hint: 'Backorder setting (no, notify, yes)',
            isRequired: false,
          ),
          const ApiField(
            name: 'weight',
            label: 'Weight',
            hint: 'Variation weight (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'dimensions_length',
            label: 'Length',
            hint: 'Variation length (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'dimensions_width',
            label: 'Width',
            hint: 'Variation width (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'dimensions_height',
            label: 'Height',
            hint: 'Variation height (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'shipping_class',
            label: 'Shipping Class',
            hint: 'Shipping class slug (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'image_id',
            label: 'Image ID',
            hint: 'Variation image ID (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'attributes',
            label: 'Attributes',
            hint: 'Variation attributes (JSON format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'menu_order',
            label: 'Menu Order',
            hint: 'Menu order (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'meta_data',
            label: 'Meta Data',
            hint: 'Meta data (JSON format)',
            isRequired: false,
          ),
          const ApiField(
            name: 'api_version',
            label: 'API Version',
            hint: 'WooCommerce API version (default: v3)',
            isRequired: false,
          ),
        ],
      };

  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    try {
      // Validate required product_id parameter
      final productIdStr = params['product_id']?.toString() ?? '';
      final productId = int.tryParse(productIdStr);

      if (productId == null || productId <= 0) {
        return {
          'success': false,
          'message':
              'Valid product_id is required and must be a positive integer',
        };
      }

      // Validate required regular_price parameter
      final regularPriceStr = params['regular_price']?.toString() ?? '';
      final regularPrice = double.tryParse(regularPriceStr);

      if (regularPrice == null || regularPrice < 0) {
        return {
          'success': false,
          'message':
              'Valid regular_price is required and must be a non-negative number',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Create variation data map
      final Map<String, dynamic> variationData = {};

      // Add required regular_price
      variationData['regular_price'] = regularPrice.toString();

      // Parse optional parameters
      final description = params['description']?.toString().trim();
      final sku = params['sku']?.toString().trim();
      final stockStatus = params['stock_status']?.toString();
      final backorders = params['backorders']?.toString();
      final shippingClass = params['shipping_class']?.toString().trim();

      // Parse numeric parameters
      double? weight;
      if (params['weight'] != null) {
        weight = double.tryParse(params['weight'].toString());
      }

      double? length;
      if (params['dimensions_length'] != null) {
        length = double.tryParse(params['dimensions_length'].toString());
      }

      double? width;
      if (params['dimensions_width'] != null) {
        width = double.tryParse(params['dimensions_width'].toString());
      }

      double? height;
      if (params['dimensions_height'] != null) {
        height = double.tryParse(params['dimensions_height'].toString());
      }

      int? stockQuantity;
      if (params['stock_quantity'] != null) {
        stockQuantity = int.tryParse(params['stock_quantity'].toString());
      }

      int? imageId;
      if (params['image_id'] != null) {
        imageId = int.tryParse(params['image_id'].toString());
      }

      int? menuOrder;
      if (params['menu_order'] != null) {
        menuOrder = int.tryParse(params['menu_order'].toString());
      }

      // Parse boolean parameter
      bool? manageStock;
      if (params['manage_stock'] != null) {
        final manageStockStr = params['manage_stock'].toString().toLowerCase();
        if (manageStockStr == 'true' || manageStockStr == '1') {
          manageStock = true;
        } else if (manageStockStr == 'false' || manageStockStr == '0') {
          manageStock = false;
        }
      }

      // Parse JSON parameters
      List<Map<String, dynamic>>? attributes;
      if (params['attributes']?.toString().isNotEmpty == true) {
        try {
          final attributesJson = params['attributes'].toString();
          final attributesList = json.decode(attributesJson) as List;
          attributes = attributesList.cast<Map<String, dynamic>>();
        } catch (e) {
          debugPrint('⚠️ Warning: Invalid attributes JSON format: ${e.toString()}');
        }
      }

      List<Map<String, dynamic>>? metaData;
      if (params['meta_data']?.toString().isNotEmpty == true) {
        try {
          final metaDataJson = params['meta_data'].toString();
          final metaDataList = json.decode(metaDataJson) as List;
          metaData = metaDataList.cast<Map<String, dynamic>>();
        } catch (e) {
          debugPrint('⚠️ Warning: Invalid meta_data JSON format: ${e.toString()}');
        }
      }

      // Build variation data
      if (description?.isNotEmpty == true) {
        variationData['description'] = description;
      }
      if (sku?.isNotEmpty == true) {
        variationData['sku'] = sku;
      }
      if (manageStock != null) {
        variationData['manage_stock'] = manageStock;
      }
      if (stockQuantity != null) {
        variationData['stock_quantity'] = stockQuantity;
      }
      if (stockStatus?.isNotEmpty == true) {
        variationData['stock_status'] = stockStatus;
      }
      if (backorders?.isNotEmpty == true) {
        variationData['backorders'] = backorders;
      }
      if (weight != null) {
        variationData['weight'] = weight.toString();
      }
      if (shippingClass?.isNotEmpty == true) {
        variationData['shipping_class'] = shippingClass;
      }
      if (imageId != null) {
        variationData['image'] = {'id': imageId};
      }
      if (menuOrder != null) {
        variationData['menu_order'] = menuOrder;
      }
      if (attributes != null) {
        variationData['attributes'] = attributes;
      }
      if (metaData != null) {
        variationData['meta_data'] = metaData;
      }

      // Add dimensions if any dimension is provided
      if (length != null || width != null || height != null) {
        final Map<String, dynamic> dimensions = {};
        if (length != null) dimensions['length'] = length.toString();
        if (width != null) dimensions['width'] = width.toString();
        if (height != null) dimensions['height'] = height.toString();
        variationData['dimensions'] = dimensions;
      }

      debugPrint('➕ Create Product Variation Parameters:');
      debugPrint('  API Version: $apiVersion');
      debugPrint('  Product ID: $productId');
      debugPrint('  Regular Price: $regularPrice');
      debugPrint('  Description: $description');
      debugPrint('  SKU: $sku');
      debugPrint('  Manage Stock: $manageStock');
      debugPrint('  Stock Quantity: $stockQuantity');
      debugPrint('  Stock Status: $stockStatus');
      debugPrint('  Backorders: $backorders');
      debugPrint('  Weight: $weight');
      debugPrint('  Length: $length');
      debugPrint('  Width: $width');
      debugPrint('  Height: $height');
      debugPrint('  Shipping Class: $shippingClass');
      debugPrint('  Image ID: $imageId');
      debugPrint('  Menu Order: $menuOrder');
      debugPrint('  Attributes: $attributes');
      debugPrint('  Meta Data: $metaData');
      debugPrint('  Request body: $variationData');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductVariationsService>();
      final response = await service.createProductVariation(
        apiVersion: apiVersion,
        productId: productId,
        variationData: variationData,
      );

      debugPrint('✅ Create Product Variation Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product variation created successfully',
        'data': response.toJson(),
      };
    } catch (e) {
      debugPrint('❌ Error: $e');

      return {
        'success': false,
        'message': 'Failed to create product variation: $e',
        'error_details': e.toString(),
      };
    }
  }
}
