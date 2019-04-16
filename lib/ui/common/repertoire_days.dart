import 'package:flutter/material.dart';
import 'package:helios_app/models/repertoire/repertoire_model.dart';
import 'package:helios_app/other/helpers/helios_colors.dart';
import 'package:helios_app/ui/common/helios_selection_button.dart';
import 'package:helios_app/ui/common/helios_text.dart';
import 'package:intl/intl.dart';

typedef SelectedDayChange = Function(int index);

class RepertoireDays extends StatefulWidget {
  RepertoireDays({
    @required this.repertoire,
    @required this.onSelectedDayChanged,
    this.itemBackgroundColor,
    this.itemFontColor,
  });

  final List<RepertoireModel> repertoire;
  final SelectedDayChange onSelectedDayChanged;
  final Color itemBackgroundColor;
  final Color itemFontColor;

  @override
  _RepertoireDaysState createState() => _RepertoireDaysState();
}

class _RepertoireDaysState extends State<RepertoireDays> {
  final double itemHeight = 80;
  int _selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.itemHeight,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.repertoire.length,
        itemBuilder: (context, item) {
          RepertoireModel repertoire = this.widget.repertoire[item];
          bool isSelected = item == _selectedDayIndex;
          Color fontColor = isSelected
              ? Colors.white
              : this.widget.itemFontColor ?? HeliosColors.categoryFontColor;

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: HeliosSelectionButton(
              staticBackgroundColor: true,
              backgroundColor: this.widget.itemBackgroundColor,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  _selectedDayIndex = item;
                  this.widget.onSelectedDayChanged(item);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    HeliosText(
                      _capitalize(
                        DateFormat("EE",
                                Localizations.localeOf(context).languageCode)
                            .format(repertoire.date)
                            .replaceFirst(".", ""),
                      ),
                      color: fontColor,
                    ),
                    HeliosText(
                      DateFormat("dd.MM").format(repertoire.date),
                      color: fontColor,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
