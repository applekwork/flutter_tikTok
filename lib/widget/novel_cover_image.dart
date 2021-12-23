import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NovelCoverImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  const NovelCoverImage(
      {Key? key, required this.imageUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child:
      Image.network(imageUrl,width: width,height: height,fit: BoxFit.cover));

       /* CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
          ),
        ),
        // placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ), */
      /* CachedNetworkImage(
        width: width,
        height: height,
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ); */
      // decoration: BoxDecoration(border: Border.all(color: ColorPlate.paper)),
      //
    }
}
