import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pepcorns/coin_model.dart';

class CoinController extends GetxController {
  RxBool isloading = true.obs;
  RxList<Coin> coinList = <Coin>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
  }

  fetchCoins() async {
    try {
      isloading(true);
      var response = await http.get(Uri.parse(
          "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en"));
      List<Coin> coins = coinFromJson(response.body);
      coinList.value = coins;
    } finally {
      isloading(false);
    }
  }
}
