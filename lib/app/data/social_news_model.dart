import 'package:pets/app/data/user_model.dart';

class SocialNews{
  final User user;
  final bool isLiked;
  final bool isBookMarked;
  final String title;
  final List<String> images;

  SocialNews({
    required this.user,
    this.isLiked = false,
    this.isBookMarked = false,
    required this.title,
    this.images = const []
  });

}