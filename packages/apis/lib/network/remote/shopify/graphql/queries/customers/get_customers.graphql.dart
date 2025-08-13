import 'package:gql/ast.dart';

class Variables$Query$GetCustomers {
  factory Variables$Query$GetCustomers({
    int? first,
    String? after,
    String? query,
  }) =>
      Variables$Query$GetCustomers._({
        if (first != null) r'first': first,
        if (after != null) r'after': after,
        if (query != null) r'query': query,
      });

  Variables$Query$GetCustomers._(this._$data);

  factory Variables$Query$GetCustomers.fromJson(Map<String, dynamic> data) {
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
    return Variables$Query$GetCustomers._(result$data);
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

  CopyWith$Variables$Query$GetCustomers<Variables$Query$GetCustomers>
      get copyWith => CopyWith$Variables$Query$GetCustomers(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Query$GetCustomers ||
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

abstract class CopyWith$Variables$Query$GetCustomers<TRes> {
  factory CopyWith$Variables$Query$GetCustomers(
    Variables$Query$GetCustomers instance,
    TRes Function(Variables$Query$GetCustomers) then,
  ) = _CopyWithImpl$Variables$Query$GetCustomers;

  factory CopyWith$Variables$Query$GetCustomers.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetCustomers;

  TRes call({
    int? first,
    String? after,
    String? query,
  });
}

class _CopyWithImpl$Variables$Query$GetCustomers<TRes>
    implements CopyWith$Variables$Query$GetCustomers<TRes> {
  _CopyWithImpl$Variables$Query$GetCustomers(
    this._instance,
    this._then,
  );

  final Variables$Query$GetCustomers _instance;

  final TRes Function(Variables$Query$GetCustomers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? first = _undefined,
    Object? after = _undefined,
    Object? query = _undefined,
  }) =>
      _then(Variables$Query$GetCustomers._({
        ..._instance._$data,
        if (first != _undefined) 'first': (first as int?),
        if (after != _undefined) 'after': (after as String?),
        if (query != _undefined) 'query': (query as String?),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetCustomers<TRes>
    implements CopyWith$Variables$Query$GetCustomers<TRes> {
  _CopyWithStubImpl$Variables$Query$GetCustomers(this._res);

  TRes _res;

  call({
    int? first,
    String? after,
    String? query,
  }) =>
      _res;
}

class Query$GetCustomers {
  Query$GetCustomers({
    this.customers,
    this.$__typename = 'Query',
  });

  factory Query$GetCustomers.fromJson(Map<String, dynamic> json) {
    final l$customers = json['customers'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers(
      customers: l$customers == null
          ? null
          : Query$GetCustomers$customers.fromJson(
              (l$customers as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCustomers$customers? customers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customers = customers;
    _resultData['customers'] = l$customers?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customers = customers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCustomers || runtimeType != other.runtimeType) {
      return false;
    }
    final l$customers = customers;
    final lOther$customers = other.customers;
    if (l$customers != lOther$customers) {
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

extension UtilityExtension$Query$GetCustomers on Query$GetCustomers {
  CopyWith$Query$GetCustomers<Query$GetCustomers> get copyWith =>
      CopyWith$Query$GetCustomers(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetCustomers<TRes> {
  factory CopyWith$Query$GetCustomers(
    Query$GetCustomers instance,
    TRes Function(Query$GetCustomers) then,
  ) = _CopyWithImpl$Query$GetCustomers;

  factory CopyWith$Query$GetCustomers.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCustomers;

  TRes call({
    Query$GetCustomers$customers? customers,
    String? $__typename,
  });
  CopyWith$Query$GetCustomers$customers<TRes> get customers;
}

class _CopyWithImpl$Query$GetCustomers<TRes>
    implements CopyWith$Query$GetCustomers<TRes> {
  _CopyWithImpl$Query$GetCustomers(
    this._instance,
    this._then,
  );

  final Query$GetCustomers _instance;

  final TRes Function(Query$GetCustomers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? customers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers(
        customers: customers == _undefined
            ? _instance.customers
            : (customers as Query$GetCustomers$customers?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetCustomers$customers<TRes> get customers {
    final local$customers = _instance.customers;
    return local$customers == null
        ? CopyWith$Query$GetCustomers$customers.stub(_then(_instance))
        : CopyWith$Query$GetCustomers$customers(
            local$customers, (e) => call(customers: e));
  }
}

class _CopyWithStubImpl$Query$GetCustomers<TRes>
    implements CopyWith$Query$GetCustomers<TRes> {
  _CopyWithStubImpl$Query$GetCustomers(this._res);

  TRes _res;

  call({
    Query$GetCustomers$customers? customers,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetCustomers$customers<TRes> get customers =>
      CopyWith$Query$GetCustomers$customers.stub(_res);
}

const documentNodeQueryGetCustomers = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCustomers'),
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
        name: NameNode(value: 'customers'),
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
                    name: NameNode(value: 'firstName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'lastName'),
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
                    name: NameNode(value: 'orders'),
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
                                name: NameNode(value: 'name'),
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
                                name: NameNode(value: 'createdAt'),
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

class Query$GetCustomers$customers {
  Query$GetCustomers$customers({
    required this.edges,
    required this.pageInfo,
    this.$__typename = 'CustomerConnection',
  });

  factory Query$GetCustomers$customers.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$pageInfo = json['pageInfo'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers$customers(
      edges: (l$edges as List<dynamic>)
          .map((e) => Query$GetCustomers$customers$edges.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      pageInfo: Query$GetCustomers$customers$pageInfo.fromJson(
          (l$pageInfo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetCustomers$customers$edges> edges;

  final Query$GetCustomers$customers$pageInfo pageInfo;

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
    if (other is! Query$GetCustomers$customers ||
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

extension UtilityExtension$Query$GetCustomers$customers
    on Query$GetCustomers$customers {
  CopyWith$Query$GetCustomers$customers<Query$GetCustomers$customers>
      get copyWith => CopyWith$Query$GetCustomers$customers(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomers$customers<TRes> {
  factory CopyWith$Query$GetCustomers$customers(
    Query$GetCustomers$customers instance,
    TRes Function(Query$GetCustomers$customers) then,
  ) = _CopyWithImpl$Query$GetCustomers$customers;

  factory CopyWith$Query$GetCustomers$customers.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCustomers$customers;

  TRes call({
    List<Query$GetCustomers$customers$edges>? edges,
    Query$GetCustomers$customers$pageInfo? pageInfo,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetCustomers$customers$edges> Function(
              Iterable<
                  CopyWith$Query$GetCustomers$customers$edges<
                      Query$GetCustomers$customers$edges>>)
          _fn);
  CopyWith$Query$GetCustomers$customers$pageInfo<TRes> get pageInfo;
}

class _CopyWithImpl$Query$GetCustomers$customers<TRes>
    implements CopyWith$Query$GetCustomers$customers<TRes> {
  _CopyWithImpl$Query$GetCustomers$customers(
    this._instance,
    this._then,
  );

  final Query$GetCustomers$customers _instance;

  final TRes Function(Query$GetCustomers$customers) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? pageInfo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers$customers(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$GetCustomers$customers$edges>),
        pageInfo: pageInfo == _undefined || pageInfo == null
            ? _instance.pageInfo
            : (pageInfo as Query$GetCustomers$customers$pageInfo),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetCustomers$customers$edges> Function(
                  Iterable<
                      CopyWith$Query$GetCustomers$customers$edges<
                          Query$GetCustomers$customers$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges
              .map((e) => CopyWith$Query$GetCustomers$customers$edges(
                    e,
                    (i) => i,
                  ))).toList());

  CopyWith$Query$GetCustomers$customers$pageInfo<TRes> get pageInfo {
    final local$pageInfo = _instance.pageInfo;
    return CopyWith$Query$GetCustomers$customers$pageInfo(
        local$pageInfo, (e) => call(pageInfo: e));
  }
}

class _CopyWithStubImpl$Query$GetCustomers$customers<TRes>
    implements CopyWith$Query$GetCustomers$customers<TRes> {
  _CopyWithStubImpl$Query$GetCustomers$customers(this._res);

  TRes _res;

  call({
    List<Query$GetCustomers$customers$edges>? edges,
    Query$GetCustomers$customers$pageInfo? pageInfo,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;

  CopyWith$Query$GetCustomers$customers$pageInfo<TRes> get pageInfo =>
      CopyWith$Query$GetCustomers$customers$pageInfo.stub(_res);
}

class Query$GetCustomers$customers$edges {
  Query$GetCustomers$customers$edges({
    required this.node,
    required this.cursor,
    this.$__typename = 'CustomerEdge',
  });

  factory Query$GetCustomers$customers$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$cursor = json['cursor'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers$customers$edges(
      node: Query$GetCustomers$customers$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      cursor: (l$cursor as String),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCustomers$customers$edges$node node;

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
    if (other is! Query$GetCustomers$customers$edges ||
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

extension UtilityExtension$Query$GetCustomers$customers$edges
    on Query$GetCustomers$customers$edges {
  CopyWith$Query$GetCustomers$customers$edges<
          Query$GetCustomers$customers$edges>
      get copyWith => CopyWith$Query$GetCustomers$customers$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomers$customers$edges<TRes> {
  factory CopyWith$Query$GetCustomers$customers$edges(
    Query$GetCustomers$customers$edges instance,
    TRes Function(Query$GetCustomers$customers$edges) then,
  ) = _CopyWithImpl$Query$GetCustomers$customers$edges;

  factory CopyWith$Query$GetCustomers$customers$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCustomers$customers$edges;

  TRes call({
    Query$GetCustomers$customers$edges$node? node,
    String? cursor,
    String? $__typename,
  });
  CopyWith$Query$GetCustomers$customers$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetCustomers$customers$edges<TRes>
    implements CopyWith$Query$GetCustomers$customers$edges<TRes> {
  _CopyWithImpl$Query$GetCustomers$customers$edges(
    this._instance,
    this._then,
  );

  final Query$GetCustomers$customers$edges _instance;

  final TRes Function(Query$GetCustomers$customers$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? cursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers$customers$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node as Query$GetCustomers$customers$edges$node),
        cursor: cursor == _undefined || cursor == null
            ? _instance.cursor
            : (cursor as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetCustomers$customers$edges$node<TRes> get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetCustomers$customers$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetCustomers$customers$edges<TRes>
    implements CopyWith$Query$GetCustomers$customers$edges<TRes> {
  _CopyWithStubImpl$Query$GetCustomers$customers$edges(this._res);

  TRes _res;

  call({
    Query$GetCustomers$customers$edges$node? node,
    String? cursor,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetCustomers$customers$edges$node<TRes> get node =>
      CopyWith$Query$GetCustomers$customers$edges$node.stub(_res);
}

class Query$GetCustomers$customers$edges$node {
  Query$GetCustomers$customers$edges$node({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.orders,
    this.$__typename = 'Customer',
  });

  factory Query$GetCustomers$customers$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$orders = json['orders'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers$customers$edges$node(
      id: (l$id as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      email: (l$email as String?),
      phone: (l$phone as String?),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      orders: Query$GetCustomers$customers$edges$node$orders.fromJson(
          (l$orders as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String? firstName;

  final String? lastName;

  final String? email;

  final String? phone;

  final String createdAt;

  final String updatedAt;

  final Query$GetCustomers$customers$edges$node$orders orders;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$firstName = firstName;
    _resultData['firstName'] = l$firstName;
    final l$lastName = lastName;
    _resultData['lastName'] = l$lastName;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$orders = orders;
    _resultData['orders'] = l$orders.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$phone = phone;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$orders = orders;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$email,
      l$phone,
      l$createdAt,
      l$updatedAt,
      l$orders,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCustomers$customers$edges$node ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (l$lastName != lOther$lastName) {
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

extension UtilityExtension$Query$GetCustomers$customers$edges$node
    on Query$GetCustomers$customers$edges$node {
  CopyWith$Query$GetCustomers$customers$edges$node<
          Query$GetCustomers$customers$edges$node>
      get copyWith => CopyWith$Query$GetCustomers$customers$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomers$customers$edges$node<TRes> {
  factory CopyWith$Query$GetCustomers$customers$edges$node(
    Query$GetCustomers$customers$edges$node instance,
    TRes Function(Query$GetCustomers$customers$edges$node) then,
  ) = _CopyWithImpl$Query$GetCustomers$customers$edges$node;

  factory CopyWith$Query$GetCustomers$customers$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCustomers$customers$edges$node;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? createdAt,
    String? updatedAt,
    Query$GetCustomers$customers$edges$node$orders? orders,
    String? $__typename,
  });
  CopyWith$Query$GetCustomers$customers$edges$node$orders<TRes> get orders;
}

class _CopyWithImpl$Query$GetCustomers$customers$edges$node<TRes>
    implements CopyWith$Query$GetCustomers$customers$edges$node<TRes> {
  _CopyWithImpl$Query$GetCustomers$customers$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetCustomers$customers$edges$node _instance;

  final TRes Function(Query$GetCustomers$customers$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? orders = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers$customers$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        firstName: firstName == _undefined
            ? _instance.firstName
            : (firstName as String?),
        lastName:
            lastName == _undefined ? _instance.lastName : (lastName as String?),
        email: email == _undefined ? _instance.email : (email as String?),
        phone: phone == _undefined ? _instance.phone : (phone as String?),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        orders: orders == _undefined || orders == null
            ? _instance.orders
            : (orders as Query$GetCustomers$customers$edges$node$orders),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetCustomers$customers$edges$node$orders<TRes> get orders {
    final local$orders = _instance.orders;
    return CopyWith$Query$GetCustomers$customers$edges$node$orders(
        local$orders, (e) => call(orders: e));
  }
}

class _CopyWithStubImpl$Query$GetCustomers$customers$edges$node<TRes>
    implements CopyWith$Query$GetCustomers$customers$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetCustomers$customers$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? createdAt,
    String? updatedAt,
    Query$GetCustomers$customers$edges$node$orders? orders,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetCustomers$customers$edges$node$orders<TRes> get orders =>
      CopyWith$Query$GetCustomers$customers$edges$node$orders.stub(_res);
}

class Query$GetCustomers$customers$edges$node$orders {
  Query$GetCustomers$customers$edges$node$orders({
    required this.edges,
    this.$__typename = 'OrderConnection',
  });

  factory Query$GetCustomers$customers$edges$node$orders.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers$customers$edges$node$orders(
      edges: (l$edges as List<dynamic>)
          .map((e) =>
              Query$GetCustomers$customers$edges$node$orders$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetCustomers$customers$edges$node$orders$edges> edges;

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
    if (other is! Query$GetCustomers$customers$edges$node$orders ||
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

extension UtilityExtension$Query$GetCustomers$customers$edges$node$orders
    on Query$GetCustomers$customers$edges$node$orders {
  CopyWith$Query$GetCustomers$customers$edges$node$orders<
          Query$GetCustomers$customers$edges$node$orders>
      get copyWith => CopyWith$Query$GetCustomers$customers$edges$node$orders(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomers$customers$edges$node$orders<TRes> {
  factory CopyWith$Query$GetCustomers$customers$edges$node$orders(
    Query$GetCustomers$customers$edges$node$orders instance,
    TRes Function(Query$GetCustomers$customers$edges$node$orders) then,
  ) = _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders;

  factory CopyWith$Query$GetCustomers$customers$edges$node$orders.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders;

  TRes call({
    List<Query$GetCustomers$customers$edges$node$orders$edges>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetCustomers$customers$edges$node$orders$edges> Function(
              Iterable<
                  CopyWith$Query$GetCustomers$customers$edges$node$orders$edges<
                      Query$GetCustomers$customers$edges$node$orders$edges>>)
          _fn);
}

class _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders<TRes>
    implements CopyWith$Query$GetCustomers$customers$edges$node$orders<TRes> {
  _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders(
    this._instance,
    this._then,
  );

  final Query$GetCustomers$customers$edges$node$orders _instance;

  final TRes Function(Query$GetCustomers$customers$edges$node$orders) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers$customers$edges$node$orders(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges
                as List<Query$GetCustomers$customers$edges$node$orders$edges>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetCustomers$customers$edges$node$orders$edges> Function(
                  Iterable<
                      CopyWith$Query$GetCustomers$customers$edges$node$orders$edges<
                          Query$GetCustomers$customers$edges$node$orders$edges>>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) =>
              CopyWith$Query$GetCustomers$customers$edges$node$orders$edges(
                e,
                (i) => i,
              ))).toList());
}

class _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders<TRes>
    implements CopyWith$Query$GetCustomers$customers$edges$node$orders<TRes> {
  _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders(this._res);

  TRes _res;

  call({
    List<Query$GetCustomers$customers$edges$node$orders$edges>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetCustomers$customers$edges$node$orders$edges {
  Query$GetCustomers$customers$edges$node$orders$edges({
    required this.node,
    this.$__typename = 'OrderEdge',
  });

  factory Query$GetCustomers$customers$edges$node$orders$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers$customers$edges$node$orders$edges(
      node: Query$GetCustomers$customers$edges$node$orders$edges$node.fromJson(
          (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetCustomers$customers$edges$node$orders$edges$node node;

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
    if (other is! Query$GetCustomers$customers$edges$node$orders$edges ||
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

extension UtilityExtension$Query$GetCustomers$customers$edges$node$orders$edges
    on Query$GetCustomers$customers$edges$node$orders$edges {
  CopyWith$Query$GetCustomers$customers$edges$node$orders$edges<
          Query$GetCustomers$customers$edges$node$orders$edges>
      get copyWith =>
          CopyWith$Query$GetCustomers$customers$edges$node$orders$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomers$customers$edges$node$orders$edges<
    TRes> {
  factory CopyWith$Query$GetCustomers$customers$edges$node$orders$edges(
    Query$GetCustomers$customers$edges$node$orders$edges instance,
    TRes Function(Query$GetCustomers$customers$edges$node$orders$edges) then,
  ) = _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders$edges;

  factory CopyWith$Query$GetCustomers$customers$edges$node$orders$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders$edges;

  TRes call({
    Query$GetCustomers$customers$edges$node$orders$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders$edges<TRes>
    implements
        CopyWith$Query$GetCustomers$customers$edges$node$orders$edges<TRes> {
  _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders$edges(
    this._instance,
    this._then,
  );

  final Query$GetCustomers$customers$edges$node$orders$edges _instance;

  final TRes Function(Query$GetCustomers$customers$edges$node$orders$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers$customers$edges$node$orders$edges(
        node: node == _undefined || node == null
            ? _instance.node
            : (node
                as Query$GetCustomers$customers$edges$node$orders$edges$node),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node(
        local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders$edges<
        TRes>
    implements
        CopyWith$Query$GetCustomers$customers$edges$node$orders$edges<TRes> {
  _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders$edges(
      this._res);

  TRes _res;

  call({
    Query$GetCustomers$customers$edges$node$orders$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node<TRes>
      get node =>
          CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node
              .stub(_res);
}

class Query$GetCustomers$customers$edges$node$orders$edges$node {
  Query$GetCustomers$customers$edges$node$orders$edges$node({
    required this.id,
    required this.name,
    required this.totalPrice,
    required this.createdAt,
    this.$__typename = 'Order',
  });

  factory Query$GetCustomers$customers$edges$node$orders$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$totalPrice = json['totalPrice'];
    final l$createdAt = json['createdAt'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers$customers$edges$node$orders$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      totalPrice: (l$totalPrice as String),
      createdAt: (l$createdAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String totalPrice;

  final String createdAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$totalPrice = totalPrice;
    _resultData['totalPrice'] = l$totalPrice;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$totalPrice = totalPrice;
    final l$createdAt = createdAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$totalPrice,
      l$createdAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetCustomers$customers$edges$node$orders$edges$node ||
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
    final l$totalPrice = totalPrice;
    final lOther$totalPrice = other.totalPrice;
    if (l$totalPrice != lOther$totalPrice) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
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

extension UtilityExtension$Query$GetCustomers$customers$edges$node$orders$edges$node
    on Query$GetCustomers$customers$edges$node$orders$edges$node {
  CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node<
          Query$GetCustomers$customers$edges$node$orders$edges$node>
      get copyWith =>
          CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node<
    TRes> {
  factory CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node(
    Query$GetCustomers$customers$edges$node$orders$edges$node instance,
    TRes Function(Query$GetCustomers$customers$edges$node$orders$edges$node)
        then,
  ) = _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders$edges$node;

  factory CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders$edges$node;

  TRes call({
    String? id,
    String? name,
    String? totalPrice,
    String? createdAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders$edges$node<
        TRes>
    implements
        CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node<
            TRes> {
  _CopyWithImpl$Query$GetCustomers$customers$edges$node$orders$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetCustomers$customers$edges$node$orders$edges$node _instance;

  final TRes Function(Query$GetCustomers$customers$edges$node$orders$edges$node)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? totalPrice = _undefined,
    Object? createdAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers$customers$edges$node$orders$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        totalPrice: totalPrice == _undefined || totalPrice == null
            ? _instance.totalPrice
            : (totalPrice as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders$edges$node<
        TRes>
    implements
        CopyWith$Query$GetCustomers$customers$edges$node$orders$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$GetCustomers$customers$edges$node$orders$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? totalPrice,
    String? createdAt,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetCustomers$customers$pageInfo {
  Query$GetCustomers$customers$pageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.startCursor,
    this.endCursor,
    this.$__typename = 'PageInfo',
  });

  factory Query$GetCustomers$customers$pageInfo.fromJson(
      Map<String, dynamic> json) {
    final l$hasNextPage = json['hasNextPage'];
    final l$hasPreviousPage = json['hasPreviousPage'];
    final l$startCursor = json['startCursor'];
    final l$endCursor = json['endCursor'];
    final l$$__typename = json['__typename'];
    return Query$GetCustomers$customers$pageInfo(
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
    if (other is! Query$GetCustomers$customers$pageInfo ||
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

extension UtilityExtension$Query$GetCustomers$customers$pageInfo
    on Query$GetCustomers$customers$pageInfo {
  CopyWith$Query$GetCustomers$customers$pageInfo<
          Query$GetCustomers$customers$pageInfo>
      get copyWith => CopyWith$Query$GetCustomers$customers$pageInfo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetCustomers$customers$pageInfo<TRes> {
  factory CopyWith$Query$GetCustomers$customers$pageInfo(
    Query$GetCustomers$customers$pageInfo instance,
    TRes Function(Query$GetCustomers$customers$pageInfo) then,
  ) = _CopyWithImpl$Query$GetCustomers$customers$pageInfo;

  factory CopyWith$Query$GetCustomers$customers$pageInfo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetCustomers$customers$pageInfo;

  TRes call({
    bool? hasNextPage,
    bool? hasPreviousPage,
    String? startCursor,
    String? endCursor,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetCustomers$customers$pageInfo<TRes>
    implements CopyWith$Query$GetCustomers$customers$pageInfo<TRes> {
  _CopyWithImpl$Query$GetCustomers$customers$pageInfo(
    this._instance,
    this._then,
  );

  final Query$GetCustomers$customers$pageInfo _instance;

  final TRes Function(Query$GetCustomers$customers$pageInfo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? hasNextPage = _undefined,
    Object? hasPreviousPage = _undefined,
    Object? startCursor = _undefined,
    Object? endCursor = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetCustomers$customers$pageInfo(
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

class _CopyWithStubImpl$Query$GetCustomers$customers$pageInfo<TRes>
    implements CopyWith$Query$GetCustomers$customers$pageInfo<TRes> {
  _CopyWithStubImpl$Query$GetCustomers$customers$pageInfo(this._res);

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
