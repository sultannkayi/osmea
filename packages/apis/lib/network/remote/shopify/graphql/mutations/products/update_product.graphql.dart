import '../../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$UpdateProduct {
  factory Variables$Mutation$UpdateProduct(
          {required Input$ProductUpdateInput input}) =>
      Variables$Mutation$UpdateProduct._({
        r'input': input,
      });

  Variables$Mutation$UpdateProduct._(this._$data);

  factory Variables$Mutation$UpdateProduct.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$ProductUpdateInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$UpdateProduct._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ProductUpdateInput get input =>
      (_$data['input'] as Input$ProductUpdateInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$UpdateProduct<Variables$Mutation$UpdateProduct>
      get copyWith => CopyWith$Variables$Mutation$UpdateProduct(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$UpdateProduct ||
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

abstract class CopyWith$Variables$Mutation$UpdateProduct<TRes> {
  factory CopyWith$Variables$Mutation$UpdateProduct(
    Variables$Mutation$UpdateProduct instance,
    TRes Function(Variables$Mutation$UpdateProduct) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdateProduct;

  factory CopyWith$Variables$Mutation$UpdateProduct.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdateProduct;

  TRes call({Input$ProductUpdateInput? input});
}

class _CopyWithImpl$Variables$Mutation$UpdateProduct<TRes>
    implements CopyWith$Variables$Mutation$UpdateProduct<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdateProduct(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdateProduct _instance;

  final TRes Function(Variables$Mutation$UpdateProduct) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$UpdateProduct._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$ProductUpdateInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdateProduct<TRes>
    implements CopyWith$Variables$Mutation$UpdateProduct<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdateProduct(this._res);

  TRes _res;

  call({Input$ProductUpdateInput? input}) => _res;
}

class Mutation$UpdateProduct {
  Mutation$UpdateProduct({
    this.productUpdate,
    this.$__typename = 'Mutation',
  });

  factory Mutation$UpdateProduct.fromJson(Map<String, dynamic> json) {
    final l$productUpdate = json['productUpdate'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateProduct(
      productUpdate: l$productUpdate == null
          ? null
          : Mutation$UpdateProduct$productUpdate.fromJson(
              (l$productUpdate as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateProduct$productUpdate? productUpdate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$productUpdate = productUpdate;
    _resultData['productUpdate'] = l$productUpdate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$productUpdate = productUpdate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$productUpdate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateProduct || runtimeType != other.runtimeType) {
      return false;
    }
    final l$productUpdate = productUpdate;
    final lOther$productUpdate = other.productUpdate;
    if (l$productUpdate != lOther$productUpdate) {
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

extension UtilityExtension$Mutation$UpdateProduct on Mutation$UpdateProduct {
  CopyWith$Mutation$UpdateProduct<Mutation$UpdateProduct> get copyWith =>
      CopyWith$Mutation$UpdateProduct(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$UpdateProduct<TRes> {
  factory CopyWith$Mutation$UpdateProduct(
    Mutation$UpdateProduct instance,
    TRes Function(Mutation$UpdateProduct) then,
  ) = _CopyWithImpl$Mutation$UpdateProduct;

  factory CopyWith$Mutation$UpdateProduct.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateProduct;

  TRes call({
    Mutation$UpdateProduct$productUpdate? productUpdate,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateProduct$productUpdate<TRes> get productUpdate;
}

class _CopyWithImpl$Mutation$UpdateProduct<TRes>
    implements CopyWith$Mutation$UpdateProduct<TRes> {
  _CopyWithImpl$Mutation$UpdateProduct(
    this._instance,
    this._then,
  );

  final Mutation$UpdateProduct _instance;

  final TRes Function(Mutation$UpdateProduct) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? productUpdate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateProduct(
        productUpdate: productUpdate == _undefined
            ? _instance.productUpdate
            : (productUpdate as Mutation$UpdateProduct$productUpdate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateProduct$productUpdate<TRes> get productUpdate {
    final local$productUpdate = _instance.productUpdate;
    return local$productUpdate == null
        ? CopyWith$Mutation$UpdateProduct$productUpdate.stub(_then(_instance))
        : CopyWith$Mutation$UpdateProduct$productUpdate(
            local$productUpdate, (e) => call(productUpdate: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdateProduct<TRes>
    implements CopyWith$Mutation$UpdateProduct<TRes> {
  _CopyWithStubImpl$Mutation$UpdateProduct(this._res);

  TRes _res;

  call({
    Mutation$UpdateProduct$productUpdate? productUpdate,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateProduct$productUpdate<TRes> get productUpdate =>
      CopyWith$Mutation$UpdateProduct$productUpdate.stub(_res);
}

const documentNodeMutationUpdateProduct = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateProduct'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ProductUpdateInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'productUpdate'),
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

class Mutation$UpdateProduct$productUpdate {
  Mutation$UpdateProduct$productUpdate({
    this.product,
    required this.userErrors,
    this.$__typename = 'ProductUpdatePayload',
  });

  factory Mutation$UpdateProduct$productUpdate.fromJson(
      Map<String, dynamic> json) {
    final l$product = json['product'];
    final l$userErrors = json['userErrors'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateProduct$productUpdate(
      product: l$product == null
          ? null
          : Mutation$UpdateProduct$productUpdate$product.fromJson(
              (l$product as Map<String, dynamic>)),
      userErrors: (l$userErrors as List<dynamic>)
          .map((e) => Mutation$UpdateProduct$productUpdate$userErrors.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdateProduct$productUpdate$product? product;

  final List<Mutation$UpdateProduct$productUpdate$userErrors> userErrors;

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
    if (other is! Mutation$UpdateProduct$productUpdate ||
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

extension UtilityExtension$Mutation$UpdateProduct$productUpdate
    on Mutation$UpdateProduct$productUpdate {
  CopyWith$Mutation$UpdateProduct$productUpdate<
          Mutation$UpdateProduct$productUpdate>
      get copyWith => CopyWith$Mutation$UpdateProduct$productUpdate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateProduct$productUpdate<TRes> {
  factory CopyWith$Mutation$UpdateProduct$productUpdate(
    Mutation$UpdateProduct$productUpdate instance,
    TRes Function(Mutation$UpdateProduct$productUpdate) then,
  ) = _CopyWithImpl$Mutation$UpdateProduct$productUpdate;

  factory CopyWith$Mutation$UpdateProduct$productUpdate.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate;

  TRes call({
    Mutation$UpdateProduct$productUpdate$product? product,
    List<Mutation$UpdateProduct$productUpdate$userErrors>? userErrors,
    String? $__typename,
  });
  CopyWith$Mutation$UpdateProduct$productUpdate$product<TRes> get product;
  TRes userErrors(
      Iterable<Mutation$UpdateProduct$productUpdate$userErrors> Function(
              Iterable<
                  CopyWith$Mutation$UpdateProduct$productUpdate$userErrors<
                      Mutation$UpdateProduct$productUpdate$userErrors>>)
          _fn);
}

class _CopyWithImpl$Mutation$UpdateProduct$productUpdate<TRes>
    implements CopyWith$Mutation$UpdateProduct$productUpdate<TRes> {
  _CopyWithImpl$Mutation$UpdateProduct$productUpdate(
    this._instance,
    this._then,
  );

  final Mutation$UpdateProduct$productUpdate _instance;

  final TRes Function(Mutation$UpdateProduct$productUpdate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? product = _undefined,
    Object? userErrors = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateProduct$productUpdate(
        product: product == _undefined
            ? _instance.product
            : (product as Mutation$UpdateProduct$productUpdate$product?),
        userErrors: userErrors == _undefined || userErrors == null
            ? _instance.userErrors
            : (userErrors
                as List<Mutation$UpdateProduct$productUpdate$userErrors>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$UpdateProduct$productUpdate$product<TRes> get product {
    final local$product = _instance.product;
    return local$product == null
        ? CopyWith$Mutation$UpdateProduct$productUpdate$product.stub(
            _then(_instance))
        : CopyWith$Mutation$UpdateProduct$productUpdate$product(
            local$product, (e) => call(product: e));
  }

  TRes userErrors(
          Iterable<Mutation$UpdateProduct$productUpdate$userErrors> Function(
                  Iterable<
                      CopyWith$Mutation$UpdateProduct$productUpdate$userErrors<
                          Mutation$UpdateProduct$productUpdate$userErrors>>)
              _fn) =>
      call(
          userErrors: _fn(_instance.userErrors.map(
              (e) => CopyWith$Mutation$UpdateProduct$productUpdate$userErrors(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate<TRes>
    implements CopyWith$Mutation$UpdateProduct$productUpdate<TRes> {
  _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate(this._res);

  TRes _res;

  call({
    Mutation$UpdateProduct$productUpdate$product? product,
    List<Mutation$UpdateProduct$productUpdate$userErrors>? userErrors,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$UpdateProduct$productUpdate$product<TRes> get product =>
      CopyWith$Mutation$UpdateProduct$productUpdate$product.stub(_res);

  userErrors(_fn) => _res;
}

class Mutation$UpdateProduct$productUpdate$product {
  Mutation$UpdateProduct$productUpdate$product({
    required this.id,
    required this.title,
    this.description,
    required this.handle,
    required this.status,
    this.vendor,
    this.productType,
    required this.tags,
    required this.updatedAt,
    this.$__typename = 'Product',
  });

  factory Mutation$UpdateProduct$productUpdate$product.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$description = json['description'];
    final l$handle = json['handle'];
    final l$status = json['status'];
    final l$vendor = json['vendor'];
    final l$productType = json['productType'];
    final l$tags = json['tags'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateProduct$productUpdate$product(
      id: (l$id as String),
      title: (l$title as String),
      description: (l$description as String?),
      handle: (l$handle as String),
      status: fromJson$Enum$ProductStatus((l$status as String)),
      vendor: (l$vendor as String?),
      productType: (l$productType as String?),
      tags: (l$tags as List<dynamic>).map((e) => (e as String)).toList(),
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
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$UpdateProduct$productUpdate$product ||
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

extension UtilityExtension$Mutation$UpdateProduct$productUpdate$product
    on Mutation$UpdateProduct$productUpdate$product {
  CopyWith$Mutation$UpdateProduct$productUpdate$product<
          Mutation$UpdateProduct$productUpdate$product>
      get copyWith => CopyWith$Mutation$UpdateProduct$productUpdate$product(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateProduct$productUpdate$product<TRes> {
  factory CopyWith$Mutation$UpdateProduct$productUpdate$product(
    Mutation$UpdateProduct$productUpdate$product instance,
    TRes Function(Mutation$UpdateProduct$productUpdate$product) then,
  ) = _CopyWithImpl$Mutation$UpdateProduct$productUpdate$product;

  factory CopyWith$Mutation$UpdateProduct$productUpdate$product.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate$product;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? handle,
    Enum$ProductStatus? status,
    String? vendor,
    String? productType,
    List<String>? tags,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateProduct$productUpdate$product<TRes>
    implements CopyWith$Mutation$UpdateProduct$productUpdate$product<TRes> {
  _CopyWithImpl$Mutation$UpdateProduct$productUpdate$product(
    this._instance,
    this._then,
  );

  final Mutation$UpdateProduct$productUpdate$product _instance;

  final TRes Function(Mutation$UpdateProduct$productUpdate$product) _then;

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
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateProduct$productUpdate$product(
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
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate$product<TRes>
    implements CopyWith$Mutation$UpdateProduct$productUpdate$product<TRes> {
  _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate$product(this._res);

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
    String? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$UpdateProduct$productUpdate$userErrors {
  Mutation$UpdateProduct$productUpdate$userErrors({
    this.field,
    required this.message,
    this.$__typename = 'UserError',
  });

  factory Mutation$UpdateProduct$productUpdate$userErrors.fromJson(
      Map<String, dynamic> json) {
    final l$field = json['field'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdateProduct$productUpdate$userErrors(
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
    if (other is! Mutation$UpdateProduct$productUpdate$userErrors ||
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

extension UtilityExtension$Mutation$UpdateProduct$productUpdate$userErrors
    on Mutation$UpdateProduct$productUpdate$userErrors {
  CopyWith$Mutation$UpdateProduct$productUpdate$userErrors<
          Mutation$UpdateProduct$productUpdate$userErrors>
      get copyWith => CopyWith$Mutation$UpdateProduct$productUpdate$userErrors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdateProduct$productUpdate$userErrors<TRes> {
  factory CopyWith$Mutation$UpdateProduct$productUpdate$userErrors(
    Mutation$UpdateProduct$productUpdate$userErrors instance,
    TRes Function(Mutation$UpdateProduct$productUpdate$userErrors) then,
  ) = _CopyWithImpl$Mutation$UpdateProduct$productUpdate$userErrors;

  factory CopyWith$Mutation$UpdateProduct$productUpdate$userErrors.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate$userErrors;

  TRes call({
    List<String>? field,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdateProduct$productUpdate$userErrors<TRes>
    implements CopyWith$Mutation$UpdateProduct$productUpdate$userErrors<TRes> {
  _CopyWithImpl$Mutation$UpdateProduct$productUpdate$userErrors(
    this._instance,
    this._then,
  );

  final Mutation$UpdateProduct$productUpdate$userErrors _instance;

  final TRes Function(Mutation$UpdateProduct$productUpdate$userErrors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? field = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdateProduct$productUpdate$userErrors(
        field: field == _undefined ? _instance.field : (field as List<String>?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate$userErrors<TRes>
    implements CopyWith$Mutation$UpdateProduct$productUpdate$userErrors<TRes> {
  _CopyWithStubImpl$Mutation$UpdateProduct$productUpdate$userErrors(this._res);

  TRes _res;

  call({
    List<String>? field,
    String? message,
    String? $__typename,
  }) =>
      _res;
}
