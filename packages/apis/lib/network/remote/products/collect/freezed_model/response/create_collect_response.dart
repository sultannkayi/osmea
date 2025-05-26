import 'package:freezed_annotation/freezed_annotation.dart';
import '../collect.dart';

part 'create_collect_response.freezed.dart';
part 'create_collect_response.g.dart';

/// 📦 Create Collect Response Model
/// Response when creating a new collect
@freezed
class CreateCollectResponse with _$CreateCollectResponse {
  const factory CreateCollectResponse({
    /// The newly created collect
    Collect? collect,
  }) = _CreateCollectResponse;

  factory CreateCollectResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCollectResponseFromJson(json);
}
