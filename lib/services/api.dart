import 'package:backb/modal/modal.dart';
import 'package:http/http.dart' as http;

class API {
  Future<Modal> getData() async {
    var client = http.Client();
    var modal;
// url is the base url for the api
// token is the Barear for the api
    const url =
        "https://fuddo.backb.in/api/v1/restaurant/10.025262804034076/76.30770989631989?limit=10&page=1";
    const token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxNzI2MDU0OTI1ZTM0MmE0ZDBkMzM4MiIsImlhdCI6MTYzNzEyODYzNiwiZXhwIjoxNjM5NzIwNjM2fQ.PHUF-vXm5lHOObrMBpGASoewBlFTOWsQhd3y8MbV9C4";
    final response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
// checking if the statuscode is 200 returning the data
    try {
      if (response.statusCode == 200) {
        print(response.body);
        var jsonString = response.body;
        modal = modalFromMap(jsonString);
        return modal;
      } else {
        print("NOT 200");
      }
      return modal;
    } on Exception catch (_) {
      print("throwing new error");
      throw Exception("Error on server");
    }
  }
}
