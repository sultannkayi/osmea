import 'package:gql/ast.dart';

class Variables$Query$GetOrders {
  factory Variables$Query$GetOrders({
    int? first,
    String? after,
    String? query,
  }) =>
      Variables$Query$GetOrders._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
        if (query != null) r'query': query,
      });

  Variables$Query$GetOrders._(this._$data);

  factory Variables$Query$GetOrders.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('first')) {
      final l$first = data['first'];
      result$data['first'] = (l$first as int?);
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] = (l$after as String?);
    }
    if (data.containsKey('query')) {
      final l$query = data['query'];
      result$data['query'] = (l$query as String?);
    }
    return Variables$Query$GetOrders._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get first => (_$data['first'] as int?);

  String? get after => (_$data['after'] as String?);

  String? get query => (_$data['query'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('first')) {
      final l$first = first;
      result$data['first'] = l$first;
    }
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

  CopyWith$Variables$Query$GetOrders<Variables$Query$GetOrders> get copyWith =>
      CopyWith$Variables$Query$GetOrders(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetOrders ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$first = first;
    final lOther$first = other.first;
    if (_$data.containsKey('first') != other._$data.containsKey('first')) {
      return false;
    }
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
      _$data.containsKey('first') ? l$first : const {},
      _$data.containsKey('after') ? l$after : const {},
      _$data.containsKey('query') ? l$query : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetOrders<TRes> {
  factory CopyWith$Variables$Query$GetOrders(
    Variables$Query$GetOrders instance,
    TRes Function(Variables$Query$GetOrders) then,
  ) = _CopyWithImpl$Variables$Query$GetOrders;

  factory CopyWith$Variables$Query$GetOrders.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetOrders;

  TRes call({
    int? first,
    String? after,
    String? query,
  });
}

class _CopyWithImpl$Variables$Query$GetOrders<TRes>
    implements CopyWith$Variables$Query$GetOrders<TRes> {
  _CopyWithImpl$Variables$Query$GetOrders(
    this._instance,
    this._then,
  );

  final Variables$Query$GetOrders _instance;

  final TRes Function(Variables$Query$GetOrders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? query = _undefined,
  }) =>
      _then(Variables$Query$GetOrders._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
        if (query != _undefined) 'query': (query as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetOrders<TRes>
    implements CopyWith$Variables$Query$GetOrders<TRes> {
  _CopyWithStubImpl$Variables$Query$GetOrders(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    String? query,
  }) =>
      _res;
}

class Query$GetOrders {
  Query$GetOrders({
    this.orders,
    this.$__typename = 'Query',
  });

  factory Query$GetOrders.fromJson(Map<String, dynamic> json) {
    final l$orders = json['orders'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders(
      orders: l$orders == null
          ? null
          : Query$GetOrders$orders.fromJson((l$orders as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrders$orders? orders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$orders = orders;
    _resultData['orders'] = l$orders?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$orders = orders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$orders,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrders || runtimeType != other.runtimeType) {
      return false;
    }
    final l$orders = orders;
    final lOther$orders = other.orders;
    if (l$orders != lOther$orders) {
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

extension UtilityExtension$Query$GetOrders on Query$GetOrders {
  CopyWith$Query$GetOrders<Query$GetOrders> get copyWith =>
      CopyWith$Query$GetOrders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetOrders<TRes> {
  factory CopyWith$Query$GetOrders(
    Query$GetOrders instance,
    TRes Function(Query$GetOrders) then,
  ) = _CopyWithImpl$Query$GetOrders;

  factory CopyWith$Query$GetOrders.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders;

  TRes call({
    Query$GetOrders$orders? orders,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders<TRes> get orders;
}

class _CopyWithImpl$Query$GetOrders<TRes>
    implements CopyWith$Query$GetOrders<TRes> {
  _CopyWithImpl$Query$GetOrders(
    this._instance,
    this._then,
  );

  final Query$GetOrders _instance;

  final TRes Function(Query$GetOrders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? orders = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders(
        orders: orders == _undefined
            ? _instance.orders
            : (orders as Query$GetOrders$orders?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetOrders$orders<TRes> get orders {
    final local$orders = _instance.orders;
    return local$orders == null
        ? CopyWith$Query$GetOrders$orders.stub(_then(_instance))
        : CopyWith$Query$GetOrders$orders(local$orders, (e) => call(orders: e));
  }
}

class _CopyWithStubImpl$Query$GetOrders<TRes>
    implements CopyWith$Query$GetOrders<TRes> {
  _CopyWithStubImpl$Query$GetOrders(this._res);

  TRes _res;

  call({
    Query$GetOrders$orders? orders,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetOrders$orders<TRes> get orders =>
      CopyWith$Query$GetOrders$orders.stub(_res);
}

const documentNodeQueryGetOrders = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetOrders'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'first')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: IntValueNode(value: '10')),
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
        name: NameNode(value: 'orders'),
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
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
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
                    name: NameNode(value: 'totalPrice'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'subtotalPrice'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'totalTax'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'lineItems'),
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
                                name: NameNode(value: 'title'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'quantity'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'variant'),
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
                                    name: NameNode(value: 'sku'),
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

class Query$GetOrders$orders {
  Query$GetOrders$orders({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'OrderConnection',
  });

  factory Query$GetOrders$orders.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$GetOrders$orders$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$GetOrders$orders$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetOrders$orders$edges> edges;

  final Query$GetOrders$orders$pageInfo pageInfo;

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
    if (other is! Query$GetOrders$orders || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetOrders$orders on Query$GetOrders$orders {
  CopyWith$Query$GetOrders$orders<Query$GetOrders$orders> get copyWith =>
      CopyWith$Query$GetOrders$orders(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetOrders$orders<TRes> {
  factory CopyWith$Query$GetOrders$orders(
    Query$GetOrders$orders instance,
    TRes Function(Query$GetOrders$orders) then,
  ) = _CopyWithImpl$Query$GetOrders$orders;

  factory CopyWith$Query$GetOrders$orders.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders;

  TRes call({
    List<Query$GetOrders$orders$edges>? edges,
    Query$GetOrders$orders$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetOrders$orders$edges> Function(
              Iterable<
                  CopyWith$Query$GetOrders$orders$edges<
                      Query$GetOrders$orders$edges>>)
          _fn);
  CopyWith$Query$GetOrders$orders$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetOrders$orders<TRes>
    implements CopyWith$Query$GetOrders$orders<TRes> {
  _CopyWithImpl$Query$GetOrders$orders(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders _instance;

  final TRes Function(Query$GetOrders$orders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$GetOrders$orders$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$GetOrders$orders$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetOrders$orders$edges> Function(
                  Iterable<
                      CopyWith$Query$GetOrders$orders$edges<
                          Query$GetOrders$orders$edges>>)
              _fn) =>
      call(
          edges: _fn(
              _instance.edges.map((e) => CopyWith$Query$GetOrders$orders$edges(
                    e,
                    (i) => i,
                  ))).toList());

  CopyWith$Query$GetOrders$orders$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetOrders$orders$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders<TRes>
    implements CopyWith$Query$GetOrders$orders<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders(this._res);

  TRes _res;

  call({
    List<Query$GetOrders$orders$edges>? edges,
    Query$GetOrders$orders$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$GetOrders$orders$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetOrders$orders$pageInfo.stub(_res);
}

class Query$GetOrders$orders$edges {
  Query$GetOrders$orders$edges({
    required this.node,
    required this.cursor,
    this.$__typename = 'OrderEdge',
  });

  factory Query$GetOrders$orders$edges.fromJson(Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$cursor = json['cursor'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges(
      node: Query$GetOrders$orders$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      cursor: (l$cursor as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrders$orders$edges$node node;

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
    if (other is! Query$GetOrders$orders$edges ||
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

extension UtilityExtension$Query$GetOrders$orders$edges
    on Query$GetOrders$orders$edges {
  CopyWith$Query$GetOrders$orders$edges<Query$GetOrders$orders$edges>
      get copyWith => CopyWith$Query$GetOrders$orders$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOrders$orders$edges<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges(
    Query$GetOrders$orders$edges instance,
    TRes Function(Query$GetOrders$orders$edges) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges;

  factory CopyWith$Query$GetOrders$orders$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges;

  TRes call({
    Query$GetOrders$orders$edges$node? node,
    String? cursor,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetOrders$orders$edges<TRes>
    implements CopyWith$Query$GetOrders$orders$edges<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges _instance;

  final TRes Function(Query$GetOrders$orders$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? cursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetOrders$orders$edges$node),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetOrders$orders$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetOrders$orders$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges<TRes>
    implements CopyWith$Query$GetOrders$orders$edges<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges(this._res);

  TRes _res;

  call({
    Query$GetOrders$orders$edges$node? node,
    String? cursor,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetOrders$orders$edges$node<TRes> get node =>
      CopyWith$Query$GetOrders$orders$edges$node.stub(_res);
}

class Query$GetOrders$orders$edges$node {
  Query$GetOrders$orders$edges$node({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.totalPrice,
    required this.subtotalPrice,
    required this.totalTax,
    required this.lineItems,
    this.$__typename = 'Order',
  });

  factory Query$GetOrders$orders$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$totalPrice = json['totalPrice'];
    final l$subtotalPrice = json['subtotalPrice'];
    final l$totalTax = json['totalTax'];
    final l$lineItems = json['lineItems'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      email: (l$email as String?),
      phone: (l$phone as String?),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      totalPrice: (l$totalPrice as String),
      subtotalPrice: (l$subtotalPrice as String),
      totalTax: (l$totalTax as String),
      lineItems: Query$GetOrders$orders$edges$node$lineItems.fromJson(
          (l$lineItems as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String? email;

  final String? phone;

  final String createdAt;

  final String updatedAt;

  final String totalPrice;

  final String subtotalPrice;

  final String totalTax;

  final Query$GetOrders$orders$edges$node$lineItems lineItems;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$totalPrice = totalPrice;
    _resultData['totalPrice'] = l$totalPrice;
    final l$subtotalPrice = subtotalPrice;
    _resultData['subtotalPrice'] = l$subtotalPrice;
    final l$totalTax = totalTax;
    _resultData['totalTax'] = l$totalTax;
    final l$lineItems = lineItems;
    _resultData['lineItems'] = l$lineItems.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$phone = phone;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$totalPrice = totalPrice;
    final l$subtotalPrice = subtotalPrice;
    final l$totalTax = totalTax;
    final l$lineItems = lineItems;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$email,
      l$phone,
      l$createdAt,
      l$updatedAt,
      l$totalPrice,
      l$subtotalPrice,
      l$totalTax,
      l$lineItems,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrders$orders$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
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
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    final l$subtotalPrice = subtotalPrice;
    final lOther$subtotalPrice = other.subtotalPrice;
    if (l$subtotalPrice != lOther$subtotalPrice) {
      return false;
    }
    final l$totalTax = totalTax;
    final lOther$totalTax = other.totalTax;
    if (l$totalTax != lOther$totalTax) {
      return false;
    }
    final l$lineItems = lineItems;
    final lOther$lineItems = other.lineItems;
    if (l$lineItems != lOther$lineItems) {
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

extension UtilityExtension$Query$GetOrders$orders$edges$node
    on Query$GetOrders$orders$edges$node {
  CopyWith$Query$GetOrders$orders$edges$node<Query$GetOrders$orders$edges$node>
      get copyWith => CopyWith$Query$GetOrders$orders$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node(
    Query$GetOrders$orders$edges$node instance,
    TRes Function(Query$GetOrders$orders$edges$node) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node;

  factory CopyWith$Query$GetOrders$orders$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node;

  TRes call({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? createdAt,
    String? updatedAt,
    String? totalPrice,
    String? subtotalPrice,
    String? totalTax,
    Query$GetOrders$orders$edges$node$lineItems? lineItems,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$lineItems<TRes> get lineItems;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node _instance;

  final TRes Function(Query$GetOrders$orders$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? totalPrice = _undefined,
    Object? subtotalPrice = _undefined,
    Object? totalTax = _undefined,
    Object? lineItems = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        email: email == _undefined ? _instance.email : (email as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        totalPrice: totalPrice == _undefined || totalPrice == null
            ? _instance.totalPrice
            : (totalPrice as String),
        subtotalPrice: subtotalPrice == _undefined || subtotalPrice == null
            ? _instance.subtotalPrice
            : (subtotalPrice as String),
        totalTax: totalTax == _undefined || totalTax == null
            ? _instance.totalTax
            : (totalTax as String),
        lineItems: lineItems == _undefined || lineItems == null
            ? _instance.lineItems
            : (lineItems as Query$GetOrders$orders$edges$node$lineItems),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetOrders$orders$edges$node$lineItems<TRes> get lineItems {
    final local$lineItems = _instance.lineItems;
    return CopyWith$Query$GetOrders$orders$edges$node$lineItems(
        local$lineItems, (e) => call(lineItems: e));
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? createdAt,
    String? updatedAt,
    String? totalPrice,
    String? subtotalPrice,
    String? totalTax,
    Query$GetOrders$orders$edges$node$lineItems? lineItems,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetOrders$orders$edges$node$lineItems<TRes> get lineItems =>
      CopyWith$Query$GetOrders$orders$edges$node$lineItems.stub(_res);
}

class Query$GetOrders$orders$edges$node$lineItems {
  Query$GetOrders$orders$edges$node$lineItems({
    required this.edges,
    this.$__typename = 'OrderLineItemConnection',
  });

  factory Query$GetOrders$orders$edges$node$lineItems.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$lineItems(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$GetOrders$orders$edges$node$lineItems$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetOrders$orders$edges$node$lineItems$edges> edges;

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
    if (other is! Query$GetOrders$orders$edges$node$lineItems ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$lineItems
    on Query$GetOrders$orders$edges$node$lineItems {
  CopyWith$Query$GetOrders$orders$edges$node$lineItems<
          Query$GetOrders$orders$edges$node$lineItems>
      get copyWith => CopyWith$Query$GetOrders$orders$edges$node$lineItems(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$lineItems<TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems(
    Query$GetOrders$orders$edges$node$lineItems instance,
    TRes Function(Query$GetOrders$orders$edges$node$lineItems) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems;

  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems;

  TRes call({
    List<Query$GetOrders$orders$edges$node$lineItems$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetOrders$orders$edges$node$lineItems$edges> Function(
              Iterable<
                  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges<
                      Query$GetOrders$orders$edges$node$lineItems$edges>>)
          _fn);
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$lineItems<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$lineItems _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$lineItems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders$edges$node$lineItems(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges
                as List<Query$GetOrders$orders$edges$node$lineItems$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetOrders$orders$edges$node$lineItems$edges> Function(
                  Iterable<
                      CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges<
                          Query$GetOrders$orders$edges$node$lineItems$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map(
              (e) => CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems<TRes>
    implements CopyWith$Query$GetOrders$orders$edges$node$lineItems<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems(this._res);

  TRes _res;

  call({
    List<Query$GetOrders$orders$edges$node$lineItems$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetOrders$orders$edges$node$lineItems$edges {
  Query$GetOrders$orders$edges$node$lineItems$edges({
    required this.node,
    this.$__typename = 'OrderLineItemEdge',
  });

  factory Query$GetOrders$orders$edges$node$lineItems$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$lineItems$edges(
      node: Query$GetOrders$orders$edges$node$lineItems$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetOrders$orders$edges$node$lineItems$edges$node node;

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
    if (other is! Query$GetOrders$orders$edges$node$lineItems$edges ||
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$lineItems$edges
    on Query$GetOrders$orders$edges$node$lineItems$edges {
  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges<
          Query$GetOrders$orders$edges$node$lineItems$edges>
      get copyWith =>
          CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges<
    TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges(
    Query$GetOrders$orders$edges$node$lineItems$edges instance,
    TRes Function(Query$GetOrders$orders$edges$node$lineItems$edges) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges;

  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges;

  TRes call({
    Query$GetOrders$orders$edges$node$lineItems$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges<TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$lineItems$edges _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$lineItems$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders$edges$node$lineItems$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetOrders$orders$edges$node$lineItems$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges<TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges(
      this._res);

  TRes _res;

  call({
    Query$GetOrders$orders$edges$node$lineItems$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node<TRes>
      get node =>
          CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node.stub(
              _res);
}

class Query$GetOrders$orders$edges$node$lineItems$edges$node {
  Query$GetOrders$orders$edges$node$lineItems$edges$node({
    required this.id,
    required this.title,
    required this.quantity,
    this.variant,
    this.$__typename = 'OrderLineItem',
  });

  factory Query$GetOrders$orders$edges$node$lineItems$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$quantity = json['quantity'];
    final l$variant = json['variant'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$lineItems$edges$node(
      id: (l$id as String),
      title: (l$title as String),
      quantity: (l$quantity as int),
      variant: l$variant == null
          ? null
          : Query$GetOrders$orders$edges$node$lineItems$edges$node$variant
              .fromJson((l$variant as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final int quantity;

  final Query$GetOrders$orders$edges$node$lineItems$edges$node$variant? variant;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$quantity = quantity;
    _resultData['quantity'] = l$quantity;
    final l$variant = variant;
    _resultData['variant'] = l$variant?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$quantity = quantity;
    final l$variant = variant;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$quantity,
      l$variant,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetOrders$orders$edges$node$lineItems$edges$node ||
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
    final l$quantity = quantity;
    final lOther$quantity = other.quantity;
    if (l$quantity != lOther$quantity) {
      return false;
    }
    final l$variant = variant;
    final lOther$variant = other.variant;
    if (l$variant != lOther$variant) {
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$lineItems$edges$node
    on Query$GetOrders$orders$edges$node$lineItems$edges$node {
  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node<
          Query$GetOrders$orders$edges$node$lineItems$edges$node>
      get copyWith =>
          CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node<
    TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node(
    Query$GetOrders$orders$edges$node$lineItems$edges$node instance,
    TRes Function(Query$GetOrders$orders$edges$node$lineItems$edges$node) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node;

  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node;

  TRes call({
    String? id,
    String? title,
    int? quantity,
    Query$GetOrders$orders$edges$node$lineItems$edges$node$variant? variant,
    String? $__typename,
  });
  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<TRes>
      get variant;
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node<TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$lineItems$edges$node _instance;

  final TRes Function(Query$GetOrders$orders$edges$node$lineItems$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? quantity = _undefined,
    Object? variant = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders$edges$node$lineItems$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        quantity: quantity == _undefined || quantity == null
            ? _instance.quantity
            : (quantity as int),
        variant: variant == _undefined
            ? _instance.variant
            : (variant
                as Query$GetOrders$orders$edges$node$lineItems$edges$node$variant?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<TRes>
      get variant {
    final local$variant = _instance.variant;
    return local$variant == null
        ? CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant
            .stub(_then(_instance))
        : CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant(
            local$variant, (e) => call(variant: e));
  }
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node<
        TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    int? quantity,
    Query$GetOrders$orders$edges$node$lineItems$edges$node$variant? variant,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<TRes>
      get variant =>
          CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant
              .stub(_res);
}

class Query$GetOrders$orders$edges$node$lineItems$edges$node$variant {
  Query$GetOrders$orders$edges$node$lineItems$edges$node$variant({
    required this.id,
    required this.title,
    this.sku,
    this.$__typename = 'ProductVariant',
  });

  factory Query$GetOrders$orders$edges$node$lineItems$edges$node$variant.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$title = json['title'];
    final l$sku = json['sku'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$edges$node$lineItems$edges$node$variant(
      id: (l$id as String),
      title: (l$title as String),
      sku: (l$sku as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String title;

  final String? sku;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$title = title;
    _resultData['title'] = l$title;
    final l$sku = sku;
    _resultData['sku'] = l$sku;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$sku = sku;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$title,
      l$sku,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other
            is! Query$GetOrders$orders$edges$node$lineItems$edges$node$variant ||
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
    final l$sku = sku;
    final lOther$sku = other.sku;
    if (l$sku != lOther$sku) {
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

extension UtilityExtension$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant
    on Query$GetOrders$orders$edges$node$lineItems$edges$node$variant {
  CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<
          Query$GetOrders$orders$edges$node$lineItems$edges$node$variant>
      get copyWith =>
          CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<
    TRes> {
  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant(
    Query$GetOrders$orders$edges$node$lineItems$edges$node$variant instance,
    TRes Function(
            Query$GetOrders$orders$edges$node$lineItems$edges$node$variant)
        then,
  ) = _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant;

  factory CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant;

  TRes call({
    String? id,
    String? title,
    String? sku,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<
        TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<
            TRes> {
  _CopyWithImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$edges$node$lineItems$edges$node$variant
      _instance;

  final TRes Function(
      Query$GetOrders$orders$edges$node$lineItems$edges$node$variant) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? sku = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders$edges$node$lineItems$edges$node$variant(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        title: title == _undefined || title == null
            ? _instance.title
            : (title as String),
        sku: sku == _undefined ? _instance.sku : (sku as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<
        TRes>
    implements
        CopyWith$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant<
            TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$edges$node$lineItems$edges$node$variant(
      this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? sku,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetOrders$orders$pageInfo {
  Query$GetOrders$orders$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetOrders$orders$pageInfo.fromJson(Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetOrders$orders$pageInfo(
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
    if (other is! Query$GetOrders$orders$pageInfo ||
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

extension UtilityExtension$Query$GetOrders$orders$pageInfo
    on Query$GetOrders$orders$pageInfo {
  CopyWith$Query$GetOrders$orders$pageInfo<Query$GetOrders$orders$pageInfo>
      get copyWith => CopyWith$Query$GetOrders$orders$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetOrders$orders$pageInfo<TRes> {
  factory CopyWith$Query$GetOrders$orders$pageInfo(
    Query$GetOrders$orders$pageInfo instance,
    TRes Function(Query$GetOrders$orders$pageInfo) then,
  ) = _CopyWithImpl$Query$GetOrders$orders$pageInfo;

  factory CopyWith$Query$GetOrders$orders$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetOrders$orders$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetOrders$orders$pageInfo<TRes>
    implements CopyWith$Query$GetOrders$orders$pageInfo<TRes> {
  _CopyWithImpl$Query$GetOrders$orders$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetOrders$orders$pageInfo _instance;

  final TRes Function(Query$GetOrders$orders$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetOrders$orders$pageInfo(
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

class _CopyWithStubImpl$Query$GetOrders$orders$pageInfo<TRes>
    implements CopyWith$Query$GetOrders$orders$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetOrders$orders$pageInfo(this._res);

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
