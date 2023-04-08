import 'package:flutter/material.dart';

import '../model/register_response_list.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.data,
  });

  final ListElement data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(data.name),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.email),
            Text(data.mobile),
          ],
        ),
      ),
    );
  }
}
