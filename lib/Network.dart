import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String sym;
  Network(this.sym);
  String bName;
  String bPrice;
  String bMarketChange;
  String bsym;
  String data;
  String lName;
  String lPrice;
  String lMarketChange;
  String lsym;
  String eName;
  String ePrice;
  String eMarketChange;
  String esym;
  String xName;
  String xPrice;
  String xMarketChange;
  String xsym;
  String cName;
  String cPrice;
  String cMarketChange;
  String csym;
  String uName;
  String uPrice;
  String uMarketChange;
  String usym;
  String dName;
  String dPrice;
  String dMarketChange;
  String dsym;
  String hName;
  String hPrice;
  String hMarketChange;
  String hsym;
  String zName;
  String zPrice;
  String zMarketChange;
  String zsym;
  String yName;
  String yPrice;
  String yMarketChange;
  String ysym;

  Future getData() async {
    try {
      http.Response response = await http.get(
          'https://api.nomics.com/v1/currencies/ticker?key=6507cfbf98d3e48e3452a716d17a5c35&ids=BTC,LTC,ETH,XRP,LINK,USDC,DASH,HT,ZEC,COMP');
      print(response.statusCode);
      if (response.statusCode == 200) {
        data = response.body;
        //Bitcoin Data
        bMarketChange = jsonDecode(data)[0]['1d']['volume_change_pct'];
        bMarketChange = bMarketChange.toString();
        String pr = jsonDecode(data)[0]['price'];
        double price = double.parse(pr);
        price = double.parse(price.toStringAsFixed(2));
        this.bPrice = price.toString();
        bName = jsonDecode(data)[0]['name'];
        bsym = jsonDecode(data)[0]['symbol'];
        //Ethereum
        eMarketChange = jsonDecode(data)[1]['1d']['volume_change_pct'];
        eMarketChange = eMarketChange.toString();
        String epr = jsonDecode(data)[1]['price'];
        double eprice = double.parse(epr);
        eprice = double.parse(eprice.toStringAsFixed(2));
        this.ePrice = eprice.toString();
        eName = jsonDecode(data)[1]['name'];
        esym = jsonDecode(data)[1]['symbol'];
        //XRP COIN
        xMarketChange = jsonDecode(data)[2]['1d']['volume_change_pct'];
        xMarketChange = xMarketChange.toString();
        print(xMarketChange);
        String xpr = jsonDecode(data)[2]['price'];
        double xprice = double.parse(xpr);
        xprice = double.parse(xprice.toStringAsFixed(2));
        this.xPrice = xprice.toString();
        xName = jsonDecode(data)[2]['name'];
        xsym = jsonDecode(data)[2]['symbol'];
        //Litecoin Data
        lName = jsonDecode(data)[3]['name'];
        lMarketChange = jsonDecode(data)[3]['1d']['volume_change_pct'];
        lMarketChange = lMarketChange.toString();
        String lpr = jsonDecode(data)[3]['price'];
        double lprice = double.parse(lpr);
        lprice = double.parse(lprice.toStringAsFixed(2));
        this.lPrice = lprice.toString();
        lsym = jsonDecode(data)[3]['symbol'];
        //ChainLink
        cName = jsonDecode(data)[4]['name'];
        cMarketChange = jsonDecode(data)[4]['1d']['volume_change_pct'];
        cMarketChange = cMarketChange.toString();
        String cpr = jsonDecode(data)[4]['price'];
        double cprice = double.parse(cpr);
        cprice = double.parse(cprice.toStringAsFixed(2));
        this.cPrice = cprice.toString();
        csym = jsonDecode(data)[4]['symbol'];
        //5.USD Coin
        uName = jsonDecode(data)[5]['name'];
        uMarketChange = jsonDecode(data)[5]['1d']['volume_change_pct'];
        uMarketChange = uMarketChange.toString();
        String upr = jsonDecode(data)[5]['price'];
        double uprice = double.parse(upr);
        uprice = double.parse(uprice.toStringAsFixed(2));
        this.uPrice = uprice.toString();
        usym = jsonDecode(data)[5]['symbol'];
        //6.DASH
        dName = jsonDecode(data)[6]['name'];
        dMarketChange = jsonDecode(data)[6]['1d']['volume_change_pct'];
        dMarketChange = dMarketChange.toString();
        String dpr = jsonDecode(data)[6]['price'];
        double dprice = double.parse(dpr);
        dprice = double.parse(dprice.toStringAsFixed(2));
        this.dPrice = dprice.toString();
        dsym = jsonDecode(data)[6]['symbol'];
        //7.HT
        hName = jsonDecode(data)[7]['name'];
        hMarketChange = jsonDecode(data)[7]['1d']['volume_change_pct'];
        hMarketChange = hMarketChange.toString();
        String hpr = jsonDecode(data)[7]['price'];
        double hprice = double.parse(hpr);
        hprice = double.parse(hprice.toStringAsFixed(2));
        this.hPrice = hprice.toString();
        hsym = jsonDecode(data)[7]['symbol'];
        //8.ZCASH
        zName = jsonDecode(data)[8]['name'];
        zMarketChange = jsonDecode(data)[8]['1d']['volume_change_pct'];
        zMarketChange = zMarketChange.toString();
        String zpr = jsonDecode(data)[8]['price'];
        double zprice = double.parse(zpr);
        zprice = double.parse(zprice.toStringAsFixed(2));
        this.zPrice = zprice.toString();
        zsym = jsonDecode(data)[8]['symbol'];
        //9.compound
        yName = jsonDecode(data)[9]['name'];
        yMarketChange = jsonDecode(data)[9]['1d']['volume_change_pct'];
        yMarketChange = yMarketChange.toString();
        String ypr = jsonDecode(data)[9]['price'];
        double yprice = double.parse(ypr);
        yprice = double.parse(yprice.toStringAsFixed(2));
        this.yPrice = yprice.toString();
        ysym = jsonDecode(data)[9]['symbol'];

        return data;
      }
    } catch (e) {
      print(e);
    }
  }

  // String get marketChange  {
  //   _marketChange =  jsonDecode(data)[0]['1d']['volume_change_pct'];
  //   _marketChange = _marketChange.toString();
  // }
  //
  // Future<double> get price async {
  //   _price = await jsonDecode(data)[0]['price'];
  //   return _price = double.parse(_price.toStringAsFixed(2));
  // }
  //
  // Future<String> get name async {
  //   _name = await jsonDecode(data)[0]['name'];
  // }
}
