import 'package:beamer/beamer.dart';
import 'package:data/entity/feed/feed_data_entity.dart';
import 'package:domain/model/post/feed_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:oncopower/base/base_page.dart';
import 'package:oncopower/di/app_modules.dart';
import 'package:oncopower/di/feed_modules.dart';
import 'package:oncopower/features/feed/feed_page_view_model.dart';
import 'package:oncopower/generated/l10n.dart';
import 'package:oncopower/molecules/app_stream_builder.dart';
import 'package:oncopower/molecules/custom_text.dart';
import 'package:oncopower/utils/color_resources.dart';
import 'package:oncopower/utils/custom_scaffold.dart';
import 'package:oncopower/utils/extensions.dart';
import 'package:oncopower/utils/image_resources.dart';
import 'package:oncopower/utils/resource.dart';
import 'package:oncopower/utils/status.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FeedPageView extends BasePageViewWidget<FeedPageViewModel> {
  const FeedPageView(ProviderBase providerBase, {Key? key})
      : super(providerBase, key: key);
  @override
  Widget build(BuildContext context, FeedPageViewModel model) {
    return CustomScaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          elevation: 0,
          toolbarHeight: 90,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
            ),
          ),
          actions: const [_FeedPageAppBar()],
          backgroundColor: context.isDesktop
              ? ColorResource.colorffffff
              : ColorResource.color1fabf1,
          centerTitle: true,
        ),
      ),
      body: ScreenTypeLayout.builder(
        desktop: (BuildContext context) => const _WebLayout(),
        mobile: (BuildContext context) => const _MobileLayout(),
        tablet: (BuildContext context) => const _MobileLayout(),
      ),
    );
  }
}

class _WebLayout extends StatelessWidget {
  const _WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(feedModuleProvider);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 480),
        child: AppStreamBuilder<Resource<FeedData>>(
          initialData: Resource.loading(),
          stream: viewModel.getFeedListResponseStream,
          dataBuilder: (context, feedPost) {
            if (feedPost?.status != Status.success) {
              return Container();
            }
            if (viewModel.feedPost.isEmpty) {
              return Container();
            }
            return ListView.builder(
              itemCount:viewModel.feedPost.length,
              itemBuilder: (context, index) {
                return index >= viewModel.feedPost.length
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: ColorResource.color82808e,
                            ),
                          ),
                          elevation: 2,
                          margin: const EdgeInsets.all(8),
                          color: ColorResource.colorffffff,
                          child: _FeedListView(
                              feedPost: viewModel.feedPost[index]),
                        ),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(feedModuleProvider);

    return AppStreamBuilder<Resource<FeedData>>(
        initialData: Resource.loading(),
        stream: viewModel.getFeedListResponseStream,
        dataBuilder: (context, feedPost) {
          if (feedPost?.status != Status.success) {
            return Container();
          }
          if (viewModel.feedPost.isEmpty) {
            return Container();
          }
          return RefreshIndicator(
            backgroundColor: ColorResource.colorffffff,
            onRefresh: () async {
              viewModel.tiggerGetFeedList();
            },
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: viewModel.feedPost.length,
              itemBuilder: (context, index) {
                return index >= viewModel.feedPost.length
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Card(
                          margin: const EdgeInsets.all(6),
                          color: ColorResource.colorffffff,
                          child: _FeedListView(
                            feedPost: viewModel.feedPost[index],
                          ),
                        ),
                      );
              },
            ),
          );
        });
  }
}

