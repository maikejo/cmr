import 'package:flutter/material.dart';

import '../../external_widgets/calendar_carousel/calendar_carousel.dart';
import '../common_widgets/responsive_container.dart';
import '../common_widgets/responsive_padding.dart';
import '../common_widgets/responsive_image.dart';
import '../../styles/common_variables.dart';
import '../../styles/common_styles.dart';

class ChooseDateDialog extends StatefulWidget {
  @override
  _ChooseDateDialogState createState() => new _ChooseDateDialogState();
}

class _ChooseDateDialogState extends State<ChooseDateDialog> {

  DateTime _currentDate = DateTime(2018, 8, 1);
  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];

  Widget _calendar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel(
        onDayPressed: (DateTime date) {
          this.setState(() => _currentDate = date);
        },
        weekendTextStyle: TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.grey,
        markedDates: _markedDate,
        height: 420.0,
        selectedDateTime: _currentDate,
        daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }

  Widget _dialogHeader() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 12.0,
            offset: Offset(0.0, 5.0)
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: CommonVariables(context: context).getAppBarHeight(),
            padding: EdgeInsets.only(
              top: CommonVariables(context: context).getAppBarPaddingTop()
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: new ResponsivePadding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new ResponsiveImage(
                              image: new ExactAssetImage("images/icons/ic_back.png"),
                              width: 24.0,
                              height: 17.0
                            )
                          )
                        )
                      ]
                    )
                  )
                ),
                Text(
                  "Date",
                  style: CommonStyles(context: context).getHeaderText()
                ),
                ResponsiveContainer(
                  width: 100.0,
                  child: ResponsivePadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: new ResponsivePadding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new Text("Today")
                          )
                        )
                      ]
                    )
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }

  Widget _buildWithConstraints(BuildContext context, BoxConstraints constraints) {
    var column = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _dialogHeader(),
        Expanded(
          child: _calendar()
        )
      ]
    );

    var constrainedBox = new ConstrainedBox(
      constraints: constraints.copyWith(
        maxHeight: MediaQuery.of(context).size.height
      ),
      child: new Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: CommonVariables(context: context).getScreenPaddingBottom()),
        child: column
      )
    );

    var scrollView = new SingleChildScrollView(
      child: constrainedBox
    );

    return scrollView;
  }

  @override
  Widget build(BuildContext context) {
    var layoutBuilder = new LayoutBuilder(builder: _buildWithConstraints);

    var scaffold = new Scaffold(body: layoutBuilder);

    return scaffold;
  }
}
