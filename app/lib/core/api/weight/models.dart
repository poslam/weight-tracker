// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../.gen/core/api/weight/models.freezed.dart';

@freezed
class WeightResponse with _$WeightResponse {
  const factory WeightResponse({
    @JsonKey(name: "result") required WeightAnalysisData analysis,
    @JsonKey(name: "data") required List<WeightData> data,
    required String type,
  }) = _WeightResponse;

  factory WeightResponse.fromJson(Map<String, dynamic> json) =>
      _$WeightResponseFromJson(json);
}

@freezed
class WeightAnalysisData with _$WeightAnalysisData {
  const factory WeightAnalysisData({
    required double start,
    required double end,
    required double max,
    required double min,
    @JsonKey(name: "diff_period") required double diff,
  }) = _WeightAnalysisData;

  factory WeightAnalysisData.fromJson(Map<String, dynamic> json) =>
      _$WeightAnalysisDataFromJson(json);
}

@freezed
class WeightData with _$WeightData {
  const factory WeightData({
    required double id,
    required double weight,
    @JsonKey(name: "user_id") required int userId,
    @JsonKey(name: "created_dt") required DateTime createdDt,
  }) = _WeightData;

  factory WeightData.fromJson(Map<String, dynamic> json) =>
      _$WeightDataFromJson(json);
}
