import 'package:flutter/material.dart';
import 'package:musicp/provider/music_provider.dart';
import 'package:musicp/view/music_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider(
          create: (context) => MusicProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/':(context) =>MusicScreen()
            },
          ),
        );
      },
    )
  );
}