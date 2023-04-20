
import 'package:expense/bloc/expense_component/expense_component_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/expense_type_bloc.dart';
import '../../constants.dart';
import '../../custom_widgets/custom_rounded_btn.dart';
import '../../model/category_model.dart';
import '../../model/expense_model.dart';
import '../../ui_helper/ui_helper.dart';

class AddExpensePage extends StatefulWidget {
  var balanceTillNow;
  bool? isLight;
  AddExpensePage({required this.balanceTillNow});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  var amtController = TextEditingController();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  var _selectedIndex = -1;

  var _selectedDate = DateTime.now();

  List<CategoryModel> arrExpenseType = [];

  String defaultDropDownValue = 'Debit';

  List<String> arrTransactionType = ['Debit', 'Credit'];

  bool isAddingExpense = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Stack(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: mTextStyle16(mColor: Colors.black),
                      )),
                  Center(
                      child: Text(
                        'Expense',
                        style: mTextStyle16(mColor: Colors.black),
                      ))
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    style: mTextStyle52(
                        mColor: isLight
                            ? MyColor.secondaryBColor
                            : MyColor.secondaryWColor),
                    controller: amtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.currency_rupee_outlined,
                          size: 25,
                          color: isLight
                              ? MyColor.secondaryBColor
                              : MyColor.secondaryWColor,
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  style: mTextStyle16(
                      mColor: isLight
                          ? MyColor.secondaryBColor
                          : MyColor.secondaryWColor),
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'Add Title',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1))),
                ),
                const SizedBox(
                  height: 21,
                ),
                TextField(
                  style: mTextStyle16(
                      mColor: isLight
                          ? MyColor.secondaryBColor
                          : MyColor.secondaryWColor),
                  controller: descController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'Add Desc',
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1))),),
                const SizedBox(height: 21,),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      topLeft: Radius.circular(15))),
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(21),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: Constants.arrImagePath.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      crossAxisSpacing: 11,
                                      mainAxisSpacing: 11,
                                      maxCrossAxisExtent: 50,
                                    ),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            _selectedIndex = index;
                                            setState(() {});
                                          },
                                          child: _selectedIndex == index
                                              ? Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border:
                                                        Border.all(width: 1),
                                                  ),
                                                  child: Image.asset(Constants
                                                      .arrImagePath[index]),
                                                )
                                              : Image.asset(Constants
                                                  .arrImagePath[index]));
                                    },
                                  ),
                                );
                              });
                        },
                        child: _selectedIndex == -1
                            ? Text(
                                'Select Expense Type',
                                style: mTextStyle16(
                                    mColor: isLight
                                        ? MyColor.secondaryBColor
                                        : MyColor.secondaryWColor),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Selected',
                                    style: mTextStyle16(
                                        mColor: isLight
                                            ? MyColor.secondaryBColor
                                            : MyColor.secondaryWColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                        Constants.arrImagePath[_selectedIndex]),
                                  )
                                ],
                              ))
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      var dateTime = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime(200),
                          lastDate: DateTime.now());
                      _selectedDate = dateTime ?? DateTime.now();
                      setState(() {});
                    },
                    child: Text(
                      _selectedDate.toString(),
                      style: mTextStyle16(
                          mColor: isLight
                              ? MyColor.secondaryBColor
                              : MyColor.secondaryWColor),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}