import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: const Center(child: BackButton()),
      ),
      backgroundColor: AppColor.darkCerulean,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 16),
            _createHistoryText(),
            Expanded(child: _createHistoryInfoListView()),
          ],
        ),
      ),
    );
  }

  Widget _createHistoryInfoListView() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        physics: const RangeMaintainingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ยังไม่พร้อมใช้จ้า')));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 16,
                  right: 8,
                  bottom: 16,
                ),
                child: _createContentInfo(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _createContentInfo() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '29 ส.ค. 2564, 18:03',
            style: AppTextTheme.main.subtitle1?.copyWith(
              color: AppColor.darkCerulean,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'ตัวแทน: ',
                  style: AppTextTheme.main.subtitle1?.copyWith(
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: '2342fsx',
                  style: AppTextTheme.main.subtitle1?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor, sed do eiusmod tempor',
            style: AppTextTheme.main.bodyText2,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _createHistoryText() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      child: Text(
        'ประวัติการสนทนา',
        style: AppTextTheme.main.headline1?.copyWith(
          color: AppColor.white,
        ),
      ),
    );
  }
}
