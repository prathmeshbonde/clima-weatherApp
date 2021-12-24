import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      String data = response.body;

      //print(data);      prints json file format
      /*print(jsonDecode(data)['coord']['lon']);

      var desc = jsonDecode(data)['weather'][0]['description'];
      print(desc);*/
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}