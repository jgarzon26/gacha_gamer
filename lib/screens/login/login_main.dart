import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gacha_gamer/constants.dart';
import 'package:gacha_gamer/screens/login/widgets/login_tile_button.dart';

class LoginMain extends StatelessWidget {
  const LoginMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    gotoWelcome() {
      Navigator.pushNamed(context, '/welcome');
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "images/icons/gachagamerlogo.svg",
                height: 100,
                width: 100,
              ),
              Text(
                'GOTCHA',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(flex: 3,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),
                child: Text(
                  'By clicking Log in, you agree with our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              LoginTileButton(
                title: 'Google',
                imgSrc: 'images/icons/google.svg',
                onPressed: gotoWelcome,
              ),
              LoginTileButton(
                title: 'Facebook',
                imgSrc: 'images/icons/facebook.svg',
                onPressed: gotoWelcome,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: gotoWelcome,
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      size: 50,
                    ),
                    title: Text(
                      'Log in with Phone Number'.toUpperCase(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: const Text(
                  'Trouble Logging in?',
                ),
              ),
              const Spacer(),
            ],
          ),
        )
      ),
    );
  }
}


