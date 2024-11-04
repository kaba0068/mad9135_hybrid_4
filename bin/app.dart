import 'package:http/http.dart' as http;
import "dart:convert";

void main(List<String> arguments) async {
  var url = Uri.https("random-data-api.com", "api/v2/users", {'size': "10"});

  var response = await http.get(url);

  try {
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body) as List<dynamic>;

      for (int i = 0; i < jsonData.length; i++) {
        print(
            "${jsonData[i]["uid"]}: ${jsonData[i]["first_name"]} ${jsonData[i]["last_name"]}");
      }
    } else {
      throw ("Invalid response type");
    }
  } catch (e) {
    print('Error: $e');
  }
}
