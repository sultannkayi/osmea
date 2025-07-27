import 'package:apis/apis.dart';
import 'package:apis/network/remote/woocommerce/products/variations/abstract/product_variations_service.dart';
import 'package:dio/dio.dart';
import 'package:example/services/api_request_handler.dart';
import 'package:example/services/api_service_registry.dart';

class UpdateProductVariationHandler implements ApiRequestHandler {
  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'product_id',
            label: 'Product ID',
            hint: 'Product ID (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'variation_id',
            label: 'Variation ID',
            hint: 'Variation ID to update (required)',
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
            hint: 'Stock keeping unit (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'price',
            label: 'Price',
            hint: 'Variation price (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'regular_price',
            label: 'Regular Price',
            hint: 'Regular price (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'sale_price',
            label: 'Sale Price',
            hint: 'Sale price (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'status',
            label: 'Status',
            hint: 'Variation status (draft, pending, private, publish)',
            isRequired: false,
          ),
          const ApiField(
            name: 'purchasable',
            label: 'Purchasable',
            hint: 'Whether the variation is purchasable (true/false)',
            isRequired: false,
          ),
          const ApiField(
            name: 'virtual',
            label: 'Virtual',
            hint: 'Whether the variation is virtual (true/false)',
            isRequired: false,
          ),
          const ApiField(
            name: 'downloadable',
            label: 'Downloadable',
            hint: 'Whether the variation is downloadable (true/false)',
            isRequired: false,
          ),
          const ApiField(
            name: 'download_limit',
            label: 'Download Limit',
            hint: 'Number of times downloadable files can be downloaded',
            isRequired: false,
          ),
          const ApiField(
            name: 'download_expiry',
            label: 'Download Expiry',
            hint: 'Number of days before access to downloadable files expires',
            isRequired: false,
          ),
          const ApiField(
            name: 'tax_status',
            label: 'Tax Status',
            hint: 'Tax status (taxable, shipping, none)',
            isRequired: false,
          ),
          const ApiField(
            name: 'tax_class',
            label: 'Tax Class',
            hint: 'Tax class (optional)',
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
            hint: 'Stock quantity (number)',
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
            hint: 'Backorders (no, notify, yes)',
            isRequired: false,
          ),
          const ApiField(
            name: 'backorders_allowed',
            label: 'Backorders Allowed',
            hint: 'Whether backorders are allowed (true/false)',
            isRequired: false,
          ),
          const ApiField(
            name: 'backordered',
            label: 'Backordered',
            hint: 'Whether the variation is backordered (true/false)',
            isRequired: false,
          ),
          const ApiField(
            name: 'weight',
            label: 'Weight',
            hint: 'Variation weight (number)',
            isRequired: false,
          ),
          const ApiField(
            name: 'length',
            label: 'Length',
            hint: 'Variation length (number)',
            isRequired: false,
          ),
          const ApiField(
            name: 'width',
            label: 'Width',
            hint: 'Variation width (number)',
            isRequired: false,
          ),
          const ApiField(
            name: 'height',
            label: 'Height',
            hint: 'Variation height (number)',
            isRequired: false,
          ),
          const ApiField(
            name: 'shipping_class',
            label: 'Shipping Class',
            hint: 'Shipping class slug (optional)',
            isRequired: false,
          ),
          const ApiField(
            name: 'shipping_class_id',
            label: 'Shipping Class ID',
            hint: 'Shipping class ID (number)',
            isRequired: false,
          ),
          const ApiField(
            name: 'menu_order',
            label: 'Menu Order',
            hint: 'Menu order (number)',
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

      // Validate required variation_id parameter
      final variationIdStr = params['variation_id']?.toString() ?? '';
      final variationId = int.tryParse(variationIdStr);

      if (variationId == null || variationId <= 0) {
        return {
          'success': false,
          'message':
              'Valid variation_id is required and must be a positive integer',
        };
      }

      // Parse API version
      final apiVersion = params['api_version']?.toString() ?? 'v3';

      // Create variation data map
      final Map<String, dynamic> variationData = {};

      // Parse string fields
      final description = params['description']?.toString()?.trim();
      final sku = params['sku']?.toString()?.trim();
      final price = params['price']?.toString()?.trim();
      final regularPrice = params['regular_price']?.toString()?.trim();
      final salePrice = params['sale_price']?.toString()?.trim();
      final status = params['status']?.toString()?.trim();
      final taxStatus = params['tax_status']?.toString()?.trim();
      final taxClass = params['tax_class']?.toString()?.trim();
      final stockStatus = params['stock_status']?.toString()?.trim();
      final backorders = params['backorders']?.toString()?.trim();
      final weight = params['weight']?.toString()?.trim();
      final shippingClass = params['shipping_class']?.toString()?.trim();

      // Parse boolean fields
      bool? purchasable;
      if (params['purchasable'] != null) {
        final purchasableStr = params['purchasable'].toString().toLowerCase();
        if (purchasableStr == 'true' || purchasableStr == '1') {
          purchasable = true;
        } else if (purchasableStr == 'false' || purchasableStr == '0') {
          purchasable = false;
        }
      }

      bool? virtual;
      if (params['virtual'] != null) {
        final virtualStr = params['virtual'].toString().toLowerCase();
        if (virtualStr == 'true' || virtualStr == '1') {
          virtual = true;
        } else if (virtualStr == 'false' || virtualStr == '0') {
          virtual = false;
        }
      }

      bool? downloadable;
      if (params['downloadable'] != null) {
        final downloadableStr = params['downloadable'].toString().toLowerCase();
        if (downloadableStr == 'true' || downloadableStr == '1') {
          downloadable = true;
        } else if (downloadableStr == 'false' || downloadableStr == '0') {
          downloadable = false;
        }
      }

      bool? manageStock;
      if (params['manage_stock'] != null) {
        final manageStockStr = params['manage_stock'].toString().toLowerCase();
        if (manageStockStr == 'true' || manageStockStr == '1') {
          manageStock = true;
        } else if (manageStockStr == 'false' || manageStockStr == '0') {
          manageStock = false;
        }
      }

      bool? backordersAllowed;
      if (params['backorders_allowed'] != null) {
        final backordersAllowedStr =
            params['backorders_allowed'].toString().toLowerCase();
        if (backordersAllowedStr == 'true' || backordersAllowedStr == '1') {
          backordersAllowed = true;
        } else if (backordersAllowedStr == 'false' ||
            backordersAllowedStr == '0') {
          backordersAllowed = false;
        }
      }

      bool? backordered;
      if (params['backordered'] != null) {
        final backorderedStr = params['backordered'].toString().toLowerCase();
        if (backorderedStr == 'true' || backorderedStr == '1') {
          backordered = true;
        } else if (backorderedStr == 'false' || backorderedStr == '0') {
          backordered = false;
        }
      }

      // Parse integer fields
      int? downloadLimit;
      if (params['download_limit'] != null) {
        downloadLimit = int.tryParse(params['download_limit'].toString());
      }

      int? downloadExpiry;
      if (params['download_expiry'] != null) {
        downloadExpiry = int.tryParse(params['download_expiry'].toString());
      }

      int? stockQuantity;
      if (params['stock_quantity'] != null) {
        stockQuantity = int.tryParse(params['stock_quantity'].toString());
      }

      int? shippingClassId;
      if (params['shipping_class_id'] != null) {
        shippingClassId = int.tryParse(params['shipping_class_id'].toString());
      }

      int? menuOrder;
      if (params['menu_order'] != null) {
        menuOrder = int.tryParse(params['menu_order'].toString());
      }

      // Parse dimension fields
      final length = params['length']?.toString()?.trim();
      final width = params['width']?.toString()?.trim();
      final height = params['height']?.toString()?.trim();

      // Build variation data
      if (description?.isNotEmpty == true) {
        variationData['description'] = description;
      }
      if (sku?.isNotEmpty == true) {
        variationData['sku'] = sku;
      }
      if (price?.isNotEmpty == true) {
        variationData['price'] = price;
      }
      if (regularPrice?.isNotEmpty == true) {
        variationData['regular_price'] = regularPrice;
      }
      if (salePrice?.isNotEmpty == true) {
        variationData['sale_price'] = salePrice;
      }
      if (status?.isNotEmpty == true) {
        variationData['status'] = status;
      }
      if (purchasable != null) {
        variationData['purchasable'] = purchasable;
      }
      if (virtual != null) {
        variationData['virtual'] = virtual;
      }
      if (downloadable != null) {
        variationData['downloadable'] = downloadable;
      }
      if (downloadLimit != null) {
        variationData['download_limit'] = downloadLimit;
      }
      if (downloadExpiry != null) {
        variationData['download_expiry'] = downloadExpiry;
      }
      if (taxStatus?.isNotEmpty == true) {
        variationData['tax_status'] = taxStatus;
      }
      if (taxClass?.isNotEmpty == true) {
        variationData['tax_class'] = taxClass;
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
      if (backordersAllowed != null) {
        variationData['backorders_allowed'] = backordersAllowed;
      }
      if (backordered != null) {
        variationData['backordered'] = backordered;
      }
      if (weight?.isNotEmpty == true) {
        variationData['weight'] = weight;
      }
      if (shippingClass?.isNotEmpty == true) {
        variationData['shipping_class'] = shippingClass;
      }
      if (shippingClassId != null) {
        variationData['shipping_class_id'] = shippingClassId;
      }
      if (menuOrder != null) {
        variationData['menu_order'] = menuOrder;
      }

      // Add dimensions if any are provided
      if (length?.isNotEmpty == true ||
          width?.isNotEmpty == true ||
          height?.isNotEmpty == true) {
        final dimensions = <String, String>{};
        if (length?.isNotEmpty == true) {
          dimensions['length'] = length!;
        }
        if (width?.isNotEmpty == true) {
          dimensions['width'] = width!;
        }
        if (height?.isNotEmpty == true) {
          dimensions['height'] = height!;
        }
        variationData['dimensions'] = dimensions;
      }

      print('✏️ Update Product Variation Parameters:');
      print('  API Version: $apiVersion');
      print('  Product ID: $productId');
      print('  Variation ID: $variationId');
      print('  Description: $description');
      print('  SKU: $sku');
      print('  Price: $price');
      print('  Regular Price: $regularPrice');
      print('  Sale Price: $salePrice');
      print('  Status: $status');
      print('  Purchasable: $purchasable');
      print('  Virtual: $virtual');
      print('  Downloadable: $downloadable');
      print('  Manage Stock: $manageStock');
      print('  Stock Quantity: $stockQuantity');
      print('  Stock Status: $stockStatus');
      print('  Weight: $weight');
      print(
          '  Dimensions: ${length != null || width != null || height != null ? 'Length: $length, Width: $width, Height: $height' : 'Not provided'}');
      print('  Request body: $variationData');

      // Get service and call API
      final service = WooNetwork.getIt.get<ProductVariationsService>();
      final response = await service.updateProductVariation(
        apiVersion: apiVersion,
        productId: productId,
        variationId: variationId,
        variationData: variationData,
      );

      print('✅ Update Product Variation Success: ${response.toJson()}');

      return {
        'success': true,
        'message': 'Product variation updated successfully',
        'data': response.toJson(),
      };
    } on DioException catch (e) {
      String errorMessage = 'Failed to update product variation';

      if (e.response?.statusCode == 400) {
        errorMessage = 'Invalid variation data provided';
      } else if (e.response?.statusCode == 404) {
        errorMessage = 'Product variation not found';
      } else if (e.response?.statusCode == 409) {
        errorMessage = 'Variation with this SKU already exists';
      } else if (e.response?.data != null) {
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('message')) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
      }

      print('❌ Update Product Variation Error: $errorMessage');
      print('🔍 Full error: ${e.toString()}');

      return {
        'success': false,
        'message': errorMessage,
        'error_details': e.toString(),
      };
    } catch (e) {
      print('❌ Update Product Variation Unexpected Error: ${e.toString()}');
      return {
        'success': false,
        'message': 'Unexpected error occurred while updating product variation',
        'error_details': e.toString(),
      };
    }
  }
}
