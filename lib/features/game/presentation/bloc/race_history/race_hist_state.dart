part of 'race_hist_bloc.dart';

abstract class ResultHistoryState {}

class InitialResultHistory extends ResultHistoryState {}

class ResultHistoryLoading extends ResultHistoryState {
  ResultHistoryLoading();
}

class ResultHistoryLoadMore extends ResultHistoryState {
  final List<Result> oldData;
  final int total;

  ResultHistoryLoadMore({required this.oldData, required this.total});
}

class ResultHistoryLoaded extends ResultHistoryState {
  final List<Result> resultList;
  final int total;

  ResultHistoryLoaded({required this.resultList, required this.total});
}

class ErrorResultHistory extends ResultHistoryState {
  final String errorMessage;

  ErrorResultHistory({required this.errorMessage});
}
