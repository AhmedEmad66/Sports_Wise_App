import 'package:collection/collection.dart';

import 'result.dart';

class LeagueTeamsModel {
	int? success;
	List<Result>? result;

	LeagueTeamsModel({this.success, this.result});

	factory LeagueTeamsModel.fromJson(Map<String, dynamic> json) {
		return LeagueTeamsModel(
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
		if (other is! LeagueTeamsModel) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => success.hashCode ^ result.hashCode;
}
