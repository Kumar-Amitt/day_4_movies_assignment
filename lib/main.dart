import 'package:day_4_movies_assignment/movies.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';

String moviesList;
List movie = [];
List poster = [];

void links() {
  for (int i = 0; i < movie.length; i++) {
    poster.add(movie[i]['poster']);
  }
}

void main() {
  moviesList = MoviesList.moviesJsonList;
  movie = jsonDecode(moviesList);
  links();

  runApp(MaterialApp(
    home: MoviesPage(),
  ));
}

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  String url=poster[0];
  int index = 0;

  void display() {
    setState(() {


    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Movies Poster',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CarouselSlider(
                height: 400.0,
                items: poster.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child:( Image(image: NetworkImage(i),
                            fit: BoxFit.cover,
                          )
                      ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ), // Use stateful widget you created here
    );
  }
}

// You are given json string of movies list (see file movies.dart)

// Hint:
// Convert the string to List of maps using jsonDecode and then use it

// Create a stateful widget called MoviesPage here
