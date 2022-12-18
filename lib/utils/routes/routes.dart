import 'package:flutter/material.dart';
import 'package:santra_flutter_task/model/modifiers_models/modifier_model.dart';
import 'package:santra_flutter_task/utils/routes/custom_page_route.dart';
import 'package:santra_flutter_task/utils/routes/routes_name.dart';
import 'package:santra_flutter_task/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:santra_flutter_task/view/cart_screens_views/cart_view.dart';
import 'package:santra_flutter_task/view/modifiers_screen_views/product_modifiers_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// WalkThrough FLOW
      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      case RoutesName.homescreenroute:
        return MaterialPageRoute(
          builder: (BuildContext context) => const BottomNavBar(),
        );

      /// Custom Page Route ///
      case RoutesName.modifierscreenroute:
        final results = settings.arguments as Map;
        final Data? productData = results['productData'];
        return CustomPageRoute(
          child: ProductModifierScreen(productData: productData),
          direction: AxisDirection.left,
        );
      case RoutesName.cartscreenroute:
        final results = settings.arguments as Map;
        final String productName = results['productName'];
        final String productCode = results['productCode'];
        final String categoryName = results['categoryName'];
        return CustomPageRoute(
          child: CartScreenView(
            productName: productName,
            productCode: productCode,
            categoryName: categoryName,
          ),
          direction: AxisDirection.left,
        );

      /// Custom Page Route ///

      ///

      // case RoutesName.walkthroughone:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const WalkThroughOneView(),
      //   );

      /// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      /// when no route found default route
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
