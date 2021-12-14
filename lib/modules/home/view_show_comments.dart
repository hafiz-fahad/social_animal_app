import 'package:fido_mingle/modules/home/logic.dart';
import 'package:fido_mingle/modules/home/state.dart';
import 'package:fido_mingle/route_generator.dart';
import 'package:fido_mingle/utils/colors.dart';
import 'package:fido_mingle/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCommentsView extends StatefulWidget {
  const AllCommentsView({Key? key}) : super(key: key);

  @override
  _AllCommentsViewState createState() => _AllCommentsViewState();
}

class _AllCommentsViewState extends State<AllCommentsView> {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<HomeLogic>().multiSelectorForCommentActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
      builder: (_homeLogic) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: MyCustomAppBar(
            title: 'Comments',
            actionWidget: InkWell(
              onTap: () {
                Get.toNamed(PageRoutes.addComment);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 15, 5),
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: ListView(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: InkWell(
                      onLongPress: () {
                        setState(() {
                          _homeLogic.multiSelectorForCommentActive = true;
                          _homeLogic.multiSelectForDeleteCommentList[index]
                              .isSelected = true;
                          _homeLogic.multiSelectorCommentCount = 0;
                          _homeLogic.multiSelectForDeleteCommentList
                              .forEach((element) {
                            if (element.isSelected!) {
                              _homeLogic.multiSelectorCommentCount =
                                  _homeLogic.multiSelectorCommentCount! + 1;
                            }
                          });
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 9,
                                offset: const Offset(0, 10))
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///---user-tile
                              ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.grey,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    )),
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Ben Brainy',
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: state.commentUserTitleTextStyle,
                                      ),
                                    ),
                                    _homeLogic.multiSelectorForCommentActive!
                                        ? Checkbox(
                                            activeColor: customThemeColor,
                                            value: _homeLogic
                                                .multiSelectForDeleteCommentList[
                                                    index]
                                                .isSelected,
                                            onChanged: (v) {
                                              setState(() {
                                                _homeLogic
                                                    .multiSelectForDeleteCommentList[
                                                        index]
                                                    .isSelected = v;
                                                _homeLogic
                                                    .multiSelectorCommentCount = 0;
                                                _homeLogic
                                                    .multiSelectForDeleteCommentList
                                                    .forEach((element) {
                                                  if (element.isSelected!) {
                                                    _homeLogic
                                                            .multiSelectorCommentCount =
                                                        _homeLogic
                                                                .multiSelectorCommentCount! +
                                                            1;
                                                  }
                                                });
                                              });
                                            })
                                        : const SizedBox()
                                  ],
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '@12benbrainy',
                                      style: state.commentUserSubTitleTextStyle,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Posted on: 3 Oct 2020 4:33 PM',
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            state.commentUserSubTitleTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),

                              ///---comment
                              Text(
                                'I jus love my new brother!!! Thanks dad❤❤❤???? A beautiful Monday! #adopt #minpin #rescue #brodog',
                                style: state.commentTextStyle,
                              ),
                              const SizedBox(
                                height: 15,
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
                                            style: state.postLikeBarTextStyle,
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
                                      Get.toNamed(PageRoutes.replyComment);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/replyIcon.svg',
                                            width: 12,
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            'Reply',
                                            style: state.postLikeBarTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          bottomNavigationBar: _homeLogic.multiSelectorForCommentActive!
              ? Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 9,
                          offset: const Offset(10, 0))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _homeLogic.multiSelectorForCommentActive = false;
                            _homeLogic.multiSelectorCommentCount = 0;
                            _homeLogic.multiSelectForDeleteCommentList
                                .forEach((element) {
                              element.isSelected = false;
                            });
                            setState(() {});
                          },
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.jost(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: customThemeColor),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            deleteCommentDialog(context);
                          },
                          child: Text(
                            'Delete (${_homeLogic.multiSelectorCommentCount})',
                            style: GoogleFonts.jost(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: customThemeColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  deleteCommentDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 9,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Delete ${Get.find<HomeLogic>().multiSelectorCommentCount} Comments?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.jost(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'You have selected ${Get.find<HomeLogic>().multiSelectorCommentCount} comments to delete them!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jost(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: customThemeColor),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.find<HomeLogic>()
                                    .multiSelectorForCommentActive = false;
                                Get.find<HomeLogic>()
                                    .multiSelectorCommentCount = 0;
                                Get.find<HomeLogic>()
                                    .multiSelectForDeleteCommentList
                                    .forEach((element) {
                                  element.isSelected = false;
                                });
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Confirm Delete',
                                style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: customThemeColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
