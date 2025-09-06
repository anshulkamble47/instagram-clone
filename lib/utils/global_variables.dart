import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/Screens/add_post_screen.dart';
import 'package:instagram_flutter/Screens/feed_screen.dart';
import 'package:instagram_flutter/Screens/profile_screen.dart';
import 'package:instagram_flutter/Screens/search_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems(String uid) 
{
  return [
          FeedScreen(),
          SearchScreen(),
          AddPostScreen(),
          Text("notification"),
          ProfileScreen( uid: FirebaseAuth.instance.currentUser!.uid),
];
}