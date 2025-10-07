import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class RandomDogImage extends StatefulWidget {
  const RandomDogImage({super.key});

  final String endpoint = 'https://dog.ceo/api/breeds/image/random';

  @override
  State<RandomDogImage> createState() => _RandomDogImageState();
}

class _RandomDogImageState extends State<RandomDogImage> {
  String _dogImageUrl = '';
  int _likes = 0;
  int _dislikes = 0;

  Future<String> getRandomDogURL() async {
    var endpoint = Uri.parse(widget.endpoint);
    var response = await http.get(endpoint);
    return jsonDecode(response.body)['message'];
  }

  @override
  void initState() {
    super.initState();

    getTemporaryDirectory().then((dir) {
      final file = File('${dir.path}/last_seen_dog.jpg');
      if (file.existsSync()) {
        setState(() {
          _dogImageUrl = '${dir.path}/last_seen_dog.jpg';
        });
      } else {
        // Get a random dog on load
        _refreshDog();
      }
    });
  }

  void _incrementCounter(bool isLikes) {
    setState(() {
      if (isLikes) {
        _likes++;
      } else {
        _dislikes++;
      }
    });
    _refreshDog();
  }

  void _refreshDog() {
    setState(() {
      _dogImageUrl = '';
    });
    getRandomDogURL().then((url) {
      if (mounted) {
        setState(() {
          _dogImageUrl = url;
        });
      }
    });
  }

  void _saveImage(String url) async {
    // Get the temp directory
    final dir = await getTemporaryDirectory();

    // Create the file path
    final filePath = '${dir.path}/last_seen_dog.jpg';

    // Get the image from th einternet
    final response = await http.get(Uri.parse(url));

    // Write the image to the file path
    final file = File(filePath);
    file.writeAsBytesSync(response.bodyBytes);
  }

  Widget _buildImage() {
    Widget childWidget;

    if (_dogImageUrl.startsWith('http')) {
      // Netwark image url
      childWidget = Image.network(_dogImageUrl);

      // Update the local cache with the dog image from the network
      _saveImage(_dogImageUrl);
    } else {
      // Local image url
      childWidget = Image.file(File(_dogImageUrl));
    }

    return _dogImageUrl.isEmpty
        ? CircularProgressIndicator()
        : GestureDetector(
            onDoubleTap: () {
              _incrementCounter(true);
            },
            onLongPress: () {
              _incrementCounter(false);
            },
            child: childWidget,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Likes: $_likes', style: TextStyle(fontSize: 24)),
            Text('Dislikes: $_dislikes', style: TextStyle(fontSize: 24)),
          ],
        ),
        ElevatedButton(
          onPressed: _refreshDog,
          child: Text('Get me a new dog please'),
        ),
      ],
    );
  }
}
