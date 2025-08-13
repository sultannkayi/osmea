class Input$ProductInput {
  factory Input$ProductInput({
    required String title,
    String? description,
    String? handle,
    String? vendor,
    String? productType,
    List<String>? tags,
  }) =>
      Input$ProductInput._({
        r'title': title,
        if (description != null) r'description': description,
        if (handle != null) r'handle': handle,
        if (vendor != null) r'vendor': vendor,
        if (productType != null) r'productType': productType,
        if (tags != null) r'tags': tags,
      });

  Input$ProductInput._(this._$data);

  factory Input$ProductInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$title = data['title'];
    result$data['title'] = (l$title as String);
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('handle')) {
      final l$handle = data['handle'];
      result$data['handle'] = (l$handle as String?);
    }
    if (data.containsKey('vendor')) {
      final l$vendor = data['vendor'];
      result$data['vendor'] = (l$vendor as String?);
    }
    if (data.containsKey('productType')) {
      final l$productType = data['productType'];
      result$data['productType'] = (l$productType as String?);
    }
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$ProductInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get title => (_$data['title'] as String);

  String? get description => (_$data['description'] as String?);

  String? get handle => (_$data['handle'] as String?);

  String? get vendor => (_$data['vendor'] as String?);

  String? get productType => (_$data['productType'] as String?);

  List<String>? get tags => (_$data['tags'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$title = title;
    result$data['title'] = l$title;
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('handle')) {
      final l$handle = handle;
      result$data['handle'] = l$handle;
    }
    if (_$data.containsKey('vendor')) {
      final l$vendor = vendor;
      result$data['vendor'] = l$vendor;
    }
    if (_$data.containsKey('productType')) {
      final l$productType = productType;
      result$data['productType'] = l$productType;
    }
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$ProductInput<Input$ProductInput> get copyWith =>
      CopyWith$Input$ProductInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ProductInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$title = title;
    final lOther$title = other.title;
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$handle = handle;
    final lOther$handle = other.handle;
    if (_$data.containsKey('handle') != other._$data.containsKey('handle')) {
      return false;
    }
    if (l$handle != lOther$handle) {
      return false;
    }
    final l$vendor = vendor;
    final lOther$vendor = other.vendor;
    if (_$data.containsKey('vendor') != other._$data.containsKey('vendor')) {
      return false;
    }
    if (l$vendor != lOther$vendor) {
      return false;
    }
    final l$productType = productType;
    final lOther$productType = other.productType;
    if (_$data.containsKey('productType') !=
        other._$data.containsKey('productType')) {
      return false;
    }
    if (l$productType != lOther$productType) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
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
    } else if (l$tags != lOther$tags) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$title = title;
    final l$description = description;
    final l$handle = handle;
    final l$vendor = vendor;
    final l$productType = productType;
    final l$tags = tags;
    return Object.hashAll([
      l$title,
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('handle') ? l$handle : const {},
      _$data.containsKey('vendor') ? l$vendor : const {},
      _$data.containsKey('productType') ? l$productType : const {},
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProductInput<TRes> {
  factory CopyWith$Input$ProductInput(
    Input$ProductInput instance,
    TRes Function(Input$ProductInput) then,
  ) = _CopyWithImpl$Input$ProductInput;

  factory CopyWith$Input$ProductInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProductInput;

  TRes call({
    String? title,
    String? description,
    String? handle,
    String? vendor,
    String? productType,
    List<String>? tags,
  });
}

class _CopyWithImpl$Input$ProductInput<TRes>
    implements CopyWith$Input$ProductInput<TRes> {
  _CopyWithImpl$Input$ProductInput(
    this._instance,
    this._then,
  );

  final Input$ProductInput _instance;

  final TRes Function(Input$ProductInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? title = _undefined,
    Object? description = _undefined,
    Object? handle = _undefined,
    Object? vendor = _undefined,
    Object? productType = _undefined,
    Object? tags = _undefined,
  }) =>
      _then(Input$ProductInput._({
        ..._instance._$data,
        if (title != _undefined && title != null) 'title': (title as String),
        if (description != _undefined) 'description': (description as String?),
        if (handle != _undefined) 'handle': (handle as String?),
        if (vendor != _undefined) 'vendor': (vendor as String?),
        if (productType != _undefined) 'productType': (productType as String?),
        if (tags != _undefined) 'tags': (tags as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$ProductInput<TRes>
    implements CopyWith$Input$ProductInput<TRes> {
  _CopyWithStubImpl$Input$ProductInput(this._res);

  TRes _res;

  call({
    String? title,
    String? description,
    String? handle,
    String? vendor,
    String? productType,
    List<String>? tags,
  }) =>
      _res;
}

class Input$ProductUpdateInput {
  factory Input$ProductUpdateInput({
    required String id,
    String? title,
    String? description,
    String? handle,
    String? vendor,
    String? productType,
    List<String>? tags,
  }) =>
      Input$ProductUpdateInput._({
        r'id': id,
        if (title != null) r'title': title,
        if (description != null) r'description': description,
        if (handle != null) r'handle': handle,
        if (vendor != null) r'vendor': vendor,
        if (productType != null) r'productType': productType,
        if (tags != null) r'tags': tags,
      });

  Input$ProductUpdateInput._(this._$data);

  factory Input$ProductUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('title')) {
      final l$title = data['title'];
      result$data['title'] = (l$title as String?);
    }
    if (data.containsKey('description')) {
      final l$description = data['description'];
      result$data['description'] = (l$description as String?);
    }
    if (data.containsKey('handle')) {
      final l$handle = data['handle'];
      result$data['handle'] = (l$handle as String?);
    }
    if (data.containsKey('vendor')) {
      final l$vendor = data['vendor'];
      result$data['vendor'] = (l$vendor as String?);
    }
    if (data.containsKey('productType')) {
      final l$productType = data['productType'];
      result$data['productType'] = (l$productType as String?);
    }
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$ProductUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get title => (_$data['title'] as String?);

  String? get description => (_$data['description'] as String?);

  String? get handle => (_$data['handle'] as String?);

  String? get vendor => (_$data['vendor'] as String?);

  String? get productType => (_$data['productType'] as String?);

  List<String>? get tags => (_$data['tags'] as List<String>?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('title')) {
      final l$title = title;
      result$data['title'] = l$title;
    }
    if (_$data.containsKey('description')) {
      final l$description = description;
      result$data['description'] = l$description;
    }
    if (_$data.containsKey('handle')) {
      final l$handle = handle;
      result$data['handle'] = l$handle;
    }
    if (_$data.containsKey('vendor')) {
      final l$vendor = vendor;
      result$data['vendor'] = l$vendor;
    }
    if (_$data.containsKey('productType')) {
      final l$productType = productType;
      result$data['productType'] = l$productType;
    }
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$ProductUpdateInput<Input$ProductUpdateInput> get copyWith =>
      CopyWith$Input$ProductUpdateInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ProductUpdateInput ||
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
    if (_$data.containsKey('title') != other._$data.containsKey('title')) {
      return false;
    }
    if (l$title != lOther$title) {
      return false;
    }
    final l$description = description;
    final lOther$description = other.description;
    if (_$data.containsKey('description') !=
        other._$data.containsKey('description')) {
      return false;
    }
    if (l$description != lOther$description) {
      return false;
    }
    final l$handle = handle;
    final lOther$handle = other.handle;
    if (_$data.containsKey('handle') != other._$data.containsKey('handle')) {
      return false;
    }
    if (l$handle != lOther$handle) {
      return false;
    }
    final l$vendor = vendor;
    final lOther$vendor = other.vendor;
    if (_$data.containsKey('vendor') != other._$data.containsKey('vendor')) {
      return false;
    }
    if (l$vendor != lOther$vendor) {
      return false;
    }
    final l$productType = productType;
    final lOther$productType = other.productType;
    if (_$data.containsKey('productType') !=
        other._$data.containsKey('productType')) {
      return false;
    }
    if (l$productType != lOther$productType) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != null && lOther$tags != null) {
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
    } else if (l$tags != lOther$tags) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$title = title;
    final l$description = description;
    final l$handle = handle;
    final l$vendor = vendor;
    final l$productType = productType;
    final l$tags = tags;
    return Object.hashAll([
      l$id,
      _$data.containsKey('title') ? l$title : const {},
      _$data.containsKey('description') ? l$description : const {},
      _$data.containsKey('handle') ? l$handle : const {},
      _$data.containsKey('vendor') ? l$vendor : const {},
      _$data.containsKey('productType') ? l$productType : const {},
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$ProductUpdateInput<TRes> {
  factory CopyWith$Input$ProductUpdateInput(
    Input$ProductUpdateInput instance,
    TRes Function(Input$ProductUpdateInput) then,
  ) = _CopyWithImpl$Input$ProductUpdateInput;

  factory CopyWith$Input$ProductUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProductUpdateInput;

  TRes call({
    String? id,
    String? title,
    String? description,
    String? handle,
    String? vendor,
    String? productType,
    List<String>? tags,
  });
}

class _CopyWithImpl$Input$ProductUpdateInput<TRes>
    implements CopyWith$Input$ProductUpdateInput<TRes> {
  _CopyWithImpl$Input$ProductUpdateInput(
    this._instance,
    this._then,
  );

  final Input$ProductUpdateInput _instance;

  final TRes Function(Input$ProductUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? title = _undefined,
    Object? description = _undefined,
    Object? handle = _undefined,
    Object? vendor = _undefined,
    Object? productType = _undefined,
    Object? tags = _undefined,
  }) =>
      _then(Input$ProductUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (title != _undefined) 'title': (title as String?),
        if (description != _undefined) 'description': (description as String?),
        if (handle != _undefined) 'handle': (handle as String?),
        if (vendor != _undefined) 'vendor': (vendor as String?),
        if (productType != _undefined) 'productType': (productType as String?),
        if (tags != _undefined) 'tags': (tags as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$ProductUpdateInput<TRes>
    implements CopyWith$Input$ProductUpdateInput<TRes> {
  _CopyWithStubImpl$Input$ProductUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? title,
    String? description,
    String? handle,
    String? vendor,
    String? productType,
    List<String>? tags,
  }) =>
      _res;
}

class Input$ProductDeleteInput {
  factory Input$ProductDeleteInput({required String id}) =>
      Input$ProductDeleteInput._({
        r'id': id,
      });

  Input$ProductDeleteInput._(this._$data);

  factory Input$ProductDeleteInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Input$ProductDeleteInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Input$ProductDeleteInput<Input$ProductDeleteInput> get copyWith =>
      CopyWith$Input$ProductDeleteInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$ProductDeleteInput ||
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

abstract class CopyWith$Input$ProductDeleteInput<TRes> {
  factory CopyWith$Input$ProductDeleteInput(
    Input$ProductDeleteInput instance,
    TRes Function(Input$ProductDeleteInput) then,
  ) = _CopyWithImpl$Input$ProductDeleteInput;

  factory CopyWith$Input$ProductDeleteInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ProductDeleteInput;

  TRes call({String? id});
}

class _CopyWithImpl$Input$ProductDeleteInput<TRes>
    implements CopyWith$Input$ProductDeleteInput<TRes> {
  _CopyWithImpl$Input$ProductDeleteInput(
    this._instance,
    this._then,
  );

  final Input$ProductDeleteInput _instance;

  final TRes Function(Input$ProductDeleteInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) => _then(Input$ProductDeleteInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Input$ProductDeleteInput<TRes>
    implements CopyWith$Input$ProductDeleteInput<TRes> {
  _CopyWithStubImpl$Input$ProductDeleteInput(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Input$CustomerInput {
  factory Input$CustomerInput({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) =>
      Input$CustomerInput._({
        if (firstName != null) r'firstName': firstName,
        if (lastName != null) r'lastName': lastName,
        if (email != null) r'email': email,
        if (phone != null) r'phone': phone,
      });

  Input$CustomerInput._(this._$data);

  factory Input$CustomerInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    return Input$CustomerInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get phone => (_$data['phone'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    return result$data;
  }

  CopyWith$Input$CustomerInput<Input$CustomerInput> get copyWith =>
      CopyWith$Input$CustomerInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CustomerInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$firstName = firstName;
    final lOther$firstName = other.firstName;
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$phone = phone;
    return Object.hashAll([
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('phone') ? l$phone : const {},
    ]);
  }
}

abstract class CopyWith$Input$CustomerInput<TRes> {
  factory CopyWith$Input$CustomerInput(
    Input$CustomerInput instance,
    TRes Function(Input$CustomerInput) then,
  ) = _CopyWithImpl$Input$CustomerInput;

  factory CopyWith$Input$CustomerInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CustomerInput;

  TRes call({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  });
}

class _CopyWithImpl$Input$CustomerInput<TRes>
    implements CopyWith$Input$CustomerInput<TRes> {
  _CopyWithImpl$Input$CustomerInput(
    this._instance,
    this._then,
  );

  final Input$CustomerInput _instance;

  final TRes Function(Input$CustomerInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
  }) =>
      _then(Input$CustomerInput._({
        ..._instance._$data,
        if (firstName != _undefined) 'firstName': (firstName as String?),
        if (lastName != _undefined) 'lastName': (lastName as String?),
        if (email != _undefined) 'email': (email as String?),
        if (phone != _undefined) 'phone': (phone as String?),
      }));
}

class _CopyWithStubImpl$Input$CustomerInput<TRes>
    implements CopyWith$Input$CustomerInput<TRes> {
  _CopyWithStubImpl$Input$CustomerInput(this._res);

  TRes _res;

  call({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) =>
      _res;
}

class Input$CustomerUpdateInput {
  factory Input$CustomerUpdateInput({
    required String id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) =>
      Input$CustomerUpdateInput._({
        r'id': id,
        if (firstName != null) r'firstName': firstName,
        if (lastName != null) r'lastName': lastName,
        if (email != null) r'email': email,
        if (phone != null) r'phone': phone,
      });

  Input$CustomerUpdateInput._(this._$data);

  factory Input$CustomerUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('firstName')) {
      final l$firstName = data['firstName'];
      result$data['firstName'] = (l$firstName as String?);
    }
    if (data.containsKey('lastName')) {
      final l$lastName = data['lastName'];
      result$data['lastName'] = (l$lastName as String?);
    }
    if (data.containsKey('email')) {
      final l$email = data['email'];
      result$data['email'] = (l$email as String?);
    }
    if (data.containsKey('phone')) {
      final l$phone = data['phone'];
      result$data['phone'] = (l$phone as String?);
    }
    return Input$CustomerUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get firstName => (_$data['firstName'] as String?);

  String? get lastName => (_$data['lastName'] as String?);

  String? get email => (_$data['email'] as String?);

  String? get phone => (_$data['phone'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('firstName')) {
      final l$firstName = firstName;
      result$data['firstName'] = l$firstName;
    }
    if (_$data.containsKey('lastName')) {
      final l$lastName = lastName;
      result$data['lastName'] = l$lastName;
    }
    if (_$data.containsKey('email')) {
      final l$email = email;
      result$data['email'] = l$email;
    }
    if (_$data.containsKey('phone')) {
      final l$phone = phone;
      result$data['phone'] = l$phone;
    }
    return result$data;
  }

  CopyWith$Input$CustomerUpdateInput<Input$CustomerUpdateInput> get copyWith =>
      CopyWith$Input$CustomerUpdateInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$CustomerUpdateInput ||
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
    if (_$data.containsKey('firstName') !=
        other._$data.containsKey('firstName')) {
      return false;
    }
    if (l$firstName != lOther$firstName) {
      return false;
    }
    final l$lastName = lastName;
    final lOther$lastName = other.lastName;
    if (_$data.containsKey('lastName') !=
        other._$data.containsKey('lastName')) {
      return false;
    }
    if (l$lastName != lOther$lastName) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (_$data.containsKey('email') != other._$data.containsKey('email')) {
      return false;
    }
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (_$data.containsKey('phone') != other._$data.containsKey('phone')) {
      return false;
    }
    if (l$phone != lOther$phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$firstName = firstName;
    final l$lastName = lastName;
    final l$email = email;
    final l$phone = phone;
    return Object.hashAll([
      l$id,
      _$data.containsKey('firstName') ? l$firstName : const {},
      _$data.containsKey('lastName') ? l$lastName : const {},
      _$data.containsKey('email') ? l$email : const {},
      _$data.containsKey('phone') ? l$phone : const {},
    ]);
  }
}

abstract class CopyWith$Input$CustomerUpdateInput<TRes> {
  factory CopyWith$Input$CustomerUpdateInput(
    Input$CustomerUpdateInput instance,
    TRes Function(Input$CustomerUpdateInput) then,
  ) = _CopyWithImpl$Input$CustomerUpdateInput;

  factory CopyWith$Input$CustomerUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CustomerUpdateInput;

  TRes call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  });
}

class _CopyWithImpl$Input$CustomerUpdateInput<TRes>
    implements CopyWith$Input$CustomerUpdateInput<TRes> {
  _CopyWithImpl$Input$CustomerUpdateInput(
    this._instance,
    this._then,
  );

  final Input$CustomerUpdateInput _instance;

  final TRes Function(Input$CustomerUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? firstName = _undefined,
    Object? lastName = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
  }) =>
      _then(Input$CustomerUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (firstName != _undefined) 'firstName': (firstName as String?),
        if (lastName != _undefined) 'lastName': (lastName as String?),
        if (email != _undefined) 'email': (email as String?),
        if (phone != _undefined) 'phone': (phone as String?),
      }));
}

class _CopyWithStubImpl$Input$CustomerUpdateInput<TRes>
    implements CopyWith$Input$CustomerUpdateInput<TRes> {
  _CopyWithStubImpl$Input$CustomerUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) =>
      _res;
}

class Input$OrderUpdateInput {
  factory Input$OrderUpdateInput({
    required String id,
    String? note,
  }) =>
      Input$OrderUpdateInput._({
        r'id': id,
        if (note != null) r'note': note,
      });

  Input$OrderUpdateInput._(this._$data);

  factory Input$OrderUpdateInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('note')) {
      final l$note = data['note'];
      result$data['note'] = (l$note as String?);
    }
    return Input$OrderUpdateInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);

  String? get note => (_$data['note'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    if (_$data.containsKey('note')) {
      final l$note = note;
      result$data['note'] = l$note;
    }
    return result$data;
  }

  CopyWith$Input$OrderUpdateInput<Input$OrderUpdateInput> get copyWith =>
      CopyWith$Input$OrderUpdateInput(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other is! Input$OrderUpdateInput || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$note = note;
    final lOther$note = other.note;
    if (_$data.containsKey('note') != other._$data.containsKey('note')) {
      return false;
    }
    if (l$note != lOther$note) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$note = note;
    return Object.hashAll([
      l$id,
      _$data.containsKey('note') ? l$note : const {},
    ]);
  }
}

abstract class CopyWith$Input$OrderUpdateInput<TRes> {
  factory CopyWith$Input$OrderUpdateInput(
    Input$OrderUpdateInput instance,
    TRes Function(Input$OrderUpdateInput) then,
  ) = _CopyWithImpl$Input$OrderUpdateInput;

  factory CopyWith$Input$OrderUpdateInput.stub(TRes res) =
      _CopyWithStubImpl$Input$OrderUpdateInput;

  TRes call({
    String? id,
    String? note,
  });
}

class _CopyWithImpl$Input$OrderUpdateInput<TRes>
    implements CopyWith$Input$OrderUpdateInput<TRes> {
  _CopyWithImpl$Input$OrderUpdateInput(
    this._instance,
    this._then,
  );

  final Input$OrderUpdateInput _instance;

  final TRes Function(Input$OrderUpdateInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? note = _undefined,
  }) =>
      _then(Input$OrderUpdateInput._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (note != _undefined) 'note': (note as String?),
      }));
}

class _CopyWithStubImpl$Input$OrderUpdateInput<TRes>
    implements CopyWith$Input$OrderUpdateInput<TRes> {
  _CopyWithStubImpl$Input$OrderUpdateInput(this._res);

  TRes _res;

  call({
    String? id,
    String? note,
  }) =>
      _res;
}

enum Enum$ProductStatus {
  ACTIVE,
  ARCHIVED,
  DRAFT,
  $unknown;

  factory Enum$ProductStatus.fromJson(String value) =>
      fromJson$Enum$ProductStatus(value);

  String toJson() => toJson$Enum$ProductStatus(this);
}

String toJson$Enum$ProductStatus(Enum$ProductStatus e) {
  switch (e) {
    case Enum$ProductStatus.ACTIVE:
      return r'ACTIVE';
    case Enum$ProductStatus.ARCHIVED:
      return r'ARCHIVED';
    case Enum$ProductStatus.DRAFT:
      return r'DRAFT';
    case Enum$ProductStatus.$unknown:
      return r'$unknown';
  }
}

Enum$ProductStatus fromJson$Enum$ProductStatus(String value) {
  switch (value) {
    case r'ACTIVE':
      return Enum$ProductStatus.ACTIVE;
    case r'ARCHIVED':
      return Enum$ProductStatus.ARCHIVED;
    case r'DRAFT':
      return Enum$ProductStatus.DRAFT;
    default:
      return Enum$ProductStatus.$unknown;
  }
}

enum Enum$CurrencyCode {
  USD,
  EUR,
  GBP,
  CAD,
  AUD,
  JPY,
  TRY,
  $unknown;

  factory Enum$CurrencyCode.fromJson(String value) =>
      fromJson$Enum$CurrencyCode(value);

  String toJson() => toJson$Enum$CurrencyCode(this);
}

String toJson$Enum$CurrencyCode(Enum$CurrencyCode e) {
  switch (e) {
    case Enum$CurrencyCode.USD:
      return r'USD';
    case Enum$CurrencyCode.EUR:
      return r'EUR';
    case Enum$CurrencyCode.GBP:
      return r'GBP';
    case Enum$CurrencyCode.CAD:
      return r'CAD';
    case Enum$CurrencyCode.AUD:
      return r'AUD';
    case Enum$CurrencyCode.JPY:
      return r'JPY';
    case Enum$CurrencyCode.TRY:
      return r'TRY';
    case Enum$CurrencyCode.$unknown:
      return r'$unknown';
  }
}

Enum$CurrencyCode fromJson$Enum$CurrencyCode(String value) {
  switch (value) {
    case r'USD':
      return Enum$CurrencyCode.USD;
    case r'EUR':
      return Enum$CurrencyCode.EUR;
    case r'GBP':
      return Enum$CurrencyCode.GBP;
    case r'CAD':
      return Enum$CurrencyCode.CAD;
    case r'AUD':
      return Enum$CurrencyCode.AUD;
    case r'JPY':
      return Enum$CurrencyCode.JPY;
    case r'TRY':
      return Enum$CurrencyCode.TRY;
    default:
      return Enum$CurrencyCode.$unknown;
  }
}

enum Enum$WeightUnit {
  KILOGRAMS,
  GRAMS,
  POUNDS,
  OUNCES,
  $unknown;

  factory Enum$WeightUnit.fromJson(String value) =>
      fromJson$Enum$WeightUnit(value);

  String toJson() => toJson$Enum$WeightUnit(this);
}

String toJson$Enum$WeightUnit(Enum$WeightUnit e) {
  switch (e) {
    case Enum$WeightUnit.KILOGRAMS:
      return r'KILOGRAMS';
    case Enum$WeightUnit.GRAMS:
      return r'GRAMS';
    case Enum$WeightUnit.POUNDS:
      return r'POUNDS';
    case Enum$WeightUnit.OUNCES:
      return r'OUNCES';
    case Enum$WeightUnit.$unknown:
      return r'$unknown';
  }
}

Enum$WeightUnit fromJson$Enum$WeightUnit(String value) {
  switch (value) {
    case r'KILOGRAMS':
      return Enum$WeightUnit.KILOGRAMS;
    case r'GRAMS':
      return Enum$WeightUnit.GRAMS;
    case r'POUNDS':
      return Enum$WeightUnit.POUNDS;
    case r'OUNCES':
      return Enum$WeightUnit.OUNCES;
    default:
      return Enum$WeightUnit.$unknown;
  }
}

enum Enum$__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown;

  factory Enum$__TypeKind.fromJson(String value) =>
      fromJson$Enum$__TypeKind(value);

  String toJson() => toJson$Enum$__TypeKind(this);
}

String toJson$Enum$__TypeKind(Enum$__TypeKind e) {
  switch (e) {
    case Enum$__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum$__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum$__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum$__TypeKind.UNION:
      return r'UNION';
    case Enum$__TypeKind.ENUM:
      return r'ENUM';
    case Enum$__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__TypeKind.LIST:
      return r'LIST';
    case Enum$__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum$__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum$__TypeKind fromJson$Enum$__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum$__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum$__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum$__TypeKind.INTERFACE;
    case r'UNION':
      return Enum$__TypeKind.UNION;
    case r'ENUM':
      return Enum$__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum$__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum$__TypeKind.LIST;
    case r'NON_NULL':
      return Enum$__TypeKind.NON_NULL;
    default:
      return Enum$__TypeKind.$unknown;
  }
}

enum Enum$__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown;

  factory Enum$__DirectiveLocation.fromJson(String value) =>
      fromJson$Enum$__DirectiveLocation(value);

  String toJson() => toJson$Enum$__DirectiveLocation(this);
}

String toJson$Enum$__DirectiveLocation(Enum$__DirectiveLocation e) {
  switch (e) {
    case Enum$__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum$__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum$__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum$__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum$__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum$__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum$__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum$__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum$__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum$__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum$__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum$__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum$__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum$__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum$__DirectiveLocation.UNION:
      return r'UNION';
    case Enum$__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum$__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum$__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum$__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum$__DirectiveLocation fromJson$Enum$__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum$__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum$__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum$__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum$__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum$__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum$__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum$__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum$__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum$__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum$__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum$__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum$__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum$__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum$__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum$__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum$__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum$__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum$__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum$__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum$__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
