import 'dart:convert';
import 'package:http/http.dart' as http;

class PixabayService {
  // YOUR PIXABAY API KEY 💚
  static const String apiKey = '53475872-0a2ace6f0c60dad149c32dc37';

  // Search for images
  static Future<List<String>> searchImages(String query, {int count = 6}) async {
    final url = Uri.parse(
      'https://pixabay.com/api/?key=$apiKey&q=${Uri.encodeComponent(query)}&image_type=photo&per_page=$count',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final hits = data['hits'] as List;
      return hits.map((hit) => hit['webformatURL'] as String).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
