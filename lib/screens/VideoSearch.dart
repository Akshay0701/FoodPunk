import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_api/youtube_api.dart';


import '../blocs/VideoPageBloc.dart';
import '../utils/universal_variables.dart';

class VideoSearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => VideoPageBloc(), child: VideoSearch());
  }
}


class VideoSearch extends StatefulWidget {

  @override
  State<VideoSearch> createState() => _VideoSearchState();
}

class _VideoSearchState extends State<VideoSearch> {

  final TextEditingController searchCtrl = TextEditingController();
  late VideoPageBloc videoPageBloc;



  @override
  Widget build(BuildContext context) {
    videoPageBloc = Provider.of<VideoPageBloc>(context);
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: UniversalVariables.whiteLightColor,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              createSearchBar(),
              Expanded(
                child: Container(
                  color: Colors.white10,
                  child: buildSuggestions(videoPageBloc.query),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listItem(YouTubeVideo video) {
    return GestureDetector(
      onTap: () {
        //
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              image: DecorationImage(
                image: NetworkImage("${video.thumbnail.high.url}"),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding:
            const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Text(
                  video.channelTitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildSuggestions(String query) {
    return Expanded(
      child: ListView.builder(
        itemCount: videoPageBloc.searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              'https://img.youtube.com/vi/${videoPageBloc.searchResults[index]["id"]}/maxresdefault.jpg',
              fit: BoxFit.cover,
            ),
            onTap: () {
              // Handle video selection
            },
          );
        },
      ),
    );
  }

  createSearchBar() {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: UniversalVariables.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: (search) {
                videoPageBloc.setQuery(search);
              },
              controller: searchCtrl,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  hintText: "Search..."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: UniversalVariables.orangeColor,
                ),
                onPressed: () => videoPageBloc.searchVideos(videoPageBloc.query)
                ),
          ),
        ],
      ),
    );
  }

}


class VideoPlayerPage extends StatelessWidget {
  final String videoId;

  const VideoPlayerPage({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                'https://img.youtube.com/vi/$videoId/maxresdefault.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
// Open video player
// You can use any video player package or WebView to play the video
// For simplicity, let's just print the videoId here
                print('Playing video with ID: $videoId');
              },
              child: Text('Play Video'),
            ),
          ],
        ),
      ),
    );
  }
}

