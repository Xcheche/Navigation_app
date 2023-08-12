import 'package:flutter/material.dart';
import './art_util.dart';

class ArtRoute extends StatefulWidget {
  final String art;
  const ArtRoute({Key? key, required this.art}) : super(key: key);
  @override
  _ArtRouteState createState() => _ArtRouteState();
}

class _ArtRouteState extends State<ArtRoute> {
  static int _currentIndex = 0;
  Color? _color = Colors.lime[900];
  void changeRoute(BuildContext context, String menuItem) {
    String image;
    switch (menuItem) {
      case ArtUtil.CARAVAGGIO:
        {
          image = ArtUtil.IMG_CARAVAGGIO;
          break;
        }
      case ArtUtil.MONET:
        {
          image = ArtUtil.IMG_MONET;
          break;
        }
      case ArtUtil.VANGOGH:
        {
          image = ArtUtil.IMG_VANGOGH;
          break;
        }
      default:
        {
          image = '';
          break;
        }
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtRoute(art: image)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                    image: NetworkImage('http://bit.ly/fl_sky'),
                    fit: BoxFit.fill),
              ),
              child: Text(
                'Choose your art',
                style: TextStyle(fontSize: 24, color: Colors.white54),
              ),
            ),
            ListTile(
              title: const Text(ArtUtil.CARAVAGGIO),
              trailing: Icon(Icons.art_track, color: _color),
              onTap: () {
                setState(() {
                  _color = Colors.blue; // change color here
                });
                changeRoute(context, ArtUtil.CARAVAGGIO);
              },
            ),
            ListTile(
              title: const Text(ArtUtil.MONET),
              trailing: Icon(Icons.art_track, color: _color),
              onTap: () {
                setState(() {
                  _color = Colors.red; // change color here
                });
                changeRoute(context, ArtUtil.MONET);
              },
            ),
            ListTile(
              title: const Text(ArtUtil.VANGOGH),
              trailing: Icon(Icons.art_track, color: _color),
              onTap: () {
                setState(() {
                  _color = Colors.green; // change color here
                });
                changeRoute(context, ArtUtil.VANGOGH);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Navigating art'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.image),
            itemBuilder: (BuildContext context) {
              return ArtUtil.menuItems.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            onSelected: (String selectedValue) {
              changeRoute(context, selectedValue);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.art),
            fit: BoxFit.cover,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: _color,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: ArtUtil.CARAVAGGIO,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: ArtUtil.MONET,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: ArtUtil.VANGOGH,
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                _color = Colors.blue; // change color here
              });
              changeRoute(context, ArtUtil.CARAVAGGIO);
              break;
            case 1:
              setState(() {
                _color = Colors.red; // change color here
              });
              changeRoute(context, ArtUtil.MONET);
              break;
            case 2:
              setState(() {
                _color = Colors.green; // change color here
              });
              changeRoute(context, ArtUtil.VANGOGH);
              break;
          }
        },
      ),
    );
  }
}
