import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:habit/constant/size.dart';
import 'package:habit/constant/style.dart';
import 'package:habit/provider/common_provider.dart';
import 'package:habit/utilry/log/log.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRscanPage extends ConsumerStatefulWidget {
  const QRscanPage({Key? key}) : super(key: key);

  @override
  ConsumerState<QRscanPage> createState() => _QRscanState();
}

class _QRscanState extends ConsumerState<QRscanPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool isFlash = false;
  bool isScan = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //監視
    ref.listen(qrResultProvider, (previous, next) {
      pi(next?.code ?? 'code');
      if (mounted && previous == null && previous?.code != next?.code) {
        pi(next?.code ?? 'code');
        // Navigator.of(context).pop(next);

        controller!.pauseCamera();

        showModalBottomSheet(
          context: context,
          isDismissible: false,
          enableDrag: false,
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: S3),
                  child: Text('UUID : ${next?.code}'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: S3),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            ref.read(qrResultProvider.notifier).update((_) => null);
                            controller!.resumeCamera();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            ref.read(qrResultProvider.notifier).update((_) => null);
                            controller!.resumeCamera();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      }
    });

    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            _buildQrView(context),
            Positioned(
              top: 35,
              left: 15,
              child: IconButton(
                icon: const Icon(
                  Icons.clear_outlined,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              bottom: 85,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FutureBuilder(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      return ClipRRect(
                        borderRadius: RADIUS_ALL,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(
                              snapshot.data ?? false ? Icons.flash_off : Icons.flash_on,
                            ),
                            onPressed: () async {
                              await controller?.toggleFlash();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  ClipRRect(
                    borderRadius: RADIUS_ALL_L,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.white10,
                            ),
                          ),
                          onPressed: _toggleScan,
                          icon: Icon(
                            isScan ? Icons.play_arrow : Icons.pause,
                            color: Colors.white,
                          ),
                          label: Text(
                            isScan ? 'SCAN' : 'STOP',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: controller?.getCameraInfo(),
                    builder: (context, snapshot) {
                      return ClipRRect(
                        borderRadius: RADIUS_ALL_L,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: IconButton(
                            color: Colors.white,
                            icon: const Icon(Icons.sync),
                            onPressed: () async {
                              await controller?.flipCamera();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.width * .85;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 8,
        borderLength: 30,
        borderWidth: 6,
        overlayColor: Colors.black45,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      ref.read(qrResultProvider.notifier).update((_) => scanData);

      setState(() {
        result = scanData;
      });
    });
  }

  _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  _toggleScan() async {
    if (isScan) {
      await controller!.resumeCamera();
    } else {
      await controller!.pauseCamera();
    }

    setState(() => isScan = !isScan);
  }
}
