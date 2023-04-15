import 'package:expense/constants.dart';
import 'package:expense/screens/add_expense/add_expense_page.dart';
import 'package:expense/ui_helper/ui_helper.dart';
import 'package:flutter/material.dart';

class FragTransactionPage extends StatelessWidget {
  var isLight;
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    isLight = Theme.of(context).brightness == Brightness.light;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? portraitUI()
          : landScapeUI(),
    );
  }

  Widget mainUI() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 8.0, left: 10, top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AddExpensePage(),));
                      },
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Spent this Week',
                        style: mTextStyle16(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('\$',
                              style: mTextStyle25(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor)),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '252',
                                style: mTextStyle52(
                                    mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor,
                                    fontWeight: FontWeight.w700)),
                            WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Text('.50',
                                    style:
                                        mTextStyle25(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor))),
                          ]))
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 12,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return mainListItem(
                        index, width, Constants.allTransactions[index]);
                  },
                  itemCount: Constants.allTransactions.length,
                  shrinkWrap: true,
                ))
          ],
        );
      },
    );
  }

  Widget mainListItem(int index, double width, Map dayWiseTransaction) {
    return Padding(
      padding: const EdgeInsets.only(left: 11.0, right: 11.0, bottom: 21.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dayWiseTransaction['day'],
                  style: mTextStyle12(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor),
                ),
                Text(
                  '\$ ${dayWiseTransaction['amt']}',
                  style: mTextStyle12(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor),
                )
              ],
            ),
          ),
          ListView.builder(
            itemBuilder: (context, childIndex) {
              return mainChildTransactionItem(
                  dayWiseTransaction['transactions'][childIndex], context);
            },
            itemCount: dayWiseTransaction['transactions'].length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }

  Widget mainChildTransactionItem(Map detailTransaction, BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Image.asset(detailTransaction['image'],
          width: MediaQuery.of(context).size.width * 0.08,
          height: MediaQuery.of(context).size.width * 0.08),
      title: Text(
        detailTransaction['title'],
        style: mTextStyle16(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        detailTransaction['desc'],
        style: mTextStyle16(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '\$ ${detailTransaction['amt']}',
            style:
                mTextStyle16(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor, fontWeight: FontWeight.w700),
          ),
          Text(
            '\$ ${detailTransaction['balance']}',
            style: mTextStyle12(mColor: isLight?MyColor.secondaryBColor:MyColor.secondaryWColor),
          )
        ],
      ),
    );
  }

  Widget landScapeUI() {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: isLight ? MyColor.secondaryBColor : MyColor.secondaryWColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Spent this Week',
                style: mTextStyle16(mColor: isLight?MyColor.secondaryWColor:MyColor.secondaryBColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\$', style: mTextStyle25(mColor: isLight?MyColor.secondaryWColor:MyColor.secondaryBColor)),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '252',
                        style: mTextStyle52(
                            mColor: isLight?MyColor.secondaryWColor:MyColor.secondaryBColor,
                            fontWeight: FontWeight.w700)),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Text('.50',
                            style: mTextStyle25(mColor: isLight?MyColor.secondaryWColor:MyColor.secondaryBColor))),
                  ]))
                ],
              )
            ],
          ),
        )),
        Expanded(
          child: height > 600
              ? mainUI()
              : SingleChildScrollView(
                  child: mainUI(),
                ),
        )
      ],
    );
  }

  Widget portraitUI() {
    return height > 600 ? mainUI() : SingleChildScrollView(child: mainUI(),);
  }
}
