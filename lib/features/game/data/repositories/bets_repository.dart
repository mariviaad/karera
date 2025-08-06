import 'package:karera/core/services/api_client.dart';
import 'package:karera/features/game/data/models/bet_item.dart';
import 'package:karera/features/game/data/models/bet_item_rm.dart';
import 'package:karera/utils/mocks.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class BetsRepository {
  final DioClient _dioClient;

  BetsRepository(this._dioClient);

  Future<BetItemRm> getCurrentBets() async {
    try {
      final response = await _dioClient.post('/api/bet/current-bets');
      return BetItemRm.fromJson(response.data);
    } catch (e) {
      logger.w('API failed, using mock bets instead. Error: $e');
      return BetItemRm.fromJson(mockBets);
    }
  }

  Future<bool> placeBet(BetItem betItem) async {
    try {
      final body = {
        'raceNum': betItem.raceNum,
        'betAmount': betItem.betAmount.toJson(),
        'resultPlacing': {
          'first': betItem.resultPlacing.first,
          'second': betItem.resultPlacing.second,
          'third': betItem.resultPlacing.third,
          'fourth': betItem.resultPlacing.fourth,
          'fifth': betItem.resultPlacing.fifth,
          'sixth': betItem.resultPlacing.sixth,
        },
        'betTotalAmount': betItem.totalBetAmount,
        'totalWinnings': betItem.totalWinnings,
        'totalLosses': betItem.totalLosses,
        'netAmount': betItem.netAmount,
      };

      final response = await _dioClient.post('/api/bet', body: body);
      final data = response.data;
      return data['message'] == 'Success';
    } catch (e) {
      logger.e('Error placing bet: $e');
      throw Exception('Error in placing bet: $e');
    }
  }
}
