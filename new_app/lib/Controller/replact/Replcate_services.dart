import 'dart:convert';
import 'package:http/http.dart' as http;

class ReplacteServices {
  static Future<void> sendData(
      String URL, String prompt, String negPrompt) async {
    // Replace 'http://your-flask-server.com/process_data' with your Flask server URL
    var url = Uri.parse('http://127.0.0.1:5000/process_data');

    // Replace the JSON data with your actual data
    var jsonData = {
      "URL": "$URL",
      "prompt": "$prompt",
      "neg prompt": "$negPrompt"
    };

    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonData),
      );

      if (response.statusCode == 200) {
        print('Request successful');
        print('Response: ${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }
}
