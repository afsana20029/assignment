import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var arrName = ['Pillover', 'T-Shirt', 'Sport Dress'];
  var arrSize = ['Size:L', 'Size:M', 'Size:L'];
  var arrolor = ['Color:Black', 'Color:Gray', 'Color:Black'];
  var unitPrice = [51, 30, 43];
  int counter = 0;
  var itemCount = [
    0,
    0,
    0,
  ];
  double getTotalAmount() {
    double total = 0;
    for (int i = 0; i < itemCount.length; i++) {
      total += itemCount[i] * unitPrice[i];
    }
    return total;
  }

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Bag',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
           Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(right: 20,left: 20),

                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ListTile(
                            leading: Container(
                              width: 100,
                              height: 200,
                              child: Image.network(
                                "https://static-01.daraz.com.bd/p/0ca5fe04272fcc0356eaa603ecf82625.jpg",
                      
                              ),
                            ),
                            title: Text(arrName[index]),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(arrolor[index]),
                                    Row(
                                      children: [
                                        Material(
                                            elevation: 6,
                                            shape: CircleBorder(),
                                            child: IconButton(
                                                onPressed: () {
                                                  itemCount[index]++;
                                                  setState(() {});
                                                },
                                                icon: Icon(Icons.add))),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text('${itemCount[index]}'),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Material(
                                          elevation: 6,
                                          shape: CircleBorder(),
                                          child: IconButton(
                                              onPressed: () {
                                                itemCount[index]--;
                                                setState(() {});
                                              },
                                              icon: Icon(Icons.remove)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(arrSize[index])
                              ],
                            ),
                            trailing: Text(
                              '${unitPrice[index]}\$',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemCount: arrSize.length),
           ),
        Padding(
            child: Text(
                'Total amount: ${getTotalAmount().toStringAsFixed(2)}\$'),
            padding: EdgeInsets.all(10)),
        Padding(
          padding: const EdgeInsets.all(30),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white),
              onPressed: () {
                MySnackBar('Congratulations', context);
              },
              child: Text('CHECK OUT')),
        ),
     ] )

    );
  }
}
