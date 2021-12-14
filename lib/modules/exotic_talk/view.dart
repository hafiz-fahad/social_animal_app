import 'package:fido_mingle/modules/exotic_talk/state.dart';
import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ExoticTalkView extends StatefulWidget {
  const ExoticTalkView({Key? key}) : super(key: key);

  @override
  _ExoticTalkViewState createState() => _ExoticTalkViewState();
}

class _ExoticTalkViewState extends State<ExoticTalkView> {
  final ExoticTalkLogic logic = Get.put(ExoticTalkLogic());
  final ExoticTalkState state = Get.find<ExoticTalkLogic>().state;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExoticTalkLogic>(
      builder: (_exoticTalkLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: const MyCustomAppBar(
            title: 'Exotic Talk',
            actionWidget: Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
              child: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                    child: Column(
                      children: [
                        ///---upper-tile
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: customPostBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 9,
                                    spreadRadius: 1,
                                    offset: const Offset(7, 8))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: customPostBackgroundColor,
                                  child: Image.asset(
                                    'assets/fidoCircleImage.png',
                                    fit: BoxFit.fill,
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Fido New Articles, and More...',
                                  softWrap: true,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: state.postTileTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: customPostBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 9,
                                    spreadRadius: 1,
                                    offset: const Offset(7, 8))
                              ]),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(7, 7, 7, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/splash_background.png',
                                    height: 270,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      ///---like-section
                                      InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/likeIcon.svg',
                                                width: 10,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Liked (15)',
                                                style:
                                                    state.postLikeBarTextStyle,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 25,
                                      ),

                                      ///---reply-section
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(PageRoutes.addComment);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 0),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/replyIcon.svg',
                                                width: 10,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                'Reply',
                                                style:
                                                    state.postLikeBarTextStyle,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  ///---view-more-section
                                  Text(
                                    'View more...',
                                    style: state.postLikeBarTextStyle,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  );
                }),
              )),
        ),
      ),
    );
  }
}