class _FeedPageAppBar extends StatelessWidget {
  const _FeedPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 18, left: 12),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(ImageResource.profileImage),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 33, top: 30, bottom: 3),
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
            padding: const EdgeInsets.only(top: 20),
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
                  const IconButton(
                    color: ColorResource.colorffffff,
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: null,
                  ),
                  CustomText(
                    S.of(context).search,
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
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: const ShapeDecoration(
                  color: Colors.black12, shape: CircleBorder()),
              child: IconButton(
                iconSize: 28,
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.beamToNamed("/add-post");
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Container(
              decoration: const ShapeDecoration(
                  color: Colors.black12, shape: CircleBorder()),
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  Navigator.pop(context);
                  context.read(appViewModelProvider).logout();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FeedListView extends StatelessWidget {
  final FeedPost? feedPost;
  const _FeedListView({Key? key, this.feedPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (feedPost!.user!.media != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 18,
                ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(feedPost!.user!.media!.image!),
                    ),
                  ),
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  left: 18,
                ),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.account_circle_sharp,
                    color: ColorResource.color82808e,
                    size: 45,
                  ),
                ),
              ),
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
                      if (feedPost!.user?.firstName != null &&
                          feedPost!.user?.firstName != '')
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              feedPost!.user!.firstName!,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.left,
                              color: ColorResource.color1a1a1a,
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              feedPost!.user!.source!,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.left,
                              color: ColorResource.color1a1a1a,
                            ),
                          ),
                        ),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomText(
                          Jiffy(feedPost!.createdAt)
                              .endOf(Units.HOUR)
                              .fromNow(),
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
        _DescriptionAndImage(feedPost: feedPost),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _DescriptionAndImage extends StatelessWidget {
  final FeedPost? feedPost;
  const _DescriptionAndImage({Key? key, this.feedPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (feedPost!.description != null)
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 20),
            child: Container(
              alignment: Alignment.topLeft,
              child: ReadMoreText(
                feedPost!.description!,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: S.of(context).seeMoreText,
                colorClickableText: ColorResource.hashgray,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: ColorResource.color1a1a1a,
                ),
                trimExpandedText: S.of(context).seeLessText,
                textAlign: TextAlign.left,
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 20),
            child: Container(
              alignment: Alignment.topLeft,
              child: const CustomText(
                '',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.left,
                color: ColorResource.color1a1a1a,
              ),
            ),
          ),
        const SizedBox(
          height: 20,
        ),
        feedPost!.user?.media != null
            ? Container(
             
                padding: const EdgeInsets.all(180),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(feedPost!.user!.media!.image!),
                  ),
                ),
              )
            : Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                  ),
                ],
              ),
        const SizedBox(
          height: 10,
        ),
        _LikeShereCommand(
          feedPost: feedPost,
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 2,
          color: ColorResource.hashgray,
        ),
        _LikeCommantShare(
          feedPost: feedPost,
        ),
      ],
    );
  }
}

class _LikeShereCommand extends StatelessWidget {
  final FeedPost? feedPost;
  const _LikeShereCommand({Key? key, this.feedPost}) : super(key: key);

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
                image: AssetImage(feedPost!.likeCount! > 0
                    ? ImageResource.likedImage
                    : ImageResource.likeImage),
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
            child: CustomText(
              '${feedPost!.likeCount!}',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.left,
              color: ColorResource.color82808e,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 140, right: 2),
          child: Container(
            alignment: Alignment.topLeft,
            child: CustomText(
              ('${feedPost!.shareCount!}${S.of(context).sharesText}'),
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
          padding: const EdgeInsets.only(right: 10, left: 2),
          child: Container(
            alignment: Alignment.topLeft,
            child: CustomText(
              ('${feedPost!.commentCount!}${S.of(context).commentsText}'),
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
  final FeedPost? feedPost;
  const _LikeCommantShare({Key? key, this.feedPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read(feedModuleProvider);
    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: TextButton.icon(
              onPressed: (() {
                viewModel.tiggerLikeRequest(feedPost!);
              }),
              icon: Image(
                image: AssetImage(ImageResource.likeImage),
                fit: BoxFit.cover,
                width: 20,
                height: 20,
              ),
              label: CustomText(
                S.of(context).likeText,
                fontSize: 18,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.left,
                color: ColorResource.color82808e,
              ),
            ),
          ),
          const VerticalDivider(
            color: ColorResource.color82808e,
            thickness: 1,
            width: 20,
          ),
          TextButton.icon(
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
            label: CustomText(
              S.of(context).commentText,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.left,
              color: ColorResource.color82808e,
            ),
          ),
          const VerticalDivider(
            color: ColorResource.color82808e,
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
              label: CustomText(
                S.of(context).shareText,
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
