import 'package:flutter/material.dart';
import 'package:refresh_token_flutter/core/extension/extension.dart';
import 'package:refresh_token_flutter/domain/vos/address_vo.dart';
import 'package:refresh_token_flutter/utils/color_constants.dart';

import '../../../utils/font_and_margin.dart';

class PickupWidget extends StatelessWidget {
  final List<Item> dataList;
  final String count;
  final String totalCount;

  const PickupWidget(
      {super.key,
      required this.dataList,
      required this.count,
      required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: dataList.length,
      padding: EdgeInsets.symmetric(vertical: kDefaultMarginHeight),
      itemBuilder: (context, position) {
        Item vo = dataList[position];
        return Container(

            margin: const EdgeInsets.symmetric(
                horizontal: kDefaultMarginWidth, vertical: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(2, 2),
                      spreadRadius: 4,
                      blurRadius: 4)
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: _tableWidget(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            title: "${vo.trackingId ?? ""}",
                            subtitle: vo.osName ?? "",
                            titleTextStyle: const TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500))),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: _tableWidget(
                            title: vo.osTownshipName ?? "",
                            subtitle: vo.osPrimaryPhone ?? "",
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: _tableWidget(
                            title: "${vo.pickupDate ?? ""}".removeTimeStamp() ??
                                "",
                            subtitle: "${vo.totalWays ?? ""}Ways",
                            crossAxisAlignment: CrossAxisAlignment.end,
                            subtitleTextStyle:
                                const TextStyle(fontWeight: FontWeight.w600))),
                  ],
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "${position+1} of $totalCount",
                      textAlign: TextAlign.right,
                    ))
              ],
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 2,
      ),
    );
  }
}

Widget _tableWidget(
    {required String title,
    required String subtitle,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    CrossAxisAlignment? crossAxisAlignment}) {
  return Column(
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: titleTextStyle,
        textAlign: TextAlign.center,
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        subtitle,
        style: subtitleTextStyle,
      ),
    ],
  );
}
