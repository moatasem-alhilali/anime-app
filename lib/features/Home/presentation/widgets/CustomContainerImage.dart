import 'package:flutter/material.dart';

class CustomContainerImage extends StatelessWidget {
  CustomContainerImage({
    super.key,
    this.child,
    this.alignment,
    this.image,
  });
  Widget? child;
  Alignment? alignment;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image!,
              ),
            ),
          ),
        ),
        Container(
          // margin: EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          alignment: alignment ?? Alignment.bottomCenter,
          decoration: MyImageDecoration(),
          child: child,
        ),
      ],
    );
  }

  BoxDecoration MyImageDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          Colors.grey.withOpacity(0.0),
          Colors.black,
        ],
        stops: [0.0, 1.0],
      ),
    );
  }
}
