import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musicp/provider/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  void initState() {

    super.initState();
    Provider.of<MusicProvider>(context,listen: false).initMusic();
  }
  MusicProvider? musicProviderF;
  MusicProvider? musicProviderT;
  @override
  Widget build(BuildContext context) {
    musicProviderF=Provider.of<MusicProvider>(context,listen: false);
    musicProviderT=Provider.of<MusicProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
    body: Stack(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img.png"),fit: BoxFit.cover
            )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 70.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Color(0xeadb6767),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
          ),
        ),
        Align(
          alignment: Alignment(0,-0.5),
          child: Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage("assets/images/img.png"),fit: BoxFit.fill
                )
            ),
          ),
        ),
        PlayerBuilder.currentPosition(
          player: musicProviderF!.assetsAudioPlayer,
          builder: (context, position) =>  Align(
           alignment: Alignment.center,
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Slider(value: position.inSeconds.toDouble(), onChanged: (value) {
                 position=Duration(seconds: value.toInt());
                  musicProviderF!.assetsAudioPlayer.seek(position);
               },
                 max: musicProviderF!.musicduration.inSeconds.toDouble(),
                 inactiveColor: Colors.grey,
                 activeColor: Colors.grey.shade400,
                 thumbColor: Colors.grey,
               ),
               Align(
                 alignment: Alignment(0, 0.050),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("$position",style: TextStyle(color: Colors.white)),
                       Text("${musicProviderF!.musicduration.inMinutes.toDouble()}",style: TextStyle(color: Colors.white)),
                     ],
                   ),
                 ),
               ),
             ],
           ),
       ),
        ),
        Align(
          alignment: Alignment(0, 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.refresh,color: Colors.white,size: 30,)),
              IconButton(onPressed: () {
                musicProviderF!.permusic();
              }, icon: Icon(Icons.skip_previous,color: Colors.white,size: 30)),
              FloatingActionButton(onPressed: (){
                if(musicProviderF!.isplay)
                  {
                    musicProviderF!.playmusic();
                  }
                else
                  {
                    musicProviderF!.stopmusic();
                  }
              },child: musicProviderF!.isplay?Icon(Icons.play_arrow_sharp,color: Colors.white,size: 30):Icon(Icons.pause,color: Colors.white,size: 30)),
              IconButton(onPressed: () {
                musicProviderF!.nextmusic();
              }, icon: Icon(Icons.skip_next,color: Colors.white,size: 30)),
              IconButton(onPressed: () {}, icon: Icon(Icons.repeat,color: Colors.white,size: 30)),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0, 0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,size: 35)),
              IconButton(onPressed: (){}, icon: Icon(Icons.shuffle,color: Colors.white,size: 35)),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.white,size: 35)),
            ],
          ),
        )
      ],
    ),
    ));
  }
}
