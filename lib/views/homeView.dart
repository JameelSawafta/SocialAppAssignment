import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test9/repository/dataLocal.dart';
import '../repository/dataAPI.dart';
import '../viewModels/homeViewModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class PostWidget extends StatefulWidget {
  var data;
  PostWidget({this.data});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.data.dataUserModel.image),
                radius: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(widget.data.dataUserModel.name), Text('Since 23 minuites')],
              )
            ],
          ),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage("${widget.data.image}"))),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.data.isFavourite = !widget.data.isFavourite;
                    });
                    print(widget.data.isFavourite);
                  },
                  icon: widget.data.isFavourite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border)),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.share,
                size: 30,
              )
            ],
          ),
        ),
        Text(widget.data.content)
      ],
    );
  }
}


class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var data = HomeViewModel(dataRepository: DataLocal());
  var _myController ;
  var i=0;
  late var data2 ;
  @override
  void initState() {
    _myController = new TabController(length: 2, vsync: this);
    data2 = data.getAllData().where((element) => element.isFavourite).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.title),
        ),
        body: TabBarView(
          controller: _myController,
           children: [
              ListView.builder(
                itemCount: data.getAllData().length,
                itemBuilder: (context, index) {
                  return PostWidget(data: data.getAllData()[index]);
                },
              ),
              //isFavourite = true
              ListView.builder(
                itemCount: data2.length,
                itemBuilder: (context, index) {
                  return PostWidget(data: data2[index]);
                },
              ),
            ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourites',
            ),
          ],
          currentIndex: i,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _myController.index = index;
              i = index;
            });
          },
        ),
    );
  }
}

