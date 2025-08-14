import 'package:apis/apis.dart';
import 'package:apis/network/remote/shopify/orders/order/abstract/order_service.dart';
import 'package:apis/network/remote/shopify/orders/order/freezed_model/request/update_shipping_address_request.dart';
import 'package:api_explorer/services/api_request_handler.dart';
import 'package:api_explorer/services/api_service_registry.dart';
import 'package:get_it/get_it.dart';

class UpdateShippingAddressHandler implements ApiRequestHandler {
  @override
  Future<Map<String, dynamic>> handleRequest(
      String method, Map<String, String> params) async {
    // Only handle PUT requests for updating shipping address
    if (method != 'PUT') {
      return {
        "status": "error",
        "message": "Method $method not supported. Only PUT is allowed.",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    // Extract required parameters
    final String apiVersion = params['api_version'] ?? ApiNetwork.apiVersion;
    final orderId = params['order_id'];
    final firstName = params['first_name'];
    final lastName = params['last_name'];
    final address1 = params['address1'];
    final city = params['city'];
    final province = params['province'];
    final country = params['country'];
    final zip = params['zip'];
    final phone = params['phone'];

    // Validate required parameters
    if (orderId == null || orderId.isEmpty) {
      return {
        "status": "error",
        "message": "Order ID is required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    if (firstName == null ||
        firstName.isEmpty ||
        lastName == null ||
        lastName.isEmpty ||
        address1 == null ||
        address1.isEmpty ||
        city == null ||
        city.isEmpty ||
        province == null ||
        province.isEmpty ||
        country == null ||
        country.isEmpty ||
        zip == null ||
        zip.isEmpty) {
      return {
        "status": "error",
        "message":
            "First name, last name, shipping address, city, province, country and ZIP code are required",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }

    try {
      // Create the request model
      final model = UpdateShippingAddressRequest(
        order: Order(
          shippingAddress: ShippingAddress(
            firstName: firstName,
            lastName: lastName,
            address1: address1,
            city: city,
            province: province,
            country: country,
            zip: zip,
            phone: phone,
          ),
        ),
      );

      // Call the order service
      final response = await GetIt.I<OrderService>().updateShippingAddress(
        apiVersion: apiVersion,
        orderId: orderId,
        model: model,
      );

      // Return success response
      return {
        "status": "success",
        "message": "Shipping address updated successfully",
        "order": response.toJson(),
        "timestamp": DateTime.now().toIso8601String(),
      };
    } catch (e) {
      // Handle errors
      return {
        "status": "error",
        "message": "Failed to update shipping address: ${e.toString()}",
        "timestamp": DateTime.now().toIso8601String(),
      };
    }
  }

  @override
  List<String> get supportedMethods => ['PUT'];

  @override
  Map<String, List<ApiField>> get requiredFields => {
        'PUT': [
          const ApiField(
            name: 'order_id',
            label: 'Order ID',
            hint: 'The ID of the order to update',
            isRequired: true,
          ),
          const ApiField(
            name: 'first_name',
            label: 'First Name',
            hint: 'First name for shipping address',
            isRequired: true,
          ),
          const ApiField(
            name: 'last_name',
            label: 'Last Name',
            hint: 'Last name for shipping address',
            isRequired: true,
          ),
          const ApiField(
            name: 'address1',
            label: 'Address',
            hint: 'The shipping address',
            isRequired: true,
          ),
          const ApiField(
            name: 'city',
            label: 'City',
            hint: 'The shipping address city',
            isRequired: true,
          ),
          const ApiField(
            name: 'province',
            label: 'Province',
            hint: 'The shipping address province/state',
            isRequired: true,
          ),
          const ApiField(
            name: 'country',
            label: 'Country',
            hint: 'The shipping address country',
            isRequired: true,
          ),
          const ApiField(
            name: 'zip',
            label: 'ZIP Code',
            hint: 'The shipping address ZIP/postal code',
            isRequired: true,
          ),
          const ApiField(
            name: 'phone',
            label: 'Phone',
            hint: 'Phone number for shipping address',
            isRequired: false,
          ),
        ],
      };
}
