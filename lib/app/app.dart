import 'package:flutter/material.dart';
import 'package:markaz_elamal/core/app/connectivity_controller.dart';
import 'package:markaz_elamal/core/common/screens/no_network_view.dart';
import 'package:markaz_elamal/core/common/screens/markaz_elamal.dart';

class ConnectivityCheck extends StatelessWidget {
  const ConnectivityCheck({super.key});

  @override
  Widget build(BuildContext context) {
    ConnectivityController.instance.init();
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (context, value, child) {
        if (value) {
          return const MarkazElamal();
        } else {
          return const NoNetworkView();
        }
      },
    );
  }
}
