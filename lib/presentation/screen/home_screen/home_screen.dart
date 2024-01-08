import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:refresh_token_flutter/presentation/reusable_widget/all_dialog.dart';
import 'package:refresh_token_flutter/presentation/screen/home_screen/pickup_widget.dart';
import 'package:refresh_token_flutter/utils/font_and_margin.dart';
import 'package:refresh_token_flutter/view_model/home_view_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/color_constants.dart';
import '../coming_soon_screen/coming_soon_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(context: _),
      child: Consumer<HomeViewModel>(builder: (_, viewModel, __) {
        return DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                GestureDetector(
                  onTap: () {
                    showConfirmDialog(
                        context: context,
                        title: "Exit",
                        cancel: "Cancel",
                        confirm: "Confirm",
                        subtitle: "Are you sure",
                        onConfirm: () {
                          Navigator.pop(context);
                          viewModel.onLogout(context);
                        });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: const Center(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultMarginWidth),
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )),
                )
              ],
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "Pick on way",
                  ),
                  Tab(
                    text: "Pick up completed",
                  ),
                  Tab(
                    text: "Pickup cancel",
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ComingSoonScreen(),
                viewModel.isLoading
                    ? RefreshIndicator(
                        onRefresh: () async {
                          viewModel.init(context: _);
                        },
                        child: ListView.separated(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefaultMarginWidth,
                              vertical: kDefaultMarginHeight),
                          itemBuilder: (_, index) {
                            return SizedBox(
                              height: 60.0,
                              child: Shimmer.fromColors(
                                baseColor: Color(0xffe3e3e3),
                                highlightColor: Colors.white,
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: hintColor,
                                  ),
                                  height: 600,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 12,
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          viewModel.init(context: context);
                        },
                        child: LazyLoadScrollView(
                            onEndOfPage: () async =>
                                await viewModel.getAllAddress(context: _),
                            child: PickupWidget(
                              dataList: viewModel.deliAddressList,
                              count: '${viewModel.count}',
                              totalCount: viewModel.totalCount,
                            )),
                      ),
                const ComingSoonScreen()
              ],
            ),

            /*Column(
              children: [
               Text(viewModel.isFirstTime)
              ],
            ),*/
          ),
        );
      }),
    );
  }
}
