import 'package:event/screen/qr_scanner.dart';
import 'package:flutter/material.dart';
import '../widgets/container_button.dart';
import '../widgets/dropdown_textediting.dart';
import '../widgets/circle_container.dart';
import '../widgets/repeat_textfield.dart';

class ConfirmSeat extends StatefulWidget {
  @override
  State<ConfirmSeat> createState() => _ConfirmSeatState();
}

class _ConfirmSeatState extends State<ConfirmSeat> {
  // const ConfirmSeat({super.key});
  String? dropDownValue;
  String? postCateg = 'post categor';

  // List<Object> product = ['10/17/[PMS]'];
  // List<Object> product2 = ['1-PMS (General Quota)'];
  String dropdownValue = '10/17/[PMS]';
  List<dynamic> dates = ['10/17/[PMS]', '10/18/[PMS]', '10/19/[PMS]'];

  String postSerialInit = '1-PMS(General Quota)';
  List<dynamic> PostSerialList = [
    '1-PMS(General Quota)',
    '1-PMS(General)',
  ];

  String postCategoryInit = 'PMS';
  List<dynamic> postCategoryList = [
    'PMS',
    'DMS',
  ];

  String peymentInit = 'tenelor EasyPaise';
  List<dynamic> peymentOptionList = [
    'tenelor EasyPaise',
    'Jazz JazzCash',
  ];

  // String transactionInit = 'tenelor EasyPaise';
  // List<dynamic> peymentOptionList = [
  //   'tenelor EasyPaise',
  //   'Jazz JazzCash',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          const CirlceContainer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Check Out',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(60, 195, 240, 1)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 0.6)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          '''Select the advertisement, Post and enter Transaction Information'''),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Advertisement'),
                      DropDownTextEditing(
                          initValue: dropdownValue, ListValue: dates),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Post Serial No and Title'),
                      DropDownTextEditing(
                        initValue: postSerialInit,
                        ListValue: PostSerialList,
                      ),
                      const SizedBox(height: 10),
                      const Text('Post Category'),
                      DropDownTextEditing(
                          initValue: postCategoryInit,
                          ListValue: postCategoryList),
                      const SizedBox(height: 10),
                      const Text('Peyment at'),
                      DropDownTextEditing(
                        initValue: peymentInit,
                        ListValue: peymentOptionList,
                      ),
                      const SizedBox(height: 10),
                      const Text('Transation ID'),
                      const RepeatTextField(
                        hint: 'Transation id',
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {},
                          child: const Text('Apply'))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const Text('Rs: 60'),
                      const Text(
                        'pay 3 Bills every months, Absolutely Free ❗',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              backgroundColor: Colors.green),
                          onPressed: () {},
                          child: const Text('Pay Now'))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ContainerButton(
                  colors: const Color.fromRGBO(60, 195, 240, 1),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const QrScanner()));
                  },
                  title: 'Confirm',
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
