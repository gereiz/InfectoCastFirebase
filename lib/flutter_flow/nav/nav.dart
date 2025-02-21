import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
          routes: [
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'inicio',
              path: 'inicio',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'inicio')
                  : NavBarPage(
                      initialPage: 'inicio',
                      page: InicioWidget(),
                    ),
            ),
            FFRoute(
              name: 'cadastro',
              path: 'cadastro',
              builder: (context, params) => CadastroWidget(),
            ),
            FFRoute(
              name: 'blog',
              path: 'blog',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'blog')
                  : NavBarPage(
                      initialPage: 'blog',
                      page: BlogWidget(),
                    ),
            ),
            FFRoute(
              name: 'subCategoria',
              path: 'subCategoria',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SubCategoriaWidget(
                  idCategoria: params.getParam(
                    'idCategoria',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['categories'],
                  ),
                  icon: params.getParam(
                    'icon',
                    ParamType.String,
                  ),
                  title: params.getParam(
                    'title',
                    ParamType.String,
                  ),
                ),
              ),
            ),
            FFRoute(
              name: 'topicos',
              path: 'topicos',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: TopicosWidget(
                  title: params.getParam(
                    'title',
                    ParamType.String,
                  ),
                  idSubCategoria: params.getParam(
                    'idSubCategoria',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['subcategories'],
                  ),
                ),
              ),
            ),
            FFRoute(
              name: 'topico',
              path: 'topico',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: TopicoWidget(
                  idTopico: params.getParam(
                    'idTopico',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['topics'],
                  ),
                  title: params.getParam(
                    'title',
                    ParamType.String,
                  ),
                ),
              ),
            ),
            FFRoute(
              name: 'postBlog',
              path: 'postBlog',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: PostBlogWidget(
                  title: params.getParam(
                    'title',
                    ParamType.String,
                  ),
                  image: params.getParam(
                    'image',
                    ParamType.String,
                  ),
                  content: params.getParam(
                    'content',
                    ParamType.String,
                  ),
                ),
              ),
            ),
            FFRoute(
              name: 'podcasts',
              path: 'podcasts',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'podcasts')
                  : NavBarPage(
                      initialPage: 'podcasts',
                      page: PodcastsWidget(),
                    ),
            ),
            FFRoute(
              name: 'calculadoras',
              path: 'calculadoras',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'calculadoras')
                  : NavBarPage(
                      initialPage: 'calculadoras',
                      page: CalculadorasWidget(),
                    ),
            ),
            FFRoute(
              name: 'clearanceDeCreatinina',
              path: 'clearanceDeCreatinina',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: ClearanceDeCreatininaWidget(),
              ),
            ),
            FFRoute(
              name: 'perfil',
              path: 'perfil',
              builder: (context, params) => PerfilWidget(),
            ),
            FFRoute(
              name: 'editPerfil',
              path: 'editPerfil',
              builder: (context, params) => EditPerfilWidget(),
            ),
            FFRoute(
              name: 'suporte',
              path: 'suporte',
              builder: (context, params) => SuporteWidget(),
            ),
            FFRoute(
              name: 'termos',
              path: 'termos',
              builder: (context, params) => TermosWidget(),
            ),
            FFRoute(
              name: 'alteraSenha',
              path: 'alteraSenha',
              builder: (context, params) => AlteraSenhaWidget(),
            ),
            FFRoute(
              name: 'atualizacoesRecentes',
              path: 'atualizacoesRecentes',
              builder: (context, params) => AtualizacoesRecentesWidget(),
            ),
            FFRoute(
              name: 'excluiConta',
              path: 'excluiConta',
              builder: (context, params) => ExcluiContaWidget(),
            ),
            FFRoute(
              name: 'listaPlataformas',
              path: 'listaPlataformas',
              builder: (context, params) => ListaPlataformasWidget(),
            ),
            FFRoute(
              name: 'recuperaSenha',
              path: 'recuperaSenha',
              builder: (context, params) => RecuperaSenhaWidget(),
            ),
            FFRoute(
              name: 'planos',
              path: 'planos',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: PlanosWidget(),
              ),
            ),
            FFRoute(
              name: 'planoContratado',
              path: 'parabens',
              requireAuth: true,
              builder: (context, params) => PlanoContratadoWidget(),
            ),
            FFRoute(
              name: 'buscaGlobal',
              path: 'buscaGlobal',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BuscaGlobalWidget(),
              ),
            ),
            FFRoute(
              name: 'chat_2_Details',
              path: 'chat2Details',
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2DetailsWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'chat_2_main',
              path: 'chat2Main',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: Chat2MainWidget(),
              ),
            ),
            FFRoute(
              name: 'chat_2_InviteUsers',
              path: 'chat2InviteUsers',
              asyncParams: {
                'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => Chat2InviteUsersWidget(
                chatRef: params.getParam(
                  'chatRef',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'image_Details',
              path: 'imageDetails',
              asyncParams: {
                'chatMessage':
                    getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
              },
              builder: (context, params) => ImageDetailsWidget(
                chatMessage: params.getParam(
                  'chatMessage',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'dashboardPlano',
              path: 'dashboardPlano',
              builder: (context, params) => DashboardPlanoWidget(),
            ),
            FFRoute(
              name: 'novaVersao',
              path: 'versao',
              requireAuth: true,
              builder: (context, params) => NovaVersaoWidget(),
            ),
            FFRoute(
              name: 'admin',
              path: 'admin',
              builder: (context, params) => AdminWidget(),
            ),
            FFRoute(
              name: 'buscaGlobalCopy',
              path: 'buscaGlobalCopy',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: BuscaGlobalCopyWidget(),
              ),
            ),
            FFRoute(
              name: 'equationsGlomecular',
              path: 'equationsGlomecular',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: EquationsGlomecularWidget(),
              ),
            ),
            FFRoute(
              name: 'fibrosisIndex',
              path: 'fibrosisIndex',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: FibrosisIndexWidget(),
              ),
            ),
            FFRoute(
              name: 'topicoCopy',
              path: 'topicoCopy',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: TopicoCopyWidget(
                  idTopico: params.getParam(
                    'idTopico',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['topics'],
                  ),
                  title: params.getParam(
                    'title',
                    ParamType.String,
                  ),
                ),
              ),
            ),
            FFRoute(
              name: 'SteroidConversionCalculator',
              path: 'steroidConversionCalculator',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SteroidConversionCalculatorWidget(),
              ),
            ),
            FFRoute(
              name: 'SequentialOrganFailureAssessment',
              path: 'sequentialOrganFailureAssessment',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SequentialOrganFailureAssessmentWidget(),
              ),
            ),
            FFRoute(
              name: 'CURB65Score',
              path: 'CURB65Score',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CURB65ScoreWidget(),
              ),
            ),
            FFRoute(
              name: 'meldNa',
              path: 'meldNa',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: MeldNaWidget(),
              ),
            ),
            FFRoute(
              name: 'meldNaCopy',
              path: 'meldNaCopy',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: MeldNaCopyWidget(),
              ),
            ),
            FFRoute(
              name: 'SIRS',
              path: 'sirs',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SirsWidget(),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
