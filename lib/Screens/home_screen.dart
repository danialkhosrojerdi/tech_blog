import 'package:flutter/material.dart';
import 'package:tech_blog/constants/color.dart';
import 'package:tech_blog/models/fake_data.dart';

import '../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 40,
                  ),
                  Image.asset(
                    Assets.images.techblogLogo.path,
                    height: size.height / 15,
                  ),
                  const Icon(
                    Icons.search,
                    size: 40,
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: size.width / 1.1,
                  height: size.height / 3.8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    gradient: const LinearGradient(
                      colors: GradiantColors.homePosterCoverGradiant,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    image: DecorationImage(
                      image: Image.asset(
                        Assets.images.posterTest.path,
                      ).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: size.width / 1.1,
                  height: size.height / 3.8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  foregroundDecoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      colors: GradiantColors.homePosterCoverGradiant,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'دانیال خسروجردی - 1 روز پیش',
                              style: textTheme.titleSmall,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '256',
                                style: textTheme.titleSmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        'تیتر دوره در این قسمت قرار می گیرد',
                        style: textTheme.titleLarge,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, size.width / 24, 0),
              child: SizedBox(
                height: 50,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tagList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: GradiantColors.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.tag,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  tagList[index].title,
                                  style: textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
