import 'package:flutter/material.dart';

class ChoisirLocal extends StatefulWidget {
  const ChoisirLocal({Key? key}) : super(key: key);

  @override
  State<ChoisirLocal> createState() => _ChoisirLocalState();
}

class _ChoisirLocalState extends State<ChoisirLocal> {
  String dropdownvalue = 'Item 5555';

  // List of items in our dropdown menu
  var items = [
    'Item 5555',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            margin: EdgeInsets.only(top: 160,left: 60),
            child: Text('Choisir Votre au Position',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFF1450AA)) ,),
          ),
          Container(
            height: 60,
          ),

          Wrap(

            children: [
              Container(
                margin: EdgeInsets.only(left: 20,top: 10),
                child: Text('bâtiment :',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 30,
                  underline: SizedBox(),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,
                          style: const TextStyle(fontSize: 20, color: Colors.black)),
                    );
                  }).toList(),
                  // After selecting the desired option, it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      print("hello");
                    });
                  },
                ),
              )


            ],
          ),

          Container(
            height: 30,
          ),

          Wrap(

            children: [
              Container(
                margin: EdgeInsets.only(left: 20,top: 10),
                child: Text('N° d’etage :',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 30,
                  underline: SizedBox(),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,
                          style: const TextStyle(fontSize: 20, color: Colors.black)),
                    );
                  }).toList(),
                  // After selecting the desired option, it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      print("hello");
                    });
                  },
                ),
              )


            ],
          ),

          Container(
            height: 30,
          ),
          Wrap(

            children: [
              Container(
                margin: EdgeInsets.only(left: 20,top: 10),
                child: Text('Type de salle :',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 30,
                  underline: SizedBox(),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,
                          style: const TextStyle(fontSize: 20, color: Colors.black)),
                    );
                  }).toList(),
                  // After selecting the desired option, it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      print("hello");
                    });
                  },
                ),
              )


            ],
          ),

          Container(
            height: 30,
          ),


          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('N°  de salle : ',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 210,
                child: Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20, // set font size
                    ),
                    decoration: InputDecoration(

                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30), // set padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), // set border radius
                        borderSide: BorderSide.none, // set border style
                      ),
                      filled: true,
                      fillColor: Colors.grey[200], // set background color
                    ),
                  ),
                ),
              )

            ],
          ),
          Container(
            height: 150,
          ),
          Container(
            margin: EdgeInsets.only(left: 100),
            child: SizedBox(
                width: 200, // set the desired width
                height: 60, // set the desired height
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(20, 15),

                    backgroundColor:  Color(0xFF1450AA),
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    // Add your button action here
                  },
                  child: Text('Suivant'),
                )

            ),
          )









        ],

      ),
    );
  }
}
