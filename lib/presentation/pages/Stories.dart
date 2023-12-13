import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_education/presentation/ColorConst/ColorConst.dart';
import 'package:image_picker/image_picker.dart';

class Stories extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Stories> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _stories = [];

  void _addStory() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _stories.add(image);
      });
    }
  }

  ImageProvider<Object> _buildImage(XFile image) {
    if (kIsWeb) {
      return NetworkImage(image.path);
    } else {
      return FileImage(File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.aftercolor,
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 8.0,
            children: _stories.map((image) {
              return GestureDetector(
                onTap: () => _showStoryViewer(_stories.indexOf(image)),
                child: CircleAvatar(
                  backgroundImage: _buildImage(image),
                  radius: 40.0,
                ),
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStory,
        child: Icon(Icons.add_a_photo),
        backgroundColor: ColorConst.thirdcolor,
      ),
    );
  }

  void _showStoryViewer(int initialIndex) {
    List<ImageProvider<Object>> imageProviders =
        _stories.map((image) => _buildImage(image)).toList();

    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return StoryViewer(
          imageProviders: imageProviders, initialIndex: initialIndex);
    }));
  }
}

class StoryViewer extends StatefulWidget {
  final List<ImageProvider<Object>> imageProviders;
  final int initialIndex;

  StoryViewer({required this.imageProviders, required this.initialIndex});

  @override
  _StoryViewerState createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _nextStory() {
    if (currentIndex < widget.imageProviders.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _previousStory() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  Widget _buildStoryContent() {
    return Image(
      image: widget.imageProviders[currentIndex],
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('История ${currentIndex + 1}/${widget.imageProviders.length}'),
        backgroundColor: ColorConst.endcolor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: _nextStory,
        onDoubleTap: _previousStory,
        child: Center(
          child: _buildStoryContent(),
        ),
      ),
    );
  }
}
