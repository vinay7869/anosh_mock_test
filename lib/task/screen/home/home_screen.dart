import 'package:anosh_mock_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/home_cubit.dart';
import '../widgets/text_container.dart';

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
                          onChanged: (value) {
                            if (value.isEmpty) {
                              c.clearSearch();
                            } else {
                              c.searchItem(value);
                            }
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
                          c.clearSearch();
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
                                      text: state.selectedItem?.barcode ??
                                          'Barcode No.'),
                                  TextContainer(
                                      text: state.selectedItem?.location ??
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
                                      text: state.selectedItem?.category ??
                                          'Category'),
                                  TextContainer(
                                      text: state.selectedItem?.collection ??
                                          'Collection'),
                                  TextContainer2(
                                      text: state.selectedItem?.description ??
                                          'Description'),
                                ],
                              ),
                              Row(
                                children: [
                                  TextContainer(
                                      text: state.selectedItem?.metalGrp ??
                                          'Metal_Grp'),
                                  TextContainer(
                                      text: state.selectedItem?.stkSection ??
                                          'STK_Section'),
                                  TextContainer(
                                      text: state.selectedItem?.mfgdBy ??
                                          'Mfgd_By'),
                                  TextContainer2(
                                      text:
                                          state.selectedItem?.notes ?? 'Notes'),
                                ],
                              ),
                              Row(
                                children: [
                                  TextContainer(
                                      text: state.selectedItem?.inStkSince ??
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
                            height: mq.height * .21,
                            width: mq.width * .4,
                            margin: const EdgeInsets.only(left: 3),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(state
                                            .selectedItem?.imageLink ??
                                        "https://nulldata.com/img/nulldata.jpg")),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
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
                                        text: state.selectedItem?.quality ??
                                            'Size'),
                                    TextContainer(
                                        text:
                                            state.selectedItem?.kt.toString() ??
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
                                            context
                                                .read<HomeCubit>()
                                                .selectItem(item);
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
      },
    );
  }
}
