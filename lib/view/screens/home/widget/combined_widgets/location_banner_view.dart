import 'package:efood_multivendor/controller/localization_controller.dart';
import 'package:efood_multivendor/controller/theme_controller.dart';
import 'package:efood_multivendor/helper/responsive_helper.dart';
import 'package:efood_multivendor/helper/route_helper.dart';
import 'package:efood_multivendor/util/dimensions.dart';
import 'package:efood_multivendor/util/images.dart';
import 'package:efood_multivendor/util/styles.dart';
import 'package:efood_multivendor/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationBannerView extends StatelessWidget {
  const LocationBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.isMobile(context) ? Dimensions.paddingSizeLarge : 0, vertical: ResponsiveHelper.isMobile(context) ? Dimensions.paddingSizeDefault : Dimensions.paddingSizeLarge),
      child: Container(
        padding: EdgeInsets.all(ResponsiveHelper.isMobile(context) ? 0 : Dimensions.paddingSizeLarge),
        height: ResponsiveHelper.isMobile(context) ? 95 : 147,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(Get.find<ThemeController>().darkTheme ? 0.5 : 0.1),
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
        ),
        child: Row(children: [
          SizedBox(width: ResponsiveHelper.isMobile(context) ? Dimensions.paddingSizeExtraSmall : 0),
          Expanded(
              child: Row(children: [
                Image.asset(Images.nearbyRestaurant, height: ResponsiveHelper.isMobile(context) ? 58:  93, width: ResponsiveHelper.isMobile(context) ? 74 : 119),
                SizedBox(width: ResponsiveHelper.isMobile(context) ? Dimensions.paddingSizeSmall : Dimensions.paddingSizeLarge),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('find_nearby'.tr, style: robotoBold.copyWith(fontSize: ResponsiveHelper.isMobile(context) ? Dimensions.fontSizeDefault : Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w600)),
                    const SizedBox(height: Dimensions.paddingSizeSmall),

                    Text('restaurant_near_from_you'.tr, style: robotoRegular.copyWith(fontSize: ResponsiveHelper.isMobile(context) ? Dimensions.fontSizeSmall : Dimensions.fontSizeLarge)),
                  ],
                ),
              ],
              ),
          ),

          Column(mainAxisAlignment: ResponsiveHelper.isMobile(context) ? MainAxisAlignment.center : MainAxisAlignment.end, children: [
            Image.asset(Images.nearbyLocation, height: ResponsiveHelper.isMobile(context) ? 30 : 40, width: ResponsiveHelper.isMobile(context) ? 30 : 40),
            CustomButton(buttonText: 'see_location'.tr, width: ResponsiveHelper.isMobile(context) ? 85 : 120, height: ResponsiveHelper.isMobile(context) ? 30 : 40, isBold: false, fontSize: Dimensions.fontSizeSmall, radius: Dimensions.radiusSmall,
                onPressed: ()=> Get.toNamed(RouteHelper.getMapViewRoute())),
          ],
          ),
          SizedBox(width: ResponsiveHelper.isMobile(context) ? Dimensions.paddingSizeSmall : 0),
        ],
        ),
      ),
    );
  }
}