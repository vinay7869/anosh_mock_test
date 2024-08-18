import 'package:anosh_mock_test/main.dart';
import 'package:flutter/material.dart';

class PP extends StatefulWidget {
  const PP({super.key});

  @override
  State<PP> createState() => _PPState();
}

class _PPState extends State<PP> {
  Map<String, dynamic> struc = {
    "Lot_Description": "Lot Description",
    "Group": "Group",
    "Units": "Units",
    "Pcs": "Pcs",
    "Weight": "Weight",
    "Rate": "Rate",
    "Value": "Value",
    "S_Rate": "S Rate",
    "S_Value": "S Value",
  };

  List<Map<String, dynamic>> tableData = [
    {
      "Lot_Description": "CBR",
      "Group": "GOLD",
      "Units": "CARATS",
      "Pcs": 1,
      "Weight": 0.05,
      "Rate": 0.0,
      "Value": 0.0,
      "S_Rate": 0.0,
      "S_Value": 88.0
    },
    {
      "Lot_Description": "SBR",
      "Group": "SILVER",
      "Units": "KILOGRAMS",
      "Pcs": 1,
      "Weight": 0.015,
      "Rate": 0.0,
      "Value": 0.0,
      "S_Rate": 0.0,
      "S_Value": 76.0
    },
    {
      "Lot_Description": "GTR",
      "Group": "GEMSTONE",
      "Units": "CARATS",
      "Pcs": 1,
      "Weight": 0.2,
      "Rate": 0.0,
      "Value": 0.0,
      "S_Rate": 0.0,
      "S_Value": 2.0
    },
    {
      "Lot_Description": "ATR",
      "Group": "DIAMOND",
      "Units": "CARATS",
      "Pcs": 1,
      "Weight": 0.2,
      "Rate": 0.0,
      "Value": 0.0,
      "S_Rate": 0.0,
      "S_Value": 21.0
    },
    {
      "Lot_Description": "ZTR",
      "Group": "COPPER",
      "Units": "CARATS",
      "Pcs": 1,
      "Weight": 0.2,
      "Rate": 0.0,
      "Value": 0.0,
      "S_Rate": 0.0,
      "S_Value": 99.0
    },
    {
      "Lot_Description": "FTR",
      "Group": "GEMSTONE",
      "Units": "CARATS",
      "Pcs": 1,
      "Weight": 0.2,
      "Rate": 0.0,
      "Value": 0.0,
      "S_Rate": 0.0,
      "S_Value": 19.0
    },
    {
      "Lot_Description": "JTR",
      "Group": "GOLD",
      "Units": "CARATS",
      "Pcs": 1,
      "Weight": 0.2,
      "Rate": 0.0,
      "Value": 0.0,
      "S_Rate": 0.0,
      "S_Value": 11.0
    }
  ];

  List<Map<String, dynamic>> filteredData = [];

  void _search(String key, String query) {
    setState(() {
      filteredData = tableData
          .where((item) =>
              item[key] != null &&
              item[key].toString().toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showSearchDialog(String key) {
    showDialog(
      context: context,
      builder: (context) {
        String query = "";
        return AlertDialog(
          title: Text('Search by ${struc[key]}'),
          content: TextField(
            onChanged: (value) {
              query = value;
            },
            decoration: const InputDecoration(hintText: 'Enter search term'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _search(key, query);
                Navigator.of(context).pop();
              },
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }

  void _sortAscending(String key) {
    setState(() {
      filteredData.sort(
        (a, b) {
          var aValue = a[key];
          var bValue = b[key];

          if (aValue is num && bValue is num) {
            return aValue.compareTo(bValue);
          } else {
            return aValue.toString().compareTo(bValue.toString());
          }
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    filteredData = List.from(tableData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Colors.black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border:
                      Border(bottom: BorderSide(width: 1, color: Colors.red))),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'My data',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: struc.keys
                        .map((key) => SizedBox(
                              width: key == 'Lot_Description'
                                  ? mq.width * .14
                                  : mq.width * .07,
                              child: key == 'Group' || key == 'Weight'
                                  ? Row(
                                      children: [
                                        Text(struc[key]),
                                        IconButton(
                                            onPressed: () =>
                                                _showSearchDialog(key),
                                            iconSize: 20,
                                            icon: const Icon(Icons.search))
                                      ],
                                    )
                                  : key == 'Lot_Description' || key == 'S_Value'
                                      ? Row(
                                          children: [
                                            Text(struc[key]),
                                            IconButton(
                                                onPressed: () =>
                                                    _sortAscending(key),
                                                icon: const Icon(
                                                    Icons.unfold_more))
                                          ],
                                        )
                                      : Text(struc[key]),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),

            //
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final item = filteredData[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: struc.keys
                          .map((key) => SizedBox(
                                width: key == 'Lot_Description'
                                    ? mq.width * .14
                                    : mq.width * .07,
                                child: Text(item[key].toString()),
                              ))
                          .toList(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
