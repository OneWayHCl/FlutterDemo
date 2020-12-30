import 'package:FlutterDemo/demo/simple_dialog_demo.dart';
import 'package:FlutterDemo/demo/stepper_demo.dart';
import 'package:flutter/material.dart';
import 'button_demo.dart';
import 'card_demo.dart';
import 'chip_demo.dart';
import 'data_table_demo.dart';
import 'date_time_demo.dart';
import 'float_action_button.dart';
import 'paginated_table_demo.dart';
import 'popup_menu_button.dart';
import 'from_demo.dart';
import 'checkbox_demo.dart';

class MaterialComponentDemo extends StatelessWidget {
  const MaterialComponentDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Button首页')),
      body: ListView(
        children: [
          ListItem(title: 'FormDemo', page: FromDemo()),
          ListItem(
              title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
          ListItem(title: 'ButtonDemo', page: ButtonDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'CheckboxDemo', page: CheckboxDemo()),
          ListItem(title: 'DateTimeDemo', page: DateTimeDemo()),
          ListItem(title: 'SimpleDialogDemo', page: SimpleDialogDemo()),
          ListItem(title: 'ChipDemo', page: ChipDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
          ListItem(title: 'PaginatedTableDemo', page: PaginatedTableDemo()),
          ListItem(title: 'CardDemo', page: CardDemo()),
          ListItem(title: 'StepperDemo', page: StepperDemo()),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key key, this.title, this.page}) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

class _WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
