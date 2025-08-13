import '../../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GetProduct {
  factory Variables$Query$GetProduct({required String id}) =>
      Variables$Query$GetProduct._({
        r'id': id,
      });

  Variables$Query$GetProduct._(this._$data);

  factory Variables$Query$GetProduct.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetProduct._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetProduct<Variables$Query$GetProduct>
      get copyWith => CopyWith$Variables$Query$GetProduct(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetProduct ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetProduct<TRes> {
  factory CopyWith$Variables$Query$GetProduct(
    Variables$Query$GetProduct instance,
    TRes Function(Variables$Query$GetProduct) then,
  ) = _CopyWithImpl$Variables$Query$GetProduct;

  factory CopyWith$Variables$Query$GetProduct.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetProduct;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetProduct<TRes>
    implements CopyWith$Variables$Query$GetProduct<TRes> {
  _CopyWithImpl$Variables$Query$GetProduct(
    this._instance,
    this._then,
  );

  final Variables$Query$GetProduct _instance;

  final TRes Function(Variables$Query$GetProduct) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Variables$Query$GetProduct._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetProduct<TRes>
    implements CopyWith$Variables$Query$GetProduct<TRes> {
  _CopyWithStubImpl$Variables$Query$GetProduct(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetProduct {
  Query$GetProduct({
    this.product,
    this.$__typename = 'Query',
  });

  factory Query$GetProduct.fromJson(Map<String, dynamic> json) {
    final l$product = json['product'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct(
      product: l$product == null
          ? null
          : Query$GetProduct$product.fromJson(
              (l$product as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProduct$product? product;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$product = product;
    _resultData['product'] = l$product?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$product = product;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$product,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct || runtimeType != other.runtimeType) {
      return false;
    }
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct on Query$GetProduct {
  CopyWith$Query$GetProduct<Query$GetProduct> get copyWith =>
      CopyWith$Query$GetProduct(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetProduct<TRes> {
  factory CopyWith$Query$GetProduct(
    Query$GetProduct instance,
    TRes Function(Query$GetProduct) then,
  ) = _CopyWithImpl$Query$GetProduct;

  factory CopyWith$Query$GetProduct.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct;

  TRes call({
    Query$GetProduct$product? product,
    String? $__typename,
  });
  CopyWith$Query$GetProduct$product<TRes> get product;
}

class _CopyWithImpl$Query$GetProduct<TRes>
    implements CopyWith$Query$GetProduct<TRes> {
  _CopyWithImpl$Query$GetProduct(
    this._instance,
    this._then,
  );

  final Query$GetProduct _instance;

  final TRes Function(Query$GetProduct) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? product = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct(
        product: product == _undefined
            ? _instance.product
            : (product as Query$GetProduct$product?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProduct$product<TRes> get product {
    final local$product = _instance.product;
    return local$product == null
        ? CopyWith$Query$GetProduct$product.stub(_then(_instance))
        : CopyWith$Query$GetProduct$product(
            local$product, (e) => call(product: e));
  }
}

class _CopyWithStubImpl$Query$GetProduct<TRes>
    implements CopyWith$Query$GetProduct<TRes> {
  _CopyWithStubImpl$Query$GetProduct(this._res);

  TRes _res;

  call({
    Query$GetProduct$product? product,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProduct$product<TRes> get product =>
      CopyWith$Query$GetProduct$product.stub(_res);
}

const documentNodeQueryGetProduct = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetProduct'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'product'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'description'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'handle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'vendor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'productType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tags'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'variants'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '50'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'price'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'sku'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'inventoryQuantity'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'weight'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'weightUnit'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'images'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '20'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'url'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'altText'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'width'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'height'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class Query$GetProduct$product {
  Query$GetProduct$product({
    required this.id,
    required this.title,
    this.description,
    required this.handle,
    required this.status,
    this.vendor,
    this.productType,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
    required this.variants,
    required this.images,
    this.$__typename = 'Product',
  });

  factory Query$GetProduct$product.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$handle = json['handle'];
    final l$status = json['status'];
    final l$vendor = json['vendor'];
    final l$productType = json['productType'];
    final l$tags = json['tags'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$variants = json['variants'];
    final l$images = json['images'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct$product(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      handle: (l$handle as String),
      status: fromJson$Enum$ProductStatus((l$status as String)),
      vendor: (l$vendor as String?),
      productType: (l$productType as String?),
      tags: (l$tags as List<dynamic>).map((e) => (e as String)).toList(),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      variants: Query$GetProduct$product$variants.fromJson(
          (l$variants as Map<String, dynamic>)),
      images: Query$GetProduct$product$images.fromJson(
          (l$images as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? description;

  final String handle;

  final Enum$ProductStatus status;

  final String? vendor;

  final String? productType;

  final List<String> tags;

  final String createdAt;

  final String updatedAt;

  final Query$GetProduct$product$variants variants;

  final Query$GetProduct$product$images images;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$description = description;
    _resultData['description'] = l$description;
    final l$handle = handle;
    _resultData['handle'] = l$handle;
    final l$status = status;
    _resultData['status'] = toJson$Enum$ProductStatus(l$status);
    final l$vendor = vendor;
    _resultData['vendor'] = l$vendor;
    final l$productType = productType;
    _resultData['productType'] = l$productType;
    final l$tags = tags;
    _resultData['tags'] = l$tags.map((e) => e).toList();
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$variants = variants;
    _resultData['variants'] = l$variants.toJson();
    final l$images = images;
    _resultData['images'] = l$images.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$handle = handle;
    final l$status = status;
    final l$vendor = vendor;
    final l$productType = productType;
    final l$tags = tags;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$variants = variants;
    final l$images = images;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$description,
      l$handle,
      l$status,
      l$vendor,
      l$productType,
      Object.hashAll(l$tags.map((v) => v)),
      l$createdAt,
      l$updatedAt,
      l$variants,
      l$images,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct$product ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (l$description != lOther$description) {
      return false;
    }
    final l$handle = handle;
    final lOther$handle = other.handle;
    if (l$handle != lOther$handle) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$vendor = vendor;
    final lOther$vendor = other.vendor;
    if (l$vendor != lOther$vendor) {
      return false;
    }
    final l$productType = productType;
    final lOther$productType = other.productType;
    if (l$productType != lOther$productType) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags.length != lOther$tags.length) {
      return false;
    }
    for (int i = 0; i < l$tags.length; i++) {
      final l$tags$entry = l$tags[i];
      final lOther$tags$entry = lOther$tags[i];
      if (l$tags$entry != lOther$tags$entry) {
        return false;
      }
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$variants = variants;
    final lOther$variants = other.variants;
    if (l$variants != lOther$variants) {
      return false;
    }
    final l$images = images;
    final lOther$images = other.images;
    if (l$images != lOther$images) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct$product
    on Query$GetProduct$product {
  CopyWith$Query$GetProduct$product<Query$GetProduct$product> get copyWith =>
      CopyWith$Query$GetProduct$product(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetProduct$product<TRes> {
  factory CopyWith$Query$GetProduct$product(
    Query$GetProduct$product instance,
    TRes Function(Query$GetProduct$product) then,
  ) = _CopyWithImpl$Query$GetProduct$product;

  factory CopyWith$Query$GetProduct$product.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct$product;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? handle,
    Enum$ProductStatus? status,
    String? vendor,
    String? productType,
    List<String>? tags,
    String? createdAt,
    String? updatedAt,
    Query$GetProduct$product$variants? variants,
    Query$GetProduct$product$images? images,
    String? $__typename,
  });
  CopyWith$Query$GetProduct$product$variants<TRes> get variants;
  CopyWith$Query$GetProduct$product$images<TRes> get images;
}

class _CopyWithImpl$Query$GetProduct$product<TRes>
    implements CopyWith$Query$GetProduct$product<TRes> {
  _CopyWithImpl$Query$GetProduct$product(
    this._instance,
    this._then,
  );

  final Query$GetProduct$product _instance;

  final TRes Function(Query$GetProduct$product) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? handle = _undefined,
    Object? status = _undefined,
    Object? vendor = _undefined,
    Object? productType = _undefined,
    Object? tags = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? variants = _undefined,
    Object? images = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct$product(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        description: description == _undefined
            ? _instance.description
            : (description as String?),
        handle: handle == _undefined || handle == null
            ? _instance.handle
            : (handle as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$ProductStatus),
        vendor: vendor == _undefined ? _instance.vendor : (vendor as String?),
        productType: productType == _undefined
            ? _instance.productType
            : (productType as String?),
        tags: tags == _undefined || tags == null
            ? _instance.tags
            : (tags as List<String>),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        variants: variants == _undefined || variants == null
            ? _instance.variants
            : (variants as Query$GetProduct$product$variants),
        images: images == _undefined || images == null
            ? _instance.images
            : (images as Query$GetProduct$product$images),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProduct$product$variants<TRes> get variants {
    final local$variants = _instance.variants;
    return CopyWith$Query$GetProduct$product$variants(
        local$variants, (e) => call(variants: e));
  }

  CopyWith$Query$GetProduct$product$images<TRes> get images {
    final local$images = _instance.images;
    return CopyWith$Query$GetProduct$product$images(
        local$images, (e) => call(images: e));
  }
}

class _CopyWithStubImpl$Query$GetProduct$product<TRes>
    implements CopyWith$Query$GetProduct$product<TRes> {
  _CopyWithStubImpl$Query$GetProduct$product(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? handle,
    Enum$ProductStatus? status,
    String? vendor,
    String? productType,
    List<String>? tags,
    String? createdAt,
    String? updatedAt,
    Query$GetProduct$product$variants? variants,
    Query$GetProduct$product$images? images,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProduct$product$variants<TRes> get variants =>
      CopyWith$Query$GetProduct$product$variants.stub(_res);

  CopyWith$Query$GetProduct$product$images<TRes> get images =>
      CopyWith$Query$GetProduct$product$images.stub(_res);
}

class Query$GetProduct$product$variants {
  Query$GetProduct$product$variants({
    required this.edges,
    this.$__typename = 'ProductVariantConnection',
  });

  factory Query$GetProduct$product$variants.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct$product$variants(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$GetProduct$product$variants$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetProduct$product$variants$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct$product$variants ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct$product$variants
    on Query$GetProduct$product$variants {
  CopyWith$Query$GetProduct$product$variants<Query$GetProduct$product$variants>
      get copyWith => CopyWith$Query$GetProduct$product$variants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProduct$product$variants<TRes> {
  factory CopyWith$Query$GetProduct$product$variants(
    Query$GetProduct$product$variants instance,
    TRes Function(Query$GetProduct$product$variants) then,
  ) = _CopyWithImpl$Query$GetProduct$product$variants;

  factory CopyWith$Query$GetProduct$product$variants.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct$product$variants;

  TRes call({
    List<Query$GetProduct$product$variants$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetProduct$product$variants$edges> Function(
              Iterable<
                  CopyWith$Query$GetProduct$product$variants$edges<
                      Query$GetProduct$product$variants$edges>>)
          _fn);
}

class _CopyWithImpl$Query$GetProduct$product$variants<TRes>
    implements CopyWith$Query$GetProduct$product$variants<TRes> {
  _CopyWithImpl$Query$GetProduct$product$variants(
    this._instance,
    this._then,
  );

  final Query$GetProduct$product$variants _instance;

  final TRes Function(Query$GetProduct$product$variants) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct$product$variants(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$GetProduct$product$variants$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetProduct$product$variants$edges> Function(
                  Iterable<
                      CopyWith$Query$GetProduct$product$variants$edges<
                          Query$GetProduct$product$variants$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$GetProduct$product$variants$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetProduct$product$variants<TRes>
    implements CopyWith$Query$GetProduct$product$variants<TRes> {
  _CopyWithStubImpl$Query$GetProduct$product$variants(this._res);

  TRes _res;

  call({
    List<Query$GetProduct$product$variants$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetProduct$product$variants$edges {
  Query$GetProduct$product$variants$edges({
    required this.node,
    this.$__typename = 'ProductVariantEdge',
  });

  factory Query$GetProduct$product$variants$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct$product$variants$edges(
      node: Query$GetProduct$product$variants$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProduct$product$variants$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct$product$variants$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct$product$variants$edges
    on Query$GetProduct$product$variants$edges {
  CopyWith$Query$GetProduct$product$variants$edges<
          Query$GetProduct$product$variants$edges>
      get copyWith => CopyWith$Query$GetProduct$product$variants$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProduct$product$variants$edges<TRes> {
  factory CopyWith$Query$GetProduct$product$variants$edges(
    Query$GetProduct$product$variants$edges instance,
    TRes Function(Query$GetProduct$product$variants$edges) then,
  ) = _CopyWithImpl$Query$GetProduct$product$variants$edges;

  factory CopyWith$Query$GetProduct$product$variants$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct$product$variants$edges;

  TRes call({
    Query$GetProduct$product$variants$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetProduct$product$variants$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetProduct$product$variants$edges<TRes>
    implements CopyWith$Query$GetProduct$product$variants$edges<TRes> {
  _CopyWithImpl$Query$GetProduct$product$variants$edges(
    this._instance,
    this._then,
  );

  final Query$GetProduct$product$variants$edges _instance;

  final TRes Function(Query$GetProduct$product$variants$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct$product$variants$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetProduct$product$variants$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProduct$product$variants$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetProduct$product$variants$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetProduct$product$variants$edges<TRes>
    implements CopyWith$Query$GetProduct$product$variants$edges<TRes> {
  _CopyWithStubImpl$Query$GetProduct$product$variants$edges(this._res);

  TRes _res;

  call({
    Query$GetProduct$product$variants$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProduct$product$variants$edges$node<TRes> get node =>
      CopyWith$Query$GetProduct$product$variants$edges$node.stub(_res);
}

class Query$GetProduct$product$variants$edges$node {
  Query$GetProduct$product$variants$edges$node({
    required this.id,
    required this.title,
    required this.price,
    this.sku,
    this.inventoryQuantity,
    this.weight,
    required this.weightUnit,
    this.$__typename = 'ProductVariant',
  });

  factory Query$GetProduct$product$variants$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$price = json['price'];
    final l$sku = json['sku'];
    final l$inventoryQuantity = json['inventoryQuantity'];
    final l$weight = json['weight'];
    final l$weightUnit = json['weightUnit'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct$product$variants$edges$node(
      id: (l$id as String),
      title: (l$title as String),
      price: (l$price as String),
      sku: (l$sku as String?),
      inventoryQuantity: (l$inventoryQuantity as int?),
      weight: (l$weight as num?)?.toDouble(),
      weightUnit: fromJson$Enum$WeightUnit((l$weightUnit as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String price;

  final String? sku;

  final int? inventoryQuantity;

  final double? weight;

  final Enum$WeightUnit weightUnit;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$price = price;
    _resultData['price'] = l$price;
    final l$sku = sku;
    _resultData['sku'] = l$sku;
    final l$inventoryQuantity = inventoryQuantity;
    _resultData['inventoryQuantity'] = l$inventoryQuantity;
    final l$weight = weight;
    _resultData['weight'] = l$weight;
    final l$weightUnit = weightUnit;
    _resultData['weightUnit'] = toJson$Enum$WeightUnit(l$weightUnit);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$price = price;
    final l$sku = sku;
    final l$inventoryQuantity = inventoryQuantity;
    final l$weight = weight;
    final l$weightUnit = weightUnit;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$price,
      l$sku,
      l$inventoryQuantity,
      l$weight,
      l$weightUnit,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct$product$variants$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$price = price;
    final lOther$price = other.price;
    if (l$price != lOther$price) {
      return false;
    }
    final l$sku = sku;
    final lOther$sku = other.sku;
    if (l$sku != lOther$sku) {
      return false;
    }
    final l$inventoryQuantity = inventoryQuantity;
    final lOther$inventoryQuantity = other.inventoryQuantity;
    if (l$inventoryQuantity != lOther$inventoryQuantity) {
      return false;
    }
    final l$weight = weight;
    final lOther$weight = other.weight;
    if (l$weight != lOther$weight) {
      return false;
    }
    final l$weightUnit = weightUnit;
    final lOther$weightUnit = other.weightUnit;
    if (l$weightUnit != lOther$weightUnit) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct$product$variants$edges$node
    on Query$GetProduct$product$variants$edges$node {
  CopyWith$Query$GetProduct$product$variants$edges$node<
          Query$GetProduct$product$variants$edges$node>
      get copyWith => CopyWith$Query$GetProduct$product$variants$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProduct$product$variants$edges$node<TRes> {
  factory CopyWith$Query$GetProduct$product$variants$edges$node(
    Query$GetProduct$product$variants$edges$node instance,
    TRes Function(Query$GetProduct$product$variants$edges$node) then,
  ) = _CopyWithImpl$Query$GetProduct$product$variants$edges$node;

  factory CopyWith$Query$GetProduct$product$variants$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct$product$variants$edges$node;

  TRes call({
    String? id,
    String? title,
    String? price,
    String? sku,
    int? inventoryQuantity,
    double? weight,
    Enum$WeightUnit? weightUnit,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetProduct$product$variants$edges$node<TRes>
    implements CopyWith$Query$GetProduct$product$variants$edges$node<TRes> {
  _CopyWithImpl$Query$GetProduct$product$variants$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetProduct$product$variants$edges$node _instance;

  final TRes Function(Query$GetProduct$product$variants$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? price = _undefined,
    Object? sku = _undefined,
    Object? inventoryQuantity = _undefined,
    Object? weight = _undefined,
    Object? weightUnit = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct$product$variants$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        price: price == _undefined || price == null
            ? _instance.price
            : (price as String),
        sku: sku == _undefined ? _instance.sku : (sku as String?),
        inventoryQuantity: inventoryQuantity == _undefined
            ? _instance.inventoryQuantity
            : (inventoryQuantity as int?),
        weight: weight == _undefined ? _instance.weight : (weight as double?),
        weightUnit: weightUnit == _undefined || weightUnit == null
            ? _instance.weightUnit
            : (weightUnit as Enum$WeightUnit),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetProduct$product$variants$edges$node<TRes>
    implements CopyWith$Query$GetProduct$product$variants$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetProduct$product$variants$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? price,
    String? sku,
    int? inventoryQuantity,
    double? weight,
    Enum$WeightUnit? weightUnit,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetProduct$product$images {
  Query$GetProduct$product$images({
    required this.edges,
    this.$__typename = 'ImageConnection',
  });

  factory Query$GetProduct$product$images.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct$product$images(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$GetProduct$product$images$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetProduct$product$images$edges> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct$product$images ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct$product$images
    on Query$GetProduct$product$images {
  CopyWith$Query$GetProduct$product$images<Query$GetProduct$product$images>
      get copyWith => CopyWith$Query$GetProduct$product$images(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProduct$product$images<TRes> {
  factory CopyWith$Query$GetProduct$product$images(
    Query$GetProduct$product$images instance,
    TRes Function(Query$GetProduct$product$images) then,
  ) = _CopyWithImpl$Query$GetProduct$product$images;

  factory CopyWith$Query$GetProduct$product$images.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct$product$images;

  TRes call({
    List<Query$GetProduct$product$images$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetProduct$product$images$edges> Function(
              Iterable<
                  CopyWith$Query$GetProduct$product$images$edges<
                      Query$GetProduct$product$images$edges>>)
          _fn);
}

class _CopyWithImpl$Query$GetProduct$product$images<TRes>
    implements CopyWith$Query$GetProduct$product$images<TRes> {
  _CopyWithImpl$Query$GetProduct$product$images(
    this._instance,
    this._then,
  );

  final Query$GetProduct$product$images _instance;

  final TRes Function(Query$GetProduct$product$images) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct$product$images(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$GetProduct$product$images$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetProduct$product$images$edges> Function(
                  Iterable<
                      CopyWith$Query$GetProduct$product$images$edges<
                          Query$GetProduct$product$images$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$GetProduct$product$images$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetProduct$product$images<TRes>
    implements CopyWith$Query$GetProduct$product$images<TRes> {
  _CopyWithStubImpl$Query$GetProduct$product$images(this._res);

  TRes _res;

  call({
    List<Query$GetProduct$product$images$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetProduct$product$images$edges {
  Query$GetProduct$product$images$edges({
    required this.node,
    this.$__typename = 'ImageEdge',
  });

  factory Query$GetProduct$product$images$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct$product$images$edges(
      node: Query$GetProduct$product$images$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProduct$product$images$edges$node node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct$product$images$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct$product$images$edges
    on Query$GetProduct$product$images$edges {
  CopyWith$Query$GetProduct$product$images$edges<
          Query$GetProduct$product$images$edges>
      get copyWith => CopyWith$Query$GetProduct$product$images$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProduct$product$images$edges<TRes> {
  factory CopyWith$Query$GetProduct$product$images$edges(
    Query$GetProduct$product$images$edges instance,
    TRes Function(Query$GetProduct$product$images$edges) then,
  ) = _CopyWithImpl$Query$GetProduct$product$images$edges;

  factory CopyWith$Query$GetProduct$product$images$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct$product$images$edges;

  TRes call({
    Query$GetProduct$product$images$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetProduct$product$images$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetProduct$product$images$edges<TRes>
    implements CopyWith$Query$GetProduct$product$images$edges<TRes> {
  _CopyWithImpl$Query$GetProduct$product$images$edges(
    this._instance,
    this._then,
  );

  final Query$GetProduct$product$images$edges _instance;

  final TRes Function(Query$GetProduct$product$images$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct$product$images$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetProduct$product$images$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProduct$product$images$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetProduct$product$images$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetProduct$product$images$edges<TRes>
    implements CopyWith$Query$GetProduct$product$images$edges<TRes> {
  _CopyWithStubImpl$Query$GetProduct$product$images$edges(this._res);

  TRes _res;

  call({
    Query$GetProduct$product$images$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProduct$product$images$edges$node<TRes> get node =>
      CopyWith$Query$GetProduct$product$images$edges$node.stub(_res);
}

class Query$GetProduct$product$images$edges$node {
  Query$GetProduct$product$images$edges$node({
    required this.id,
    required this.url,
    this.altText,
    this.width,
    this.height,
    this.$__typename = 'Image',
  });

  factory Query$GetProduct$product$images$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$url = json['url'];
    final l$altText = json['altText'];
    final l$width = json['width'];
    final l$height = json['height'];
    final l$$__typename = json['__typename'];
    return Query$GetProduct$product$images$edges$node(
      id: (l$id as String),
      url: (l$url as String),
      altText: (l$altText as String?),
      width: (l$width as int?),
      height: (l$height as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String url;

  final String? altText;

  final int? width;

  final int? height;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$url = url;
    _resultData['url'] = l$url;
    final l$altText = altText;
    _resultData['altText'] = l$altText;
    final l$width = width;
    _resultData['width'] = l$width;
    final l$height = height;
    _resultData['height'] = l$height;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$url = url;
    final l$altText = altText;
    final l$width = width;
    final l$height = height;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$url,
      l$altText,
      l$width,
      l$height,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProduct$product$images$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$url = url;
    final lOther$url = other.url;
    if (l$url != lOther$url) {
      return false;
    }
    final l$altText = altText;
    final lOther$altText = other.altText;
    if (l$altText != lOther$altText) {
      return false;
    }
    final l$width = width;
    final lOther$width = other.width;
    if (l$width != lOther$width) {
      return false;
    }
    final l$height = height;
    final lOther$height = other.height;
    if (l$height != lOther$height) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProduct$product$images$edges$node
    on Query$GetProduct$product$images$edges$node {
  CopyWith$Query$GetProduct$product$images$edges$node<
          Query$GetProduct$product$images$edges$node>
      get copyWith => CopyWith$Query$GetProduct$product$images$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProduct$product$images$edges$node<TRes> {
  factory CopyWith$Query$GetProduct$product$images$edges$node(
    Query$GetProduct$product$images$edges$node instance,
    TRes Function(Query$GetProduct$product$images$edges$node) then,
  ) = _CopyWithImpl$Query$GetProduct$product$images$edges$node;

  factory CopyWith$Query$GetProduct$product$images$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProduct$product$images$edges$node;

  TRes call({
    String? id,
    String? url,
    String? altText,
    int? width,
    int? height,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetProduct$product$images$edges$node<TRes>
    implements CopyWith$Query$GetProduct$product$images$edges$node<TRes> {
  _CopyWithImpl$Query$GetProduct$product$images$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetProduct$product$images$edges$node _instance;

  final TRes Function(Query$GetProduct$product$images$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? url = _undefined,
    Object? altText = _undefined,
    Object? width = _undefined,
    Object? height = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProduct$product$images$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        url: url == _undefined || url == null ? _instance.url : (url as String),
        altText:
            altText == _undefined ? _instance.altText : (altText as String?),
        width: width == _undefined ? _instance.width : (width as int?),
        height: height == _undefined ? _instance.height : (height as int?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetProduct$product$images$edges$node<TRes>
    implements CopyWith$Query$GetProduct$product$images$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetProduct$product$images$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? url,
    String? altText,
    int? width,
    int? height,
    String? $__typename,
  }) =>
      _res;
}
