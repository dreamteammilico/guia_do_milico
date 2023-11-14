import 'dart:convert';
import 'dart:io';
//import 'dart:html' as html;
import 'dart:typed_data';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ContentSearchRepository extends GetConnect {
  @override
  onInit() async {
    httpClient.baseUrl = "http://34.101.177.193";
    String ticket = await authenticate('admin', 'dreamteam');
    await GetStorage().write('auth_ticket', ticket);
  }

  Future<String> authenticate(String username, String password) async {
    final Uri authUrl = Uri.parse(
        "${httpClient.baseUrl}/alfresco/api/-default-/public/authentication/versions/1/tickets");

    final Map<String, String> authData = {
      "userId": username,
      "password": password,
    };

    final Map<String, String> authHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    try {
      final authResponse = await http.post(authUrl,
          body: jsonEncode(authData), headers: authHeaders);

      if (authResponse.statusCode == 201) {
        return authResponse.body.trim();
      }
    } catch (e) {
      print('Erro na autenticação: $e');
    }

    return "";
  }

  Future<Map<String, dynamic>> searchDocuments(String searchTerm,
      {bool byTag = false}) async {
    String ticketJson = await GetStorage().read('auth_ticket');
    // if (ticketJson.isEmpty) {
    //   GetStorage().write('auth_ticket', authenticate('admin', 'dreamteam'));
    //   ticketJson = GetStorage().read('auth_ticket');
    // }
    Map<String, dynamic> jsonMap = json.decode(ticketJson);
    String ticket = jsonMap['entry']['id'];
    final String ticketBase64 = base64Encode(utf8.encode(ticket));

    final Map<String, String> searchHeaders = {
      "Authorization": "Basic $ticketBase64",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    if (byTag) {
      searchTerm = "+TAG:\"$searchTerm\"";
    }
    final Map<String, dynamic> searchBody = {
      "query": {
        "language": "afts",
        "query": searchTerm,
      },
      "paging": {
        "maxItems": 20,
        "skipCount": 0,
      },
      "highlight": {
        "fragmentSize": 450,
        "snippetCount": 3,
        "prefix": "<strong><i>",
        "postfix": "</i></strong>",
        "mergeContiguous": true,
        "fields": [
          {
            "field": "cm:content",
          },
          {
            "field": "description",
            "prefix": "(",
            "postfix": ")",
          },
        ],
      },
      "localization": {
        "locales": ["pt_BR"]
      },
      "scope": {
        "locations": "nodes",
      },
    };
    Map<String, dynamic> searchResult = <String, dynamic>{};
    try {
      var result = await httpClient.post(
          "/alfresco/api/-default-/public/search/versions/1/search",
          body: jsonEncode(searchBody),
          headers: searchHeaders);
      if (result.hasError) {
        throw Exception("Pegou");
      }
      searchResult = result.body['list'];
      return searchResult;
    } catch (e) {
      throw Exception("Pegou");
    }
  }

  Future<Uint8List?> downloadFile(String id, String nome) async {
    //nome = "$nome.pdf";
    String ticketJson = GetStorage().read('auth_ticket');
    if (ticketJson.isEmpty) {
      throw Exception("Pegou");
    }
    Map<String, dynamic> jsonMap = json.decode(ticketJson);
    String ticket = jsonMap['entry']['id'];
    final String ticketBase64 = base64Encode(utf8.encode(ticket));

    final Map<String, String> headers = {
      HttpHeaders.authorizationHeader: 'Basic $ticketBase64',
    };

    try {
      final String url =
          "${httpClient.baseUrl}/alfresco/api/-default-/public/cmis/versions/1.1/atom/content?id=${id}";

      final response = await http.get(Uri.parse(url), headers: headers);

      return response.bodyBytes;
    } catch (e) {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAllTags() async {
    String ticketJson = GetStorage().read('auth_ticket');
    if (ticketJson.isEmpty) {
      throw Exception("Pegou");
    }
    Map<String, dynamic> jsonMap = json.decode(ticketJson);
    String ticket = jsonMap['entry']['id'];
    final String ticketBase64 = base64Encode(utf8.encode(ticket));

    final Map<String, String> headers = {
      HttpHeaders.authorizationHeader: 'Basic $ticketBase64',
    };

    try {
      final String url =
          "${httpClient.baseUrl}/alfresco/api/-default-/public/alfresco/versions/1/tags?skipCount=0&maxItems=100&include=count";

      final response = await http.get(Uri.parse(url), headers: headers);
      List<Map<String, dynamic>> tagCountList = [];
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> entries = data['list']['entries'];

      for (var entry in entries) {
        final String tag = entry['entry']['tag'];
        final int count = entry['entry']['count'];
        tagCountList.add({'word': tag, 'value': count});
      }
      return tagCountList;
    } catch (e) {
      throw Exception('Falha na solicitação HTTP');
    }
  }
}
