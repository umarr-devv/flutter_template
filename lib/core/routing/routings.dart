import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Routings {
  init,
  home,
  favorite,
  profile,
  search,
  logs;

  void go(
    BuildContext context, {
    pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
    String? fragment,
  }) {
    context.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
      fragment: fragment,
    );
  }

  Future push(
    BuildContext context, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    context.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  Future replace(
    BuildContext context, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) async {
    context.replaceNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
