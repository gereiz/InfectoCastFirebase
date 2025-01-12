import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/logo_infectoSOS-04.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'login': ParameterData.none(),
  'inicio': ParameterData.none(),
  'cadastro': ParameterData.none(),
  'blog': ParameterData.none(),
  'subCategoria': (data) async => ParameterData(
        allParams: {
          'idCategoria': getParameter<DocumentReference>(data, 'idCategoria'),
          'icon': getParameter<String>(data, 'icon'),
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'topicos': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'idSubCategoria':
              getParameter<DocumentReference>(data, 'idSubCategoria'),
        },
      ),
  'topico': (data) async => ParameterData(
        allParams: {
          'idTopico': getParameter<DocumentReference>(data, 'idTopico'),
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'postBlog': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
          'image': getParameter<String>(data, 'image'),
          'content': getParameter<String>(data, 'content'),
        },
      ),
  'podcasts': ParameterData.none(),
  'calculadoras': ParameterData.none(),
  'clearanceDeCreatinina': ParameterData.none(),
  'perfil': ParameterData.none(),
  'editPerfil': ParameterData.none(),
  'suporte': ParameterData.none(),
  'termos': ParameterData.none(),
  'alteraSenha': ParameterData.none(),
  'atualizacoesRecentes': ParameterData.none(),
  'excluiConta': ParameterData.none(),
  'listaPlataformas': ParameterData.none(),
  'recuperaSenha': ParameterData.none(),
  'planos': ParameterData.none(),
  'planoContratado': ParameterData.none(),
  'buscaGlobal': ParameterData.none(),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_2_main': ParameterData.none(),
  'chat_2_InviteUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
        },
      ),
  'dashboardPlano': ParameterData.none(),
  'novaVersao': ParameterData.none(),
  'admin': ParameterData.none(),
  'buscaGlobalCopy': ParameterData.none(),
  'equationsGlomecular': ParameterData.none(),
  'fibrosisIndex': ParameterData.none(),
  'topicoCopy': (data) async => ParameterData(
        allParams: {
          'idTopico': getParameter<DocumentReference>(data, 'idTopico'),
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'SteroidConversionCalculator': ParameterData.none(),
  'SequentialOrganFailureAssessment': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
