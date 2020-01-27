import 'package:core_app/core.dart';

void main() {
  print('\ntoBool:');
  print('Yes'.toBool());
  print('true'.toBool());
  print('1'.toBool());
  print('1.0'.toBool());
  print('2.0'.toBool());
  print('false'.toBool());
  print('No'.toBool());

  print('\ntoDouble:');
  print('Yes'.toDouble());
  print('Yes'.toDouble(-1));
  print('10'.toDouble());
  print('10.4'.toDouble());
  print('-10.4'.toDouble());

  print('\ntoInt:');
  print('Yes'.toInt());
  print('Yes'.toInt(-1));
  print('10'.toInt());
  print('10.4'.toInt());
  print('-10.4'.toInt());

  print('\ntoNum:');
  print('Yes'.toNum());
  print('Yes'.toNum(-1));
  print('10'.toNum());
  print('10.4'.toNum());
  print('-10.4'.toNum());

}
