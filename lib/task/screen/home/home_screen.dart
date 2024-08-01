import 'dart:developer';
import 'package:anosh_mock_test/main.dart';
import 'package:anosh_mock_test/task/json/my_json.dart';
import 'package:flutter/material.dart';
import '../../model/model.dart';
import '../widgets/text_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  List<Item> _itemsList = [];
  List<Item> _searchResults = [];
  Item? selectedItem;

  @override
  void initState() {
    final itemsList = List.from(myItems['Items'] as Iterable)
        .map((e) => Item.fromJson(e))
        .toList();
    _itemsList = itemsList;

    super.initState();
  }

  bool show = false;

  void searchItem(String barcode) {
    setState(() {
      _searchResults =
          _itemsList.where((item) => item.barcode.contains(barcode)).toList();
      show = true;
    });
  }

  void selectItem(Item item) {
    setState(() {
      selectedItem = item;
      show = false;
      _controller.text = item.barcode;
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    log(_itemsList.length.toString());

    //
    if (selectedItem?.tableData != null) {
      for (var tableDataItem in selectedItem!.tableData) {
        log('table data -->> ${tableDataItem.group}');
        log('table data -->> ${tableDataItem.lotDescription}');
        log('table data -->> ${tableDataItem.pcs}');
        log('table data -->> ${tableDataItem.sRate}');
      }
    } else {
      log('table data is null or empty');
    }

    return DecoratedBox(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/Mock.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(7, 2, 7, 7),
          children: [
            // details card
            Padding(
              padding: EdgeInsets.only(left: mq.width * .07),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: mq.width * .12),
                    decoration: const BoxDecoration(
                        color: Color(0xffEDEDED),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Align(
                      child: Text(
                        'Details',
                        style: TextStyle(fontFamily: 'Allerta'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: Colors.white),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: mq.height * .06,
                    child: TextField(
                      controller: _controller,
                      onTap: () {
                        show = true;
                        setState(() {});
                      },
                      onChanged: (value) {
                        searchItem(value);
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Color(0xff6C6C6C),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          hintText: 'Search'),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        selectedItem = null;
                        show = false;
                        _searchResults.clear();
                      });
                    },
                    child: const Text('Clear'))
              ],
            ),

            const SizedBox(height: 10),

            Stack(
              children: [
                // upper grid

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextContainer(
                                  text: selectedItem?.barcode ?? 'Barcode No.'),
                              TextContainer(
                                  text: selectedItem?.location ?? 'Location'),
                              TextContainer(
                                  text: selectedItem?.branch ?? 'Branch'),
                              TextContainer(
                                  text: selectedItem?.status ?? 'Status'),
                              TextContainer(
                                  text: selectedItem?.counter.toString() ??
                                      'Counter'),
                            ],
                          ),
                          Row(
                            children: [
                              TextContainer(
                                  text: selectedItem?.source ?? 'Source'),
                              TextContainer(
                                  text: selectedItem?.category ?? 'Category'),
                              TextContainer(
                                  text:
                                      selectedItem?.collection ?? 'Collection'),
                              TextContainer2(
                                  text: selectedItem?.description ??
                                      'Description'),
                            ],
                          ),
                          Row(
                            children: [
                              TextContainer(
                                  text: selectedItem?.metalGrp ?? 'Metal_Grp'),
                              TextContainer(
                                  text: selectedItem?.stkSection ??
                                      'STK_Section'),
                              TextContainer(
                                  text: selectedItem?.mfgdBy ?? 'Mfgd_By'),
                              TextContainer2(
                                  text: selectedItem?.notes ?? 'Notes'),
                            ],
                          ),
                          Row(
                            children: [
                              TextContainer(
                                  text: selectedItem?.inStkSince ??
                                      'In_STK_Since'),
                              TextContainer(
                                  text: selectedItem?.certNo ?? 'Cert_No'),
                              TextContainer(
                                  text: selectedItem?.huidNo ?? 'HUID_No'),
                              TextContainer(
                                  text: selectedItem?.cusName ?? 'Order_No'),
                              TextContainer(
                                  text: selectedItem?.size ?? 'Cus_Name'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: mq.height * .21,
                        width: mq.width * .4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(selectedItem?.imageLink ??
                                    "https://nulldata.com/img/nulldata.jpg")),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      )
                    ],
                  ),
                ),

                // bottom grid
                Padding(
                  padding: EdgeInsets.only(top: mq.height * .23),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextContainer(
                                    text: selectedItem?.quality ?? 'Size'),
                                TextContainer(
                                    text: selectedItem?.kt.toString() ??
                                        'Quality'),
                                TextContainer(
                                    text: selectedItem?.pcs.toString() ?? 'KT'),
                                TextContainer(
                                    text: selectedItem?.grossWt.toString() ??
                                        'Pcs'),
                                TextContainer(
                                    text: selectedItem?.netWt.toString() ??
                                        'Gross_Wt'),
                                TextContainer(
                                    text: selectedItem?.diaPcs.toString() ??
                                        'Net_Wt'),
                              ],
                            ),
                            Row(
                              children: [
                                TextContainer(
                                    text: selectedItem?.diaWt.toString() ??
                                        'Dia_Pcs'),
                                TextContainer(
                                    text: selectedItem?.clsPcs.toString() ??
                                        'Dia_Wt'),
                                TextContainer(
                                    text: selectedItem?.clsWt.toString() ??
                                        'Cls_Pcs'),
                                TextContainer(
                                    text: selectedItem?.chainWt.toString() ??
                                        'Cls_Wt'),
                                TextContainer(
                                    text: selectedItem?.mRate.toString() ??
                                        'Chain_Wt'),
                                TextContainer(
                                    text: selectedItem?.mValue.toString() ??
                                        'M_Rate'),
                              ],
                            ),
                            Row(
                              children: [
                                TextContainer(
                                    text: selectedItem?.lRate.toString() ??
                                        'M_Value'),
                                TextContainer(
                                    text: selectedItem?.lCharges.toString() ??
                                        'L_Rate'),
                                TextContainer(
                                    text: selectedItem?.rCharges.toString() ??
                                        'L_Charges'),
                                TextContainer(
                                    text: selectedItem?.oCharges.toString() ??
                                        'R_Charges'),
                                TextContainer(
                                    text: selectedItem?.mrp.toString() ??
                                        'O_Charges'),
                                TextContainer(
                                    text:
                                        selectedItem?.mrp.toString() ?? 'MRP'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //  search container
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Visibility(
                        visible: show,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          margin: EdgeInsets.only(right: mq.width * .17),
                          decoration: const BoxDecoration(
                              color: Color(0xff1D1D1D),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _searchResults.length,
                            itemBuilder: (context, index) {
                              final item = _searchResults[index];
                              return ListTile(
                                title: Text(
                                  item.barcode,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  selectItem(item);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
