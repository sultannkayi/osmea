import 'package:apis/network/remote/shopify/products/product/abstract/product_service.dart'
    show ProductService;
import 'package:apis/network/remote/shopify/products/product/freezed_model/request/create_product_downloaded_image_request.dart'
    as req;
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';
import 'package:apis/apis.dart';

///*******************************************************************
//*********** 📥 CREATE PRODUCT DOWNLOADED IMAGE HANDLER 📥 ********
///*******************************************************************

class CreateProductDownloadedImageHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
    String method,
    Map<String, dynamic> params,
  ) async {
    // Only handle POST requests for creating products with downloaded image
    if (method != 'POST') {
      return {
        "status": "error",
        "message":
            "Method $method not supported for Create Product Downloaded Image API",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Extract required parameters
      final title = params['title'];
      if (title == null || title.isEmpty) {
        return {
          "status": "error",
          "message": "Title is required for creating a product",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Extract optional product fields
      final bodyHtml = params['body_html'] as String?;
      final vendor = params['vendor'] as String?;
      final productType = params['product_type'] as String?;

      // Extract image URLs (required for downloaded images)
      final dynamic imagesParam = params['images'];
      List<req.Image>? images;

      if (imagesParam == null) {
        return {
          "status": "error",
          "message":
              "At least one image URL is required for downloaded image product",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      if (imagesParam is String) {
        // Single image URL
        if (imagesParam.trim().isEmpty) {
          return {
            "status": "error",
            "message": "Image URL cannot be empty",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        // Validate URL format
        try {
          Uri.parse(imagesParam.trim());
        } catch (e) {
          return {
            "status": "error",
            "message": "Invalid image URL format: $imagesParam",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }

        images = [req.Image(src: imagesParam.trim())];
      } else if (imagesParam is List) {
        // Multiple image URLs
        images = [];
        for (final imageUrl in imagesParam) {
          if (imageUrl == null || imageUrl.toString().trim().isEmpty) {
            return {
              "status": "error",
              "message": "Image URL cannot be empty",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          // Validate URL format
          try {
            Uri.parse(imageUrl.toString().trim());
          } catch (e) {
            return {
              "status": "error",
              "message": "Invalid image URL format: $imageUrl",
              "timestamp": DateTime.now().toIso8601String(),
            };
          }

          images.add(req.Image(src: imageUrl.toString().trim()));
        }

        if (images.isEmpty) {
          return {
            "status": "error",
            "message": "At least one valid image URL is required",
            "timestamp": DateTime.now().toIso8601String(),
          };
        }
      } else {
        return {
          "status": "error",
          "message": "Images parameter must be a string URL or list of URLs",
          "timestamp": DateTime.now().toIso8601String(),
        };
      }

      // Create the product request
      final product = req.Product(
        title: title.toString().trim(),
        bodyHtml: bodyHtml?.trim(),
        vendor: vendor?.trim(),
        productType: productType?.trim(),
        images: images,
      );

      final request = req.CreateProductDownloadedImageRequest(product: product);

      // Call the API method using ApiNetwork.apiVersion
      final response =
          await GetIt.I<ProductService>().createProductDownloadedImage(
        apiVersion: ApiNetwork.apiVersion,
        model: request,
      );

      // Return successful response
      return {
        "status": "success",
        "message": "Product with downloaded image created successfully",
        "product": response.product?.toJson(),
        "params": {
          "title": title,
          "body_html": bodyHtml,
          "vendor": vendor,
          "product_type": productType,
          "images": images.map((img) => img.src).toList(),
        },
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Enhanced error handling
      String errorMessage = e.toString();
      if (e.toString().contains('400') || e.toString().contains('422')) {
        errorMessage = 'Invalid product data: ${e.toString()}';
      } else if (e.toString().contains('401')) {
        errorMessage =
            'Authentication failed. Please check your API credentials.';
      } else if (e.toString().contains('403')) {
        errorMessage =
            'Access denied. You don\'t have permission to create products.';
      } else if (e.toString().contains('429')) {
        errorMessage = 'Rate limit exceeded. Please try again later.';
      }

      return {
        "status": "error",
        "message": errorMessage,
        "details": e.toString(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['POST'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'POST': [
          const ApiField(
            name: 'title',
            label: 'Product Title',
            hint: 'The title of the product (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'images',
            label: 'Image URLs',
            hint:
                'Single URL string or list of image URLs to download (required)',
            isRequired: true,
          ),
          const ApiField(
            name: 'body_html',
            label: 'Product Description',
            hint: 'The HTML description of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'vendor',
            label: 'Vendor',
            hint: 'The vendor/brand of the product',
            isRequired: false,
          ),
          const ApiField(
            name: 'product_type',
            label: 'Product Type',
            hint: 'The type/category of the product',
            isRequired: false,
          ),
        ],
      };
}
