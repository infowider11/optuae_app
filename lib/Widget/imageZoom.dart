import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';




class ImageZoomerScreen extends StatefulWidget {
  final String imageUrl;
  ImageZoomerScreen({Key? key,required this.imageUrl}) : super(key: key);

  @override
  State<ImageZoomerScreen> createState() => _ImageZoomerScreenState();
}

class _ImageZoomerScreenState extends State<ImageZoomerScreen> {
  // final String imageUrl = 'https://example.com/your_image.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Center(
            child: PhotoView(
              enablePanAlways: true,
              enableRotation: true,
              // initialScale: PhotoViewComputedScale.covered*0.8,
              imageProvider: NetworkImage(widget.imageUrl),
              backgroundDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
