import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const  VideoPlayer();
  }
}


class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayeFuture;

@override
  void initState() {
    
    super.initState();
    _controller =VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',),
  
    );
   _initializeVideoPlayeFuture =_controller.initialize();
   _controller.setLooping(true);
  }
  @override
  void dispose() {
  
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Video Player'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayeFuture, 
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return AspectRatio(aspectRatio: _controller.value.aspectRatio,
            child:const  VideoPlayer(),
            );
        }
        else 

        {

          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        }
        
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: const Icon(CupertinoIcons.play_arrow),),
    );
  }
}
