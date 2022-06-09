
import 'package:machinetest/services/http_services.dart';

import '../model/home_model.dart';

class HomeRepository {
  HttpHelper http = HttpHelper();
  Future<List<HomeModel>> getHome() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/posts");
    return homeModelFromJson(response.body);
  }
}
