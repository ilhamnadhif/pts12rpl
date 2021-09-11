import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailMovie extends StatelessWidget {
  final String title, desc, releaseDate, imagePath;
  const DetailMovie(
      {required this.title,
      required this.desc,
      required this.imagePath,
      required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                width: 100,
                height: 150,
                child: Image(
                  image: NetworkImage(imagePath),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    desc,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(releaseDate),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
