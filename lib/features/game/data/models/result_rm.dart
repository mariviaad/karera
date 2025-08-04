import 'package:karera/features/game/data/models/result.dart';

class ResultRm {
  final List<Result> results;
  final int total;

  ResultRm({required this.results, required this.total});

  factory ResultRm.fromJson(Map<String, dynamic> json) {
    return ResultRm(
      results:
          (json["results"] as List<dynamic>?)
              ?.map((item) => Result.fromJson(item))
              .toList() ??
          [],
      total: json["total"],
    );
  }
}
