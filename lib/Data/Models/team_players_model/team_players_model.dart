import 'package:collection/collection.dart';

import 'result.dart';

class TeamPlayersModel {
	int? success;
	List<Result>? result;

	TeamPlayersModel({this.success, this.result});

	factory TeamPlayersModel.fromJson(Map<String, dynamic> json) {
		return TeamPlayersModel(
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
		if (other is! TeamPlayersModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => success.hashCode ^ result.hashCode;
}
