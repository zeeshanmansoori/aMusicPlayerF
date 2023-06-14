import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerControllersWidget extends StatelessWidget {
  const PlayerControllersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).colorScheme.primary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.skip_previous),
        ),
        MaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            color: primaryColor,
            padding: const EdgeInsets.all(15),
            child: const Icon(
              Icons.play_arrow,
              size: 30,
              color: Colors.white,
            )),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.skip_next),
        ),
      ],
    );
  }
}
