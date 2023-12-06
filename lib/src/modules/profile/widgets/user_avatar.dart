import 'package:MochiChinese/src/constant/assets_manager.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final int type;

  // type 0: guest, 1: free, 2: paid
  const UserAvatar({ this.type = 0, super.key});


  @override
  Widget build(BuildContext context) {
    Color borderColor = Color(0xffcbcbcb);
    List<Color> cardColors = [Color(0xffe5e5e5), Color(0xffcbcbcb)];
    String text = "Guest account";

    switch(type) {
      case 1: {
         borderColor = Color(0xff3ec654);
        cardColors = [Color(0xff53de69), Color(0xff3ec654)];
        break;
      }case 2: {
      borderColor = Color(0xfffb993b);
    cardColors = [Color(0xffffcb08), Color(0xfffdb033)];
        break;
    }
    }
    const double sizeAvatar = 192;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: sizeAvatar,
          height: sizeAvatar,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsManager.images.userAvatar),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(sizeAvatar / 2),
              border: Border.all(color: borderColor, width: 5)),
        ),
        Positioned(
            left: -15,
            bottom: 0,
            child: Container(
              width: sizeAvatar + 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(colors: cardColors),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ))
      ],
    );
  }
}
