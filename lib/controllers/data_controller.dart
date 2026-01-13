import 'package:dio/dio.dart' as dio;
import 'package:fintech_application/models/stock.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final dio = dio.Dio();
  dioClient.options.String baseUrl = 'https://www.alphavantage.co';
}

class RemoteServices {
  static var dio = dio.Dio(BaseOptions(baseUrl: 'https://www.alphavantage.co'));
  static Future<AlphaVantageDailyResponse> getStockPrices(String symbol) async {
    final dio = dio.Dio();
    dio.options.baseUrl = 'https://www.alphavantage.co';
    dio.Response response;
    response = await dio.get(
      "/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=UY1WEHB55AHTUNFS",
    );

    


        final response = await dio.get('/query', queryParameters: {
          'function': 'TIME_SERIES_DAILY',
          'symbol': symbol,
          'apikey': 'UY1WEHB55AHTUNFS'
        });
        return AlphaVantageDailyResponse.fromJson(response.data);
      }
    }