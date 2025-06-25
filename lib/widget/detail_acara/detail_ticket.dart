import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailTicket extends StatefulWidget {
  const DetailTicket({super.key});

  @override
  State<DetailTicket> createState() => _DetailTicketState();
}

class _DetailTicketState extends State<DetailTicket> {
  List<Map<String, dynamic>> dataDummy = [
    {"tipeTicket": "Tribun Utara", "price": 200000},
    {"tipeTicket": "Tribun Selatan", "price": 200000},
    {"tipeTicket": "Tribun Barat", "price": 200000},
  ];

  int selectedTicket = -1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Tiket',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          for (int index = 0; index < dataDummy.length; index++)
            InkWell(
              onTap: () {
                setState(() {
                  selectedTicket = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: selectedTicket == index
                            ? const Color(0xFF173831)
                            : Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                    color: selectedTicket == index
                        ? const Color(0xFFDBF0DD)
                        : const Color.fromARGB(12, 0, 0, 0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(103, 140, 179, 152),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            CupertinoIcons.tickets,
                            color: Color(0xFF173831),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${dataDummy[index]['tipeTicket']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        )
                      ],
                    ),
                    Text(
                      'Rp. ${dataDummy[index]['price']}',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF173831)),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}


// ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           padding: const EdgeInsets.only(
//             top: 20,
//           ),
//           itemCount: dataDummy.length,
//           itemBuilder: (context, index) => InkWell(
//                 onTap: () {
//                   setState(() {
//                     selectedTicket = index;
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   margin: const EdgeInsets.only(bottom: 8),
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                           color: selectedTicket == index
//                               ? const Color(0xFF173831)
//                               : Colors.transparent),
//                       borderRadius: BorderRadius.circular(10),
//                       color: selectedTicket == index
//                           ? const Color(0xFFDBF0DD)
//                           : const Color.fromARGB(12, 0, 0, 0)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: BoxDecoration(
//                                 color: const Color.fromARGB(103, 140, 179, 152),
//                                 borderRadius: BorderRadius.circular(8)),
//                             child: const Icon(
//                               CupertinoIcons.tickets,
//                               color: Color(0xFF173831),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             '${dataDummy[index]['tipeTicket']}',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w600, fontSize: 16),
//                           )
//                         ],
//                       ),
//                       Text(
//                         'Rp. ${dataDummy[index]['price']}',
//                         style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF173831)),
//                       )
//                     ],
//                   ),
//                 ),
//               ))