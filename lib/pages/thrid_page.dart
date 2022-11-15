import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_suitmedia/cubits/list_users_cubit/list_users_cubit.dart';
import 'package:test_suitmedia/data/models/list_user_model.dart';
import 'package:test_suitmedia/pages/second_page.dart';
import 'package:test_suitmedia/widgets/appbar.dart';

class ThridPage extends StatefulWidget {
  const ThridPage({super.key, required this.name});
  static const String routeName = '/thrid-page';
  final String name;

  @override
  State<ThridPage> createState() => _ThridPageState();
}

class _ThridPageState extends State<ThridPage> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ListUsersCubit>().fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainAppbar(
          title: 'Third Screen',
        ),
      ),
      body: BlocConsumer<ListUsersCubit, ListUsersState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ListUsersHasData ||
              state is ListUsersLoading && !state.isInitial) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ListUsersCubit>().fetchUsers();
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index >= state.users.length) {
                    return state.hasReachedMaximum
                        ? const Center(
                            child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Has Reach Max'),
                          ))
                        : const Center(
                            child: CircularProgressIndicator(strokeWidth: 0.7),
                          );
                  } else {
                    final user = state.users[index];
                    return UserCard(
                      user: user,
                      name: widget.name,
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: state.users.length + 1,
              ),
            );
          } else if (state is ListUsersFailed) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is ListUsersLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 0.7),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
    required this.name,
  }) : super(key: key);

  final User user;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SecondPage.routeName,
          arguments: {
            'name': name,
            'selected_name': '${user.firstName} ${user.lastName}',
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        height: 80,
        child: ListTile(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                user.avatar!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text('${user.firstName} ${user.lastName}'),
          subtitle: Text(user.email!),
        ),
      ),
    );
  }
}
