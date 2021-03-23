import 'package:deliveryboy/src/controllers/user_controller.dart';
import 'package:deliveryboy/src/repository/user_repository.dart';
import 'package:flutter/material.dart';

class StatusSwitcher extends StatefulWidget {
  final UserController controller;
  StatusSwitcher(this.controller);
  @override
  _StatusSwitcherState createState() => _StatusSwitcherState();
}

class _StatusSwitcherState extends State<StatusSwitcher> {
  bool _status = true;

  @override
  void initState() {
    super.initState();
    _status = currentUser.value.isAvailable;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _status = !_status;
        });
        await widget.controller.updateStatus();
      },
      child: _status
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.green,
              ),
              child: Row(
                children: [
                  Text(
                    'Online',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.done,
                      color: Colors.green,
                      size: 15,
                    ),
                  )
                ],
              ))
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Offline',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white, fontSize: 12),
                  )
                ],
              )),
    );
  }
}
