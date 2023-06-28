import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oic_next_to_you/common/dependency_injection/dependency_injection.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_buttons.dart';
import 'package:oic_next_to_you/common/presentation/theme/app_colors.dart';
import 'package:oic_next_to_you/features/agent_info/domain/entities/agent_info.dart';
import 'package:oic_next_to_you/features/agent_info/presentation/providers/agent_info_provider.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import 'package:provider/provider.dart';

class ValidateAgentDialog extends StatelessWidget {
  const ValidateAgentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ChangeNotifierProvider.value(
            value: di<AgentInfoProvider>(),
            builder: (context, _) {
              final state = context.watch<AgentInfoProvider>().state;

              return state.when(
                initial: () => _InputAgentLicenseWidget(),
                errorInvalidAgent: () => _InputAgentLicenseWidget(
                  errorText: 'ไม่พบหมายเลขตัวเทนที่ระบุ',
                ),
                successValidAgent: (info) => _DisplayValidAgentWidget(
                  agentInfo: info,
                  onClickedAcknowledge: () => Navigator.of(context).pop(info),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _InputAgentLicenseWidget extends StatelessWidget {
  final _inputTextStyle = const TextStyle(
    color: AppColor.black,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  final _normalTextStyle = const TextStyle(
    color: AppColor.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  final _normalBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: AppColor.darkCerulean,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  final _errorTextStyle = const TextStyle(
    color: AppColor.red,
    fontSize: 12,
  );

  final _errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: AppColor.red,
    ),
    borderRadius: BorderRadius.circular(8),
  );

  final TextEditingController _controller = TextEditingController();

  final String? errorText;

  _InputAgentLicenseWidget({this.errorText});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      _createTextFieldLabel(),
      _createFixedSpace(8),
      _createTextField(),
      _createFixedSpace(16),
      _createAcknowledgeButton(context),
    ]));
  }

  Widget _createTextFieldLabel() {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'กรุณาระบุหมายเลขตัวแทนประกัน',
        style: _normalTextStyle,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _createTextField() {
    return TextField(
      controller: _controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\da-zA-Z]')),
      ],
      style: _inputTextStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        errorText: errorText,
        errorStyle: _errorTextStyle,
        focusedBorder: _normalBorder,
        enabledBorder: _normalBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
      ),
    );
  }

  Widget _createAcknowledgeButton(BuildContext context) {
    return Consumer<AgentInfoProvider>(
      builder: (context, provider, _) {
        return PrimaryButton(
          isLoading: provider.isLoading,
          onPressed: () => context
              .read<AgentInfoProvider>()
              .validateAgent(licenseId: _controller.text),
          //onPressed:() =>  context.read<AgentInfoProvider>().validateAgentInfo(licenseId: _controller.text).then((value) => null),
          child: const Text('ยืนยัน'),
        );
      },
    );
  }

  Widget _createFixedSpace(double spacing) => SizedBox(height: spacing);
}

class _DisplayValidAgentWidget extends StatelessWidget {
  final AgentInfo agentInfo;
  final Function? onClickedAcknowledge;

  const _DisplayValidAgentWidget({
    required this.agentInfo,
    this.onClickedAcknowledge,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'พบข้อมูลตัวแทนหมายเลข',
            style: TextStyle(
              color: AppColor.black50,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          _createFixedSpace(8),

          // Agent license id
          Text(
            agentInfo.licenseId,
            style: const TextStyle(
              color: AppColor.black,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
          _createFixedSpace(16),

          // Agent name text
          Text(
            "" + agentInfo.name,
            style: const TextStyle(
              color: AppColor.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "สถานะ : " +
                (agentInfo.agentStatus == "Y" ? "ยังไม่หมดอายุ" : "หมดอายุ"),
            style: const TextStyle(
              color: AppColor.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "วันที่หมดอายุ : " + Extension().ToThaiDate(agentInfo.expireDate),
            style: const TextStyle(
              color: AppColor.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          _createFixedSpace(16),
          _createAcknowledgeButton(),
        ],
      ),
    );
  }

  Widget _createAcknowledgeButton() {
    return PrimaryButton(
      onPressed: () => onClickedAcknowledge?.call(),
      child: const Text('รับทราบ'),
    );
  }

  Widget _createFixedSpace(double spacing) => SizedBox(height: spacing);
}
