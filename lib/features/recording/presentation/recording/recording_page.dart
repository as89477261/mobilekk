import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';
import 'package:oic_next_to_you/common/presentation/utils.dart';
import 'package:oic_next_to_you/features/agent_info/presentation/widgets/validate_agent_dialog.dart';
import 'package:oic_next_to_you/features/recording/domain/entities/processed_text.dart';
import 'package:oic_next_to_you/features/recording/presentation/recording/recording_provider.dart';
import 'package:oic_next_to_you/features/recording/presentation/recording/recording_router.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_confirm/req_record_confirm.dart';
import 'package:oic_next_to_you/features/agent_info/domain/entities/agent_info.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import 'package:provider/provider.dart';

import '../../../../common/dependency_injection/dependency_injection.dart';

void main() async {
  localWidgetInitForDebug(testWidget: const RecordingScreen());
}

class RecordingScreen extends StatelessWidget {
  const RecordingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: di<RecordingProvider>())],
      child: RecordingWidget(),
    );
  }
}

class RecordingWidget extends StatelessWidget {
  final TextEditingController infoTextController = TextEditingController();
  late String sessionID = "";
  late String uid = "";
  late String agentID = "";
  late String agentFullName = "";
  late bool isInitial = false;
  RecordingWidget({super.key});

  final router = di<RecordRouter>();

  void _startListening(BuildContext context) async {
    final provider = Provider.of<RecordingProvider>(context, listen: false);
    await provider.initialStartRecord(sessionID, uid);
    await _recordVoice(context);
  }

  Future<void> _recordVoice(BuildContext context) async {
    final provider = Provider.of<RecordingProvider>(context, listen: false);
    await provider.startRecord(sessionID);
  }

  void _stopListening(BuildContext context) async {
    var obj = reqRecordConfirm(
        sessioNID: sessionID,
        creatEBY: "Mobile",
        personaLCODE: uid,
        agenTID: agentID,
        agenTNAME: agentFullName);

    final provider = Provider.of<RecordingProvider>(context, listen: false);
    await provider.stopRecord(obj);
  }

  void _validateAgentDialog(BuildContext context) {
    var info = showDialog(
      context: context,
      builder: (context) => const ValidateAgentDialog(),
    ).then((value) {
      if (value != null) {
        var buffer = value as AgentInfo;
        agentID = buffer.licenseId;
        agentFullName = buffer.name;

        _createScaffold(context);
      }
    });
  }

  void _configModule(BuildContext context) async {
    sessionID = Extension().getRandomString(8);
    agentID = "";
    agentFullName = "";

    await Session().GetUserID().then((value) => uid = value);
    await Session().SetRecordAgentID('');
    await Session().SetRecordAgentFullName('');
    await Session().SetRecordSessionID(sessionID);
    return;
  }

  @override
  Widget build(BuildContext context) {
    _configModule(context);
    return _createScaffold(context);
  }

