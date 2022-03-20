import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets/app/controllers/social_media_controller.dart';
import 'package:pets/app/widgets/social_media_tile.dart';

class SocialMediaPage extends StatefulWidget {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  State<SocialMediaPage> createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  final SocialMediaController _controller = Get.put(SocialMediaController());
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _controller.onScroll,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: _controller.data.length,
        itemBuilder: (_, index) => SocialMediaTile(data : _controller.data[index])
      ),
    );
  }
}