import 'package:flutter/material.dart';

import '../../../../../shared/services/service.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    CustomMessaging.instance.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
