import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:santra_flutter_task/res/components/home_componenets/product_description_component.dart';
import 'package:santra_flutter_task/utils/constants/colors.dart';
import 'package:santra_flutter_task/utils/routes/routes_name.dart';
import 'package:santra_flutter_task/view_model/home_view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    ///
    final homeViewModel = Provider.of<HomeViewModel>(
      context,
      listen: false,
    );
    homeViewModel.getModifierList(
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().appBackgroundcolor,
        body: Consumer<HomeViewModel>(
            builder: (context, valueOfHomeViewModel, child) {
          
          return valueOfHomeViewModel.modifierListloading == true
              ? const Center(
                  child: Text('Processing'),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: valueOfHomeViewModel
                              .modifiersModelList!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesName.modifierscreenroute,
                                  arguments: {
                                    'productData': valueOfHomeViewModel
                                        .modifiersModelList!.data![index],
                                  },
                                );
                              },
                              child: ProductDescriptionComponent(
                                data: valueOfHomeViewModel
                                    .modifiersModelList!.data![index],
                              ),
                            );
                            // Text(
                            //   '${valueOfHomeViewModel.modifiersModelList!.data![index].businessName}',
                            // );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
