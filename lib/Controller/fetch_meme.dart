// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart';

class FetchMeme {
  static fetchNewMeme() async {
    Response response = await get(Uri.parse("https://meme-api.com/gimme"));
    Map bodyData = jsonDecode(response.body);
    // print(bodyData);
    // ignore: avoid_print
    print(bodyData["url"]);
    return bodyData["url"];
  }
}
