import '../../config.dart';

class CommonImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? image;
  const CommonImage({super.key, this.height, this.width, this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image!,
      width: height,
      height: width,
      fit: BoxFit.fill,
    );
  }
}
