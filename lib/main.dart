import 'package:flutter/material.dart';
import 'package:division/division.dart';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color _mainColor = Color(0xFFd66667);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: HomePage(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _mainColor,
              ),
              title: Container(
                height: 0.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                color: _mainColor,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: Colors.grey,
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _mainColor,
              ),
              title: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Header(),
                TabBar(),
                UserImages(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  Widget _buildTitle(String title) {
    return Division(
      style: StyleClass().margin(bottom: 20.0).alignChild('left'),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        _buildTitle('Popular'),
        Icon(
          Icons.search,
          size: 30.0,
        ),
      ],
    );
  }
}

class TabBar extends StatelessWidget {
  Widget _buildText(String title, {bool active = false}) {
    return Container(
      margin: EdgeInsets.only(right: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: active ? FontWeight.bold : FontWeight.w100,
            ),
          ),
          _buildSmallCircle(active)
        ],
      ),
    );
  }

  Widget _buildSmallCircle(bool active) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        width: 5.0,
        height: 5.0,
        decoration: BoxDecoration(
          color: active ? Colors.redAccent : Colors.transparent,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildText('All', active: true),
          _buildText('Animation'),
          _buildText('Branding'),
          _buildText('Illustration'),
          _buildText('Mobile Design'),
          _buildText('Web Design'),
        ],
      ),
    );
  }
}

class UserImages extends StatelessWidget {
  Widget _buildCard(String name, String avatarurl, String imageUrl) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatarurl),
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '29min ago',
                        style: TextStyle(color: Colors.grey, fontSize: 13.0),
                      ),
                    ],
                  ),
                ],
              ),
              Division(
                style: StyleClass()
                    .padding(horizontal: 10, vertical: 5)
                    .borderRadius(all: 18)
                    .align('center')
                    .linearGradient(
                  beginAlign: 'top',
                  endAlign: 'bottom',
                  colors: [
                    Color(0xFFfc8d8e),
                    Color(0xFFd66667),
                  ],
                ).elevation(5, color: rgb(150, 150, 150)),
                child: Text(
                  'Follow',
                  style: TextStyle(color: Colors.white, fontSize: 11.0),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 180.0,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Center(
                  child: CircularProgressIndicator(),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            alignment: Alignment.centerLeft,
            child: Text('This is an exercise outside of work...'),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '4567',
                      style: TextStyle(color: Colors.grey, fontSize: 13.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.mode_comment,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '23',
                      style: TextStyle(color: Colors.grey, fontSize: 13.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.grey,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '327',
                      style: TextStyle(color: Colors.grey, fontSize: 13.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '328',
                      style: TextStyle(color: Colors.grey, fontSize: 13.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardsRow() {
    return Container(
      child: Column(
        children: <Widget>[
          _buildCard('Maful Prayoga Arnandi', 'https://tinyfac.es/data/avatars/2DDDE973-40EC-4004-ABC0-73FD4CD6D042-200w.jpeg', 'https://images.pexels.com/photos/2267748/pexels-photo-2267748.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
          _buildCard('Adam Denisov', 'https://tinyfac.es/data/avatars/E0B4CAB3-F491-4322-BEF2-208B46748D4A-200w.jpeg', 'https://images.pexels.com/photos/2148217/pexels-photo-2148217.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
          _buildCard('Luis Calvilo', 'https://i.pravatar.cc/300', 'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=format%2Ccompress&cs=tinysrgb&dpr=2&h=750&w=1260'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardsRow();
  }
}
