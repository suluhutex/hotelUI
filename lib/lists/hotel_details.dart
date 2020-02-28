import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ImgList {
  final String imgs;
  ImgList({this.imgs});
}

List _imgList = [
  ImgList(imgs: 'assets/img/room1.jpg'),
  ImgList(imgs: 'assets/img/room2.jpg'),
  ImgList(imgs: 'assets/img/room3.jpg'),
  ImgList(imgs: 'assets/img/room4.jpg'),
];

class HotelDetails extends StatelessWidget {
  final Map<String, Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              floating: false,
              pinned: true,
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.topCenter,
                            colors: [Colors.transparent, Colors.grey[800]],
                          ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                        },
                        blendMode: BlendMode.darken,
                        child: new Image.asset(
                          "${_imgList[index].imgs.toString()}",
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: _imgList.length,
                    pagination: new SwiperPagination(),
                    //control: new SwiperControl(),
                    viewportFraction: 1,
                  ),
                ),
              ),
            )
          ];
        },
        body: Material(
          color: Colors.grey[100],
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              Card(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 2),
                                  child: Text('Bangaiza Hotel',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .apply(
                                              color: Colors.black87,
                                              fontWeightDelta: 2)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1, horizontal: 2),
                                  child: Text('Tononoka, Mombasa Kenya',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .apply(color: Colors.black54)),
                                ),
                                FlatButton.icon(
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.grey, size: 20,
                                  ),
                                  label: Text('+254722000022',
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .apply(
                                              color: Colors.black87,
                                              fontSizeDelta: -4.5)),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 2),
                                  child: Text('KSh. 400',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .apply(
                                              color: Colors.purple,
                                              fontWeightDelta: 4)),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1, horizontal: 2),
                                  child: Text('1 shower \n & breakfast',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .apply(
                                            color: Colors.black,
                                          )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.amber,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/calendar');
                        },
                                              child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Book Now',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.title.apply(
                                      color: Colors.purple,
                                    )),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.purple,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        child: Text('About hotel',
                            style: Theme.of(context).textTheme.title.apply(
                                color: Colors.black87, fontWeightDelta: 2)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non sodales neque sodales ut etiam sit amet nisl. Ornare arcu odio ut sem nulla.',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .apply(color: Colors.black54)),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 4),
                  child: Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(-4.046251, 39.666142),
                        zoom: 18,
                      ),
                      markers: _markers.values.toSet(),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Get Directions',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.title.apply(
                                    color: Colors.purple,
                                  )),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.purple,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
