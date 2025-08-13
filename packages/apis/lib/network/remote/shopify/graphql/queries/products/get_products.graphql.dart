import '../../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Query$GetProducts {
  factory Variables$Query$GetProducts({
    required int first,
    String? after,
    String? query,
  }) =>
      Variables$Query$GetProducts._({
        r'first': first,
        if (after != null) r'after': after,
        if (query != null) r'query': query,
      });

  Variables$Query$GetProducts._(this._$data);

  factory Variables$Query$GetProducts.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$first = data['first'];
    result$data['first'] = (l$first as int);
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('query')) {
      final l$query = data['query'];
      result$data['query'] = (l$query as String?);
    }
    return Variables$Query$GetProducts._(result$data);
  }

  Map<String, dynamic> _$data;

  int get first => (_$data['first'] as int);

  String? get after => (_$data['after'] as String?);

  String? get query => (_$data['query'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$first = first;
    result$data['first'] = l$first;
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after;
    }
    if (_$data.containsKey('query')) {
      final l$query = query;
      result$data['query'] = l$query;
    }
    return result$data;
  }

  CopyWith$Variables$Query$GetProducts<Variables$Query$GetProducts>
      get copyWith => CopyWith$Variables$Query$GetProducts(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetProducts ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (l$first != lOther$first) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    final l$query = query;
    final lOther$query = other.query;
    if (_$data.containsKey('query') != other._$data.containsKey('query')) {
      return false;
    }
    if (l$query != lOther$query) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$first = first;
    final l$after = after;
    final l$query = query;
    return Object.hashAll([
      l$first,
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('query') ? l$query : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetProducts<TRes> {
  factory CopyWith$Variables$Query$GetProducts(
    Variables$Query$GetProducts instance,
    TRes Function(Variables$Query$GetProducts) then,
  ) = _CopyWithImpl$Variables$Query$GetProducts;

  factory CopyWith$Variables$Query$GetProducts.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetProducts;

  TRes call({
    int? first,
    String? after,
    String? query,
  });
}

class _CopyWithImpl$Variables$Query$GetProducts<TRes>
    implements CopyWith$Variables$Query$GetProducts<TRes> {
  _CopyWithImpl$Variables$Query$GetProducts(
    this._instance,
    this._then,
  );

  final Variables$Query$GetProducts _instance;

  final TRes Function(Variables$Query$GetProducts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? query = _undefined,
  }) =>
      _then(Variables$Query$GetProducts._({
        ..._instance._$data,
        if (first != _undefined && first != null) 'first': (first as int),
        if (after != _undefined) 'after': (after as String?),
        if (query != _undefined) 'query': (query as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetProducts<TRes>
    implements CopyWith$Variables$Query$GetProducts<TRes> {
  _CopyWithStubImpl$Variables$Query$GetProducts(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    String? query,
  }) =>
      _res;
}

class Query$GetProducts {
  Query$GetProducts({
    this.products,
    this.$__typename = 'Query',
  });

  factory Query$GetProducts.fromJson(Map<String, dynamic> json) {
    final l$products = json['products'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts(
      products: l$products == null
          ? null
          : Query$GetProducts$products.fromJson(
              (l$products as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProducts$products? products;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$products = products;
    _resultData['products'] = l$products?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$products = products;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$products,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProducts || runtimeType != other.runtimeType) {
      return false;
    }
    final l$products = products;
    final lOther$products = other.products;
    if (l$products != lOther$products) {
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

extension UtilityExtension$Query$GetProducts on Query$GetProducts {
  CopyWith$Query$GetProducts<Query$GetProducts> get copyWith =>
      CopyWith$Query$GetProducts(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetProducts<TRes> {
  factory CopyWith$Query$GetProducts(
    Query$GetProducts instance,
    TRes Function(Query$GetProducts) then,
  ) = _CopyWithImpl$Query$GetProducts;

  factory CopyWith$Query$GetProducts.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProducts;

  TRes call({
    Query$GetProducts$products? products,
    String? $__typename,
  });
  CopyWith$Query$GetProducts$products<TRes> get products;
}

class _CopyWithImpl$Query$GetProducts<TRes>
    implements CopyWith$Query$GetProducts<TRes> {
  _CopyWithImpl$Query$GetProducts(
    this._instance,
    this._then,
  );

  final Query$GetProducts _instance;

  final TRes Function(Query$GetProducts) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? products = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts(
        products: products == _undefined
            ? _instance.products
            : (products as Query$GetProducts$products?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProducts$products<TRes> get products {
    final local$products = _instance.products;
    return local$products == null
        ? CopyWith$Query$GetProducts$products.stub(_then(_instance))
        : CopyWith$Query$GetProducts$products(
            local$products, (e) => call(products: e));
  }
}

class _CopyWithStubImpl$Query$GetProducts<TRes>
    implements CopyWith$Query$GetProducts<TRes> {
  _CopyWithStubImpl$Query$GetProducts(this._res);

  TRes _res;

  call({
    Query$GetProducts$products? products,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProducts$products<TRes> get products =>
      CopyWith$Query$GetProducts$products.stub(_res);
}

const documentNodeQueryGetProducts = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetProducts'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'query')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'products'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: VariableNode(name: NameNode(value: 'first')),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
          ArgumentNode(
            name: NameNode(value: 'query'),
            value: VariableNode(name: NameNode(value: 'query')),
          ),
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
                        value: IntValueNode(value: '10'),
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
                        value: IntValueNode(value: '5'),
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
                name: NameNode(value: 'cursor'),
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
            name: NameNode(value: 'pageInfo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'hasNextPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'hasPreviousPage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'startCursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'endCursor'),
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

class Query$GetProducts$products {
  Query$GetProducts$products({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'ProductConnection',
  });

  factory Query$GetProducts$products.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$GetProducts$products$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$GetProducts$products$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetProducts$products$edges> edges;

  final Query$GetProducts$products$pageInfo pageInfo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e.toJson()).toList();
    final l$pageInfo = pageInfo;
    _resultData['pageInfo'] = l$pageInfo.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$pageInfo = pageInfo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$pageInfo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProducts$products ||
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
    final l$pageInfo = pageInfo;
    final lOther$pageInfo = other.pageInfo;
    if (l$pageInfo != lOther$pageInfo) {
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

extension UtilityExtension$Query$GetProducts$products
    on Query$GetProducts$products {
  CopyWith$Query$GetProducts$products<Query$GetProducts$products>
      get copyWith => CopyWith$Query$GetProducts$products(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products<TRes> {
  factory CopyWith$Query$GetProducts$products(
    Query$GetProducts$products instance,
    TRes Function(Query$GetProducts$products) then,
  ) = _CopyWithImpl$Query$GetProducts$products;

  factory CopyWith$Query$GetProducts$products.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products;

  TRes call({
    List<Query$GetProducts$products$edges>? edges,
    Query$GetProducts$products$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetProducts$products$edges> Function(
              Iterable<
                  CopyWith$Query$GetProducts$products$edges<
                      Query$GetProducts$products$edges>>)
          _fn);
  CopyWith$Query$GetProducts$products$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetProducts$products<TRes>
    implements CopyWith$Query$GetProducts$products<TRes> {
  _CopyWithImpl$Query$GetProducts$products(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products _instance;

  final TRes Function(Query$GetProducts$products) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$GetProducts$products$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$GetProducts$products$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetProducts$products$edges> Function(
                  Iterable<
                      CopyWith$Query$GetProducts$products$edges<
                          Query$GetProducts$products$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$GetProducts$products$edges(
                    e,
                    (i) => i,
                  ))).toList());

  CopyWith$Query$GetProducts$products$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetProducts$products$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$GetProducts$products<TRes>
    implements CopyWith$Query$GetProducts$products<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products(this._res);

  TRes _res;

  call({
    List<Query$GetProducts$products$edges>? edges,
    Query$GetProducts$products$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$GetProducts$products$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetProducts$products$pageInfo.stub(_res);
}

class Query$GetProducts$products$edges {
  Query$GetProducts$products$edges({
    required this.node,
    required this.cursor,
    this.$__typename = 'ProductEdge',
  });

  factory Query$GetProducts$products$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$cursor = json['cursor'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges(
      node: Query$GetProducts$products$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      cursor: (l$cursor as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProducts$products$edges$node node;

  final String cursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node.toJson();
    final l$cursor = cursor;
    _resultData['cursor'] = l$cursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$cursor = cursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$cursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProducts$products$edges ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$cursor = cursor;
    final lOther$cursor = other.cursor;
    if (l$cursor != lOther$cursor) {
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

extension UtilityExtension$Query$GetProducts$products$edges
    on Query$GetProducts$products$edges {
  CopyWith$Query$GetProducts$products$edges<Query$GetProducts$products$edges>
      get copyWith => CopyWith$Query$GetProducts$products$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges<TRes> {
  factory CopyWith$Query$GetProducts$products$edges(
    Query$GetProducts$products$edges instance,
    TRes Function(Query$GetProducts$products$edges) then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges;

  factory CopyWith$Query$GetProducts$products$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges;

  TRes call({
    Query$GetProducts$products$edges$node? node,
    String? cursor,
    String? $__typename,
  });
  CopyWith$Query$GetProducts$products$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetProducts$products$edges<TRes>
    implements CopyWith$Query$GetProducts$products$edges<TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges _instance;

  final TRes Function(Query$GetProducts$products$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? cursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetProducts$products$edges$node),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProducts$products$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetProducts$products$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetProducts$products$edges<TRes>
    implements CopyWith$Query$GetProducts$products$edges<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges(this._res);

  TRes _res;

  call({
    Query$GetProducts$products$edges$node? node,
    String? cursor,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProducts$products$edges$node<TRes> get node =>
      CopyWith$Query$GetProducts$products$edges$node.stub(_res);
}

class Query$GetProducts$products$edges$node {
  Query$GetProducts$products$edges$node({
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

  factory Query$GetProducts$products$edges$node.fromJson(
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
    final l$variants = json['variants'];
    final l$images = json['images'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges$node(
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
      variants: Query$GetProducts$products$edges$node$variants.fromJson(
          (l$variants as Map<String, dynamic>)),
      images: Query$GetProducts$products$edges$node$images.fromJson(
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

  final Query$GetProducts$products$edges$node$variants variants;

  final Query$GetProducts$products$edges$node$images images;

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
    if (other is! Query$GetProducts$products$edges$node ||
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

extension UtilityExtension$Query$GetProducts$products$edges$node
    on Query$GetProducts$products$edges$node {
  CopyWith$Query$GetProducts$products$edges$node<
          Query$GetProducts$products$edges$node>
      get copyWith => CopyWith$Query$GetProducts$products$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges$node<TRes> {
  factory CopyWith$Query$GetProducts$products$edges$node(
    Query$GetProducts$products$edges$node instance,
    TRes Function(Query$GetProducts$products$edges$node) then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges$node;

  factory CopyWith$Query$GetProducts$products$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges$node;

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
    Query$GetProducts$products$edges$node$variants? variants,
    Query$GetProducts$products$edges$node$images? images,
    String? $__typename,
  });
  CopyWith$Query$GetProducts$products$edges$node$variants<TRes> get variants;
  CopyWith$Query$GetProducts$products$edges$node$images<TRes> get images;
}

class _CopyWithImpl$Query$GetProducts$products$edges$node<TRes>
    implements CopyWith$Query$GetProducts$products$edges$node<TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges$node _instance;

  final TRes Function(Query$GetProducts$products$edges$node) _then;

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
      _then(Query$GetProducts$products$edges$node(
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
            : (variants as Query$GetProducts$products$edges$node$variants),
        images: images == _undefined || images == null
            ? _instance.images
            : (images as Query$GetProducts$products$edges$node$images),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProducts$products$edges$node$variants<TRes> get variants {
    final local$variants = _instance.variants;
    return CopyWith$Query$GetProducts$products$edges$node$variants(
        local$variants, (e) => call(variants: e));
  }

  CopyWith$Query$GetProducts$products$edges$node$images<TRes> get images {
    final local$images = _instance.images;
    return CopyWith$Query$GetProducts$products$edges$node$images(
        local$images, (e) => call(images: e));
  }
}

class _CopyWithStubImpl$Query$GetProducts$products$edges$node<TRes>
    implements CopyWith$Query$GetProducts$products$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges$node(this._res);

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
    Query$GetProducts$products$edges$node$variants? variants,
    Query$GetProducts$products$edges$node$images? images,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProducts$products$edges$node$variants<TRes> get variants =>
      CopyWith$Query$GetProducts$products$edges$node$variants.stub(_res);

  CopyWith$Query$GetProducts$products$edges$node$images<TRes> get images =>
      CopyWith$Query$GetProducts$products$edges$node$images.stub(_res);
}

class Query$GetProducts$products$edges$node$variants {
  Query$GetProducts$products$edges$node$variants({
    required this.edges,
    this.$__typename = 'ProductVariantConnection',
  });

  factory Query$GetProducts$products$edges$node$variants.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges$node$variants(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$GetProducts$products$edges$node$variants$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetProducts$products$edges$node$variants$edges> edges;

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
    if (other is! Query$GetProducts$products$edges$node$variants ||
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

extension UtilityExtension$Query$GetProducts$products$edges$node$variants
    on Query$GetProducts$products$edges$node$variants {
  CopyWith$Query$GetProducts$products$edges$node$variants<
          Query$GetProducts$products$edges$node$variants>
      get copyWith => CopyWith$Query$GetProducts$products$edges$node$variants(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges$node$variants<TRes> {
  factory CopyWith$Query$GetProducts$products$edges$node$variants(
    Query$GetProducts$products$edges$node$variants instance,
    TRes Function(Query$GetProducts$products$edges$node$variants) then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges$node$variants;

  factory CopyWith$Query$GetProducts$products$edges$node$variants.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants;

  TRes call({
    List<Query$GetProducts$products$edges$node$variants$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetProducts$products$edges$node$variants$edges> Function(
              Iterable<
                  CopyWith$Query$GetProducts$products$edges$node$variants$edges<
                      Query$GetProducts$products$edges$node$variants$edges>>)
          _fn);
}

class _CopyWithImpl$Query$GetProducts$products$edges$node$variants<TRes>
    implements CopyWith$Query$GetProducts$products$edges$node$variants<TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges$node$variants(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges$node$variants _instance;

  final TRes Function(Query$GetProducts$products$edges$node$variants) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$edges$node$variants(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges
                as List<Query$GetProducts$products$edges$node$variants$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetProducts$products$edges$node$variants$edges> Function(
                  Iterable<
                      CopyWith$Query$GetProducts$products$edges$node$variants$edges<
                          Query$GetProducts$products$edges$node$variants$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$GetProducts$products$edges$node$variants$edges(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants<TRes>
    implements CopyWith$Query$GetProducts$products$edges$node$variants<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants(this._res);

  TRes _res;

  call({
    List<Query$GetProducts$products$edges$node$variants$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetProducts$products$edges$node$variants$edges {
  Query$GetProducts$products$edges$node$variants$edges({
    required this.node,
    this.$__typename = 'ProductVariantEdge',
  });

  factory Query$GetProducts$products$edges$node$variants$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges$node$variants$edges(
      node: Query$GetProducts$products$edges$node$variants$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProducts$products$edges$node$variants$edges$node node;

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
    if (other is! Query$GetProducts$products$edges$node$variants$edges ||
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

extension UtilityExtension$Query$GetProducts$products$edges$node$variants$edges
    on Query$GetProducts$products$edges$node$variants$edges {
  CopyWith$Query$GetProducts$products$edges$node$variants$edges<
          Query$GetProducts$products$edges$node$variants$edges>
      get copyWith =>
          CopyWith$Query$GetProducts$products$edges$node$variants$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges$node$variants$edges<
    TRes> {
  factory CopyWith$Query$GetProducts$products$edges$node$variants$edges(
    Query$GetProducts$products$edges$node$variants$edges instance,
    TRes Function(Query$GetProducts$products$edges$node$variants$edges) then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges$node$variants$edges;

  factory CopyWith$Query$GetProducts$products$edges$node$variants$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants$edges;

  TRes call({
    Query$GetProducts$products$edges$node$variants$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetProducts$products$edges$node$variants$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$GetProducts$products$edges$node$variants$edges<TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$variants$edges<TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges$node$variants$edges(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges$node$variants$edges _instance;

  final TRes Function(Query$GetProducts$products$edges$node$variants$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$edges$node$variants$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node
                as Query$GetProducts$products$edges$node$variants$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProducts$products$edges$node$variants$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetProducts$products$edges$node$variants$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants$edges<
        TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$variants$edges<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants$edges(
      this._res);

  TRes _res;

  call({
    Query$GetProducts$products$edges$node$variants$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProducts$products$edges$node$variants$edges$node<TRes>
      get node =>
          CopyWith$Query$GetProducts$products$edges$node$variants$edges$node
              .stub(_res);
}

class Query$GetProducts$products$edges$node$variants$edges$node {
  Query$GetProducts$products$edges$node$variants$edges$node({
    required this.id,
    required this.title,
    required this.price,
    this.sku,
    this.inventoryQuantity,
    this.$__typename = 'ProductVariant',
  });

  factory Query$GetProducts$products$edges$node$variants$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$price = json['price'];
    final l$sku = json['sku'];
    final l$inventoryQuantity = json['inventoryQuantity'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges$node$variants$edges$node(
      id: (l$id as String),
      title: (l$title as String),
      price: (l$price as String),
      sku: (l$sku as String?),
      inventoryQuantity: (l$inventoryQuantity as int?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String price;

  final String? sku;

  final int? inventoryQuantity;

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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$price,
      l$sku,
      l$inventoryQuantity,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProducts$products$edges$node$variants$edges$node ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetProducts$products$edges$node$variants$edges$node
    on Query$GetProducts$products$edges$node$variants$edges$node {
  CopyWith$Query$GetProducts$products$edges$node$variants$edges$node<
          Query$GetProducts$products$edges$node$variants$edges$node>
      get copyWith =>
          CopyWith$Query$GetProducts$products$edges$node$variants$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges$node$variants$edges$node<
    TRes> {
  factory CopyWith$Query$GetProducts$products$edges$node$variants$edges$node(
    Query$GetProducts$products$edges$node$variants$edges$node instance,
    TRes Function(Query$GetProducts$products$edges$node$variants$edges$node)
        then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges$node$variants$edges$node;

  factory CopyWith$Query$GetProducts$products$edges$node$variants$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants$edges$node;

  TRes call({
    String? id,
    String? title,
    String? price,
    String? sku,
    int? inventoryQuantity,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetProducts$products$edges$node$variants$edges$node<
        TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$variants$edges$node<
            TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges$node$variants$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges$node$variants$edges$node _instance;

  final TRes Function(Query$GetProducts$products$edges$node$variants$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? price = _undefined,
    Object? sku = _undefined,
    Object? inventoryQuantity = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$edges$node$variants$edges$node(
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants$edges$node<
        TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$variants$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges$node$variants$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? price,
    String? sku,
    int? inventoryQuantity,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetProducts$products$edges$node$images {
  Query$GetProducts$products$edges$node$images({
    required this.edges,
    this.$__typename = 'ImageConnection',
  });

  factory Query$GetProducts$products$edges$node$images.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges$node$images(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$GetProducts$products$edges$node$images$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetProducts$products$edges$node$images$edges> edges;

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
    if (other is! Query$GetProducts$products$edges$node$images ||
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

extension UtilityExtension$Query$GetProducts$products$edges$node$images
    on Query$GetProducts$products$edges$node$images {
  CopyWith$Query$GetProducts$products$edges$node$images<
          Query$GetProducts$products$edges$node$images>
      get copyWith => CopyWith$Query$GetProducts$products$edges$node$images(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges$node$images<TRes> {
  factory CopyWith$Query$GetProducts$products$edges$node$images(
    Query$GetProducts$products$edges$node$images instance,
    TRes Function(Query$GetProducts$products$edges$node$images) then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges$node$images;

  factory CopyWith$Query$GetProducts$products$edges$node$images.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges$node$images;

  TRes call({
    List<Query$GetProducts$products$edges$node$images$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetProducts$products$edges$node$images$edges> Function(
              Iterable<
                  CopyWith$Query$GetProducts$products$edges$node$images$edges<
                      Query$GetProducts$products$edges$node$images$edges>>)
          _fn);
}

class _CopyWithImpl$Query$GetProducts$products$edges$node$images<TRes>
    implements CopyWith$Query$GetProducts$products$edges$node$images<TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges$node$images(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges$node$images _instance;

  final TRes Function(Query$GetProducts$products$edges$node$images) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$edges$node$images(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges
                as List<Query$GetProducts$products$edges$node$images$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetProducts$products$edges$node$images$edges> Function(
                  Iterable<
                      CopyWith$Query$GetProducts$products$edges$node$images$edges<
                          Query$GetProducts$products$edges$node$images$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$GetProducts$products$edges$node$images$edges(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetProducts$products$edges$node$images<TRes>
    implements CopyWith$Query$GetProducts$products$edges$node$images<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges$node$images(this._res);

  TRes _res;

  call({
    List<Query$GetProducts$products$edges$node$images$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetProducts$products$edges$node$images$edges {
  Query$GetProducts$products$edges$node$images$edges({
    required this.node,
    this.$__typename = 'ImageEdge',
  });

  factory Query$GetProducts$products$edges$node$images$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges$node$images$edges(
      node: Query$GetProducts$products$edges$node$images$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetProducts$products$edges$node$images$edges$node node;

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
    if (other is! Query$GetProducts$products$edges$node$images$edges ||
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

extension UtilityExtension$Query$GetProducts$products$edges$node$images$edges
    on Query$GetProducts$products$edges$node$images$edges {
  CopyWith$Query$GetProducts$products$edges$node$images$edges<
          Query$GetProducts$products$edges$node$images$edges>
      get copyWith =>
          CopyWith$Query$GetProducts$products$edges$node$images$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges$node$images$edges<
    TRes> {
  factory CopyWith$Query$GetProducts$products$edges$node$images$edges(
    Query$GetProducts$products$edges$node$images$edges instance,
    TRes Function(Query$GetProducts$products$edges$node$images$edges) then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges$node$images$edges;

  factory CopyWith$Query$GetProducts$products$edges$node$images$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges$node$images$edges;

  TRes call({
    Query$GetProducts$products$edges$node$images$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetProducts$products$edges$node$images$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$GetProducts$products$edges$node$images$edges<TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$images$edges<TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges$node$images$edges(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges$node$images$edges _instance;

  final TRes Function(Query$GetProducts$products$edges$node$images$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$edges$node$images$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetProducts$products$edges$node$images$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetProducts$products$edges$node$images$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetProducts$products$edges$node$images$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetProducts$products$edges$node$images$edges<TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$images$edges<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges$node$images$edges(
      this._res);

  TRes _res;

  call({
    Query$GetProducts$products$edges$node$images$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetProducts$products$edges$node$images$edges$node<TRes>
      get node =>
          CopyWith$Query$GetProducts$products$edges$node$images$edges$node.stub(
              _res);
}

class Query$GetProducts$products$edges$node$images$edges$node {
  Query$GetProducts$products$edges$node$images$edges$node({
    required this.id,
    required this.url,
    this.altText,
    this.width,
    this.height,
    this.$__typename = 'Image',
  });

  factory Query$GetProducts$products$edges$node$images$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$url = json['url'];
    final l$altText = json['altText'];
    final l$width = json['width'];
    final l$height = json['height'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$edges$node$images$edges$node(
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
    if (other is! Query$GetProducts$products$edges$node$images$edges$node ||
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

extension UtilityExtension$Query$GetProducts$products$edges$node$images$edges$node
    on Query$GetProducts$products$edges$node$images$edges$node {
  CopyWith$Query$GetProducts$products$edges$node$images$edges$node<
          Query$GetProducts$products$edges$node$images$edges$node>
      get copyWith =>
          CopyWith$Query$GetProducts$products$edges$node$images$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$edges$node$images$edges$node<
    TRes> {
  factory CopyWith$Query$GetProducts$products$edges$node$images$edges$node(
    Query$GetProducts$products$edges$node$images$edges$node instance,
    TRes Function(Query$GetProducts$products$edges$node$images$edges$node) then,
  ) = _CopyWithImpl$Query$GetProducts$products$edges$node$images$edges$node;

  factory CopyWith$Query$GetProducts$products$edges$node$images$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$edges$node$images$edges$node;

  TRes call({
    String? id,
    String? url,
    String? altText,
    int? width,
    int? height,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetProducts$products$edges$node$images$edges$node<
        TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$images$edges$node<TRes> {
  _CopyWithImpl$Query$GetProducts$products$edges$node$images$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$edges$node$images$edges$node _instance;

  final TRes Function(Query$GetProducts$products$edges$node$images$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? url = _undefined,
    Object? altText = _undefined,
    Object? width = _undefined,
    Object? height = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$edges$node$images$edges$node(
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

class _CopyWithStubImpl$Query$GetProducts$products$edges$node$images$edges$node<
        TRes>
    implements
        CopyWith$Query$GetProducts$products$edges$node$images$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$edges$node$images$edges$node(
      this._res);

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

class Query$GetProducts$products$pageInfo {
  Query$GetProducts$products$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetProducts$products$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetProducts$products$pageInfo(
      hasNextPage: (l$hasNextPage as bool),
      hasPreviousPage: (l$hasPreviousPage as bool),
      startCursor: (l$startCursor as String?),
      endCursor: (l$endCursor as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final bool hasNextPage;

  final bool hasPreviousPage;

  final String? startCursor;

  final String? endCursor;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$hasNextPage = hasNextPage;
    _resultData['hasNextPage'] = l$hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    _resultData['hasPreviousPage'] = l$hasPreviousPage;
    final l$startCursor = startCursor;
    _resultData['startCursor'] = l$startCursor;
    final l$endCursor = endCursor;
    _resultData['endCursor'] = l$endCursor;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$hasNextPage = hasNextPage;
    final l$hasPreviousPage = hasPreviousPage;
    final l$startCursor = startCursor;
    final l$endCursor = endCursor;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$hasNextPage,
      l$hasPreviousPage,
      l$startCursor,
      l$endCursor,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetProducts$products$pageInfo ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hasNextPage = hasNextPage;
    final lOther$hasNextPage = other.hasNextPage;
    if (l$hasNextPage != lOther$hasNextPage) {
      return false;
    }
    final l$hasPreviousPage = hasPreviousPage;
    final lOther$hasPreviousPage = other.hasPreviousPage;
    if (l$hasPreviousPage != lOther$hasPreviousPage) {
      return false;
    }
    final l$startCursor = startCursor;
    final lOther$startCursor = other.startCursor;
    if (l$startCursor != lOther$startCursor) {
      return false;
    }
    final l$endCursor = endCursor;
    final lOther$endCursor = other.endCursor;
    if (l$endCursor != lOther$endCursor) {
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

extension UtilityExtension$Query$GetProducts$products$pageInfo
    on Query$GetProducts$products$pageInfo {
  CopyWith$Query$GetProducts$products$pageInfo<
          Query$GetProducts$products$pageInfo>
      get copyWith => CopyWith$Query$GetProducts$products$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetProducts$products$pageInfo<TRes> {
  factory CopyWith$Query$GetProducts$products$pageInfo(
    Query$GetProducts$products$pageInfo instance,
    TRes Function(Query$GetProducts$products$pageInfo) then,
  ) = _CopyWithImpl$Query$GetProducts$products$pageInfo;

  factory CopyWith$Query$GetProducts$products$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetProducts$products$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetProducts$products$pageInfo<TRes>
    implements CopyWith$Query$GetProducts$products$pageInfo<TRes> {
  _CopyWithImpl$Query$GetProducts$products$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetProducts$products$pageInfo _instance;

  final TRes Function(Query$GetProducts$products$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetProducts$products$pageInfo(
        hasNextPage: hasNextPage == _undefined || hasNextPage == null
            ? _instance.hasNextPage
            : (hasNextPage as bool),
        hasPreviousPage:
            hasPreviousPage == _undefined || hasPreviousPage == null
                ? _instance.hasPreviousPage
                : (hasPreviousPage as bool),
        startCursor: startCursor == _undefined
            ? _instance.startCursor
            : (startCursor as String?),
        endCursor: endCursor == _undefined
            ? _instance.endCursor
            : (endCursor as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetProducts$products$pageInfo<TRes>
    implements CopyWith$Query$GetProducts$products$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetProducts$products$pageInfo(this._res);

  TRes _res;

  call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  }) =>
      _res;
}
