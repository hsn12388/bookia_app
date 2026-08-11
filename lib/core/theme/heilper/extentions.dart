import 'package:flutter/material.dart';

extension navigator on BuildContext {
  Future pushNamed(String route) {
    return Navigator.pushNamed(this, route);
  }

  Future pushNameAndRemoveUntil(String route, bool predicate) {
    return Navigator.pushNamedAndRemoveUntil(this, route, (v) => predicate);
  }

  void pop() => Navigator.pop(this);
}

extension paddingg on num {
  EdgeInsets get padhorizontal {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  EdgeInsets get padvertical {
    return EdgeInsets.symmetric(vertical: toDouble());
  }

  EdgeInsets get padall {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsets get padtop {
    return EdgeInsets.only(top: toDouble());
  }

  EdgeInsets get padbottom {
    return EdgeInsets.only(bottom: toDouble());
  }

  EdgeInsets get padaleft {
    return EdgeInsets.only(left: toDouble());
  }

  EdgeInsets get padaright {
    return EdgeInsets.only(right: toDouble());
  }
}
