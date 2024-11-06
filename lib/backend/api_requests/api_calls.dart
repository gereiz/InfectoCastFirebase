import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Algolia Group Code

class AlgoliaGroup {
  static String getBaseUrl() => 'https://SWI9KF2RX5-dsn.algolia.net/1';
  static Map<String, String> headers = {
    'X-Algolia-Application-Id': 'SWI9KF2RX5',
    'X-Algolia-API-Key': '4ae6aad5fb931d69411ab337ed900f6b',
    'Content-Type': 'application/json',
  };
  static MultiIndexCall multiIndexCall = MultiIndexCall();
  static TopicsCall topicsCall = TopicsCall();
  static CategoriesCall categoriesCall = CategoriesCall();
  static SubcategoriesCall subcategoriesCall = SubcategoriesCall();
}

class MultiIndexCall {
  Future<ApiCallResponse> call({
    String? titulo = '999999999999',
  }) async {
    final baseUrl = AlgoliaGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "requests": [
    {
      "indexName": "categories",
      "params": "query=$titulo"
    },
    {
      "indexName": "subcategories",
      "params": "query=$titulo"
    },
    {
      "indexName": "topics",
      "params": "query=$titulo"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Multi Index',
      apiUrl: '$baseUrl/indexes/*/queries',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Application-Id': 'SWI9KF2RX5',
        'X-Algolia-API-Key': '4ae6aad5fb931d69411ab337ed900f6b',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].hits[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? index(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].index''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? hits(dynamic response) => getJsonField(
        response,
        r'''$.results[:].hits''',
        true,
      ) as List?;
  List? results(dynamic response) => getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?;
}

class TopicsCall {
  Future<ApiCallResponse> call({
    String? titulo = ' ',
  }) async {
    final baseUrl = AlgoliaGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "params": "query=$titulo"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'topics',
      apiUrl: '$baseUrl/indexes/topics/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Application-Id': 'SWI9KF2RX5',
        'X-Algolia-API-Key': '4ae6aad5fb931d69411ab337ed900f6b',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? hits(dynamic response) => getJsonField(
        response,
        r'''$.hits''',
        true,
      ) as List?;
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CategoriesCall {
  Future<ApiCallResponse> call({
    String? titulo = ' ',
  }) async {
    final baseUrl = AlgoliaGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "params": "query=$titulo"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'categories',
      apiUrl: '$baseUrl/indexes/categories/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Application-Id': 'SWI9KF2RX5',
        'X-Algolia-API-Key': '4ae6aad5fb931d69411ab337ed900f6b',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? hits(dynamic response) => getJsonField(
        response,
        r'''$.hits''',
        true,
      ) as List?;
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SubcategoriesCall {
  Future<ApiCallResponse> call({
    String? titulo = ' ',
  }) async {
    final baseUrl = AlgoliaGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "params": "query=$titulo"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'subcategories',
      apiUrl: '$baseUrl/indexes/subcategories/query',
      callType: ApiCallType.POST,
      headers: {
        'X-Algolia-Application-Id': 'SWI9KF2RX5',
        'X-Algolia-API-Key': '4ae6aad5fb931d69411ab337ed900f6b',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? hits(dynamic response) => getJsonField(
        response,
        r'''$.hits''',
        true,
      ) as List?;
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.hits[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Algolia Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
