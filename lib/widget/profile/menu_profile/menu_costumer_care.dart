import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuCostumerCare extends StatelessWidget {
  const MenuCostumerCare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(20),
      // decoration: const BoxDecoration(
      //     color: Colors.white,
      //     // boxShadow: <BoxShadow>[
      //     //   BoxShadow(
      //     //       color: Colors.black26, offset: Offset(0, 5), blurRadius: 4)
      //     // ],
      //     border: Border(
      //         bottom: BorderSide(color: Color(0xFF4E4F54)),
      //         top: BorderSide(color: Color(0xFF4E4F54), width: 0.5))),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Costumer Care 24/7',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.question_circle_fill,
                    color: Color(0xFF4E4F54),
                    size: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pusat Bantuan',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Color(0xFF4E4F54),
                size: 35,
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.headset_mic_rounded,
                    color: Color(0xFF4E4F54),
                    size: 26,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Bantuan Langsung',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Color(0xFF4E4F54),
                size: 35,
              )
            ],
          ),
        ],
      ),
    );
  }
}
