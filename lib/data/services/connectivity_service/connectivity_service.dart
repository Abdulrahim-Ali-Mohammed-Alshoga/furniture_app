import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import 'no_connection_snack_bar.dart';

class ConnectivityController extends GetxService {
  StreamController<bool> connectionStatusController = StreamController<bool>();
  final Connectivity _connectivity = Connectivity();
  bool? currentConnectivityStatus = false;
  Function? onHideCallback ;

  @override
  void onInit() async {
    super.onInit();
    await initializeConnectivity();
  }

  initializeConnectivity() async {
    // await checkWhenStreamIsNull();
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _getStatusFromResult(
          result.contains(ConnectivityResult.wifi) ||
              result.contains(ConnectivityResult.mobile));
    });
  }

  bool _getStatusFromResult(bool result, ) {

    result
        ? NoConnectionSnackBar.hideNoConnectionSnackBar(
            onHideCallback: onHideCallback)
        : NoConnectionSnackBar.showNoConnectionSnackBar();
    return currentConnectivityStatus = result;
  }

  //
  // checkWhenStreamIsNull() async {
  //   List<ConnectivityResult> result = await _connectivity.checkConnectivity();
  //   currentConnectivityStatus = result.first == ConnectivityResult.mobile ||
  //       result.first == ConnectivityResult.wifi;
  //
  //   currentConnectivityStatus!
  //       ? NoConnectionSnackBar.hideNoConnectionSnackBar()
  //       : NoConnectionSnackBar.showNoConnectionSnackBar();
  // }

  @override
  onClose() {
    connectionStatusController.close();
    return super.onClose();
  }
}

// class ConnectivityService extends GetxService {
//   final Connectivity _connectivity = Connectivity();
//
//   late StreamSubscription<List<ConnectivityResult>> connectionStatusController;
//
//   late ConnectivityStatus currentConnectivityStatus;
//
//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     await checkWhenStreamIsNull();
//     connectionStatusController =
//         _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
//       _getStatusFromResult(result);
//     }  )  ;
//   }
//
//   Future checkWhenStreamIsNull() async {
//     List<ConnectivityResult> connectivityResult =
//         await (_connectivity.checkConnectivity());
//
//     if (connectivityResult.contains(ConnectivityResult.none)) {
//       currentConnectivityStatus = ConnectivityStatus.offline;
//     } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
//       currentConnectivityStatus = ConnectivityStatus.wiFi;
//     } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
//       currentConnectivityStatus = ConnectivityStatus.mobileData;
//     }
//   }
//
//   @override
//   onClose() {
//     connectionStatusController.cancel();
//     return super.onClose();
//   }
//
//   // Convert from the third part enum to our own enum
//
//   ConnectivityStatus _getStatusFromResult(List<ConnectivityResult> result) {
//     switch (result.first) {
//       case ConnectivityResult.mobile:
//         {
//           NoConnectionSnackBar.hideNoConnectionSnackBar();
//           return currentConnectivityStatus = ConnectivityStatus.mobileData;
//         }
//       case ConnectivityResult.wifi:
//         {
//           NoConnectionSnackBar.hideNoConnectionSnackBar();
//           return currentConnectivityStatus = ConnectivityStatus.wiFi;
//         }
//       case ConnectivityResult.none:
//         {
//           NoConnectionSnackBar.showNoConnectionSnackBar();
//           return currentConnectivityStatus = ConnectivityStatus.offline;
//         }
//       default:
//         return ConnectivityStatus.offline;
//     }
//   }
// }
//
