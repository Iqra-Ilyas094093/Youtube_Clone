import 'dart:convert';
import 'dart:developer' as dev;

import 'package:http/http.dart'as http;

class ApiServices{
  final String baseUrl = 'www.googleapis.com';
  static const String apiKey  = 'AIzaSyA3XBQkg-qFAeyq7l7ecn9ZVpoKjORtJfk';

  Future<Map<String ,dynamic>> getApiCalls(String endpoint,{Map<String,dynamic>? params,})async{
    final queryParameter = {
      'key':apiKey,
      ...?params
    };
    final uri = Uri.https(baseUrl,endpoint,queryParameter);
    dev.log('url for $endpoint is $uri');
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data;
    }else{
      dev.log('Unable to hit api with status code${response.statusCode} and ${response.reasonPhrase}');
      throw Exception('Api not hit');
    }
  }

}