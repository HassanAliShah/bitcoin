import 'package:bitcoin/Network.dart';
import 'package:bitcoin/login_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;

  CircularProgressIndicator loading = CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Colors.black),
  );
  Network network = Network('BTC');
  Future data;
  bool circle = true;
  @override
  void initState() {
    super.initState();
    data = getdata();
  }

  getdata() async {
    return await network.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent.shade200,
          automaticallyImplyLeading: false,
          title: Center(child: Text('Crypto Currency')),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  auth.signOut();
                  Navigator.pushNamed(context, login_Page.id);
                })
          ],
        ),
        body: FutureBuilder(
          future: data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // ignore: unrelated_type_equality_checks
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView(
                  children: [
                    Card(
                      image: AssetImage('images/bitcoinlogo.png'),
                      name: network.bName,
                      marketChage: network.bMarketChange,
                      price: network.bPrice,
                      symbol: network.bsym,
                    ),
                    Card(
                      name: network.eName,
                      marketChage: network.eMarketChange,
                      price: network.ePrice,
                      image: AssetImage('images/Ethereum.png'),
                      symbol: network.esym,
                    ),
                    Card(
                      image: AssetImage('images/litcoin.png'),
                      price: network.lPrice,
                      marketChage: network.lMarketChange,
                      name: network.lName,
                      symbol: network.lsym,
                    ),
                    Card(
                      price: network.xPrice,
                      name: network.xName,
                      marketChage: network.xMarketChange,
                      image: AssetImage('images/Ripple.png.png'),
                      symbol: network.xsym,
                    ),
                    Card(
                      image: AssetImage('images/chainlink.png'),
                      price: network.cPrice,
                      marketChage: network.cMarketChange,
                      name: network.cName,
                      symbol: network.csym,
                    ),
                    Card(
                      image: AssetImage('images/usdc.png'),
                      price: network.uPrice,
                      marketChage: network.uMarketChange,
                      name: network.uName,
                      symbol: network.usym,
                    ),
                    Card(
                      image: AssetImage('images/dash.png'),
                      price: network.dPrice,
                      marketChage: network.dMarketChange,
                      name: network.dName,
                      symbol: network.dsym,
                    ),
                    Card(
                      image: AssetImage('images/huobi-token.png'),
                      price: network.hPrice,
                      marketChage: network.hMarketChange,
                      name: network.hName,
                      symbol: network.hsym,
                    ),
                    Card(
                      image: AssetImage('images/zcash.png'),
                      price: network.zPrice,
                      marketChage: network.zMarketChange,
                      name: network.zName,
                      symbol: network.zsym,
                    ),
                    Card(
                      image: AssetImage('images/compound.jpeg'),
                      price: network.yPrice,
                      marketChage: network.yMarketChange,
                      name: network.yName,
                      symbol: network.ysym,
                    ),
                  ],
                );
                break;
              case ConnectionState.none:
                return Text('Network Error');
                break;
              default:
                return ModalProgressHUD(
                  inAsyncCall: circle,
                  child: Container(),
                  progressIndicator: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.black),
                  ),
                );
            }
          },
        ));
  }
}

class Card extends StatelessWidget {
  final String name;
  final String price;
  final String marketChage;
  final AssetImage image;
  final String symbol;

  Card({this.name, this.price, this.marketChage, this.image, this.symbol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Material(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: image,
                  ),
                  elevation: 10.0,
                  shape: CircleBorder(),
                  clipBehavior: Clip.none,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        (name),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        (symbol),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '$marketChage',
                      style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
