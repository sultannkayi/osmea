import '../../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$CreateProduct {
  factory Variables$Mutation$CreateProduct(
          {required Input$ProductInput input}) =>
      Variables$Mutation$CreateProduct._({
        r'input': input,
      });

  Variables$Mutation$CreateProduct._(this._$data);

  factory Variables$Mutation$CreateProduct.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$ProductInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateProduct._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ProductInput get input => (_$data['input'] as Input$ProductInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateProduct<Variables$Mutation$CreateProduct>
      get copyWith => CopyWith$Variables$Mutation$CreateProduct(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateProduct ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$input = input;
    return Object.hashAll([l$input]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateProduct<TRes> {
  factory CopyWith$Variables$Mutation$CreateProduct(
    Variables$Mutation$CreateProduct instance,
    TRes Function(Variables$Mutation$CreateProduct) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateProduct;

  factory CopyWith$Variables$Mutation$CreateProduct.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateProduct;

  TRes call({Input$ProductInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateProduct<TRes>
    implements CopyWith$Variables$Mutation$CreateProduct<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateProduct(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateProduct _instance;

  final TRes Function(Variables$Mutation$CreateProduct) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateProduct._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$ProductInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateProduct<TRes>
    implements CopyWith$Variables$Mutation$CreateProduct<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateProduct(this._res);

  TRes _res;

  call({Input$ProductInput? input}) => _res;
}

class Mutation$CreateProduct {
  Mutation$CreateProduct({
    this.productCreate,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateProduct.fromJson(Map<String, dynamic> json) {
    final l$productCreate = json['productCreate'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateProduct(
      productCreate: l$productCreate == null
          ? null
          : Mutation$CreateProduct$productCreate.fromJson(
              (l$productCreate as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateProduct$productCreate? productCreate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$productCreate = productCreate;
    _resultData['productCreate'] = l$productCreate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$productCreate = productCreate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$productCreate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateProduct || runtimeType != other.runtimeType) {
      return false;
    }
    final l$productCreate = productCreate;
    final lOther$productCreate = other.productCreate;
    if (l$productCreate != lOther$productCreate) {
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

extension UtilityExtension$Mutation$CreateProduct on Mutation$CreateProduct {
  CopyWith$Mutation$CreateProduct<Mutation$CreateProduct> get copyWith =>
      CopyWith$Mutation$CreateProduct(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateProduct<TRes> {
  factory CopyWith$Mutation$CreateProduct(
    Mutation$CreateProduct instance,
    TRes Function(Mutation$CreateProduct) then,
  ) = _CopyWithImpl$Mutation$CreateProduct;

  factory CopyWith$Mutation$CreateProduct.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateProduct;

  TRes call({
    Mutation$CreateProduct$productCreate? productCreate,
    String? $__typename,
  });
  CopyWith$Mutation$CreateProduct$productCreate<TRes> get productCreate;
}

class _CopyWithImpl$Mutation$CreateProduct<TRes>
    implements CopyWith$Mutation$CreateProduct<TRes> {
  _CopyWithImpl$Mutation$CreateProduct(
    this._instance,
    this._then,
  );

  final Mutation$CreateProduct _instance;

  final TRes Function(Mutation$CreateProduct) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? productCreate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateProduct(
        productCreate: productCreate == _undefined
            ? _instance.productCreate
            : (productCreate as Mutation$CreateProduct$productCreate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateProduct$productCreate<TRes> get productCreate {
    final local$productCreate = _instance.productCreate;
    return local$productCreate == null
        ? CopyWith$Mutation$CreateProduct$productCreate.stub(_then(_instance))
        : CopyWith$Mutation$CreateProduct$productCreate(
            local$productCreate, (e) => call(productCreate: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateProduct<TRes>
    implements CopyWith$Mutation$CreateProduct<TRes> {
  _CopyWithStubImpl$Mutation$CreateProduct(this._res);

  TRes _res;

  call({
    Mutation$CreateProduct$productCreate? productCreate,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateProduct$productCreate<TRes> get productCreate =>
      CopyWith$Mutation$CreateProduct$productCreate.stub(_res);
}

const documentNodeMutationCreateProduct = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateProduct'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ProductInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'productCreate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'product'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'userErrors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'field'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'message'),
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
]);

class Mutation$CreateProduct$productCreate {
  Mutation$CreateProduct$productCreate({
    this.product,
    required this.userErrors,
    this.$__typename = 'ProductCreatePayload',
  });

  factory Mutation$CreateProduct$productCreate.fromJson(
      Map<String, dynamic> json) {
    final l$product = json['product'];
    final l$userErrors = json['userErrors'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateProduct$productCreate(
      product: l$product == null
          ? null
          : Mutation$CreateProduct$productCreate$product.fromJson(
              (l$product as Map<String, dynamic>)),
      userErrors: (l$userErrors as List<dynamic>)
          .map((e) => Mutation$CreateProduct$productCreate$userErrors.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateProduct$productCreate$product? product;

  final List<Mutation$CreateProduct$productCreate$userErrors> userErrors;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$product = product;
    _resultData['product'] = l$product?.toJson();
    final l$userErrors = userErrors;
    _resultData['userErrors'] = l$userErrors.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$product = product;
    final l$userErrors = userErrors;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$product,
      Object.hashAll(l$userErrors.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateProduct$productCreate ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$product = product;
    final lOther$product = other.product;
    if (l$product != lOther$product) {
      return false;
    }
    final l$userErrors = userErrors;
    final lOther$userErrors = other.userErrors;
    if (l$userErrors.length != lOther$userErrors.length) {
      return false;
    }
    for (int i = 0; i < l$userErrors.length; i++) {
      final l$userErrors$entry = l$userErrors[i];
      final lOther$userErrors$entry = lOther$userErrors[i];
      if (l$userErrors$entry != lOther$userErrors$entry) {
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

extension UtilityExtension$Mutation$CreateProduct$productCreate
    on Mutation$CreateProduct$productCreate {
  CopyWith$Mutation$CreateProduct$productCreate<
          Mutation$CreateProduct$productCreate>
      get copyWith => CopyWith$Mutation$CreateProduct$productCreate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateProduct$productCreate<TRes> {
  factory CopyWith$Mutation$CreateProduct$productCreate(
    Mutation$CreateProduct$productCreate instance,
    TRes Function(Mutation$CreateProduct$productCreate) then,
  ) = _CopyWithImpl$Mutation$CreateProduct$productCreate;

  factory CopyWith$Mutation$CreateProduct$productCreate.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateProduct$productCreate;

  TRes call({
    Mutation$CreateProduct$productCreate$product? product,
    List<Mutation$CreateProduct$productCreate$userErrors>? userErrors,
    String? $__typename,
  });
  CopyWith$Mutation$CreateProduct$productCreate$product<TRes> get product;
  TRes userErrors(
      Iterable<Mutation$CreateProduct$productCreate$userErrors> Function(
              Iterable<
                  CopyWith$Mutation$CreateProduct$productCreate$userErrors<
                      Mutation$CreateProduct$productCreate$userErrors>>)
          _fn);
}

class _CopyWithImpl$Mutation$CreateProduct$productCreate<TRes>
    implements CopyWith$Mutation$CreateProduct$productCreate<TRes> {
  _CopyWithImpl$Mutation$CreateProduct$productCreate(
    this._instance,
    this._then,
  );

  final Mutation$CreateProduct$productCreate _instance;

  final TRes Function(Mutation$CreateProduct$productCreate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? product = _undefined,
    Object? userErrors = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateProduct$productCreate(
        product: product == _undefined
            ? _instance.product
            : (product as Mutation$CreateProduct$productCreate$product?),
        userErrors: userErrors == _undefined || userErrors == null
            ? _instance.userErrors
            : (userErrors
                as List<Mutation$CreateProduct$productCreate$userErrors>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateProduct$productCreate$product<TRes> get product {
    final local$product = _instance.product;
    return local$product == null
        ? CopyWith$Mutation$CreateProduct$productCreate$product.stub(
            _then(_instance))
        : CopyWith$Mutation$CreateProduct$productCreate$product(
            local$product, (e) => call(product: e));
  }

  TRes userErrors(
          Iterable<Mutation$CreateProduct$productCreate$userErrors> Function(
                  Iterable<
                      CopyWith$Mutation$CreateProduct$productCreate$userErrors<
                          Mutation$CreateProduct$productCreate$userErrors>>)
              _fn) =>
      call(
          userErrors: _fn(_instance.userErrors.map(
              (e) => CopyWith$Mutation$CreateProduct$productCreate$userErrors(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Mutation$CreateProduct$productCreate<TRes>
    implements CopyWith$Mutation$CreateProduct$productCreate<TRes> {
  _CopyWithStubImpl$Mutation$CreateProduct$productCreate(this._res);

  TRes _res;

  call({
    Mutation$CreateProduct$productCreate$product? product,
    List<Mutation$CreateProduct$productCreate$userErrors>? userErrors,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateProduct$productCreate$product<TRes> get product =>
      CopyWith$Mutation$CreateProduct$productCreate$product.stub(_res);

  userErrors(_fn) => _res;
}

class Mutation$CreateProduct$productCreate$product {
  Mutation$CreateProduct$productCreate$product({
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
    this.$__typename = 'Product',
  });

  factory Mutation$CreateProduct$productCreate$product.fromJson(
      Map<String, dynamic> json) {
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
    final l$$__typename = json['__typename'];
    return Mutation$CreateProduct$productCreate$product(
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
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateProduct$productCreate$product ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateProduct$productCreate$product
    on Mutation$CreateProduct$productCreate$product {
  CopyWith$Mutation$CreateProduct$productCreate$product<
          Mutation$CreateProduct$productCreate$product>
      get copyWith => CopyWith$Mutation$CreateProduct$productCreate$product(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateProduct$productCreate$product<TRes> {
  factory CopyWith$Mutation$CreateProduct$productCreate$product(
    Mutation$CreateProduct$productCreate$product instance,
    TRes Function(Mutation$CreateProduct$productCreate$product) then,
  ) = _CopyWithImpl$Mutation$CreateProduct$productCreate$product;

  factory CopyWith$Mutation$CreateProduct$productCreate$product.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateProduct$productCreate$product;

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
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateProduct$productCreate$product<TRes>
    implements CopyWith$Mutation$CreateProduct$productCreate$product<TRes> {
  _CopyWithImpl$Mutation$CreateProduct$productCreate$product(
    this._instance,
    this._then,
  );

  final Mutation$CreateProduct$productCreate$product _instance;

  final TRes Function(Mutation$CreateProduct$productCreate$product) _then;

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
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateProduct$productCreate$product(
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateProduct$productCreate$product<TRes>
    implements CopyWith$Mutation$CreateProduct$productCreate$product<TRes> {
  _CopyWithStubImpl$Mutation$CreateProduct$productCreate$product(this._res);

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
    String? $__typename,
  }) =>
      _res;
}

class Mutation$CreateProduct$productCreate$userErrors {
  Mutation$CreateProduct$productCreate$userErrors({
    this.field,
    required this.message,
    this.$__typename = 'UserError',
  });

  factory Mutation$CreateProduct$productCreate$userErrors.fromJson(
      Map<String, dynamic> json) {
    final l$field = json['field'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateProduct$productCreate$userErrors(
      field: (l$field as List<dynamic>?)?.map((e) => (e as String)).toList(),
      message: (l$message as String),
      $__typename: (l$$__typename as String),
    );
  }

  final List<String>? field;

  final String message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$field = field;
    _resultData['field'] = l$field?.map((e) => e).toList();
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$field = field;
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$field == null ? null : Object.hashAll(l$field.map((v) => v)),
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateProduct$productCreate$userErrors ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$field = field;
    final lOther$field = other.field;
    if (l$field != null && lOther$field != null) {
      if (l$field.length != lOther$field.length) {
        return false;
      }
      for (int i = 0; i < l$field.length; i++) {
        final l$field$entry = l$field[i];
        final lOther$field$entry = lOther$field[i];
        if (l$field$entry != lOther$field$entry) {
          return false;
        }
      }
    } else if (l$field != lOther$field) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$CreateProduct$productCreate$userErrors
    on Mutation$CreateProduct$productCreate$userErrors {
  CopyWith$Mutation$CreateProduct$productCreate$userErrors<
          Mutation$CreateProduct$productCreate$userErrors>
      get copyWith => CopyWith$Mutation$CreateProduct$productCreate$userErrors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateProduct$productCreate$userErrors<TRes> {
  factory CopyWith$Mutation$CreateProduct$productCreate$userErrors(
    Mutation$CreateProduct$productCreate$userErrors instance,
    TRes Function(Mutation$CreateProduct$productCreate$userErrors) then,
  ) = _CopyWithImpl$Mutation$CreateProduct$productCreate$userErrors;

  factory CopyWith$Mutation$CreateProduct$productCreate$userErrors.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateProduct$productCreate$userErrors;

  TRes call({
    List<String>? field,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateProduct$productCreate$userErrors<TRes>
    implements CopyWith$Mutation$CreateProduct$productCreate$userErrors<TRes> {
  _CopyWithImpl$Mutation$CreateProduct$productCreate$userErrors(
    this._instance,
    this._then,
  );

  final Mutation$CreateProduct$productCreate$userErrors _instance;

  final TRes Function(Mutation$CreateProduct$productCreate$userErrors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? field = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateProduct$productCreate$userErrors(
        field: field == _undefined ? _instance.field : (field as List<String>?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateProduct$productCreate$userErrors<TRes>
    implements CopyWith$Mutation$CreateProduct$productCreate$userErrors<TRes> {
  _CopyWithStubImpl$Mutation$CreateProduct$productCreate$userErrors(this._res);

  TRes _res;

  call({
    List<String>? field,
    String? message,
    String? $__typename,
  }) =>
      _res;
}
