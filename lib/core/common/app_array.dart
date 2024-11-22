
import '../../config.dart';

const kBaseUrl = 'https://fwallet-s78e.onrender.com/';

class AppArray {
  static final AppArray _instance = AppArray._internal();

  factory AppArray() {
    return _instance;
  }

  AppArray._internal();

  var bottomNavigationBarList = [
    {
      "title": appFonts.mpay,
      "icon": eSvgAssets.cards,
      "iconDark": eSvgAssets.cardsDark
    },
    {
      "title": "Beneficiary",
      "icon": eSvgAssets.bitcoin,
      "iconDark": eSvgAssets.bitcoinDark
    },
    {
      "title": appFonts.reward,
      "icon": eSvgAssets.insight,
      "iconDark": eSvgAssets.insightDark
    },
    {
      "title": appFonts.profile,
      "icon": eSvgAssets.profile,
      "iconDark": eSvgAssets.profileDark
    }
  ];

  var localList = <Locale>[
    const Locale('en'),
    const Locale('ar'),
    const Locale('fr'),
    const Locale('hi'),
  ];

  

  var optionList = [
    {
      "title": appFonts.topup,
      "icon": eSvgAssets.cryptoSend,
    },
    {
      "title": appFonts.bill,
      "icon": eSvgAssets.bill,
      "color": appTheme.darkText
    },
    {
      "title": appFonts.request,
      "icon": eSvgAssets.download,
      "color": appTheme.darkText
    },
    {
      "title": appFonts.withdraw,
      "icon": eSvgAssets.withdraw,
      "color": appTheme.darkText
    }
  ];
  
  var transaction = [
    {
      "title": appFonts.amazonPrime,
      "subTitle": appFonts.subscription,
      "icon": eSvgAssets.amazon,
      "price": "199.99",
      "time": "8:45 am",
    },
    {
      "title": appFonts.appleStore,
      "subTitle": appFonts.installment,
      "icon": eSvgAssets.apple,
      "price": "59.85",
      "time": "9:00 pm",
    },
    {
      "title": appFonts.groceryShop,
      "subTitle": appFonts.purchase,
      "icon": eSvgAssets.shop,
      "price": "55.30",
      "time": "20 Mar",
    },
    {
      "title": appFonts.snapchatSub,
      "subTitle": appFonts.billPay,
      "icon": eSvgAssets.snapchat,
      "price": "18.01",
      "time": "19 Mar",
    },
    {
      "title": appFonts.spotifyMusic,
      "subTitle": appFonts.transfer,
      "icon": eSvgAssets.spotify,
      "price": "19.20",
      "time": "18 Mar",
    },
  ];
  

  var allServiceList = [
    {
      "title": appFonts.bills,
      "list": [
        {
          "title": appFonts.electricity,
          "icon": eSvgAssets.electricity,
        },
        {
          "title": appFonts.water,
          "icon": eSvgAssets.droplet,
        },
        {
          "title": appFonts.internet,
          "icon": eSvgAssets.wifi,
        },
        {
          "title": appFonts.television,
          "icon": eSvgAssets.television,
        },
        {
          "title": appFonts.mobile,
          "icon": eSvgAssets.smartphone,
        },
        {
          "title": appFonts.eWallet,
          "icon": eSvgAssets.eWallet,
        }
      ]
    },
    {
      "title": appFonts.otherOption,
      "list": [
        {
          "title": appFonts.investment,
          "icon": eSvgAssets.barchart,
        },
        {
          "title": appFonts.deals,
          "icon": eSvgAssets.deals,
        },
        {
          "title": appFonts.medical,
          "icon": eSvgAssets.otherMedical,
        },
        {
          "title": appFonts.car,
          "icon": eSvgAssets.car,
        },
        {
          "title": appFonts.shopping,
          "icon": eSvgAssets.shoppingBag,
        },
        {
          "title": appFonts.games,
          "icon": eSvgAssets.game,
        }
      ]
    }
  ];
  var receiveMoneyList = [
    {
      "amount": "49.85",
      "Date": "10 Feb, 2023",
      "time": "9:02 pm",
      "receiverForm": appFonts.dianneChristian,
      "bankName": appFonts.hdfcBank
    }
  ];
  var selectBankList = [
    {
      "amount": "25263.36",
      "accountNumber": "**** **** **** 2563",
      "isCheck": false
    },
    {
      "amount": "85256.25",
      "accountNumber": "**** **** **** 1235",
      "isCheck": false
    },
  ];
  var recentPayees = [
    {"title": appFonts.add, "icon": eImageAssets.firstQuick, "pin": ""},
    {"title": appFonts.higgins, "icon": eImageAssets.higgins, "pin": "**** 56"},
    {"title": appFonts.trunk, "icon": eImageAssets.trunk, "pin": "**** 78"},
    {"title": appFonts.tanner, "icon": eImageAssets.tanner, "pin": "**** 15"},
    {"title": appFonts.dianne, "icon": eImageAssets.secQuick, "pin": "**** 56"},
  ];
  var amountList = ["50.00", "100.00", "150.00"];

 
  var viewTransaction = [
    {
      "title": "John",
      "date": "28 Feb, 2023",
      "amount": "100",
      "time": "8:45 am",
      "icon": eSvgAssets.tProjectTip,
    },
    {
      "title": "Albert",
      "date": "20 Feb, 2023",
      "amount": "1000",
      "time": "9:00 pm",
      "icon": eSvgAssets.tTransfer,
    },
 
    {
      "title": "Manu",
      "date": "10 Jan, 2023",
      "amount": "150",
      "time": "6:15 pm",
      "icon": eSvgAssets.coffee,
    }
  ];

 

