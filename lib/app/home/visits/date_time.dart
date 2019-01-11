import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:firma_prototype/globals.dart' as globals;

const double _kPickerSheetHeight = 216.0;

class DateTimePicker {
  static Widget buildDatePicker(BuildContext context, DateTime date,
      Null Function(DateTime newDateTime) onDateChanged) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: date == null ? DateTime.now() : date,
                onDateTimeChanged: onDateChanged,
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          color: CupertinoColors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 2,
            )
          ],
        ),
        height: 36.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date == null ? 'date' : DateFormat.yMMMd().format(date),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color.fromRGBO(111, 62, 93, 0.62),
                  ),
                ),
                Icon(
                  OMIcons.calendarToday,
                  color: Color(globals.color_common_purple),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  static Widget buildTimePicker(BuildContext context, DateTime time,
      Null Function(DateTime newDateTime) onDateChanged) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return _buildBottomPicker(
              CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: time == null ? DateTime.now() : time,
                onDateTimeChanged: onDateChanged,
                use24hFormat: true,
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          color: CupertinoColors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 2,
            )
          ],
        ),
        height: 36.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: time == null
                    ? [
                        _generateTimeSection('HH'),
                        _generateTimeSection(':'),
                        _generateTimeSection('MM')
                      ]
                    : [
                        _generateTimeSection(DateFormat.H().format(time)),
                        _generateTimeSection(':'),
                        _generateTimeSection(DateFormat.m().format(time))
                      ]),
          ),
        ),
      ),
    );
  }

  static Widget _generateTimeSection(String text) {
    return Expanded(
      flex: 1,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Color.fromRGBO(111, 62, 93, 0.62),
          ),
        ),
      ),
    );
  }
}
