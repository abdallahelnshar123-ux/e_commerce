import 'package:json_annotation/json_annotation.dart';

part 'update_product_count_dto.g.dart';

@JsonSerializable()
class UpdateProductCountDto {
  @JsonKey(name: "count")
  final String? count;

  UpdateProductCountDto ({
    this.count,
  });

  factory UpdateProductCountDto.fromJson(Map<String, dynamic> json) {
    return _$UpdateProductCountDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateProductCountDtoToJson(this);
  }
}


