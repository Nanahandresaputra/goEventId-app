import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_event_id/feature/bloc/tiket_acara/tiket_acara_bloc.dart';
import 'package:go_event_id/helpers/currency_format.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailTicket extends StatefulWidget {
  final dynamic state;
  final Function(int) onChange;
  const DetailTicket({super.key, required this.state, required this.onChange});

  @override
  State<DetailTicket> createState() => _DetailTicketState();
}

class _DetailTicketState extends State<DetailTicket> {
  int selectedTicket = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Tiket',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(
          height: 10,
        ),
        widget.state is TiketAcaraSuccess &&
                widget.state.tiketAcaraModel.data.isNotEmpty
            ? Column(
                children: <Widget>[
                  for (int index = 0;
                      index < widget.state.tiketAcaraModel.data.length;
                      index++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedTicket =
                              widget.state.tiketAcaraModel.data[index].id;
                          widget.onChange(
                              widget.state.tiketAcaraModel.data[index].id);
                        });
                      },
                      child: Skeletonizer(
                        enabled: widget.state is TiketAcaraLoading,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: selectedTicket ==
                                          widget.state.tiketAcaraModel
                                              .data[index].id
                                      ? const Color(0xFF173831)
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                              color: selectedTicket ==
                                      widget
                                          .state.tiketAcaraModel.data[index].id
                                  ? const Color(0xFFDBF0DD)
                                  : const Color.fromARGB(12, 0, 0, 0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            103, 140, 179, 152),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Icon(
                                      CupertinoIcons.tickets,
                                      color: Color(0xFF173831),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${widget.state.tiketAcaraModel.data[index].tipeTiket}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        CurrencyFormat.convertToIdr(
                                            widget.state.tiketAcaraModel
                                                .data[index].hargaTiket,
                                            0),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF173831)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}


// ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           padding: const EdgeInsets.only(
//             top: 20,
//           ),
//           itemCount: .length,
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
//                           color: selectedTicket == widget.state.tiketAcaraModel.data[index].id
//                               ? const Color(0xFF173831)
//                               : Colors.transparent),
//                       borderRadius: BorderRadius.circular(10),
//                       color: selectedTicket == widget.state.tiketAcaraModel.data[index].id
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
//                             '${[index]['tipeTicket']}',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w600, fontSize: 16),
//                           )
//                         ],
//                       ),
//                       Text(
//                         'Rp. ${[index]['price']}',
//                         style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF173831)),
//                       )
//                     ],
//                   ),
//                 ),
//               ))





// ======================
// for (int index = 0; index < .length; index++)
//           InkWell(
//             onTap: () {
//               setState(() {
//                 selectedTicket = index;
//               });
//             },
//             child: Container(
//               padding: const EdgeInsets.all(10),
//               margin: const EdgeInsets.only(bottom: 8),
//               decoration: BoxDecoration(
//                   border: Border.all(
//                       color: selectedTicket == widget.state.tiketAcaraModel.data[index].id
//                           ? const Color(0xFF173831)
//                           : Colors.transparent),
//                   borderRadius: BorderRadius.circular(10),
//                   color: selectedTicket == widget.state.tiketAcaraModel.data[index].id
//                       ? const Color(0xFFDBF0DD)
//                       : const Color.fromARGB(12, 0, 0, 0)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(103, 140, 179, 152),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: const Icon(
//                           CupertinoIcons.tickets,
//                           color: Color(0xFF173831),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Text(
//                         '${[index]['tipeTicket']}',
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 16),
//                       )
//                     ],
//                   ),
//                   Text(
//                     'Rp. ${[index]['price']}',
//                     style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF173831)),
//                   )
//                 ],
//               ),
//             ),
//           )