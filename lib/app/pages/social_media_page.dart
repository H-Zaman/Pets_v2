import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/app/data/social_news_model.dart';
import 'package:pets/app/data/user_model.dart';
import 'package:pets/app/widgets/c_IconButton.dart';
import 'dart:math' as math;
import 'package:pets/others/resources/fonts.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _demoData.length,
      itemBuilder: (_, index) => _SocialMediaTile(data : _demoData[index])
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
          if(data.images.isNotEmpty) AspectRatio(
            aspectRatio: 3/2,
            child: Container(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: data.images.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
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
          )
        ],
      ),
    );
  }
}


final _demoData = [
  SocialNews(
    user: User(
      name: 'Rachel Goodman',
      location: 'New york, USA',
      avatar: 'https://images.unsplash.com/photo-1524638431109-93d95c968f03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    ),
    title: 'My meow meow',
    images: [
      'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    ]
  ),
  SocialNews(
    user: User(
      name: 'Ross Upton',
      location: 'Dhaka, BD',
      avatar: 'https://images.unsplash.com/photo-1481437642641-2f0ae875f836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
    ),
    title: 'My meow meow',
    images: [
      'https://images.unsplash.com/photo-1591561582301-7ce6588cc286?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'
    ]
  ),
];