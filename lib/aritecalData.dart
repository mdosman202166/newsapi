import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview/aritecal.dart';
import 'package:http/http.dart' as http;

class AritecalData {
  List<Articels> articellist = <Articels>[];
  String url =
      "https://newsapi.org/v2/everything?q=tesla&from=2021-12-05&sortBy=publishedAt&apiKey=430b205f05f34cae9f7323718b7b99c0";

  Future getArticel() async {
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    var jsondata = jsonDecode(response.body);

    print(jsondata);

    if (jsondata['status'] == 'ok') {
      jsondata['articles'].forEach((elemant) {
        Articels articel = Articels(
            elemant['author'] ?? "",
            elemant['title'] ?? "",
            elemant['description'] ?? "",
            elemant['url'] ?? "",
            elemant['urlToImage'] ??
                "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b6e0b072897469.5bf6e79950d23.gif",
            elemant['publishedAt'] ?? "",
            elemant['content'] ?? "");

        articellist.add(articel);
      });
    }
  }
}
