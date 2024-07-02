// import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

// class ModelViewersss extends StatefulWidget {
//   const ModelViewersss({super.key});

//   @override
//   State<ModelViewersss> createState() => _ModelViewersssState();
// }

// class _ModelViewersssState extends State<ModelViewersss> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(title: const Text('Model Viewer')),
//        body: const ModelViewer(
//           backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
//           src: 'assets/stadi2.glb',
//           alt: 'A 3D model of an astronaut',
//           ar: true,
//           arModes: ['scene-viewer', 'webxr', 'quick-look'],
//           autoRotate: true,
//           iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
//           disableZoom: true,
//         )
//       );
//   }
// }