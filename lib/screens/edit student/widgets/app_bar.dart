
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "EDIT STUDENT",
        style: GoogleFonts.alatsi(),
      ),
    );
  }


class EditIconOnImage extends StatelessWidget {
  const EditIconOnImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        right: 70,
        top: 100,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.cyan,
        ));
  }
}