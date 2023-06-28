import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin AppRouter {
  void replaceWithPage(BuildContext context, Widget nextPage);
  void navigateToPage(BuildContext context, Widget nextPage);
  void navigateBack(BuildContext context);
}

// extend the generated private router
class LegacyRouter implements AppRouter {
  @override
  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void navigateToPage(BuildContext context, Widget nextPage) {
    _navigate(context, nextPage);
  }

  @override
  void replaceWithPage(BuildContext context, Widget nextPage) {
    _pushReplacement(context, nextPage);
  }

  void _pushReplacement(BuildContext context, Widget screen) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => screen));

  void _navigate(BuildContext context, Widget screen) => Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => screen));

}
