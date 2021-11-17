import 'package:backb/modal/modal.dart';
import 'package:backb/services/api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Modal> _futureData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureData = API().getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_left,
            color: Colors.black,
          ),
          title: Text(
            "Search",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 150,
              child: FutureBuilder<Modal>(
                  future: _futureData,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                snapshot.data!.data!.branch!.category!.length,
                            itemBuilder: (context, index) {
                              print(snapshot
                                  .data!.data!.branch!.category!.length);
                              var restaurentData =
                                  snapshot.data!.data!.branch!.category![index];
                              // var branch =
                              //     snapshot.data!.data!.branch!.category![index];
                              return croosProductTile(restaurentData);
                            },
                          )
                        : Center(
                            child: Container(),
                          );
                  }),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: FutureBuilder<Modal>(
                  future: _futureData,
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data!.data!.restaurant!.length,
                            itemBuilder: (context, index) {
                              print(snapshot.data!.data!.restaurant!.length);
                              var restaurentData =
                                  snapshot.data!.data!.restaurant![index];
                              // var branch =
                              //     snapshot.data!.data!.branch!.category![index];
                              return ProductTile(restaurentData);
                            },
                          )
                        : Center(
                            child: Container(
                              child: CircularProgressIndicator(),
                            ),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Container ProductTile(restaurentdata) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  height: 160,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    height: double.infinity,
                    width: double.infinity,
                    image: NetworkImage(
                        "https://fuddo-development.s3.ap-south-1.amazonaws.com/${restaurentdata.storeBg}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurentdata.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        children: [
                          Text(
                            "${restaurentdata.location.address} | ${restaurentdata.distance.toString().substring(0, restaurentdata.distance.toString().indexOf('.'))} km",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "₹.${restaurentdata.avgPersonAmt.toString()} for two",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "${restaurentdata.openTime.toString()} am",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            " - ${restaurentdata.closeTime.toString()} pm",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container croosProductTile(categoryData) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  height: 50,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    height: double.infinity,
                    width: double.infinity,
                    image: NetworkImage(categoryData.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryData.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
