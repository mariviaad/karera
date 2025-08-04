import 'package:equatable/equatable.dart';

class Result extends Equatable {
  final int raceNum;
  final ResultPlacing resultPlacing;
  final int status;

  Result({
    required this.raceNum,
    required this.status,
    required this.resultPlacing,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      raceNum: json["raceNum"],
      resultPlacing: ResultPlacing.fromJson(json["resultPlacing"]),
      status: json["status"],
    );
  }

  @override
  List<Object?> get props => [raceNum, resultPlacing, status];
}

class ResultPlacing extends Equatable {
  final int first;
  final int second;
  final int third;
  final int fourth;
  final int fifth;
  final int sixth;

  ResultPlacing({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
    required this.sixth,
  });

  factory ResultPlacing.fromJson(Map<String, dynamic> json) {
    return ResultPlacing(
      first: json["first"],
      second: json["second"],
      third: json["third"],
      fourth: json["fourth"],
      fifth: json["fifth"],
      sixth: json["sixth"],
    );
  }

  @override
  List<Object?> get props => [first, second, third, fourth, fifth, sixth];
}
