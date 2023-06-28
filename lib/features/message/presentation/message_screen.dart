import 'package:flutter/material.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';
import 'package:oic_next_to_you/features/main/data/models/history/res_personal_history.dart';
import 'package:oic_next_to_you/features/detail/models/res_detail_model.dart';
import 'package:oic_next_to_you/features/detail/presentation/detail_provider.dart';
import 'package:oic_next_to_you/features/message/presentation/message_provider.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import 'package:oic_next_to_you/features/recording/data/models/record_detail/record_detail_response/record_detail_response.dart';
import 'package:oic_next_to_you/common/core/session.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  var myTextFieldController1 = TextEditingController();
  var bufferText = "";
  var uid = "";
  var isLoading = false;

  @override
  initState() {
    //print("initState Called");
    Session().GetUserID().then((value) => uid = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.darkCerulean,
        appBar: AppBar(
            title: Text("ย้อนกลับ"),
            backgroundColor: Theme.of(context).primaryColor,
            leading: BackButton()),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              maxLines: 20, //or null
                              decoration: const InputDecoration.collapsed(
                                  hintText:
                                      "กรอกข้อมูลบทสนทนา (ขึ้นบรรทัดใหม่เมื่อจบประโยค)"),
                              onChanged: (text) {
                                bufferText = text;
                              },
                            ),
                          ))),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (bufferText != "") {
                        var sessionID = Extension().getRandomString(8);
                        if (isLoading == false) {
                          _onSubmit(sessionID);
                        }
                      } else {
                        _showMyDialog();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      side: const BorderSide(width: 1, color: AppColor.white),
                      textStyle: AppTextTheme.primaryButton,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
                      backgroundColor: AppColor.white,
                    ),
                    child: isLoading
                        ? Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(2.0),
                            child: const CircularProgressIndicator(
                              color: Colors.blue,
                              strokeWidth: 3,
                            ))
                        : Icon(Icons.search, color: AppColor.black, size: 60.0),
                  ),
                  const Text(
                    'ตรวจสอบข้อความ',
                    style: AppTextTheme.primaryButton,
                  ),
                ],
              )
              // _createProfileInfo(context),
              // _createBreakLine(),
              //_createHistoryText(),

              ),
          //floatingActionButton: _addRecordingButton(context),
        ));
  }

  void _onSubmit(String sessionID) async {
    setState(() => isLoading = true);

    MessageProvider().GetResultText(bufferText, uid, sessionID).then((value) {
      setState(() {
        isLoading = false;
      });
      ShowDialog(sessionID);
    });
  }

  Future<Object?> ShowDialog(String sessionID) async {
    return showGeneralDialog(
        context: context,
        transitionDuration: Duration(milliseconds: 400),
        pageBuilder: (bc, ania, anis) {
          return SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(color: AppColor.darkCerulean),

              //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " ",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      "ผลลัพธ์การตรวจสอบข้อความสุ่มเสี่ยง",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColor.white,
                          decoration: TextDecoration.none,
                          fontStyle: FontStyle.normal),
                    ),
                    const Text(
                      " ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                        child: FutureBuilder<Widget>(
                      future: _generateListDetail(sessionID),
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
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("ปิด"))
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<Widget> _generateListDetail(String sessionID) async {
    List<resDetail> bufferDetail =
        await DetailProvider().getPersonalDetailRecordHistory(sessionID);

    return Container(
        height: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Text.rich(TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                children: List.generate(bufferDetail.length, (index) {
                  return TextSpan(
                    style: TextStyle(
                      fontWeight: (bufferDetail[index].resulTTEXTPHASE != "0"
                          ? FontWeight.bold
                          : FontWeight.normal),
                      decoration: (bufferDetail[index].resulTTEXTPHASE != "0"
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
                        text: "- " +
                            (bufferDetail[index].raWTEXTPHASE ?? "") +
                            "\n",
                      ),
                    ],
                  );
                })))));
  }

  Widget _createBreakLine() {
    return const Divider(
      color: AppColor.white,
      height: 20,
      thickness: 2,
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'แจ้งเตือน',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('กรุณากรอกข้อมูลบทสนทนาก่อนตรวจสอบข้อความ'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ปิด'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextFieldController1.dispose();
    super.dispose();
  }
}
