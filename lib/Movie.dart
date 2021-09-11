import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pts12rpl/detailMovie.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List movies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    this.fetchMovie();
  }

  fetchMovie() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "https://api.themoviedb.org/3/movie/now_playing?api_key=f9882f03ebbec0cd3cf99a20006d0a51";
    var response = await http.get(Uri.parse(url));
    // print(response.body)
    if (response.statusCode == 200) {
      var items = jsonDecode(response.body)['results'];
      setState(() {
        movies = items;
        isLoading = false;
      });
    } else {
      setState(() {
        throw Exception('Failed to load Movie');
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    if (movies.contains(null) || movies.length < 0 || isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return getCard(movies[index]);
        });
  }

  Widget getCard(item) {
    int id = item['id'];
    String title = item['title'];
    String desc = item['overview'];
    String releaseDate = item['release_date'];
    String imagePath = "https://image.tmdb.org/t/p/w500" + item['poster_path'];
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailMovie(
                title: title,
                desc: desc,
                releaseDate: releaseDate,
                imagePath: imagePath,
              ),
            ),
          );
        },
        title: Row(
          children: <Widget>[
            Container(
              width: 100,
              height: 150,
              child: Image(
                image: NetworkImage(imagePath),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  releaseDate,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
