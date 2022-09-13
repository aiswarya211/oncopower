import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oncopower/base/base_page.dart';

import 'package:oncopower/features/feed/feed_page_view_model.dart';

import 'package:oncopower/molecules/custom_text.dart';
import 'package:oncopower/utils/color_resources.dart';
import 'package:oncopower/utils/image_resources.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeedPageView extends BasePageViewWidget<FeedPageViewModel> {
  const FeedPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);
  @override
  Widget build(BuildContext context, FeedPageViewModel model) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: ColorResource.colorffffff,
            toolbarHeight: 90,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            ),
            actions: [
              Container(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Row(
                  children: [
                    // if (feedScreenCubit.user.media != null)
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(right: 20, top: 18, left: 12),
                    //   child: Container(
                    //     width: 45,
                    //     height: 45,
                    //     decoration: const ShapeDecoration(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(10),
                    //           bottomRight: Radius.circular(10),
                    //           topLeft: Radius.circular(10),
                    //           topRight: Radius.circular(10),
                    //         ),
                    //       ),
                    //       // image: DecorationImage(
                    //       //   fit: BoxFit.contain,
                    //       //   image: NetworkImage(
                    //       //       feedScreenCubit.user.media!.image!),
                    //       // ),
                    //     ),
                    //     child: Padding(
                    //       padding:
                    //           const EdgeInsets.only(left: 33, top: 30, bottom: 3),
                    //       child: Container(
                    //         alignment: Alignment.bottomLeft,
                    //         width: 10,
                    //         height: 10,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: ColorResource.colorffffff,
                    //           image: DecorationImage(
                    //             fit: BoxFit.none,
                    //             image: AssetImage(ImageResource.groupImage),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // else
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, top: 18, left: 12),
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(ImageResource.ProfileImage),
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 33, top: 30, bottom: 3),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorResource.colorffffff,
                              image: DecorationImage(
                                fit: BoxFit.none,
                                image: AssetImage(ImageResource.groupImage),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        top: 20,
                      ),
                      child: Container(
                        width: 200,
                        decoration: const ShapeDecoration(
                          color: Colors.black12,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.search,
                              ),
                              onPressed: () {},
                            ),
                            const CustomText(
                              'sreach here',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.left,
                              color: ColorResource.colorffffff,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        right: 8,
                      ),
                      child: Container(
                        decoration: const ShapeDecoration(
                            color: Colors.black12, shape: CircleBorder()),
                        child: IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 10),
                      child: Container(
                        decoration: const ShapeDecoration(
                            color: Colors.black12, shape: CircleBorder()),
                        child: IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            // feedScreenCubit.authCubit.logout();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 3.0,
          color: ColorResource.colorffffff,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3, right: 95, bottom: 5),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(ImageResource.homeImage),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3, left: 95, bottom: 5),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorResource.colorffbb00,
                  child: IconButton(
                    padding: const EdgeInsets.all(5.0),
                    icon: const Icon(
                      Icons.add,
                      color: ColorResource.colorffffff,
                      size: 30,
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, Routes.addPostScreen)
                      //     .then((value) => feedScreenCubit.initial(context));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ScreenTypeLayout.builder(
          desktop: (BuildContext context) => const _WebLayout(),
          mobile: (BuildContext context) => const _MobileLayout(),
        ));
  }
}

class _WebLayout extends StatelessWidget {
  const _WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            _FeedListView(),
          ],
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorResource.colorffffff,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(height: 100),
              _FeedListView(),
            ],
          ),
        ));
  }
}

