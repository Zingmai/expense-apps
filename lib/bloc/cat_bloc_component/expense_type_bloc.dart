import 'package:bloc/bloc.dart';
import 'package:expense/database/db_helper.dart';
import 'package:meta/meta.dart';

import '../../model/category_model.dart';

part 'expense_type_event.dart';

part 'expense_type_state.dart';

class ExpenseTypeBloc extends Bloc<ExpenseTypeEvent, ExpenseTypeState> {
  ExpenseTypeBloc() : super(ExpenseTypeInitialState()) {
    on<FetchExpenseTypeEvent>((event, emit) async {

      emit(ExpenseTypeLoadingState());
      var arrExpenseType = await DBHelper().fetchAllExpenseType();
      emit(ExpenseTypeLoadedState(arrExpenseType));
    });
  }
}
