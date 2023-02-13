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
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double bodyMargin = size.width / 24;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SolidColors.scaffoldBg,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ),
            Image.asset(
              Assets.images.techblogLogo.path,
              height: size.height / 15,
            ),
            const Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  _getHomePagePoster(size, textTheme),
                  _getTags(size, textTheme, bodyMargin),
                  _getSectionTitle(bodyMargin, textTheme, 'آخرین نوشته ها',
                      Assets.icons.bluePen.path),
                  _getRecentArticles(size, bodyMargin, textTheme),
                  _getSectionTitle(bodyMargin, textTheme, 'آخرین پادکست ها',
                      Assets.icons.microphon.path),
                  _getRecentPodcasts(size, bodyMargin, textTheme)
                ],
              ),
            ),
          ),
          _getBottomNavigation(size)
        ],
      ),
    );
  }

  Widget _getBottomNavigation(Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            height: size.height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: GradiantColors.bottomNav,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_square,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.face,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _getSectionTitle(
      double bodyMargin, TextTheme textTheme, String title, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: bodyMargin,
        vertical: 32,
      ),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(imagePath),
            color: SolidColors.seeMore,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  SizedBox _getRecentArticles(
      Size size, double bodyMargin, TextTheme textTheme) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, bodyMargin, 0),
                    child: Container(
                      height: size.height / 5,
                      width: size.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(blogList[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: GradiantColors.blogPost,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          blogList[index].writer,
                          style: textTheme.headlineSmall,
                        ),
                        Text(
                          blogList[index].views,
                          style: textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width / 2.5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, bodyMargin, 0),
                  child: Text(
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox _getRecentPodcasts(
      Size size, double bodyMargin, TextTheme textTheme) {
    return SizedBox(
      height: size.height / 2.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, bodyMargin, 0),
                child: Container(
                  height: size.height / 5,
                  width: size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(blogList[index].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: GradiantColors.blogPost,
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 2.5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 8, bodyMargin, 0),
                  child: Text(
                    blogList[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Stack _getHomePagePoster(Size size, TextTheme textTheme) {
    return Stack(
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
                      style: textTheme.headlineSmall,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '256',
                        style: textTheme.headlineSmall,
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
                style: textTheme.headlineLarge,
              )
            ],
          ),
        )
      ],
    );
  }

  Padding _getTags(Size size, TextTheme textTheme, double bodyMargin) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, bodyMargin, 0),
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
                          style: textTheme.headlineSmall,
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
    );
  }
}
