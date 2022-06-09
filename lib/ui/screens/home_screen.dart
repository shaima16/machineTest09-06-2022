import 'package:flutter/material.dart';
import 'package:machinetest/ui/screens/theme/text_style.dart';
import 'package:machinetest/ui/screens/widget/common_scaffold.dart';
import 'package:machinetest/ui/screens/widget/dialog.dart';

import '../../data/model/home_model.dart';
import '../../data/repository/home_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      child: SafeArea(
        child: Center(
          child: FutureBuilder<List<HomeModel>>(
            future: HomeRepository().getHome(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                showSnackBar(message: 'Error occured');
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data?[index].title ?? "",
                            style: bold12TextField,
                          ),
                          Text(
                            snapshot.data?[index].body ?? "",
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: regular14TextField,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
