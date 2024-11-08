import 'package:flutter/material.dart';
import 'package:pro_minder/core/utils/text_styles.dart';
import 'package:pro_minder/features/on_boarding/domain/entities/boarding_page_entity.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key, required this.pageData});
  final BoardingPageEntity pageData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          pageData.title,
          style: style22,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          pageData.description,
          style: style18,
        ),
        const SizedBox(
          height: 6,
        ),
        if (pageData.secondLineDescription != null)
          Text(
            pageData.secondLineDescription!,
            style: style18,
          ),
        const SizedBox(
          height: 32,
        ),
        Flexible(
          child: Image.asset(
            pageData.imageAsset,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        )
      ],
    );
  }
}
