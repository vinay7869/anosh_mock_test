import '../../../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/home_cubit.dart';
import '../../common/widgets/text_container.dart';

bool isMobile = mq.width < 480;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..fetchItems(),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final _controller = TextEditingController();
  bool isMobile = mq.width < 480;
  List<String> tableDataString = const [
    'LOT Description',
    'Group',
    'Units',
    'Pcs',
    'Weight',
    'Rate',
    'Value',
    'S Rate',
    'S Value',
  ];

  @override
  Widget build(BuildContext context) {
    final c = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      bloc: c,
      builder: (context, state) {
        return DecoratedBox(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Mock.png'))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ),
            body: ListView(
              padding: const EdgeInsets.fromLTRB(25, 7, 25, 25),
              children: [
                // details card
                Padding(
                  padding: EdgeInsets.only(
                      left: isMobile ? mq.width * .07 : mq.width * .05),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal:
                                isMobile ? mq.width * .12 : mq.width * .05),
                        decoration: const BoxDecoration(
                            color: Color(0xffEDEDED),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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

                // divider
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Divider(color: Colors.white),
                ),

                //search text field
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 10 : mq.width * .25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: isMobile ? mq.height * .06 : mq.height * .08,
                          child: TextField(
                            controller: _controller,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                c.clearSearch();
                              } else {
                                c.searchItem(value);
                              }
                            },
                            onTapOutside: (_) =>
                                FocusScope.of(context).unfocus(),
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor:
                                    const Color(0xff6C6C6C).withOpacity(.25),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40))),
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                hintText: 'Search',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            _controller.clear();
                            c.clearSearch();
                          },
                          child: const Text('clear'))
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                //
                Stack(
                  children: [
                    SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            // upper grid
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        TextContainer(
                                            text: state.selectedItem?.barcode ??
                                                'Barcode No.'),
                                        TextContainer(
                                            text:
                                                state.selectedItem?.location ??
                                                    'Location'),
                                        TextContainer(
                                            text: state.selectedItem?.branch ??
                                                'Branch'),
                                        TextContainer(
                                            text: state.selectedItem?.status ??
                                                'Status'),
                                        TextContainer(
                                            text: state.selectedItem?.counter
                                                    .toString() ??
                                                'Counter'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextContainer(
                                            text: state.selectedItem?.source ??
                                                'Source'),
                                        TextContainer(
                                            text:
                                                state.selectedItem?.category ??
                                                    'Category'),
                                        TextContainer(
                                            text: state
                                                    .selectedItem?.collection ??
                                                'Collection'),
                                        TextContainer2(
                                            text: state.selectedItem
                                                    ?.description ??
                                                'Description'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextContainer(
                                            text:
                                                state.selectedItem?.metalGrp ??
                                                    'Metal_Grp'),
                                        TextContainer(
                                            text: state
                                                    .selectedItem?.stkSection ??
                                                'STK_Section'),
                                        TextContainer(
                                            text: state.selectedItem?.mfgdBy ??
                                                'Mfgd_By'),
                                        TextContainer2(
                                            text: state.selectedItem?.notes ??
                                                'Notes'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextContainer(
                                            text: state
                                                    .selectedItem?.inStkSince ??
                                                'In_STK_Since'),
                                        TextContainer(
                                            text: state.selectedItem?.certNo ??
                                                'Cert_No'),
                                        TextContainer(
                                            text: state.selectedItem?.huidNo ??
                                                'HUID_No'),
                                        TextContainer(
                                            text: state.selectedItem?.cusName ??
                                                'Order_No'),
                                        TextContainer(
                                            text: state.selectedItem?.size ??
                                                'Cus_Name'),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: isMobile
                                      ? mq.height * .22
                                      : mq.height * .28,
                                  width: isMobile
                                      ? mq.width * .22 * 2
                                      : mq.width * .18,
                                  margin: const EdgeInsets.only(left: 7),
                                  decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      // image: DecorationImage(
                                      //     fit: BoxFit.cover,
                                      //     image: NetworkImage(state
                                      //             .selectedItem?.imageLink ??
                                      //         "https://nulldata.com/img/nulldata.jpg")),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                )
                              ],
                            ),

                            // bottom grid
                            Padding(
                              padding: EdgeInsets.only(
                                  top: mq.height * .01, right: mq.width * .03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      TextContainer(
                                          text: state.selectedItem?.quality ??
                                              'Size'),
                                      TextContainer(
                                          text: state.selectedItem?.kt
                                                  .toString() ??
                                              'Quality'),
                                      TextContainer(
                                          text: state.selectedItem?.pcs
                                                  .toString() ??
                                              'KT'),
                                      TextContainer(
                                          text: state.selectedItem?.grossWt
                                                  .toString() ??
                                              'Pcs'),
                                      TextContainer(
                                          text: state.selectedItem?.netWt
                                                  .toString() ??
                                              'Gross_Wt'),
                                      TextContainer(
                                          text: state.selectedItem?.diaPcs
                                                  .toString() ??
                                              'Net_Wt'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextContainer(
                                          text: state.selectedItem?.diaWt
                                                  .toString() ??
                                              'Dia_Pcs'),
                                      TextContainer(
                                          text: state.selectedItem?.clsPcs
                                                  .toString() ??
                                              'Dia_Wt'),
                                      TextContainer(
                                          text: state.selectedItem?.clsWt
                                                  .toString() ??
                                              'Cls_Pcs'),
                                      TextContainer(
                                          text: state.selectedItem?.chainWt
                                                  .toString() ??
                                              'Cls_Wt'),
                                      TextContainer(
                                          text: state.selectedItem?.mRate
                                                  .toString() ??
                                              'Chain_Wt'),
                                      TextContainer(
                                          text: state.selectedItem?.mValue
                                                  .toString() ??
                                              'M_Rate'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextContainer(
                                          text: state.selectedItem?.lRate
                                                  .toString() ??
                                              'M_Value'),
                                      TextContainer(
                                          text: state.selectedItem?.lCharges
                                                  .toString() ??
                                              'L_Rate'),
                                      TextContainer(
                                          text: state.selectedItem?.rCharges
                                                  .toString() ??
                                              'L_Charges'),
                                      TextContainer(
                                          text: state.selectedItem?.oCharges
                                                  .toString() ??
                                              'R_Charges'),
                                      TextContainer(
                                          text: state.selectedItem?.mrp
                                                  .toString() ??
                                              'O_Charges'),
                                      TextContainer(
                                          text: state.selectedItem?.mrp
                                                  .toString() ??
                                              'MRP'),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Table data
                            Padding(
                              padding: EdgeInsets.only(top: mq.height * .03),
                              child: Column(
                                children: [
                                  //
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        color: const Color(0xffD9D9D9)
                                            .withOpacity(.35)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: isMobile
                                              ? mq.width * .11
                                              : mq.width * .03),
                                      child: Row(
                                        children: tableDataString.map((e) {
                                          return Container(
                                            padding: const EdgeInsets.all(7),
                                            width: isMobile
                                                ? mq.width * .27
                                                : mq.width * .1,
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),

                                  //
                                ],
                              ),
                            ),

                            //
                            state.tableData.isEmpty
                                ? Container(
                                    height: 100,
                                    width: isMobile
                                        ? mq.width *
                                                .27 *
                                                tableDataString.length +
                                            mq.width * .22
                                        : mq.width *
                                                .1 *
                                                tableDataString.length +
                                            mq.width * .06,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      color: Color.fromARGB(97, 102, 102, 102),
                                    ),
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      color: Color.fromARGB(97, 102, 102, 102),
                                    ),
                                    child: Column(
                                        children:
                                            state.tableData.map((eachData) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: isMobile
                                                ? mq.width * .11
                                                : mq.width * .03),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TableDataText(
                                                  text:
                                                      eachData.lotDescription),
                                              TableDataText(
                                                  text: eachData.group),
                                              TableDataText(
                                                  text: eachData.units),
                                              TableDataText(
                                                  text:
                                                      eachData.pcs.toString()),
                                              TableDataText(
                                                  text: eachData.weight
                                                      .toString()),
                                              TableDataText(
                                                  text:
                                                      eachData.rate.toString()),
                                              TableDataText(
                                                  text: eachData.value
                                                      .toString()),
                                              TableDataText(
                                                  text: eachData.sRate
                                                      .toString()),
                                              TableDataText(
                                                  text: eachData.sValue
                                                      .toString()),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList()),
                                  ),
                          ],
                        ),
                      ),
                    ),

                    // search container
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: state.show,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              margin: EdgeInsets.only(right: mq.width * .17),
                              decoration: const BoxDecoration(
                                  color: Color(0xff1D1D1D),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7))),
                              child: state.searchItem.isEmpty
                                  ? const Text(
                                      'No Match Found',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.searchItem.length,
                                      itemBuilder: (context, index) {
                                        final item = state.searchItem[index];
                                        return ListTile(
                                          title: Text(
                                            item.barcode,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            c.selectItem(item);
                                            FocusScope.of(context).unfocus();
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
