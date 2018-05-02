import 'package:flutter/material.dart';

class Post {

  String username;
  String contentImage;
  String profilePicture;
  bool hasLiked = false;

  Post(this.username, this.contentImage, this.profilePicture);
}