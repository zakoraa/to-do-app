import 'package:flutter/material.dart';
import 'package:todoapp/module/home/widgets/app_bar_home.dart';
import 'package:todoapp/module/home/widgets/completed.dart';
import 'package:todoapp/module/home/widgets/incomplete.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: HomeAppBar.heightAppBar + 20),
                    Incomplete(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Completed()
                  ],
                ),
              ),
              HomeAppBar()
            ],
          ),
        ),
      ),
    );
  }
}