  Widget _createScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("ย้อนกลับ"),
          backgroundColor: Theme.of(context).primaryColor,
          leading: BackButton(
            onPressed: () => router.navigateToMain(context),
          )),
      backgroundColor: AppColor.darkCerulean,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _createAgentInfoButton(context),
            //_createAgentInfo(context),
            Expanded(child: _createRiskInfoContainer()),
            _createInfoTextField(),
            const SizedBox(height: 24),
            _createVoiceRecordButton()
          ],
        ),
      ),
    );
  }

  // Widget _createAgentInfo(BuildContext context) {
  //   return Text(
  //     "รหัสตัวแทน : " + agentFullName,
  //     //obj.creatEDATE ?? "",
  //     style: AppTextTheme.main.subtitle1?.copyWith(
  //       color: Color.fromARGB(255, 255, 255, 255),
  //       fontSize: 18,
  //     ),
  //   );
  // }

  Widget _createAgentInfoButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _validateAgentDialog(context),
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
      child: const Text('ตรวจสอบข้อมูลตัวแทน'),
    );
  }

  Widget _createRiskInfoContainer() {
    return Selector<RecordingProvider, List<ProcessedText>>(
        selector: (context, provider) => provider.state.processedTexts,
        builder: (context, processedTexts, widget) {
          return ListView.builder(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
            reverse: true,
            itemCount: processedTexts.length,
            itemBuilder: (context, index) {
              final item = processedTexts[index];
              bool isToolTipVisible = item.riskRatio > 0;
              return Row(
                children: <Widget>[
                  SizedBox(
                    width: 75,
                    child: Text(
                      DateFormat.Hms().format(item.processedTime),
                      style: const TextStyle(color: AppColor.white),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 125,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Card(
                              color: AppColor.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 8,
                              child: Material(
                                borderRadius: BorderRadius.circular(12.0),
                                color: _colorFromProcessedText(item),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    item.original,
                                    style: AppTextTheme.main.bodyText1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Visibility(
                              visible: isToolTipVisible,
                              child: Tooltip(
                                message: 'รายละเอียดเพิ่มเติม',
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return _createRiskInfoDialog(
                                            item, context);
                                      },
                                    );
                                  },
                                  child: Icon(Icons.info),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  Widget _createRiskInfoDialog(ProcessedText item, BuildContext context) {
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
          Text('ข้อความ: ${item.original}'),
          Text(
              'ความเป็นไปได้: ${item.riskRatio > 0 ? (item.riskRatio * 100).round().toString() + " %" : "0 %"}'),
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
                      color: _colorTextFromProcessedText(item),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  text: '[' +
                      item.violatedRule!.number +
                      '] ' +
                      _GroupFromProcessedText(item),
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
          child: const Text('รับทราบ'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  Widget _createInfoTextField() {
    return Selector<RecordingProvider, String>(
        selector: (context, provider) => provider.state.toProcessText,
        builder: (context, toProcessedText, widget) {
          infoTextController.text = toProcessedText;
          return Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              maxLines: 10,
              controller: infoTextController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: AppColor.black50),
                hintText: 'ข้อความเสียงที่บันทึกจะปรากฏที่นี่',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
                fillColor: AppColor.white,
              ),
              readOnly: true,
            ),
          );
        });
  }

  Widget _createVoiceRecordButton() {
    return Selector<RecordingProvider, bool>(
      selector: (context, provider) => provider.state.isRecording,
      builder: (context, isRecording, _) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                isRecording
                    ? _stopListening(context)
                    : _startListening(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                side: const BorderSide(width: 1, color: AppColor.white),
                textStyle: AppTextTheme.primaryButton,
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 32,
                ),
                backgroundColor: AppColor.white,
              ),
              child: Icon(
                isRecording ? Icons.stop : Icons.mic,
                color: isRecording ? Colors.red : AppColor.darkCerulean,
                size: 30,
              ),
            ),
            Text(
              isRecording ? 'หยุดบันทึก' : 'เริ่มต้นบันทึก',
              style: AppTextTheme.primaryButton,
            ),
          ],
        );
      },
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

  Color _colorTextFromProcessedText(ProcessedText text) {
    print("processedText: $text");
    final violatedRule = text.violatedRule?.number;
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

  Color _colorFromProcessedText(ProcessedText text) {
    print("processedText: $text");
    final violatedRule = text.violatedRule?.number;
    if (violatedRule != null) {
      if (_negatives.contains(violatedRule)) {
        if (text.riskRatio > 0.5 && text.riskRatio <= 0.75) {
          return AppColor.red25;
        } else if (text.riskRatio > 0.75) {
          return AppColor.red;
        }
      } else if (_positives.contains(violatedRule)) {
        if (text.riskRatio > 0.5 && text.riskRatio <= 0.75) {
          return AppColor.limeGreen25;
        } else if (text.riskRatio > 0.75) {
          return AppColor.limeGreen;
        }
      }
      return AppColor.white;
    } else {
      return AppColor.white;
    }
  }

  String _GroupFromProcessedText(ProcessedText text) {
    print("Group processedText: $text");
    final violatedRule = text.violatedRule?.number;

    if (violatedRule != null) {
      var group = int.parse(violatedRule);

      return _groupName[group != 0 ? group - 1 : 0];
    }

    return "-";
  }
}

///Sample Code
///
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecordingWidget(),
    );
  }
}
*/
