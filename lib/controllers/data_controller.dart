import 'package:dio/dio.dart' as dio;
import 'package:fintech_application/models/stock.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Rx<AlphaVantageDailyResponse> appleStock = AlphaVantageDailyResponse.fromRawJson("").obs;
  Rx<AlphaVantageDailyResponse> googleStock = AlphaVantageDailyResponse.fromRawJson("").obs;
  Rx<AlphaVantageDailyResponse> amazonStock = AlphaVantageDailyResponse.fromRawJson("").obs;

  Future<void> getStockPrices() async {
    Future.delayed(const Duration(seconds: 2),() async {
      var aaplStock = await RemoteServices.getStockPrices("AAPL");
      googleStock(aaplStock);
    });
    /* var aaplStock = await RemoteServices.getStockPrices("AAPL");
    appleStock(aaplStock); */
    Future.delayed(const Duration(seconds: 2),() async {
      var googlStock = await RemoteServices.getStockPrices("GOOGL");
      googleStock(googlStock);
    });
    /* var googlStock = await RemoteServices.getStockPrices("GOOGL");
    googleStock(googlStock); */
    Future.delayed(const Duration(seconds: 2),() async {
      var amznStock = await RemoteServices.getStockPrices("AMZN");
      amazonStock(amznStock);
    });
    /* var amznStock = await RemoteServices.getStockPrices("AMZN");
    amazonStock(amznStock); */
  }
}

class RemoteServices {
  static var dioClient = dio.Dio(dio.BaseOptions(baseUrl: 'https://www.alphavantage.co'));

  static Future<AlphaVantageDailyResponse> getStockPrices(String symbol) async {
    final client = dio.Dio();
    client.options.baseUrl = 'https://www.alphavantage.co';
    dio.Response response;
    response = await client.get(
      "/query?function=TIME_SERIES_DAILY&symbol=$symbol&apikey=UY1WEHB55AHTUNFS",
    );
    // print(response.data.toString()));

    AlphaVantageDailyResponse data = AlphaVantageDailyResponse.fromJson(response.data);
    // return data;
    print(data.meta.information);
    print(data.meta.symbol);
    var open = data.bars.where((e) => e.open < 300);
    for (int i = 0; i < open.length; ++i) {
      print(open.elementAt(i).open);
    }
    return data;

    


        /*final response = await dio.get('/query', queryParameters: {
          'function': 'TIME_SERIES_DAILY',
          'symbol': symbol,
          'apikey': 'UY1WEHB55AHTUNFS'
        });
        return AlphaVantageDailyResponse.fromJson(response.data);
      } */
    }
}