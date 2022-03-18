import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/app/data/social_news_model.dart';
import 'package:pets/app/data/user_model.dart';
import 'package:pets/app/widgets/c_IconButton.dart';
import 'package:pets/app/widgets/loader.dart';
import 'package:pets/app/widgets/pageination_widget.dart';
import 'package:pets/others/helpers/date_time_helper.dart';
import 'dart:math' as math;
import 'package:pets/others/resources/fonts.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (info){
        if(info is ScrollStartNotification){
          print('start');
        }
        if(info is ScrollEndNotification){
          print('end');
        }
        return true;
      },
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: _demoData.length,
        itemBuilder: (_, index) => _SocialMediaTile(data : _demoData[index])
      ),
    );
  }
}

class _SocialMediaTile extends StatelessWidget {
  final SocialNews data;
  const _SocialMediaTile({Key? key, required this.data}) : super(key: key);

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


final _demoData = [
  SocialNews(
      user: User(
          name: 'Sofia Rahman',
          location: 'Punjab, India',
          avatar: 'https://images.unsplash.com/photo-1481214110143-ed630356e1bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
      ),
      title: 'Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie piepie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie Cutie pie',
      images: [
        'https://images.unsplash.com/photo-1525983360072-2ebda055ba40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        'https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        'https://images.unsplash.com/photo-1528301725143-1ba694832e77?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
        'https://images.unsplash.com/photo-1548767797-d8c844163c4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'
      ],
      createdAt: DateTime(2022, 03, 18, 6, 24)
  ),
  SocialNews(
    user: User(
      name: 'Rachel Goodman',
      location: 'New york, USA',
      avatar: 'https://images.unsplash.com/photo-1524638431109-93d95c968f03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    ),
    title: 'My meow meow',
    images: [
      'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    ],
    createdAt: DateTime(2022, 03, 17, 12, 24)
  ),
  SocialNews(
    user: User(
      name: 'Ross Upton',
      location: 'Dhaka, BD',
      avatar: 'https://images.unsplash.com/photo-1481437642641-2f0ae875f836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
    ),
    title: 'My bun bun',
    images: [
      'https://images.unsplash.com/photo-1591561582301-7ce6588cc286?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
      'https://images.unsplash.com/photo-1521247560470-d2cbfe2f7b47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
    ],
    createdAt: DateTime(2022, 03, 18, 14, 24)
  ),
  SocialNews(
    user: User(
        name: 'Sofia Rahman',
        location: 'Punjab, India',
        avatar: 'https://images.unsplash.com/photo-1481214110143-ed630356e1bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    ),
    title: 'Cutie pie',
    images: [
      'https://images.unsplash.com/photo-1525983360072-2ebda055ba40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
    ],
    createdAt: DateTime(2022, 03, 18, 6, 24)
  ),

];