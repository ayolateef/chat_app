// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
//
// class CameraScreen extends StatelessWidget {
//   final CameraController cameraController;
//
//   CameraScreen({Key? key, required this.cameraController}) : super(key: key);
//
//   bool isCapturing = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AspectRatio(
//           aspectRatio: cameraController.value.aspectRatio,
//           child: CameraPreview(cameraController),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.camera),
//         onPressed: () async {
//           if (!isCapturing) {
//             try {
//               isCapturing = true;
//               XFile image = await cameraController.takePicture();
//               Navigator.pop(context, image);
//               // Add a delay to prevent immediate capture after a previous one
//               await Future.delayed(const Duration(seconds: 1));
//             } catch (e) {
//               print("Error taking picture: $e");
//             } finally {
//               isCapturing = false;
//             }
//           }
//         },
//       ),
//     );
//   }
// }
