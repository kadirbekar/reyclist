import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/init/design/color.dart';

class CircleAvatarIcon extends StatefulWidget {
  CircleAvatarIcon({Key? key}) : super(key: key);

  @override
  State<CircleAvatarIcon> createState() => _CircleAvatarIconState();
}

class _CircleAvatarIconState extends State<CircleAvatarIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          Positioned(
              bottom: 0,
              right: -25,
              child: RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: kcVeryLightGreyColor,
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(15.0),
                shape: const CircleBorder(),
              )),
        ],
      ),
    );
  }
}
