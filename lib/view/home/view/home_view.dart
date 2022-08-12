import 'package:event_app/view/home/model/home.model.dart';

import '../../../product/utility/padding/padding_all.dart';
import 'package:flutter/material.dart';

import '../../../product/enum/image/image_enum.dart';
import '../../../product/init/theme/color_theme.dart';
import '../../../product/utility/border/border_radius.dart';
import '../../../product/utility/padding/padding_symetric.dart';
import '../../../product/utility/space/space.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _title = "Let’s find you some events!";
  final String _searchData = "Search the events";
  final String _cardtitle = "Popular events";
  final String _seeAll = "See all";
  final String _cardtitle2 = "Upcoming events";

  final String _event = "Birthday event";
  final String _local = "Brooklyn, NY";
  final String _date = "24 July, 2021";
  final String _hour = "8:00 PM";

  @override
  Widget build(BuildContext context) {
    List<Event> _eventList = Event.eventsList;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const PagePaddingSymetrict.horizontalNormal(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                space(),
                // text Let’s find you some events!
                Text(
                  _title,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 25, color: AppColors().text),
                ),
                space(),

                // search textfield
                _search(searchData: _searchData),
                space(),

                // text Popular events => see all
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText(context, _cardtitle, 20),
                    _buildText(context, _seeAll, 16),
                  ],
                ),
                space(),
                //event card
                SizedBox(
                  height: size.height * .3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _eventList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 200,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(_eventList[index].imagePath!),
                                    Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Card(
                                            child: _buildText(context,
                                                _eventList[index].data!, 14))),
                                  ],
                                ),
                                Padding(
                                  padding: const PagePaddingSymetrict
                                      .horizontalNormal(),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildText(context,
                                          _eventList[index].eventName!, 18),
                                      spaceMin(),
                                      _buildText(context,
                                          _eventList[index].local!, 16),
                                      spaceNormal(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Spacer(),
                                          _buildText(context,
                                              _eventList[index].hour!, 18)
                                        ],
                                      ),
                                      space(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                space(),
                //text Upcoming events => see all
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText(context, _cardtitle2, 20),
                    _buildText(context, _seeAll, 16),
                  ],
                ),
                space(),
                //event card
                SizedBox(
                  height: size.height * .3,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _eventList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 140,
                            child: Card(
                              child: Padding(
                                padding: const PagePaddingAll.halfNormal(),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ImageEnums.illustration.ToImage,
                                    spaceWidth(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildText(context,
                                            _eventList[index].eventName!, 20),
                                        spaceMin(),
                                        _buildText(context,
                                            _eventList[index].local!, 16),
                                        spaceNormal(),
                                        _buildText(context,
                                            _eventList[index].data!, 20),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildText(BuildContext context, String value, double size) {
    return Text(value,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: AppColors().text, fontSize: size));
  }

  AppBar _appBar() {
    return AppBar(
      leading: ImageEnums.drawer.ToImage,
      actions: [
        ImageEnums.alarm.ToImage,
      ],
    );
  }
}

class _search extends StatelessWidget {
  const _search({
    Key? key,
    required String searchData,
  })  : _searchData = searchData,
        super(key: key);

  final String _searchData;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: ImageEnums.seach.ToImage,
          border: OutlineInputBorder(borderRadius: radiusCircular()),
          hintText: _searchData),
    );
  }
}
