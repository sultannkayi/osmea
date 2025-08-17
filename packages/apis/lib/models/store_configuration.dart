class StoreConfiguration {
  final int? id;
  final String storeName;
  final String displayName;
  final String platform;
  final String? shopifyAccessToken;
  final String apiVersion;
  final String? storeUrl;
  final String? username;
  final String? password;
  final bool isActive;
  final bool isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;

  StoreConfiguration({
    this.id,
    required this.storeName,
    required this.displayName,
    required this.platform,
    this.shopifyAccessToken,
    required this.apiVersion,
    this.storeUrl,
    this.username,
    this.password,
    this.isActive = false,
    this.isDefault = false,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'store_name': storeName,
      'display_name': displayName,
      'platform': platform,
      'shopify_access_token': shopifyAccessToken,
      'api_version': apiVersion,
      'store_url': storeUrl,
      'username': username,
      'password': password,
      'is_active': isActive ? 1 : 0,
      'is_default': isDefault ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory StoreConfiguration.fromJson(Map<String, dynamic> json) {
    return StoreConfiguration(
      id: json['id'],
      storeName: json['store_name'],
      displayName: json['display_name'],
      platform: json['platform'],
      shopifyAccessToken: json['shopify_access_token'],
      apiVersion: json['api_version'],
      storeUrl: json['store_url'],
      username: json['username'],
      password: json['password'],
      isActive: json['is_active'] == 1,
      isDefault: json['is_default'] == 1,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  bool get isComplete {
    if (platform == 'shopify') {
      return storeName.isNotEmpty &&
          shopifyAccessToken != null &&
          shopifyAccessToken!.isNotEmpty &&
          apiVersion.isNotEmpty;
    } else if (platform == 'woocommerce') {
      return storeUrl != null &&
          storeUrl!.isNotEmpty &&
          username != null &&
          username!.isNotEmpty &&
          password != null &&
          password!.isNotEmpty &&
          apiVersion.isNotEmpty;
    }
    return false;
  }

  String get baseUrl {
    if (platform == 'shopify') {
      return 'https://$storeName.myshopify.com/admin';
    } else if (platform == 'woocommerce') {
      return storeUrl ?? '';
    }
    return '';
  }

  StoreConfiguration copyWith({
    int? id,
    String? storeName,
    String? displayName,
    String? platform,
    String? shopifyAccessToken,
    String? apiVersion,
    String? storeUrl,
    String? username,
    String? password,
    bool? isActive,
    bool? isDefault,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoreConfiguration(
      id: id ?? this.id,
      storeName: storeName ?? this.storeName,
      displayName: displayName ?? this.displayName,
      platform: platform ?? this.platform,
      shopifyAccessToken: shopifyAccessToken ?? this.shopifyAccessToken,
      apiVersion: apiVersion ?? this.apiVersion,
      storeUrl: storeUrl ?? this.storeUrl,
      username: username ?? this.username,
      password: password ?? this.password,
      isActive: isActive ?? this.isActive,
      isDefault: isDefault ?? this.isDefault,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'StoreConfiguration(id: $id, storeName: $storeName, displayName: $displayName, platform: $platform, isActive: $isActive, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StoreConfiguration && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
