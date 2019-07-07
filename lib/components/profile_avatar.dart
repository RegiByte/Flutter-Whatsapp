import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String url;
  final double size;

  ProfileAvatar({this.url, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.0,
          color: Colors.grey[200],
        ),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: url,
          placeholder: (context, url) {
            return Image.asset('assets/empty.png');
          },
          errorWidget: (context, url, message) {
            return Image.asset('assets/empty.png');
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
