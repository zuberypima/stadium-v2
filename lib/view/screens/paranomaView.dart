// import 'package:flutter/material.dart';
// import 'package:panorama_viewer/panorama_viewer.dart';

// class ParanomaView extends StatefulWidget {
//   const ParanomaView({super.key});

//   @override
//   State<ParanomaView> createState() => _ParanomaViewState();
// }

// bool autoRotate = true;
// bool allowSwipe = true;
// int swipeSensitivity = 1;
// int rotationCount = 0;

// class _ParanomaViewState extends State<ParanomaView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: PanoramaViewer(
//             child: Image.asset('assets/stadipara.jpg'),
//           ),
//         ),
//       ),
//     );
//   }
// }
