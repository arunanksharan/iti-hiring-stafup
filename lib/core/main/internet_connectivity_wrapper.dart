import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:lottie/lottie.dart';

import '../../utils/fh_images.dart';


class InternetConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const InternetConnectivityWrapper({super.key, required this.child});

  @override
  InternetConnectivityWrapperState createState() =>
      InternetConnectivityWrapperState();
}

class InternetConnectivityWrapperState
    extends State<InternetConnectivityWrapper> {
  late Stream<List<ConnectivityResult>> _connectivityStream;
  ConnectivityResult? _currentStatus;
  Timer? _statusTimer;
  bool _showStatus = true;

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
    _connectivityStream.listen((result) {
      setState(() {
        _currentStatus = result[0];
        _showStatus = true;
        _statusTimer?.cancel(); // Cancel any previous timer
        _statusTimer = Timer(const Duration(seconds: 2), () {
          setState(() {
            _showStatus = false;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ConnectivityResult>>(
      stream: _connectivityStream,
      builder: (context, snapshot) {
        final status =
            snapshot.data?.isNotEmpty == true ? snapshot.data!.first : null;
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              widget.child,
              if (_showStatus)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    // child: SafeArea(
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 4, horizontal: 12),
                    //     decoration: BoxDecoration(
                    //       color: _getStatusColor(_currentStatus),
                    //       borderRadius: BorderRadius.circular(20),
                    //       // boxShadow: [
                    //       //   BoxShadow(
                    //       //     color: Colors.black.withValues(alpha:0.1),
                    //       //     blurRadius: 14,
                    //       //     offset: const Offset(0, 2),
                    //       //   ),
                    //       // ],
                    //     ),
                    //     child: Text(
                    //       _getStatusMessage(_currentStatus),
                    //       textAlign: TextAlign.center,
                    //       style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 13,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              if (_currentStatus == ConnectivityResult.none)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.white.withValues(alpha:0.5),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 250,
                              child: Lottie.asset(noInternetLottie),
                            ),
                            const SizedBox(
                              height: 20,
                            ), // Add spacing between the animation and text
                            const Text(
                              'No Internet Connection',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // Color _getStatusColor(ConnectivityResult? result) {
  //   switch (result) {
  //     case ConnectivityResult.none:
  //       return Colors.red;
  //     case ConnectivityResult.mobile:
  //     case ConnectivityResult.wifi:
  //       return Colors.green;
  //     default:
  //       return Colors.orange;
  //   }
  // }

  // String _getStatusMessage(ConnectivityResult? result) {
  //   switch (result) {
  //     case ConnectivityResult.none:
  //       return 'No internet connection';
  //     case ConnectivityResult.mobile:
  //       return 'Connected to mobile network';
  //     case ConnectivityResult.wifi:
  //       return 'Connected to WiFi';
  //     default:
  //       return 'Checking connection...';
  //   }
  // }

  @override
  void dispose() {
    _statusTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}
