// To parse this JSON data, do
//
//     final retrieveProductCustomFieldNameResponse = retrieveProductCustomFieldNameResponseFromJson(jsonString);

import 'dart:convert';

List<String> retrieveProductCustomFieldNameResponseFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String retrieveProductCustomFieldNameResponseToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
