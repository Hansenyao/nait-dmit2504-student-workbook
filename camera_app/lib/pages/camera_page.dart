import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.cameraDescription});
  final CameraDescription cameraDescription;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      widget.cameraDescription,
      ResolutionPreset.max,
    );

    _controller
        .initialize()
        .then((_) {
          if (!mounted) return;
          // Once the controller is initialized, it's good practice to rerender the screen to avoid any wonkiness
          setState(() {});
        })
        .catchError((e) {
          // Here is where you handle errors with the camera permission denied
          if (e is CameraException) {
            if (e.code == "CamerAccessDenied") {}
          }
          // Handle other exceptions here
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<XFile?> takePicture() async {
    // First we make sure we're not currently in the process of taking a picture
    if (_controller.value.isTakingPicture) return null;

    try {
      var file = await _controller.takePicture();
      return file;
    } catch (e) {
      // If something goes wrong you can decide how to handle that.
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera Page')),
      body: Center(
        child: Column(children: [Expanded(child: CameraPreview(_controller))]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (mounted) {
            var file = await takePicture();
            if (file != null && mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Picture saved to ${file.path}")),
              );
            }
            // It only saves to the cache for now, so maybe in the futrue save it to a more secure location
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
