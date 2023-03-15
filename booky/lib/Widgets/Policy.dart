import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  const Policy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            "Policy",
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
