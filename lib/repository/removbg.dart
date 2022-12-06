import 'package:http/http.dart' as http;

class RemoveBg {
  remove(String image) async {
    final body = {'image_url': image, 'size': 'auto'};
    final headers = {'X-API-Key': 'ZXytrYfW2h9tqzfAZ8uxFEMj'};
    final url = Uri.parse('https://api.remove.bg/v1.0/removebg');

    final response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
            print(response.headers);

    } else {
      throw Exception(
          'Failed to do network requests: Error Code: ${response.statusCode}\nBody: ${response.body}');
    }
  }
}
