import 'dart:convert';

import 'package:dictionary/controller/controller.dart';
import 'package:dictionary/model/model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FetchData {
  Future getData(word) async {
    var url = "https://api.dictionaryapi.dev/api/v2/entries/en_US/$word";

    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      var controller = Get.put(Dataget());

      controller.updateData(dictionaryFromJson(response.body));

      return response.body;
    } else {
      throw response.body;
    }
  }
}
