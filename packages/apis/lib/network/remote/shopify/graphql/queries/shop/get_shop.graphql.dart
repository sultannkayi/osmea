import '../../schema.graphql.dart';
import 'package:gql/ast.dart';

class Query$GetShop {
  Query$GetShop({
    this.shop,
    this.$__typename = 'Query',
  });

  factory Query$GetShop.fromJson(Map<String, dynamic> json) {
    final l$shop = json['shop'];
    final l$$__typename = json['__typename'];
    return Query$GetShop(
      shop: l$shop == null
          ? null
          : Query$GetShop$shop.fromJson((l$shop as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetShop$shop? shop;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$shop = shop;
    _resultData['shop'] = l$shop?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$shop = shop;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$shop,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetShop || runtimeType != other.runtimeType) {
      return false;
    }
    final l$shop = shop;
    final lOther$shop = other.shop;
    if (l$shop != lOther$shop) {
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

extension UtilityExtension$Query$GetShop on Query$GetShop {
  CopyWith$Query$GetShop<Query$GetShop> get copyWith => CopyWith$Query$GetShop(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetShop<TRes> {
  factory CopyWith$Query$GetShop(
    Query$GetShop instance,
    TRes Function(Query$GetShop) then,
  ) = _CopyWithImpl$Query$GetShop;

  factory CopyWith$Query$GetShop.stub(TRes res) =
      _CopyWithStubImpl$Query$GetShop;

  TRes call({
    Query$GetShop$shop? shop,
    String? $__typename,
  });
  CopyWith$Query$GetShop$shop<TRes> get shop;
}

class _CopyWithImpl$Query$GetShop<TRes>
    implements CopyWith$Query$GetShop<TRes> {
  _CopyWithImpl$Query$GetShop(
    this._instance,
    this._then,
  );

  final Query$GetShop _instance;

  final TRes Function(Query$GetShop) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? shop = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShop(
        shop:
            shop == _undefined ? _instance.shop : (shop as Query$GetShop$shop?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetShop$shop<TRes> get shop {
    final local$shop = _instance.shop;
    return local$shop == null
        ? CopyWith$Query$GetShop$shop.stub(_then(_instance))
        : CopyWith$Query$GetShop$shop(local$shop, (e) => call(shop: e));
  }
}

class _CopyWithStubImpl$Query$GetShop<TRes>
    implements CopyWith$Query$GetShop<TRes> {
  _CopyWithStubImpl$Query$GetShop(this._res);

  TRes _res;

  call({
    Query$GetShop$shop? shop,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetShop$shop<TRes> get shop =>
      CopyWith$Query$GetShop$shop.stub(_res);
}

const documentNodeQueryGetShop = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetShop'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'shop'),
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
            name: NameNode(value: 'myshopifyDomain'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'plan'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'displayName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'partnerDevelopment'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'shopifyPlus'),
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
            name: NameNode(value: 'currencyCode'),
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
]);

class Query$GetShop$shop {
  Query$GetShop$shop({
    required this.id,
    required this.name,
    required this.email,
    required this.myshopifyDomain,
    required this.plan,
    required this.currencyCode,
    this.$__typename = 'Shop',
  });

  factory Query$GetShop$shop.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$myshopifyDomain = json['myshopifyDomain'];
    final l$plan = json['plan'];
    final l$currencyCode = json['currencyCode'];
    final l$$__typename = json['__typename'];
    return Query$GetShop$shop(
      id: (l$id as String),
      name: (l$name as String),
      email: (l$email as String),
      myshopifyDomain: (l$myshopifyDomain as String),
      plan: Query$GetShop$shop$plan.fromJson((l$plan as Map<String, dynamic>)),
      currencyCode: fromJson$Enum$CurrencyCode((l$currencyCode as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String email;

  final String myshopifyDomain;

  final Query$GetShop$shop$plan plan;

  final Enum$CurrencyCode currencyCode;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$myshopifyDomain = myshopifyDomain;
    _resultData['myshopifyDomain'] = l$myshopifyDomain;
    final l$plan = plan;
    _resultData['plan'] = l$plan.toJson();
    final l$currencyCode = currencyCode;
    _resultData['currencyCode'] = toJson$Enum$CurrencyCode(l$currencyCode);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$myshopifyDomain = myshopifyDomain;
    final l$plan = plan;
    final l$currencyCode = currencyCode;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$email,
      l$myshopifyDomain,
      l$plan,
      l$currencyCode,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetShop$shop || runtimeType != other.runtimeType) {
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
    final l$myshopifyDomain = myshopifyDomain;
    final lOther$myshopifyDomain = other.myshopifyDomain;
    if (l$myshopifyDomain != lOther$myshopifyDomain) {
      return false;
    }
    final l$plan = plan;
    final lOther$plan = other.plan;
    if (l$plan != lOther$plan) {
      return false;
    }
    final l$currencyCode = currencyCode;
    final lOther$currencyCode = other.currencyCode;
    if (l$currencyCode != lOther$currencyCode) {
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

extension UtilityExtension$Query$GetShop$shop on Query$GetShop$shop {
  CopyWith$Query$GetShop$shop<Query$GetShop$shop> get copyWith =>
      CopyWith$Query$GetShop$shop(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetShop$shop<TRes> {
  factory CopyWith$Query$GetShop$shop(
    Query$GetShop$shop instance,
    TRes Function(Query$GetShop$shop) then,
  ) = _CopyWithImpl$Query$GetShop$shop;

  factory CopyWith$Query$GetShop$shop.stub(TRes res) =
      _CopyWithStubImpl$Query$GetShop$shop;

  TRes call({
    String? id,
    String? name,
    String? email,
    String? myshopifyDomain,
    Query$GetShop$shop$plan? plan,
    Enum$CurrencyCode? currencyCode,
    String? $__typename,
  });
  CopyWith$Query$GetShop$shop$plan<TRes> get plan;
}

class _CopyWithImpl$Query$GetShop$shop<TRes>
    implements CopyWith$Query$GetShop$shop<TRes> {
  _CopyWithImpl$Query$GetShop$shop(
    this._instance,
    this._then,
  );

  final Query$GetShop$shop _instance;

  final TRes Function(Query$GetShop$shop) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? myshopifyDomain = _undefined,
    Object? plan = _undefined,
    Object? currencyCode = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShop$shop(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        myshopifyDomain:
            myshopifyDomain == _undefined || myshopifyDomain == null
                ? _instance.myshopifyDomain
                : (myshopifyDomain as String),
        plan: plan == _undefined || plan == null
            ? _instance.plan
            : (plan as Query$GetShop$shop$plan),
        currencyCode: currencyCode == _undefined || currencyCode == null
            ? _instance.currencyCode
            : (currencyCode as Enum$CurrencyCode),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetShop$shop$plan<TRes> get plan {
    final local$plan = _instance.plan;
    return CopyWith$Query$GetShop$shop$plan(local$plan, (e) => call(plan: e));
  }
}

class _CopyWithStubImpl$Query$GetShop$shop<TRes>
    implements CopyWith$Query$GetShop$shop<TRes> {
  _CopyWithStubImpl$Query$GetShop$shop(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? email,
    String? myshopifyDomain,
    Query$GetShop$shop$plan? plan,
    Enum$CurrencyCode? currencyCode,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetShop$shop$plan<TRes> get plan =>
      CopyWith$Query$GetShop$shop$plan.stub(_res);
}

class Query$GetShop$shop$plan {
  Query$GetShop$shop$plan({
    required this.displayName,
    required this.partnerDevelopment,
    required this.shopifyPlus,
    this.$__typename = 'ShopPlan',
  });

  factory Query$GetShop$shop$plan.fromJson(Map<String, dynamic> json) {
    final l$displayName = json['displayName'];
    final l$partnerDevelopment = json['partnerDevelopment'];
    final l$shopifyPlus = json['shopifyPlus'];
    final l$$__typename = json['__typename'];
    return Query$GetShop$shop$plan(
      displayName: (l$displayName as String),
      partnerDevelopment: (l$partnerDevelopment as bool),
      shopifyPlus: (l$shopifyPlus as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String displayName;

  final bool partnerDevelopment;

  final bool shopifyPlus;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$displayName = displayName;
    _resultData['displayName'] = l$displayName;
    final l$partnerDevelopment = partnerDevelopment;
    _resultData['partnerDevelopment'] = l$partnerDevelopment;
    final l$shopifyPlus = shopifyPlus;
    _resultData['shopifyPlus'] = l$shopifyPlus;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$displayName = displayName;
    final l$partnerDevelopment = partnerDevelopment;
    final l$shopifyPlus = shopifyPlus;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$displayName,
      l$partnerDevelopment,
      l$shopifyPlus,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Query$GetShop$shop$plan || runtimeType != other.runtimeType) {
      return false;
    }
    final l$displayName = displayName;
    final lOther$displayName = other.displayName;
    if (l$displayName != lOther$displayName) {
      return false;
    }
    final l$partnerDevelopment = partnerDevelopment;
    final lOther$partnerDevelopment = other.partnerDevelopment;
    if (l$partnerDevelopment != lOther$partnerDevelopment) {
      return false;
    }
    final l$shopifyPlus = shopifyPlus;
    final lOther$shopifyPlus = other.shopifyPlus;
    if (l$shopifyPlus != lOther$shopifyPlus) {
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

extension UtilityExtension$Query$GetShop$shop$plan on Query$GetShop$shop$plan {
  CopyWith$Query$GetShop$shop$plan<Query$GetShop$shop$plan> get copyWith =>
      CopyWith$Query$GetShop$shop$plan(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetShop$shop$plan<TRes> {
  factory CopyWith$Query$GetShop$shop$plan(
    Query$GetShop$shop$plan instance,
    TRes Function(Query$GetShop$shop$plan) then,
  ) = _CopyWithImpl$Query$GetShop$shop$plan;

  factory CopyWith$Query$GetShop$shop$plan.stub(TRes res) =
      _CopyWithStubImpl$Query$GetShop$shop$plan;

  TRes call({
    String? displayName,
    bool? partnerDevelopment,
    bool? shopifyPlus,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetShop$shop$plan<TRes>
    implements CopyWith$Query$GetShop$shop$plan<TRes> {
  _CopyWithImpl$Query$GetShop$shop$plan(
    this._instance,
    this._then,
  );

  final Query$GetShop$shop$plan _instance;

  final TRes Function(Query$GetShop$shop$plan) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? displayName = _undefined,
    Object? partnerDevelopment = _undefined,
    Object? shopifyPlus = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetShop$shop$plan(
        displayName: displayName == _undefined || displayName == null
            ? _instance.displayName
            : (displayName as String),
        partnerDevelopment:
            partnerDevelopment == _undefined || partnerDevelopment == null
                ? _instance.partnerDevelopment
                : (partnerDevelopment as bool),
        shopifyPlus: shopifyPlus == _undefined || shopifyPlus == null
            ? _instance.shopifyPlus
            : (shopifyPlus as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetShop$shop$plan<TRes>
    implements CopyWith$Query$GetShop$shop$plan<TRes> {
  _CopyWithStubImpl$Query$GetShop$shop$plan(this._res);

  TRes _res;

  call({
    String? displayName,
    bool? partnerDevelopment,
    bool? shopifyPlus,
    String? $__typename,
  }) =>
      _res;
}
