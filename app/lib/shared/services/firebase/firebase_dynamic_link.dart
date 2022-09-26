import 'dart:developer' as dev;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';

class CustomDynamicLink {
  const CustomDynamicLink._();

  /// Singleton instance of CustomDynamicLink Helper
  static CustomDynamicLink? _instance;

  /// Get instance of this class
  static CustomDynamicLink get instance =>
      _instance ??= const CustomDynamicLink._();

  static FirebaseDynamicLinks? _dynamicLinks;

  static Future<void> initialize() async {
    _dynamicLinks ??= FirebaseDynamicLinks.instance;
  }

  /// Creates a Dynamic Link from the parameters.
  Future<Uri> createLink({
    required String uri,
    required String uriPrefix,
    bool shorLink = false,
  }) async {
    final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(uri),
      uriPrefix: uriPrefix,
      androidParameters:
          const AndroidParameters(packageName: 'com.example.rental'),
      iosParameters:
          IOSParameters(bundleId: Firebase.app().options.iosBundleId!),
    );

    if (shorLink) {
      final ShortDynamicLink shortDynamicLink =
          await _dynamicLinks!.buildShortLink(dynamicLinkParams);
      _logDynamicLink(dynamicLink: shortDynamicLink);
      return shortDynamicLink.shortUrl;
    }

    final Uri link = await _dynamicLinks!.buildLink(dynamicLinkParams);
    _logDynamicLink(dynamicLink: link);
    return link;
  }

  /// Exact Dynamic Link was used to open the application
  Future<PendingDynamicLinkData?> getDynamicLink(String link) async {
    final PendingDynamicLinkData? dynamicLink =
        await _dynamicLinks!.getDynamicLink(Uri.parse(link));
    _logDynamicLink(dynamicLink: dynamicLink);
    return dynamicLink;
  }

  void _logDynamicLink({required Object? dynamicLink}) {
    if (kDebugMode) {
      dev.log(
          name: '$runtimeType',
          '\x1B[35mDynamic Link(${dynamicLink.runtimeType}): $dynamicLink');
    }
  }
}
