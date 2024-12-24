// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VideoPlayerScreen(videoUrl: 'your_video_url_here'),
//     );
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;

//   VideoPlayerScreen({required this.videoUrl});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/photo/flowingwater.mp4')
//       ..initialize().then((_) {
//         setState(() {
//           _isInitialized = true;
//         });
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Video Player')),
//       body: _isInitialized
//           ? Stack(
//               alignment: Alignment.center,
//               children: [
//                 AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: Icon(_controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow),
//                       onPressed: () {
//                         setState(() {
//                           _controller.value.isPlaying
//                               ? _controller.pause()
//                               : _controller.play();
//                         });
//                       },
//                     )
//                   ],
//                 ),
//               ],
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
