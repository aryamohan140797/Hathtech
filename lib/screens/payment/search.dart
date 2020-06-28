import 'package:app/constants/buttons.dart';
import 'package:app/constants/colors.dart';
import 'package:app/constants/strings.dart';
import 'package:app/constants/styles.dart';
import 'package:app/models/searchmodel.dart';
import 'package:app/screens/bottomnavbar.dart';
import 'package:app/services/apis.dart';
import 'package:flutter/material.dart';

class SeachList extends StatefulWidget {
  @override
  _SeachListState createState() => _SeachListState();
}

class SearchList {
  String id, name;

  SearchList({this.id, this.name});
}

class _SeachListState extends State<SeachList> {
  List<Searchmodel> _notes = List<Searchmodel>();
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorTheme.whiteColor,
        leading: Iconbuttons(
          iconColor: ColorTheme.grey,
          icon: Icons.arrow_back_ios,
          iconsize: 20.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new Bottomnavigation(index: 1),
              ),
            );
          },
        ),
        title: Container(
          height: MediaQuery.of(context).size.height / 18,
          width: MediaQuery.of(context).size.width / 1.3,
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: TextField(
              onChanged: (txt) {
                Apis().searchapi(txt).then((value) {
                  setState(() {
                    _notes.clear();
                  });
                  _notes.addAll(value);
                  setState(() {});
                });
              },
              cursorColor: ColorTheme.grey,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorTheme.whiteColor),
                ),
                hintText: searchtext,
                hintStyle: Style.Worksans(ColorTheme.grey, 15.0),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          _listview(),
        ],
      ),
    );
  }

  _listview() {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 1.4,
            child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 5.0),
                    child: Container(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          child: Text(_notes[index].name,
                              style: Style.Worksans(ColorTheme.black, 15.0)),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
