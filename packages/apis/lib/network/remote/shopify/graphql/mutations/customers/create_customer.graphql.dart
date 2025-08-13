import '../../schema.graphql.dart';
import 'package:gql/ast.dart';

class Variables$Mutation$CreateCustomer {
  factory Variables$Mutation$CreateCustomer(
          {required Input$CustomerInput input}) =>
      Variables$Mutation$CreateCustomer._({
        r'input': input,
      });

  Variables$Mutation$CreateCustomer._(this._$data);

  factory Variables$Mutation$CreateCustomer.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] =
        Input$CustomerInput.fromJson((l$input as Map<String, dynamic>));
    return Variables$Mutation$CreateCustomer._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CustomerInput get input => (_$data['input'] as Input$CustomerInput);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateCustomer<Variables$Mutation$CreateCustomer>
      get copyWith => CopyWith$Variables$Mutation$CreateCustomer(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Variables$Mutation$CreateCustomer ||
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

abstract class CopyWith$Variables$Mutation$CreateCustomer<TRes> {
  factory CopyWith$Variables$Mutation$CreateCustomer(
    Variables$Mutation$CreateCustomer instance,
    TRes Function(Variables$Mutation$CreateCustomer) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateCustomer;

  factory CopyWith$Variables$Mutation$CreateCustomer.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateCustomer;

  TRes call({Input$CustomerInput? input});
}

class _CopyWithImpl$Variables$Mutation$CreateCustomer<TRes>
    implements CopyWith$Variables$Mutation$CreateCustomer<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateCustomer(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateCustomer _instance;

  final TRes Function(Variables$Mutation$CreateCustomer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? input = _undefined}) =>
      _then(Variables$Mutation$CreateCustomer._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$CustomerInput),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateCustomer<TRes>
    implements CopyWith$Variables$Mutation$CreateCustomer<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateCustomer(this._res);

  TRes _res;

  call({Input$CustomerInput? input}) => _res;
}

class Mutation$CreateCustomer {
  Mutation$CreateCustomer({
    this.customerCreate,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateCustomer.fromJson(Map<String, dynamic> json) {
    final l$customerCreate = json['customerCreate'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCustomer(
      customerCreate: l$customerCreate == null
          ? null
          : Mutation$CreateCustomer$customerCreate.fromJson(
              (l$customerCreate as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateCustomer$customerCreate? customerCreate;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customerCreate = customerCreate;
    _resultData['customerCreate'] = l$customerCreate?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customerCreate = customerCreate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customerCreate,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCustomer || runtimeType != other.runtimeType) {
      return false;
    }
    final l$customerCreate = customerCreate;
    final lOther$customerCreate = other.customerCreate;
    if (l$customerCreate != lOther$customerCreate) {
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

extension UtilityExtension$Mutation$CreateCustomer on Mutation$CreateCustomer {
  CopyWith$Mutation$CreateCustomer<Mutation$CreateCustomer> get copyWith =>
      CopyWith$Mutation$CreateCustomer(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateCustomer<TRes> {
  factory CopyWith$Mutation$CreateCustomer(
    Mutation$CreateCustomer instance,
    TRes Function(Mutation$CreateCustomer) then,
  ) = _CopyWithImpl$Mutation$CreateCustomer;

  factory CopyWith$Mutation$CreateCustomer.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCustomer;

  TRes call({
    Mutation$CreateCustomer$customerCreate? customerCreate,
    String? $__typename,
  });
  CopyWith$Mutation$CreateCustomer$customerCreate<TRes> get customerCreate;
}

class _CopyWithImpl$Mutation$CreateCustomer<TRes>
    implements CopyWith$Mutation$CreateCustomer<TRes> {
  _CopyWithImpl$Mutation$CreateCustomer(
    this._instance,
    this._then,
  );

  final Mutation$CreateCustomer _instance;

  final TRes Function(Mutation$CreateCustomer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? customerCreate = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateCustomer(
        customerCreate: customerCreate == _undefined
            ? _instance.customerCreate
            : (customerCreate as Mutation$CreateCustomer$customerCreate?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateCustomer$customerCreate<TRes> get customerCreate {
    final local$customerCreate = _instance.customerCreate;
    return local$customerCreate == null
        ? CopyWith$Mutation$CreateCustomer$customerCreate.stub(_then(_instance))
        : CopyWith$Mutation$CreateCustomer$customerCreate(
            local$customerCreate, (e) => call(customerCreate: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateCustomer<TRes>
    implements CopyWith$Mutation$CreateCustomer<TRes> {
  _CopyWithStubImpl$Mutation$CreateCustomer(this._res);

  TRes _res;

  call({
    Mutation$CreateCustomer$customerCreate? customerCreate,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateCustomer$customerCreate<TRes> get customerCreate =>
      CopyWith$Mutation$CreateCustomer$customerCreate.stub(_res);
}

const documentNodeMutationCreateCustomer = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateCustomer'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CustomerInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'customerCreate'),
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
            name: NameNode(value: 'customer'),
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

class Mutation$CreateCustomer$customerCreate {
  Mutation$CreateCustomer$customerCreate({
    this.customer,
    required this.userErrors,
    this.$__typename = 'CustomerCreatePayload',
  });

  factory Mutation$CreateCustomer$customerCreate.fromJson(
      Map<String, dynamic> json) {
    final l$customer = json['customer'];
    final l$userErrors = json['userErrors'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCustomer$customerCreate(
      customer: l$customer == null
          ? null
          : Mutation$CreateCustomer$customerCreate$customer.fromJson(
              (l$customer as Map<String, dynamic>)),
      userErrors: (l$userErrors as List<dynamic>)
          .map((e) =>
              Mutation$CreateCustomer$customerCreate$userErrors.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateCustomer$customerCreate$customer? customer;

  final List<Mutation$CreateCustomer$customerCreate$userErrors> userErrors;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$customer = customer;
    _resultData['customer'] = l$customer?.toJson();
    final l$userErrors = userErrors;
    _resultData['userErrors'] = l$userErrors.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$customer = customer;
    final l$userErrors = userErrors;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$customer,
      Object.hashAll(l$userErrors.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Mutation$CreateCustomer$customerCreate ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$customer = customer;
    final lOther$customer = other.customer;
    if (l$customer != lOther$customer) {
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

extension UtilityExtension$Mutation$CreateCustomer$customerCreate
    on Mutation$CreateCustomer$customerCreate {
  CopyWith$Mutation$CreateCustomer$customerCreate<
          Mutation$CreateCustomer$customerCreate>
      get copyWith => CopyWith$Mutation$CreateCustomer$customerCreate(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateCustomer$customerCreate<TRes> {
  factory CopyWith$Mutation$CreateCustomer$customerCreate(
    Mutation$CreateCustomer$customerCreate instance,
    TRes Function(Mutation$CreateCustomer$customerCreate) then,
  ) = _CopyWithImpl$Mutation$CreateCustomer$customerCreate;

  factory CopyWith$Mutation$CreateCustomer$customerCreate.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate;

  TRes call({
    Mutation$CreateCustomer$customerCreate$customer? customer,
    List<Mutation$CreateCustomer$customerCreate$userErrors>? userErrors,
    String? $__typename,
  });
  CopyWith$Mutation$CreateCustomer$customerCreate$customer<TRes> get customer;
  TRes userErrors(
      Iterable<Mutation$CreateCustomer$customerCreate$userErrors> Function(
              Iterable<
                  CopyWith$Mutation$CreateCustomer$customerCreate$userErrors<
                      Mutation$CreateCustomer$customerCreate$userErrors>>)
          _fn);
}

class _CopyWithImpl$Mutation$CreateCustomer$customerCreate<TRes>
    implements CopyWith$Mutation$CreateCustomer$customerCreate<TRes> {
  _CopyWithImpl$Mutation$CreateCustomer$customerCreate(
    this._instance,
    this._then,
  );

  final Mutation$CreateCustomer$customerCreate _instance;

  final TRes Function(Mutation$CreateCustomer$customerCreate) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? customer = _undefined,
    Object? userErrors = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateCustomer$customerCreate(
        customer: customer == _undefined
            ? _instance.customer
            : (customer as Mutation$CreateCustomer$customerCreate$customer?),
        userErrors: userErrors == _undefined || userErrors == null
            ? _instance.userErrors
            : (userErrors
                as List<Mutation$CreateCustomer$customerCreate$userErrors>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateCustomer$customerCreate$customer<TRes> get customer {
    final local$customer = _instance.customer;
    return local$customer == null
        ? CopyWith$Mutation$CreateCustomer$customerCreate$customer.stub(
            _then(_instance))
        : CopyWith$Mutation$CreateCustomer$customerCreate$customer(
            local$customer, (e) => call(customer: e));
  }

  TRes userErrors(
          Iterable<Mutation$CreateCustomer$customerCreate$userErrors> Function(
                  Iterable<
                      CopyWith$Mutation$CreateCustomer$customerCreate$userErrors<
                          Mutation$CreateCustomer$customerCreate$userErrors>>)
              _fn) =>
      call(
          userErrors: _fn(_instance.userErrors.map(
              (e) => CopyWith$Mutation$CreateCustomer$customerCreate$userErrors(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate<TRes>
    implements CopyWith$Mutation$CreateCustomer$customerCreate<TRes> {
  _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate(this._res);

  TRes _res;

  call({
    Mutation$CreateCustomer$customerCreate$customer? customer,
    List<Mutation$CreateCustomer$customerCreate$userErrors>? userErrors,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateCustomer$customerCreate$customer<TRes> get customer =>
      CopyWith$Mutation$CreateCustomer$customerCreate$customer.stub(_res);

  userErrors(_fn) => _res;
}

class Mutation$CreateCustomer$customerCreate$customer {
  Mutation$CreateCustomer$customerCreate$customer({
    required this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'Customer',
  });

  factory Mutation$CreateCustomer$customerCreate$customer.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$firstName = json['firstName'];
    final l$lastName = json['lastName'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCustomer$customerCreate$customer(
      id: (l$id as String),
      firstName: (l$firstName as String?),
      lastName: (l$lastName as String?),
      email: (l$email as String?),
      phone: (l$phone as String?),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$firstName,
      l$lastName,
      l$email,
      l$phone,
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
    if (other is! Mutation$CreateCustomer$customerCreate$customer ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$CreateCustomer$customerCreate$customer
    on Mutation$CreateCustomer$customerCreate$customer {
  CopyWith$Mutation$CreateCustomer$customerCreate$customer<
          Mutation$CreateCustomer$customerCreate$customer>
      get copyWith => CopyWith$Mutation$CreateCustomer$customerCreate$customer(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateCustomer$customerCreate$customer<TRes> {
  factory CopyWith$Mutation$CreateCustomer$customerCreate$customer(
    Mutation$CreateCustomer$customerCreate$customer instance,
    TRes Function(Mutation$CreateCustomer$customerCreate$customer) then,
  ) = _CopyWithImpl$Mutation$CreateCustomer$customerCreate$customer;

  factory CopyWith$Mutation$CreateCustomer$customerCreate$customer.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate$customer;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateCustomer$customerCreate$customer<TRes>
    implements CopyWith$Mutation$CreateCustomer$customerCreate$customer<TRes> {
  _CopyWithImpl$Mutation$CreateCustomer$customerCreate$customer(
    this._instance,
    this._then,
  );

  final Mutation$CreateCustomer$customerCreate$customer _instance;

  final TRes Function(Mutation$CreateCustomer$customerCreate$customer) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateCustomer$customerCreate$customer(
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate$customer<TRes>
    implements CopyWith$Mutation$CreateCustomer$customerCreate$customer<TRes> {
  _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate$customer(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$CreateCustomer$customerCreate$userErrors {
  Mutation$CreateCustomer$customerCreate$userErrors({
    this.field,
    required this.message,
    this.$__typename = 'UserError',
  });

  factory Mutation$CreateCustomer$customerCreate$userErrors.fromJson(
      Map<String, dynamic> json) {
    final l$field = json['field'];
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateCustomer$customerCreate$userErrors(
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
    if (other is! Mutation$CreateCustomer$customerCreate$userErrors ||
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

extension UtilityExtension$Mutation$CreateCustomer$customerCreate$userErrors
    on Mutation$CreateCustomer$customerCreate$userErrors {
  CopyWith$Mutation$CreateCustomer$customerCreate$userErrors<
          Mutation$CreateCustomer$customerCreate$userErrors>
      get copyWith =>
          CopyWith$Mutation$CreateCustomer$customerCreate$userErrors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateCustomer$customerCreate$userErrors<
    TRes> {
  factory CopyWith$Mutation$CreateCustomer$customerCreate$userErrors(
    Mutation$CreateCustomer$customerCreate$userErrors instance,
    TRes Function(Mutation$CreateCustomer$customerCreate$userErrors) then,
  ) = _CopyWithImpl$Mutation$CreateCustomer$customerCreate$userErrors;

  factory CopyWith$Mutation$CreateCustomer$customerCreate$userErrors.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate$userErrors;

  TRes call({
    List<String>? field,
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$CreateCustomer$customerCreate$userErrors<TRes>
    implements
        CopyWith$Mutation$CreateCustomer$customerCreate$userErrors<TRes> {
  _CopyWithImpl$Mutation$CreateCustomer$customerCreate$userErrors(
    this._instance,
    this._then,
  );

  final Mutation$CreateCustomer$customerCreate$userErrors _instance;

  final TRes Function(Mutation$CreateCustomer$customerCreate$userErrors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? field = _undefined,
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateCustomer$customerCreate$userErrors(
        field: field == _undefined ? _instance.field : (field as List<String>?),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate$userErrors<TRes>
    implements
        CopyWith$Mutation$CreateCustomer$customerCreate$userErrors<TRes> {
  _CopyWithStubImpl$Mutation$CreateCustomer$customerCreate$userErrors(
      this._res);

  TRes _res;

  call({
    List<String>? field,
    String? message,
    String? $__typename,
  }) =>
      _res;
}
