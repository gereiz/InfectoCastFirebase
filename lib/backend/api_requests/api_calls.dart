import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start InfectoCast Group Code

class InfectoCastGroup {
  static String getBaseUrl() => 'https://infectoadm.ibitweb.com.br/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static BuscaCall buscaCall = BuscaCall();
  static LoginCall loginCall = LoginCall();
  static ListaCategoriasCall listaCategoriasCall = ListaCategoriasCall();
  static ListaSubCategoriasCall listaSubCategoriasCall =
      ListaSubCategoriasCall();
  static ListaTopicosCall listaTopicosCall = ListaTopicosCall();
  static BlogPostsCall blogPostsCall = BlogPostsCall();
  static ListaPodCastsCall listaPodCastsCall = ListaPodCastsCall();
  static ListaPlanosCall listaPlanosCall = ListaPlanosCall();
  static RegisterCall registerCall = RegisterCall();
  static ListTopicoCall listTopicoCall = ListTopicoCall();
}

class BuscaCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? authToken = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "search": "$search"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'busca',
      apiUrl: '$baseUrl/search',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer',
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

  List<String>? buscaTitle(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? buscaId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? buscaIcon(dynamic response) => (getJsonField(
        response,
        r'''$[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? buscaOrigin(dynamic response) => (getJsonField(
        response,
        r'''$[:].table_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? busca(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '$baseUrl/login',
      callType: ApiCallType.POST,
      headers: {
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
}

class ListaCategoriasCall {
  Future<ApiCallResponse> call({
    String? titulo = '',
    String? icon = '',
    String? authToken = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListaCategorias',
      apiUrl: '$baseUrl/listCategories',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? catId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? catTitle(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? catIcon(dynamic response) => (getJsonField(
        response,
        r'''$[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  dynamic categoria(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class ListaSubCategoriasCall {
  Future<ApiCallResponse> call({
    int? idCategory,
    String? authToken = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id_category": $idCategory
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListaSubCategorias',
      apiUrl: '$baseUrl/listSubCategories',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
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

  List? subcategoria(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class ListaTopicosCall {
  Future<ApiCallResponse> call({
    int? idSubcategory,
    String? authToken = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id_subcategory": $idSubcategory
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListaTopicos',
      apiUrl: '$baseUrl/listTopics',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
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

  List? topicos(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<int>? topicosFree(dynamic response) => (getJsonField(
        response,
        r'''$[:].Free''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? topicosPlanId(dynamic response) => getJsonField(
        response,
        r'''$[:].plan_id''',
        true,
      ) as List?;
  List<int>? topicosPremium(dynamic response) => (getJsonField(
        response,
        r'''$[:].Premium''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? topicosGold(dynamic response) => (getJsonField(
        response,
        r'''$[:].Gold''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? topicosId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? topicosContent(dynamic response) => (getJsonField(
        response,
        r'''$[:].content''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? topicosTitle(dynamic response) => (getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? topicosIdSubCat(dynamic response) => (getJsonField(
        response,
        r'''$[:].id_subcategory''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class BlogPostsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BlogPosts',
      apiUrl: '$baseUrl/listPosts',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? blogPoats(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  String? postTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].title''',
      ));
  String? postImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].image''',
      ));
  String? postContent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].content''',
      ));
  int? postId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
}

class ListaPodCastsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListaPodCasts',
      apiUrl: '$baseUrl/listPodcasts',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic podcast(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  int? podcastId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  String? podcastTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].title''',
      ));
  String? podcastLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].link''',
      ));
}

class ListaPlanosCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ListaPlanos',
      apiUrl: '$baseUrl/listPlans',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic plano(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  List<int>? planoId(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? planoName(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? planoIcon(dynamic response) => (getJsonField(
        response,
        r'''$[:].icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? planoPrice(dynamic response) => (getJsonField(
        response,
        r'''$[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? planoPriceId(dynamic response) => (getJsonField(
        response,
        r'''$[:].price_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? planoIsActive(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_active''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? planoDescription(dynamic response) => (getJsonField(
        response,
        r'''$[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? password = '',
    int? countryId,
    String? phone = '',
    String? cpf = '',
    String? birthday = '',
    String? gender = '',
    String? college = '',
    String? idProfessional = '',
    String? collegeUf = '',
    int? plan,
    int? isAdmin,
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$name",
  "email": "$email",
  "password": "$password",
  "country_id": $countryId,
  "phone": "$phone",
  "plan": $plan,
  "is_admin": $isAdmin
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '$baseUrl/register',
      callType: ApiCallType.POST,
      headers: {
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
}

class ListTopicoCall {
  Future<ApiCallResponse> call({
    String? title = '',
  }) async {
    final baseUrl = InfectoCastGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "title": "$title"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ListTopico',
      apiUrl: '$baseUrl/listTopic',
      callType: ApiCallType.POST,
      headers: {
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
}

/// End InfectoCast Group Code

/// Start StripeSubscription Group Code

class StripeSubscriptionGroup {
  static String getBaseUrl() => 'https://api.stripe.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Authorization':
        'Bearer sk_test_51PQBEHP1Xnjwtxz7zC8QkyEHiiyy99SNQtJsTrb578N7PmHlAGGBXPZJyMowjynDj358vneGS7wZYimGsAPUmNki00IWNN2qzc',
  };
  static CriarCustomerCall criarCustomerCall = CriarCustomerCall();
  static CriarSessaoCheckoutCall criarSessaoCheckoutCall =
      CriarSessaoCheckoutCall();
  static PesquisarAssinaturaCall pesquisarAssinaturaCall =
      PesquisarAssinaturaCall();
}

class CriarCustomerCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = StripeSubscriptionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Criar Customer',
      apiUrl: '$baseUrl/customers',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer sk_test_51PQBEHP1Xnjwtxz7zC8QkyEHiiyy99SNQtJsTrb578N7PmHlAGGBXPZJyMowjynDj358vneGS7wZYimGsAPUmNki00IWNN2qzc',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? stripeCustId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class CriarSessaoCheckoutCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? successUrl = '',
    String? cancelUrl = '',
    String? price = '',
  }) async {
    final baseUrl = StripeSubscriptionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Criar Sessao Checkout',
      apiUrl: '$baseUrl/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer sk_test_51PQBEHP1Xnjwtxz7zC8QkyEHiiyy99SNQtJsTrb578N7PmHlAGGBXPZJyMowjynDj358vneGS7wZYimGsAPUmNki00IWNN2qzc',
      },
      params: {
        'mode': "subscription",
        'success_url': successUrl,
        'cancel_url': cancelUrl,
        'line_items[0][price]': price,
        'line_items[0][quantity]': "1",
        'customer': customer,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class PesquisarAssinaturaCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? customer = '',
  }) async {
    final baseUrl = StripeSubscriptionGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pesquisar Assinatura',
      apiUrl: '$baseUrl/subscriptions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':
            'Bearer sk_test_51PQBEHP1Xnjwtxz7zC8QkyEHiiyy99SNQtJsTrb578N7PmHlAGGBXPZJyMowjynDj358vneGS7wZYimGsAPUmNki00IWNN2qzc',
      },
      params: {
        'id': id,
        'customer': customer,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End StripeSubscription Group Code

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