class _FeedListView extends StatelessWidget {
  const _FeedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: ScrollController(),
        child: Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Card(
        color: ColorResource.colorffffff,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // if (feedPost!.user!.media != null)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 18,
                  ),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: ColorResource.color82808e
                        // image: DecorationImage(
                        //   fit: BoxFit.contain,
                        //   image: NetworkImage('hg'),
                        // ),
                        ),
                  ),
                ),
                // else
                //   const Padding(
                //     padding: EdgeInsets.only(
                //       top: 15,
                //       left: 18,
                //     ),
                //     child: IconButton(
                //       icon: Icon(
                //         Icons.account_circle_sharp,
                //         color: ColorResource.lightHash,
                //         size: 45,
                //       ),
                //       onPressed: null,
                //     ),
                //   ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // if (feedPost.user?.firstName != null &&
                          //     feedPost.user?.firstName != '')
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: const CustomText(
                                'geetha',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                                color: ColorResource.color1a1a1a,
                              ),
                            ),
                          )
                          // else
                          //   Padding(
                          //     padding:
                          //         const EdgeInsets.only(top: 15),
                          //     child: Container(
                          //       alignment: Alignment.topLeft,
                          //       child: CustomText(
                          //         text: feedPost.user!.source!,
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //         textAlign: TextAlign.left,
                          //         color: ColorResource.lightblack,
                          //       ),
                          //     ),
                          //   ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(ImageResource.clockImage),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: CustomText(
                              'hi',
                              // // Jiffy(feedPost.createdAt)
                              //     .endOf(Units.HOUR)
                              //     .fromNow(),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.left,
                              color: ColorResource.color82808e,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(ImageResource.menuImage),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const _DescriptionAndImage(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}

class _DescriptionAndImage extends StatelessWidget {
  const _DescriptionAndImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (feedPost.description != null)
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 20),
          child: Container(
            alignment: Alignment.topLeft,
            child: const ReadMoreText(
              'kjk',
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Seemore',
              colorClickableText: ColorResource.hashgray,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: ColorResource.color1a1a1a,
              ),
              trimExpandedText: 'Seeless',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // else
        //   Padding(
        //     padding: const EdgeInsets.only(right: 15, left: 20),
        //     child: Container(
        //       alignment: Alignment.topLeft,
        //       child: CustomText(
        //         text: '',
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //         textAlign: TextAlign.left,
        //         color: ColorResource.lightblack,
        //         overflow: TextOverflow.ellipsis,
        //         softWrap: false,
        //       ),
        //     ),
        //   ),
        const SizedBox(
          height: 20,
        ),
        // feedPost.user?.media != null
        Container(
          padding: const EdgeInsets.all(180),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: NetworkImage(feedPost.user!.media!.image!),
              // ),
              ),
        ),
        // : Row(
        //     children: [
        //       Container(
        //         alignment: Alignment.center,
        //       ),
        //     ],
        //   ),
        const SizedBox(
          height: 10,
        ),
        const _LikeShereCommand(),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 2,
          color: ColorResource.hashgray,
        ),
        const _LikeCommantShare(),
      ],
    );
  }
}

class _LikeShereCommand extends StatelessWidget {
  const _LikeShereCommand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(ImageResource.likeImage),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: Container(
            alignment: Alignment.topLeft,
            child: const CustomText(
              '9',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.left,
              color: ColorResource.color82808e,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 150),
          child: Container(
            alignment: Alignment.topLeft,
            child: const CustomText(
              '32 share',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.left,
              color: ColorResource.color82808e,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: CustomText(
            '.',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.left,
            color: ColorResource.color82808e,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 15),
          child: Container(
            alignment: Alignment.topLeft,
            child: const CustomText(
              '25 comment',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.left,
              color: ColorResource.color82808e,
            ),
          ),
        ),
      ],
    );
  }
}

class _LikeCommantShare extends StatelessWidget {
  const _LikeCommantShare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: TextButton.icon(
              onPressed: (() {}),
              icon: Image(
                image: AssetImage(ImageResource.likeImage),
                fit: BoxFit.cover,
                width: 10,
                height: 10,
              ),
              label: const CustomText(
                'Like',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.left,
                color: ColorResource.color82808e,
              ),
            ),
          ),
          const VerticalDivider(
            color: ColorResource.hashgray,
            thickness: 1,
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton.icon(
              onPressed: (() {
                // Navigator.pushNamed(context, Routes.commentScreen,
                //     arguments: feedPost);
              }),
              icon: Image(
                image: AssetImage(ImageResource.commentImage),
                fit: BoxFit.cover,
                width: 20,
                height: 20,
              ),
              label: const CustomText(
                'Comment',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.left,
                color: ColorResource.color82808e,
              ),
            ),
          ),
          const VerticalDivider(
            color: ColorResource.hashgray,
            thickness: 1,
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: TextButton.icon(
              onPressed: (() {
                // feedScreenCubit.shareOnTap(feedPost, context);
              }),
              icon: Image(
                image: AssetImage(ImageResource.shareImage),
                fit: BoxFit.cover,
                width: 20,
                height: 20,
              ),
              label: const CustomText(
                'Share',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.left,
                color: ColorResource.color82808e,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
