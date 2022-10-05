import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../shared/common/common.dart';
import '../../../../shared/widgets/widgets.dart';
import 'detail/page/rental_girl_detail_page.dart';

class RentalGirlPage extends StatelessWidget {
  const RentalGirlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: context.insets.h12,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: context.sizes.p8,
        mainAxisSpacing: context.sizes.p8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(child: Image.asset(AppImages.avatar)),
              ListTile(
                leading: const Icon(Icons.card_membership),
                title: Text('Card item $index'),
                subtitle: const Text('Rental girl friend this'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AppTextButton(
                    child: const Text('DATING NOW'),
                    onPressed: () {
                      context.goRouter.go(
                          '${context.goRouter.location}/${RentalGirlDetailPage.routerPath}');
                    },
                  ),
                  AppTextButton(
                    child: const Text('LIKE'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
