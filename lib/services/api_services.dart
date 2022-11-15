import 'package:test_suitmedia/data/models/list_user_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_suitmedia/utils/constants.dart';
import 'package:test_suitmedia/utils/failure.dart';

class ApiServices {
  Future<ListUserResponse> getListUser(
      {String page = '1', String perPage = '10'}) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${baseUrl}users?page=$page&per_page=$perPage",
        ),
      );

      if (response.statusCode == 200) {
        return listUserResponseFromJson(response.body);
      } else {
        throw ServerFailure(response.body);
      }
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
