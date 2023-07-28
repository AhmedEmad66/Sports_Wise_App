import 'package:collection/collection.dart';

import 'result.dart';

class AvailableCountriesModel {
	int? success;
	List<Result>? result;

	AvailableCountriesModel({this.success, this.result});

	factory AvailableCountriesModel.fromJson(Map<String, dynamic> json) {
		return AvailableCountriesModel(
			success: json['success'] as int?,
			result: (json['result'] as List<dynamic>?)
						?.map((e) => Result.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'result': result?.map((e) => e.toJson()).toList(),
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! AvailableCountriesModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => success.hashCode ^ result.hashCode;
}
