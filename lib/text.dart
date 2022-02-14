/*

import 'package:flutter/material.dart';
class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

bool isAdded = false;
class _MovieListState extends State<MovieList> {


  Widget movieListItemWidget(Movie movieItem) {
    final favoritesList = context.watch<MovieProvider>();
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.network(
                'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}')),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: Text(
                    movieItem.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        width: 800,
                        child: Text(
                          movieItem.overview,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 13),
                          maxLines: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  trailing: IconButton(
                    icon:favoritesList.favoriteMovies.contains(movieItem)
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                    onPressed: () {
                      developer.log('OnTap works. Set State ', name: 'Test OnTap Func from GestureDetector');

                      !favoritesList.favoriteMovies.contains(movieItem)
                          ? favoritesList.add(movieItem)
                          : favoritesList.remove(movieItem);

                     // developer.log('${favoritesList.isAdded}', name: 'Update ListTile');


                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: Text('Close'),
        ),
      ],
    );
  }

  Widget movieListWidget(List<Movie> movies) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: movieListItemWidget(movies[index]),
          ),
        );
      },

    );
  }



  @override
  Widget build(BuildContext context) {

    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: movieProvider.movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: movieListItemWidget(movieProvider.movies[index]),
            ),
          );
        },

      ),
    );
  }

   _pushSaved(Movie favoriteMovie) {
     favoritProvider = Provider.of<FavoriteProvider>(context, listen: false);
    Navigator.pushNamed(context, favoritProvider.addFavorites(favoriteMovie));
  }

}




import 'package:advancedprovider/movieprovider.dart';
import 'package:advancedprovider/networking/movieapi.dart';
import 'package:flutter/material.dart';
import 'package:advancedprovider/models/movie.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../models/favorite.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  final _saved = <Movie>{};

  Widget movieListItemWidget(Movie movieItem) {
    final favorites = _saved.contains(movieItem);
    return  Container(
      // margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[

          //Only with Image it causes "A" RenderFlex overflowed by pixels"
          Flexible(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                    image:NetworkImage(
                        'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}'
                    ),
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: Text(

              movieItem.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,),
            ),
          ),
        ],

      ),

    );

    */
/*Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'http://image.tmdb.org/t/p/w500/${movieItem.posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movieItem.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );*//*

  }

  Widget movieListWidget(List<Movie> movies) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {

          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: movieListItemWidget(movies[index]),
            ),
          ),
        );


      },
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          //When the data is well loaded
          if (provider.favoriteMovies.isNotEmpty) {

            return movieListWidget(provider.favoriteMovies);
          }
          //While the data is loading.
          return  Center(
            child: Text('No favorites added.'),
          );
        },
      ),
    );
  }
}





*/