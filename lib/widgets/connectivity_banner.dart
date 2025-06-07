// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'network_banner.dart'; // Import your widget

// class ConnectivityBanner extends StatefulWidget {
//   const ConnectivityBanner({Key? key}) : super(key: key);

//   @override
//   State<ConnectivityBanner> createState() => _ConnectivityBannerState();
// }

// class _ConnectivityBannerState extends State<ConnectivityBanner> {
//   late StreamSubscription<ConnectivityResult> _subscription;
//   bool _isOnline = true;

//   @override
//   void initState() {
//     super.initState();
//     _subscription = Connectivity().onConnectivityChanged.listen((result) {
//       final isOnline = result != ConnectivityResult.none;
//       if (mounted) {
//         setState(() {
//           _isOnline = isOnline;
//         });
//       }
//     });
//     // Initial check
//     Connectivity().checkConnectivity().then((result) {
//       final isOnline = result != ConnectivityResult.none;
//       if (mounted) {
//         setState(() {
//           _isOnline = isOnline;
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return !_isOnline
//         ? NetworkBanner(
//             message: 'No Internet Connection',
//             isOnline: false,
//           )
//         : SizedBox.shrink();
//   }
// }
