
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/global_widgets/qr/scanner_button_widgets.dart';
import 'package:furniture_app/global_widgets/qr/scanner_error_widget.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerWidget extends StatefulWidget {
  const MobileScannerWidget({super.key});

  static const String route = '/MobileScannerWidget';

  @override
  State<MobileScannerWidget> createState() => _MobileScannerWidgetState();
}

class _MobileScannerWidgetState extends State<MobileScannerWidget> {
  final MobileScannerController controller = MobileScannerController(
  formats: [BarcodeFormat.upcA], // تأكد من تضمين التنسيقات المطلوبة

  );
  bool isAllowBack = true;

  @override
  Widget build(BuildContext context) {


    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 300.w,
      height: 180.h,
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          return Get.back(result: {'BarCodeValue': '-1'});
        }
      },

      child: Scaffold(

        body: Stack(
          fit: StackFit.expand,
          children: [
            MobileScanner(
              fit: BoxFit.fill,
              controller: controller,

              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  if (isAllowBack) {
                    Get.back(result: {'BarCodeValue': barcode.displayValue});
                    isAllowBack = false;
                  }
                }
              },
              errorBuilder: (context, error, child) {
                return ScannerErrorWidget(error: error);
              },
              // overlayBuilder: (context, constraints) {
              //   return Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Align(
              //       alignment: Alignment.topCenter,
              //       child: ScannedBarcodeLabel(barcodes: controller.barcodes),
              //     ),
              //   );
              // },
            ),
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, value, child) {
                // Not ready.
                if (!value.isInitialized ||
                    !value.isRunning ||
                    value.error != null ||
                    value.size.isEmpty) {
                  return const SizedBox();
                }

                return CustomPaint(
                  painter: ScannerOverlay(scanWindow: scanWindow),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: controller,
                      builder: (context, state, child) {
                        if (!state.isInitialized || !state.isRunning) {
                          return const SizedBox.shrink();
                        }
                        return IconButton(
                          color: Colors.white,
                          iconSize: 40.0,
                          icon: const Icon(Icons.first_page_outlined),
                          onPressed: () async {
                            Get.back(result: {'BarCodeValue': '-1'});
                          },
                        );
                      },
                    ),
                    ToggleFlashlightButton(controller: controller),
                    SwitchCameraButton(controller: controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}

class ScannerOverlay extends CustomPainter {
  const ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: use `Offset.zero & size` instead of Rect.largest
    // we need to pass the size to the custom paint widget
    final backgroundPath = Path()..addRect(Rect.largest);
    final cutoutPath = Path()..addRect(scanWindow);
    // final cutoutPath = Path()
    //   ..addRRect(
    //     RRect.fromRectAndCorners(
    //       scanWindow,
    //       topLeft: Radius.circular(borderRadius),
    //       topRight: Radius.circular(borderRadius),
    //       bottomLeft: Radius.circular(borderRadius),
    //       bottomRight: Radius.circular(borderRadius),
    //     ),
    //   );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(.3)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOut;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(10.0.r),
      topRight: Radius.circular(10.r),
      bottomLeft: Radius.circular(10.0.r),
      bottomRight: Radius.circular(10.0.r),
    );

    // First, draw the background,
    // with a cutout area that is a bit larger than the scan window.
    // Finally, draw the scan window itself.

    canvas.drawRRect(borderRect, borderPaint);

    canvas.drawPath(backgroundWithCutout, backgroundPaint);
  }

  @override
  bool shouldRepaint(ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}

// MobileScanner(
// fit: BoxFit.contain,
// scanWindow:scanWindow,
// overlayBuilder: (context, constraints) {
// return Align(
// alignment: Alignment.bottomCenter,
// child:ScannedBar ,
// );
// },
// onDetect: (capture) {
// final List<Barcode> barcodes = capture.barcodes;
// for (final barcode in barcodes) {
// Navigator.canPop(context)
// ? Navigator.pop<String>(
// context, barcode.rawValue ?? 'No data in QR')
//     : null;
// },
//
// }),
