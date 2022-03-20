import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/app/data/social_news_model.dart';
import 'package:pets/app/widgets/pageination_widget.dart';
import 'package:pets/others/helpers/date_time_helper.dart';
import 'package:pets/others/resources/fonts.dart';
import 'dart:math' as math;
import 'c_IconButton.dart';
import 'loader.dart';

class SocialMediaTile extends StatelessWidget {
  final SocialNews data;
  const SocialMediaTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// user part
          Row(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(data.user.avatar!),
                radius: 16,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.user.name,
                      style: TextStyle(
                        fontFamily: CFonts.medium,
                        fontSize: 12
                      ),
                    ),
                    Text(
                      data.user.location!,
                      style: TextStyle(
                        fontFamily: CFonts.light,
                        fontSize: 10
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_horiz_rounded
                ),
              )
            ],
          ),
          SizedBox(height: 2),
          /// image
          _Images(images: data.images),
          /// buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CIconButton(
                    icon: CupertinoIcons.heart,
                    selected: data.isLiked,
                    selectedIcon: CupertinoIcons.heart_fill,
                    selectedColor: Colors.pinkAccent,
                  ),
                  CIconButton(
                    icon: CupertinoIcons.chat_bubble
                  ),
                  CIconButton(
                    icon: CupertinoIcons.bookmark,
                    selectedIcon: CupertinoIcons.bookmark_fill,
                    selected: data.isBookMarked,
                    selectedColor: Colors.green,
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: Icon(
                    Icons.reply_rounded
                  ),
                ),
                iconSize: 16,
                constraints: BoxConstraints(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTimeHelper.getDiffDuration(data.createdAt),
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: CFonts.light
                      ),
                    ),
                    Text(
                      'View comments',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: CFonts.light,
                        decoration: TextDecoration.underline
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Images extends StatefulWidget {
  final List<String> images;
  const _Images({Key? key, required this.images}) : super(key: key);

  @override
  State<_Images> createState() => _ImagesState();
}

class _ImagesState extends State<_Images> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3/2,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: 2
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  spreadRadius: 4,
                    blurStyle: BlurStyle.normal
                )
              ]
            ),
            child: PageView.builder(
              itemCount: widget.images.length,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index){
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (_, index){
                final image = widget.images[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (_, __, ___) => Loader(),
                  ),
                );
              },
            ),
          ),
          if(widget.images.length > 1)Positioned(
            bottom: 12,
            right: 12,
            child: PaginationWidget(
              length: widget.images.length,
              selectedIndex: selectedIndex,
            ),
          )
        ],
      ),
    );
  }
}