  var lastPaid = [
    {
      "title": appFonts.mobile,
      "date": "20 Jan, 2023",
      "price": "49.99",
      "time": "8:45 am",
      "icon": eSvgAssets.smartphone,
    },
    {
      "title": appFonts.electricity,
      "date": "19 Jan, 2023",
      "price": "66.08",
      "time": "9:23 am",
      "icon": eSvgAssets.electricity,
    },
    {
      "title": appFonts.water,
      "date": "18 Jan, 2023",
      "price": "85.12",
      "time": "2:45 pm",
      "icon": eSvgAssets.droplet,
    },
    {
      "title": appFonts.television,
      "date": "20 Jan, 2023",
      "price": "14.89",
      "time": "3:00 pm",
      "icon": eSvgAssets.television,
    },
  ];

  var transactionHistory = [
    {
      "dayTitle": appFonts.today,
      "list": [
        {
          "title": appFonts.amazonPrime,
          "subTitle": appFonts.subscription,
          "icon": eSvgAssets.amazon,
          "price": "199.99",
          "time": "8:45 am",
        },
        {
          "title": appFonts.appleStore,
          "subTitle": appFonts.installment,
          "icon": eSvgAssets.apple,
          "price": "59.85",
          "time": "8:30 am",
        }
      ]
    },
    {
      "dayTitle": appFonts.yesterday,
      "list": [
        {
          "title": appFonts.groceryShop,
          "subTitle": appFonts.purchase,
          "icon": eSvgAssets.shop,
          "price": "55.30",
          "time": "2:18 am",
        },
        {
          "title": appFonts.flipkart,
          "subTitle": appFonts.billPay,
          "icon": eSvgAssets.flipkart,
          "price": "18.01",
          "time": "2:15 am",
        },
        {
          "title": appFonts.diane,
          "subTitle": appFonts.transfer,
          "icon": eSvgAssets.spotify,
          "price": "19.20",
          "time": "3:00 pm",
        },
      ]
    },
    {
      "dayTitle": "12 Feb,2023",
      "list": [
        {
          "title": appFonts.fruitShop,
          "subTitle": appFonts.purchase,
          "icon": eSvgAssets.shop,
          "price": "14.31",
          "time": "2:18 am",
        }
      ]
    },
  ];
  var thLayout = [
    {
      "dayTitle": "12th May to 25th Jan",
      "list": [
        {
          "title": appFonts.amazonPrime,
          "subTitle": appFonts.subscription,
          "icon": eSvgAssets.amazon,
          "price": "199.99",
          "time": "8:45 am",
        },
        {
          "title": appFonts.appleStore,
          "subTitle": appFonts.installment,
          "icon": eSvgAssets.apple,
          "price": "59.85",
          "time": "8:30 am",
        }
      ]
    }
  ];
}
