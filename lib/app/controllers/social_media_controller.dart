import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/app/data/social_news_model.dart';
import 'package:pets/app/data/user_model.dart';
import 'package:pets/app/widgets/bottom_nav_bar.dart';

class SocialMediaController extends GetxController{
  RxList<SocialNews> data = <SocialNews>[].obs;

  @override
  void onInit() {
    data.value = _demoData;
    super.onInit();
  }


  bool onScroll (info){
    if(info is ScrollStartNotification){
      BottomNavBar.hide(true);
    }
    if(info is ScrollUpdateNotification){
      BottomNavBar.hide(true);
    }
    if(info is ScrollEndNotification){
      BottomNavBar.hide(false);
    }
    return true;
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