import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_app/bloc/repositories.bloc.dart';

class GitRepositoriesPage extends StatelessWidget {
  final String user;
  const GitRepositoriesPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RepositoriesBloc repositoriesBloc = context.read<RepositoriesBloc>();
    repositoriesBloc.add(GetUserRepositoriesEvent(user: this.user));
    return Scaffold(
      appBar: AppBar(title: const Text('Repositories')),
      body: Column(
        children: [
          BlocBuilder<RepositoriesBloc, RepositoriesState>(
            builder: (context, state) {
              if (state is RepositoriesLoadingState) {
                return Center(
                  child: const CircularProgressIndicator(),
                );
              } else if (state is RepositoriesErrorState) {
                return Center(
                  child: Column(children: [
                    Text("$state.errorMessage"),
                    ElevatedButton(
                        onPressed: () {
                          repositoriesBloc.add(repositoriesBloc.lastEvent);
                        },
                        child: Text("Retry"))
                  ]),
                );
              }
              if (state is RepositoriesSuccessState) {
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          subtitle: Text("${state.repositories[index]['language']}",
                            style: TextStyle(color: Theme.of(context).primaryColor,
                            ),),
                          trailing: Icon(state.repositories[index]['visibility'] ==
                              'public'
                              ? Icons.visibility
                              : Icons.visibility_off
                          , color: Theme.of(context).primaryColor,),
                          title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${state.repositories[index]['owner']['avatar_url']}"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Text(
                                "${state.repositories[index]['name']}",
                                    maxLines: 1,style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1),
                      itemCount: state.repositories.length),
                );
              } else
                return Container();
            },
          )
        ],
      ),
    );
  }
}
