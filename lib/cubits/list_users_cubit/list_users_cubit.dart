import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_suitmedia/data/models/list_user_model.dart';
import 'package:test_suitmedia/services/api_services.dart';
import 'package:test_suitmedia/utils/failure.dart';

part 'list_users_state.dart';

class ListUsersCubit extends Cubit<ListUsersState> {
  final ApiServices apiServices;
  ListUsersCubit(
    this.apiServices,
  ) : super(ListUsersInitial());
  int page = 1;
  void fetchUsers() async {
    try {
      if (state.hasReachedMaximum) {
        return;
      }
      emit(ListUsersLoading(state.users, state is ListUsersInitial));

      await apiServices.getListUser(page: page.toString()).then((value) {
        page++;
        final users = [...state.users, ...value.data!];
        final hasReachedMaximum = value.data!.isEmpty;
        return emit(ListUsersHasData(
            data: users, hasReachedMaximum: hasReachedMaximum));
      });
    } on ServerFailure catch (e) {
      emit(ListUsersFailed(error: e.message));
    }
  }
}
