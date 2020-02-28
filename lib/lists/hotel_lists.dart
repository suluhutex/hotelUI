import 'package:flutter/material.dart';
import 'package:shower_and_breakfast/lists/star_rating.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ItemList {
  final String title;
  final String img;
  final double rating;
  final String subtitle;
  final String price;
  ItemList({this.title, this.img, this.rating, this.subtitle, this.price});
}

List _itemList = [
  ItemList(
      title: 'Bangaiza Hotel',
      img: 'assets/img/room1.jpg',
      rating: 3.5,
      subtitle: 'Tononoka, Mombasa',
      price: 'KSh. 500'),
  ItemList(
      title: 'Chapa Kazi Hotel',
      img: 'assets/img/room2.jpg',
      rating: 4.5,
      subtitle: 'Buxton, Mombasa',
      price: 'KSh. 400'),
  ItemList(
      title: 'Pumzika Poa Hotel',
      img: 'assets/img/room3.jpg',
      rating: 4.0,
      subtitle: 'Old Town, Mombasa',
      price: 'KSh. 300'),
  ItemList(
      title: 'Karibu Customer Hotel',
      img: 'assets/img/room4.jpg',
      rating: 4.0,
      subtitle: 'Bamburi, Mombasa',
      price: 'KSh. 400'),
  ItemList(
      title: 'Sulubu Hotel',
      img: 'assets/img/room1.jpg',
      rating: 4.5,
      subtitle: 'Mwembe, Mombasa',
      price: 'KSh. 400'),
];

class HotelLists extends StatefulWidget {
  @override
  _HotelListsState createState() => _HotelListsState();
}

class _HotelListsState extends State<HotelLists> {
  List<Widget> _getItems() {
    List<Widget> items = new List();

    
    Widget swiper = Container(
      height: MediaQuery.of(context).size.height * .35,
      width: MediaQuery.of(context).size.width,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          print("${_itemList[index].img.toString()}");
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/hoteldetails');
            },
                      child: Stack(
              children: <Widget>[
                ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.grey[600]],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.darken,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: new Image.asset(
                    "${_itemList[index].img.toString()}",
                    fit: BoxFit.fill,
                  ),
                                ),
                ),
                Positioned(
                  top: 5,
                  left: 0,
                  right: 0,
                  child: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border:
              Border(left: BorderSide(color: Colors.amberAccent, width: 6))),
      margin: EdgeInsets.only(right: 20, bottom: 10, top: 10, left: 10),
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'Featured',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 95,
                    child: ListTile(
                      title: Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          '${_itemList[index].subtitle}',
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .apply(color: Colors.grey[100], fontSizeDelta: 0),
                        ),
                      ),
                      subtitle: Text(
                        '${_itemList[index].title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .apply(color: Colors.white, fontWeightDelta: 2),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border,
                        color: Colors.white,),
                      ),
                    ),
                  )
                )
              ],
            ),
          );
        },
        itemCount: _itemList.length,
        pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );

    items.add(swiper);

    Widget moreText = Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border:
              Border(left: BorderSide(color: Colors.amberAccent, width: 6))),
      margin: EdgeInsets.only(right: 10, top: 8, bottom: 7, left: 10),
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'More',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );

    items.add(moreText);

    for (var model in _itemList) {
      Widget listItem = InkWell (
        onTap: (){
          Navigator.pushNamed(context, '/hoteldetails');
        },
        child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${model.img}'), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${model.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .apply(color: Colors.grey[800], fontWeightDelta: 2),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${model.subtitle}',
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .apply(color: Colors.grey[500], fontSizeDelta: 0),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: StarRating(
                              rating: model.rating,

                              //onRatingChanged: (rating) =>

                              //setState(() => this.rating = rating),
                            ),
                          ),
                          Container(
                            width: 110,
                            height: 28,
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0)),
                            ),
                            child: Text(
                              "${model.price}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ));
      items.add(listItem);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text('Shower n Breakfast',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sort,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            children: _getItems(),
          ),
        ),
      ),
    );
  }
}
