import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_event_id/feature/bloc/acara/acara_bloc.dart';
import 'package:go_event_id/feature/model/acara_model.dart';
import 'package:go_event_id/screen/detail_acara/detail_acara.dart';
import 'package:go_event_id/widget/acara/card_acara.dart';
import 'package:go_event_id/widget/execption_message/no_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListContent extends StatefulWidget {
  final int? filterCategory;
  final String? filterSearch;
  final dynamic state;
  const ListContent(
      {super.key,
      this.filterCategory = 0,
      this.filterSearch = '',
      required this.state});

  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  List<Datum> eventData = [];

  @override
  void initState() {
    super.initState();

    context.read<AcaraBloc>().add(GetAcaraEvent());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state is AcaraSuccess) {
      eventData = widget.state.acaraModel.data.where((Datum item) {
        if (widget.filterCategory != 0 && widget.filterSearch != '') {
          print('state validate ---> 1');
          return item.kategori.id == widget.filterCategory &&
              item.namaAcara
                  .toLowerCase()
                  .contains('${widget.filterSearch}'.toLowerCase());
        } else if (widget.filterCategory != 0 && widget.filterSearch == '') {
          print('state validate ---> 2');
          return item.kategori.id == widget.filterCategory;
        } else if (widget.filterCategory == 0 && widget.filterSearch != '') {
          print('state validate ---> 3');
          return item.namaAcara
              .toLowerCase()
              .contains('${widget.filterSearch}'.toLowerCase());
        } else {
          print('state validate ---> 4');
          return true;
        }
      }).toList();
    }

    return widget.state is AcaraSuccess && eventData.isEmpty
        ? const NoData()
        : Skeletonizer(
            enabled: widget.state is AcaraLoading,
            // height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.state is AcaraSuccess
                    ? widget.state.acaraModel.data.length
                    : 7,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black26, width: 1)),
                    child: CardAcara(
                      data: widget.state is AcaraSuccess
                          ? eventData[index]
                          : null,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailAcara(
                                data: widget.state is AcaraSuccess
                                    ? eventData[index]
                                    : null,
                              ),
                            ));
                      },
                    ),
                  );
                }),
          );
  }
}
