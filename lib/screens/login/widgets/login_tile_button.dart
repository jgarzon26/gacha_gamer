import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginTileButton extends StatelessWidget {
  const LoginTileButton({
    super.key, required this.title, required this.imgSrc, required this.onPressed,
  });

  final String title, imgSrc;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        child: ListTile(
          leading: SvgPicture.asset(
            imgSrc,
            height: 50,
            width: 50,
          ),
          title: Text(
            'Log in with $title'.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
      ),
    );
  }
}