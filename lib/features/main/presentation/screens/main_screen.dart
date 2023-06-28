import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/domain/entities/user/userprofile.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_text_theme.dart';
import 'package:oic_next_to_you/common/presentation/utils.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';

import 'package:oic_next_to_you/features/main/presentation/providers/main_screen_provider.dart';
import 'package:oic_next_to_you/features/main/data/models/history/res_personal_history.dart';
import 'package:oic_next_to_you/features/recording/presentation/recording/recording_page.dart';
import 'package:oic_next_to_you/features/detail/presentation/detail_screen.dart';
import 'package:oic_next_to_you/features/message/presentation/message_screen.dart';

import 'package:provider/provider.dart';

import '../routers/main_router.dart';

void main() {
  localWidgetInitForDebug(testWidget: MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: di<MainScreenProvider>())
      ],
      child: MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  MainWidget({Key? key}) : super(key: key);
  final router = di<MainRouter>();
  late userprofile currentUser;
  late List<res_personal_history>? lstPersonalHistory;

  @override
  Widget build(BuildContext context) {
    return _mainGenerate(context);
  }

  Widget _mainGenerate(BuildContext context) {
    return Selector<MainScreenProvider, bool>(
        selector: (_, provider) => provider.state.loggedOut,
        builder: (context, isLoggedOut, provider) {
          if (isLoggedOut) {
            afterRendered(() => router.navigateToLogin(context));
          }
          return Scaffold(
              backgroundColor: AppColor.darkCerulean,
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _createProfileInfo(context),
                    _createBreakLine(),
                    _createHistoryText(),
                    Expanded(
                        child: FutureBuilder<Widget>(
                      future: _createCardListView(context),
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
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                //padding: const EdgeInsets.all(1),
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _addMessageButton(context),
                    _addRecordingButton(context),
                  ],
                ),
              )
              //floatingActionButton: _addRecordingButton(context),
              );
        });
  }

  Widget _addRecordingButton(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () => Navigator.of(context)
    //       .push(
    //         new MaterialPageRoute(builder: (_) => new RecordingScreen()),
    //       )
    //       .then((val) => val ? _mainGenerate(context) : null),
    //   child: const Text('ตรวจสอบข้อมูลตัวแทน'),
    // );
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 700),
      openBuilder: (context, _) => RecordingScreen(),
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      closedColor: AppColor.darkCerulean,
      onClosed: (value) => {},
      closedBuilder: (context, openContainer) {
        return FloatingActionButton.extended(
          heroTag: "record",
          backgroundColor: AppColor.peachOrange,
          //backgroundColor: Theme.of(context).dialogBackgroundColor,
          onPressed: null,
          label: Row(
            children: [
              const Icon(
                Icons.add,
                color: AppColor.darkCerulean,
                size: 24,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                ' เริ่มบันทึก   ',
                style: AppTextTheme.main.bodyMedium?.copyWith(
                  color: AppColor.darkCerulean,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _addMessageButton(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: () => Navigator.of(context)
    //       .push(
    //         new MaterialPageRoute(builder: (_) => new RecordingScreen()),
    //       )
    //       .then((val) => val ? _mainGenerate(context) : null),
    //   child: const Text('ตรวจสอบข้อมูลตัวแทน'),
    // );
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 700),
      openBuilder: (context, _) => MessageScreen(),
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      closedColor: AppColor.darkCerulean,
      onClosed: (value) => {},
      closedBuilder: (context, openContainer) {
        return FloatingActionButton.extended(
          heroTag: "message",
          backgroundColor: AppColor.peachOrange,
          //backgroundColor: Theme.of(context).dialogBackgroundColor,
          onPressed: null,
          label: Row(
            children: [
              const Icon(
                Icons.add,
                color: AppColor.darkCerulean,
                size: 24,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'ตรวจข้อความ',
                style: AppTextTheme.main.bodyMedium?.copyWith(
                  color: AppColor.darkCerulean,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<Widget> _createCardListView(BuildContext context) async {
    List<res_personal_history>? lstData;
    GridView? bufferWidget;
    Stack? bufferStack;
    final size = MediaQuery.of(context).size;
    var provider = Provider.of<MainScreenProvider>(context, listen: false);
    var currentUser = await Session().GetSessionPersonal();
    var bufferLstRecord = await provider.fetchUserRecordHistories(
        currentUser.uid!, currentUser.phonENUMBER!);

    return Container(
      margin: const EdgeInsets.all(16),
      child: (bufferLstRecord != null && bufferLstRecord.isNotEmpty == true)
          ? GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              physics: RangeMaintainingScrollPhysics(),
              children: List.generate(bufferLstRecord.length, (index) {
                return GestureDetector(
                  onTap: () {
                    index == 3
                        ? router.navigateToHistory(context)
                        : ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('ยังไม่พร้อมใช้จ้า')));
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
                      child:
                          _createContentInfo(context, bufferLstRecord[index]),
                    ),
                  ),
                );
              }))
          : Stack(
              children: <Widget>[
                Container(
                  height: 80,
                  width: size.width * 0.85,
                  padding: const EdgeInsets.only(
                      left: 15, bottom: 5, right: 15, top: 20),
                  alignment: Alignment.bottomCenter,

                  child: const Text(
                    "ยังไม่มีประวัติทำรายการ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ), //Text
                ), //Container
              ], //<Widget>[]
            )
      //Container;
      ,
    );
  }

  Widget _createViewAllCard() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Text(
            ' . . . ',
            style: AppTextTheme.main.headline2?.copyWith(
              color: AppColor.darkCerulean,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'ดูทั้งหมด',
            style: AppTextTheme.main.headline2?.copyWith(
              color: AppColor.darkCerulean,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _createContentInfo(BuildContext context, res_personal_history obj) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailScreen(obj: obj)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Extension().ToThaiDateTime(obj.creatEDATE ?? ""),
                //obj.creatEDATE ?? "",
                style: AppTextTheme.main.subtitle1?.copyWith(
                  color: AppColor.darkCerulean,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 4,
              ),
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
                      text: obj.agenTNAME ?? "ไม่ระบุ",
                      style: AppTextTheme.main.subtitle1?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  Extension().WordWarp((obj.raWTEXTRECORD ?? ""), 40),
                  style: AppTextTheme.main.bodyText2,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ));
  }

  Widget _createHistoryText() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 1,
        right: 16,
      ),
      child: Text(
        'ประวัติการสนทนา',
        style: AppTextTheme.main.headline1
            ?.copyWith(color: AppColor.white, fontSize: 24),
      ),
    );
  }

  Widget _createBreakLine() {
    return const Divider(
      color: AppColor.white,
      height: 15,
      thickness: 2,
      indent: 30,
      endIndent: 30,
    );
  }

  Widget _createProfileInfo(BuildContext context) {
    final provider = Provider.of<MainScreenProvider>(context, listen: false);
    final state = provider.state;
    if (state.userNumber == null && !state.isLoading) {
      afterRendered(() => provider.fetchUserAndHistories());
    }
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
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Selector<MainScreenProvider, String?>(
                  selector: (_, provider) => provider.state.userNumber,
                  builder: (context, userNumber, widget) {
                    return Text(
                      userNumber ?? '',
                      style: AppTextTheme.main.bodyLarge?.copyWith(
                        color: AppColor.peachOrange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
              SizedBox(
                height: 5,
              ),
              createLogoutButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget createLogoutButton(BuildContext context) {
    final provider = Provider.of<MainScreenProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) {
          return _createRiskInfoDialog(context, provider);
        },
      ),
      child: RichText(
        text: TextSpan(
          style: TextStyle(color: AppColor.white, fontSize: 16),
          children: <TextSpan>[
            TextSpan(text: ''),
            TextSpan(
              text: 'เพิกถอนการเข้าถึงข้อมูลส่วนบุคคล',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createRiskInfoDialog(
      BuildContext context, MainScreenProvider provider) {
    return AlertDialog(
      title: const Text(
        'แจ้งเตือน',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '    เนื่องจากระบบ จำเป็นต้องได้รับความยินยอมเข้าถึงข้อมูลส่วนบุคคลจากผู้ใช้งาน \n' +
                  '     ดังนั้นเมื่อท่านประสงค์ขอเพิกถอนความยินยอมให้เข้าถึงข้อมูลส่วนบุคคลแล้วนั้น มีผลให้ท่านไม่สามารถใช้งานระบบ และข้อมูลของท่านจะถูกลบออกจากระบบเป็นการถาวร \n\n' +
                  'ท่านต้องการยืนยันการเพิกถอนหรือไม่ ?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    text: ''),
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
          child: const Text('ยกเลิก'),
        ),
        ElevatedButton(
          onPressed: () => provider.logout(),
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
          child: const Text('ยืนยัน'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
