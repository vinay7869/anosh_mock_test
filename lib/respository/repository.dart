import 'dart:convert';
import 'dart:developer';
import 'package:anosh_mock_test/model/jwellery_model.dart';
import 'package:flutter/services.dart';

class JwelleryRepository {
  static const String jwellerDatafilePath = "assets/data/jwellery_items.json";

  Future<Map<String, dynamic>> _loadJsonFromAssets() async {
    String jsonString = await rootBundle.loadString(jwellerDatafilePath);
    return jsonDecode(jsonString);
  }

  Future<List<Item>> getJwelleryData() async {
    final loadFromAsset = await _loadJsonFromAssets();

    if (loadFromAsset.containsKey('Items')) {
      final items = loadFromAsset['Items'];

      if (items is List) {
        final jwelleryList =
            List.from(items).map((e) => Item.fromJson(e)).toList();
        log(jwelleryList.length.toString());
        return jwelleryList;
      } else {
        return [];
      }
    }
    return [];
  }
}
