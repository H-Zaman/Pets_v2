import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/app/controllers/home_controller.dart';
import 'package:pets/app/pages/menu_page.dart';
import 'package:pets/app/pages/pets_page.dart';
import 'package:pets/app/pages/social_media_page.dart';
import 'package:pets/app/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  final _controller = Get.put(HomeController());

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      onChangedPage(tabController.index);
    });
    super.initState();
  }

  onChangedPage(int index){
    BottomNavBar.index.value = index;
  }

  onChangeBottomBar(int index){
    tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: const [
          SocialMediaPage(),
          PetsPage(),
          MenuPage()
        ]
      ),
      floatingActionButton: BottomNavBar(
        onChanged: onChangeBottomBar,
      )
    );
  }
}