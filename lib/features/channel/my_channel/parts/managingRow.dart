import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors/colors.dart';

import '../../../../cores/widgets/ImageButton.dart';
import '../../../../utilities/colors.dart';

class managingRow extends StatelessWidget {
  const managingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: softBlueGreyBackGround,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Manage Videos ',
                style: TextStyle(color: kAssistingColor,fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        Expanded(child: ImageButton(onPressed: (){}, image: 'pen.png', haveColor: true)),
        Expanded(child: ImageButton(onPressed: (){}, image: 'time-watched.png', haveColor: true)),

      ],
    );
  }
}
