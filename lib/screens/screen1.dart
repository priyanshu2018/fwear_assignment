import 'package:flutter/material.dart';
import 'package:fwear_assignment/constant.dart';

class Screen1 extends StatelessWidget {
  final onTapBack;
  Screen1({this.onTapBack});

  @override
  Widget build(BuildContext context) {
    var mediaHeight = MediaQuery.of(context).size.height;
    var mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                          height: 1.1,
                          color: Colors.black,
                          fontSize: mediaHeight * .04,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(userName,
                        style: TextStyle(
                            height: 1.1,
                            color: Colors.black,
                            fontSize: mediaHeight * .04,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: mediaHeight * .04,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 9,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                      height: mediaHeight / 6,
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: mediaHeight * .025,
                                color: backgroundColor,
                              ),
                              onPressed: onTapBack,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text("Reading",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: mediaHeight * .025,
                                        fontWeight: FontWeight.bold)),
                                Text("Book Lists",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: mediaHeight * .025,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Image.asset("asset/images/bookclip.png",
                          width: mediaWidth / 2, height: mediaHeight / 4.4),
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15, top: 20, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: mediaHeight * .03,
                        fontWeight: FontWeight.bold)),
                Text("see all",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: mediaHeight * .02,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 15, left: 15),
            width: mediaWidth,
            height: mediaHeight / 3,
            child: GridView.builder(
                itemCount: popularBooks.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  childAspectRatio: mediaWidth / mediaHeight / 1.44,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade300, blurRadius: 10)
                              ],
                              image: DecorationImage(
                                  image: popularBooks[index].coverPhoto,
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(popularBooks[index].title,
                                  softWrap: true,
                                  style: TextStyle(
                                      height: 1.2,
                                      color: Colors.black87,
                                      fontSize: mediaHeight * .022,
                                      fontWeight: FontWeight.bold)),
                              Text(popularBooks[index].author,
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: mediaHeight * .02)),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(popularBooks[index].rating,
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: mediaHeight * .022,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15, top: 20, bottom: 15),
            child: Text("Audiobook",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: mediaHeight * .03,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.yellowAccent,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/46/c7/ac/46c7ac826b4d5d9cf208a70bb65b09e7.jpg"),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Eula Hardy",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: mediaHeight * .022,
                                fontWeight: FontWeight.bold)),
                        Text("Cecillia Alexander",
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.black87,
                                fontSize: mediaHeight * .02))
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.play_arrow,
                  size: 30,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: backgroundColor,
        unselectedItemColor: Color(0XFF6d7586),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              title: Text("k")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 20), title: Text("k")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 25), title: Text("k")),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline, size: 20),
              title: Text("k")),
        ],
      ),
    );
  }
}
