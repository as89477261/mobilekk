import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';
import 'package:oic_next_to_you/features/main/data/models/history/res_personal_history.dart';
import 'package:oic_next_to_you/features/detail/models/res_detail_model.dart';
import 'package:oic_next_to_you/features/detail/presentation/detail_provider.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/processed_text.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.obj});

  final res_personal_history obj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkCerulean,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: BackButton()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _createContentInfo(context, obj),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ย้อนกลับ'),
              ),
            ),

            // _createProfileInfo(context),
            // _createBreakLine(),
            //_createHistoryText(),
          ],
        ),
      ),
      //floatingActionButton: _addRecordingButton(context),
    );
  }

  Widget _createProfileInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Icon(
            Icons.account_circle,
            size: 90,
            color: AppColor.peachOrange,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'สวัสดีผู้ใช้หมายเลข',
                style: AppTextTheme.main.bodyLarge?.copyWith(
                  color: AppColor.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _createContentInfo(BuildContext context, res_personal_history obj) {
    double height = MediaQuery.of(context).size.height - 150;

    return Container(
        constraints: BoxConstraints(
            minHeight: 100, minWidth: double.infinity, maxHeight: height),
        padding: const EdgeInsets.only(
          left: 8,
          top: 16,
          right: 8,
          bottom: 16,
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "วันที่เริ่มบันทึก : " +
                      Extension().ToThaiDateTime(obj.creatEDATE ?? ""),
                  //obj.creatEDATE ?? "",
                  style: AppTextTheme.main.subtitle1?.copyWith(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                  ),
                ),
                Text(
                  "รหัสตัวแทน : " + (obj.agenTID ?? "ไม่ระบุ"),
                  //obj.creatEDATE ?? "",
                  style: AppTextTheme.main.subtitle1?.copyWith(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                  ),
                ),
                Text(
                  "ชื่อตัวแทน : " + (obj.agenTNAME ?? "ไม่ระบุ"),
                  //obj.creatEDATE ?? "",
                  style: AppTextTheme.main.subtitle1?.copyWith(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                  ),
                ),
                _createBreakLine(),
                Expanded(
                    child: FutureBuilder<Widget>(
                  future: _generateListDetail(context, obj),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return snapshot.data!;
                    } else {
                      /// you handle others state like error while it will a widget no matter what, you can skip it
                      return const SizedBox(
                          child: Center(
                        child: CircularProgressIndicator(),
                      ));
                    }
                  },
                )),
              ],
            )));
  }

  Future<Widget> _generateListDetail(
      BuildContext context, res_personal_history obj) async {
    List<resDetail> bufferDetail = await DetailProvider()
        .getPersonalDetailRecordHistory(obj.sessioNID ?? "");

    bufferDetail.sort((a, b) => a.creatEDATE!.compareTo(b.creatEDATE!));

    return Container(
        constraints: const BoxConstraints(minWidth: double.infinity),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white),
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text.rich(TextSpan(
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    children: List.generate(bufferDetail.length, (index) {
                      return TextSpan(
                        style: TextStyle(
                          fontWeight:
                              (bufferDetail[index].resulTTEXTPHASE != "0"
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                          decoration:
                              (bufferDetail[index].resulTTEXTPHASE != "0"
                                  ? TextDecoration.underline
                                  : TextDecoration.none),
                          fontSize: 18,
                          color: Extension().colorFromProcessedText(
                              bufferDetail[index].resulTTEXTPHASE ?? "",
                              double.parse(bufferDetail[index].risKLEVEL ??
                                  '0')), // Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "" +
                                (bufferDetail[index].raWTEXTPHASE ?? "") +
                                "\n",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _createRiskInfoDialog(
                                        bufferDetail[index], context);
                                  },
                                );
                              },
                          ),
                        ],
                      );
                    }))))));
  }

  Widget _createBreakLine() {
    return const Divider(
      color: AppColor.white,
      height: 20,
      thickness: 2,
    );
  }

  Widget _createRiskInfoDialog(resDetail item, BuildContext context) {
    return AlertDialog(
      title: const Text(
        'รายละเอียดของความเสี่ยง',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ข้อความ: ${item.raWTEXTPHASE}'),
          Text('ความเป็นไปได้: ' +
              (double.parse(item.risKLEVEL ?? '0') > 0
                  ? ((double.parse(item.risKLEVEL ?? '0')) * 100)
                          .round()
                          .toString() +
                      " %"
                  : "0 %")),
          // Text(
          //   'หมวดที่เข้าข่าย: ${item.violatedRule?.number} "' +
          //       _GroupFromProcessedText(item) +
          //       '"',
          // )

          RichText(
            text: TextSpan(
              text: 'หมวดที่เข้าข่าย: ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  style: TextStyle(
                      color: _colorTextFromProcessedText(
                          item.resulTTEXTPHASE ?? "",
                          double.parse(item.risKLEVEL ?? '0')),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  text: '[' +
                      (item.resulTTEXTPHASE ?? "") +
                      '] ' +
                      _GroupFromProcessedText(
                        item.resulTTEXTPHASE ?? "",
                      ),
                ),
              ],
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            side: const BorderSide(width: 1, color: AppColor.white),
            textStyle: AppTextTheme.primaryButton,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            backgroundColor: AppColor.darkCerulean,
          ),
          child: const Text('ปิด'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  final _positives = ["1", "2", "3", "4", "5", "6", "13", "15"];
  final _negatives = ["7", "8", "9", "10", "11", "12", "14", "16", "17"];

  final _groupName = [
    "การปฎิบัติของผู้เสนอขายที่ไม่ผิดหลักการ ข้อปฎิบัติ หรือจรรยาบรรณของการเสนอขายประกันภัย",
    "อธิบายหลักการเปิดเผยข้อความจริง และผลที่จะเกิดขึ้นหากลูกค้ามีการแถลงข้อความอันเป็นเท็จ",
    "แจ้งชัดว่ากรมธรรม์ประกันภัยที่เสนอขายเป็นของบริษัทใด",
    "อธิบายรายละเอียดของกรมธรรม์ เพื่อให้มั่นใจว่าลูกค้าได้รับข้อมูลอย่างถูกต้องเพียงพอประกอบการตัดสินใจทำสัญญาประกันภัย",
    "แจ้งข้อมูลเกี่ยวกับการชำระเบี้ยประกันภัย",
    "ให้ข้อมูลและหลักฐานในการพิสูจน์ตัวตนของผู้เสนอขาย",
    "กระทำการรบกวน หรือก่อความรำคาญให้แก่ลูกค้า",
    "ชักชวนให้ผู้เอาประกันภัยยกเลิกกรมธรรม์ประกันภัย เพื่อมาซื้อกรมธรรม์ประกันภัยใหม่",
    "ให้ข้อความที่เป็นเท็จ ปกปิดข้อความจริง หรือบิดเบือนข้อมูล",
    "ให้คำแนะนำซึ่งอาจจะก่อให้เกิดความเข้าใจผิด",
    "บังคับให้ลูกค้าเข้าทำสัญญาประกันภัย หรือใช้การทำสัญญาประกันภัยเป็นเงื่อนไขในการให้บริการหรือทำธุรกรรมอื่นใด เว้นแต่การทำสัญญาประกันภัยมีวัตถุประสงค์เพื่อป้องกันความเสี่ยงในการให้บริการหรือทำธุรกรรมนั้นโดยตรง",
    "ให้ลูกค้าชำระเงินผ่านบัญชีส่วนตัว กระทำการโอนเงินให้บัญชีอื่นใดที่ไม่ใช่บัญชีของบริษัทของกรมธรรม์ หรือกระทำการใดๆให้ได้รับความเสียหายทางด้านการเงินแก่บริษัท",
    "แจ้งสิทธิในการดำเนินการหลังทำประกันภัยที่จำเป็น",
    "ใช้คำพูดที่สื่อความหมายผิดว่ากรมธรรม์ประกันชีวิตคือการฝากเงิน",
    "ให้คำแนะนำในการเปิดเผยข้อมูลสุขภาพ",
    "ให้คำแนะนำในการปกปิดข้อเท็จจริง เช่น ข้อมูลสุขภาพ",
    "กระทำการลดหรือเสนอที่จะลดค่าบำเหน็จจากการประกันชีวิตให้กับผู้เอาประกันภัย หรือให้ข้อเสนอที่เทียบเท่ากับการลดค่าบำเหน็จ เพราะผิดจรรยาบรรณ "
  ];

  Color _colorTextFromProcessedText(String group, double percent) {
    print("processedText: $group");
    final violatedRule = group;
    if (violatedRule != null) {
      if (_negatives.contains(violatedRule)) {
        return AppColor.red50;
      } else if (_positives.contains(violatedRule)) {
        return AppColor.limeGreen50;
      }
      return AppColor.black;
    } else {
      return AppColor.black;
    }
  }

  Color _colorFromProcessedText(String group, double percent) {
    print("processedText: $group");

    if (group != null) {
      if (_negatives.contains(group)) {
        if (percent > 0.5 && percent <= 0.75) {
          return AppColor.red25;
        } else if (percent > 0.75) {
          return AppColor.red;
        }
      } else if (_positives.contains(group)) {
        if (percent > 0.5 && percent <= 0.75) {
          return AppColor.limeGreen25;
        } else if (percent > 0.75) {
          return AppColor.limeGreen;
        }
      }
      return AppColor.white;
    } else {
      return AppColor.white;
    }
  }

  String _GroupFromProcessedText(String group) {
    print("Group processedText: $group");
    final violatedRule = group;

    if (violatedRule != null) {
      var group = int.parse(violatedRule);

      return _groupName[group != 0 ? group - 1 : 0];
    }

    return "-";
  }
}
