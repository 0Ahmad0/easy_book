import 'dart:convert';
import 'dart:developer';

import 'package:easy_book_test/core/app_colors.dart';
import 'package:easy_book_test/core/app_const.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/account_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Map<String, List<AccountModel>> map = {};
  Map<String, List<AccountModel>> originMap = {};
  List<AccountModel> data = [];
  List<AccountModel> originData = [];
  List<AccountModel> _finalSearch = [];

  late Future _future;

  Future _fetchData() async {
    try {
      final response = await http.get(
          Uri.parse(
            AppConst.url,
          ),
          headers: {
            'Content-Type': 'application/json',
            'MyToken': AppConst.myToken
          });
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        originData.clear();
        for (Map<String, dynamic> object in jsonData) {
          final item = AccountModel.fromJson(object);
          originData.add(item);
        }
        data = originData;
        map = convertListToMap(data);
        originMap = map;
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Failed to fetch data. Check your internet connection!.'),
        ),
      );
    }
  }

  convertListToMap(List<AccountModel> list) {
    Map<String, List<AccountModel>> mapResults = {};
    for (AccountModel item in list) {
      if (!mapResults.containsKey(item.mainAccount ?? 'main')) {
        mapResults[item.mainAccount ?? 'main'] = [];
      }
      mapResults[item.mainAccount ?? 'main']!.add(item);
      // print(
      //     "------------------map[item.mainAccount]---------------------------");
      // print(mapResults[item.mainAccount]);
      // print("------------------map[item.mainAccount]---------------------------");
    }
    return mapResults;
  }

  getChildrenToList(
      List<AccountModel> parent, Map<String, List<AccountModel>> map) {
    List<AccountModel> allNodes = [];
    allNodes.addAll(parent);
    for (AccountModel accountModel in allNodes) {
      if (originMap.containsKey(accountModel.cardGuide) &&
          !map.containsKey(accountModel.cardGuide)) {
        data.addAll(originMap[accountModel.cardGuide]!);
        map[accountModel.cardGuide] = originMap[accountModel.cardGuide]!;
      }
    }
  }

  List<Widget> _buildChildren(String mainAccount) {
    final children = data
        .where((item) => item.mainAccount == mainAccount)
        .map<Widget>((child) {
      //   final it = AccountModel.fromJson(child);
      final hasChildren =
          //map.containsKey(mainAccount)&&!map[mainAccount]!.isEmpty;
          data.any((item) => item.mainAccount == child.cardGuide);
      return Container(
        color: AppColors.white,
        child: Column(
          children: [
            hasChildren
                ? buildExpansionTile(child.cardCode, child)
                : ListTile(
                    title: Text(
                      '${child.cardCode} - ${child.accountName}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
            Visibility(
              visible: !hasChildren,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  color: AppColors.black,
                  thickness: .2,
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
    return children;
  }

  Widget buildExpansionTile(String index, AccountModel item) {
    if (item.mainAccount == null) {
      return ExpansionTileCard(
        key: Key((data.length != originData.length).toString()),
        initiallyExpanded: data.length != originData.length,
        baseColor: AppColors.white,
        expandedTextColor: AppColors.darkGreen,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
        expandedColor: AppColors.lightGreen,
        shadowColor: Colors.transparent,
        title: Text(
          "${int.parse(index) + 1} - ${item.accountName}",
          style: const TextStyle(
              color: AppColors.darkGreen, fontWeight: FontWeight.bold),
        ),
        children: _buildChildren(item.cardGuide),
      );
    }
    return ExpansionTileCard(
      key: Key((data.length != originData.length).toString()),
      initiallyExpanded: data.length != originData.length,
      baseColor: AppColors.white,
      expandedColor: AppColors.white,
      shadowColor: Colors.transparent,
      expandedTextColor: AppColors.black,
      title: Text(
        '${item.cardCode} - ${item.accountName}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: _buildChildren(item.cardGuide),
    );
  }

  List<AccountModel> _searchAndReturnNodes(
      String searchTerm, List<AccountModel> data) {
    List<AccountModel> results = [];
    // print(searchTerm);
    // print(data.length);
    void addToResults(AccountModel item) {
      if (!results.contains(item)) {
        results.add(item);
      }
      if (item.mainAccount != null) {
        final parent = data.firstWhere(
          (element) => element.cardGuide == item.mainAccount!,
          orElse: () => AccountModel(
            id: -1,
            cardGuide: '',
            cardCode: '',
            accountName: '',
          ),
        );
        if (parent.id != -1) {
          addToResults(parent);
        }
      }
    }

    for (var item in data) {
      if (searchTerm
              .toLowerCase()
              .split(' ')
              .every((s) => item.accountName.toLowerCase().contains(s)) ||
          item.cardCode.toString() == searchTerm) {
        addToResults(item);
      }
    }
    return results;
  }

  @override
  void initState() {
    _future = _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchData,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            AppConst.accounts,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: GestureDetector(
              child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(color: AppColors.black)),
            child: const Icon(
              Icons.grid_view,
              color: AppColors.black,
            ),
          )),
          actions: [
            GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: AppColors.darkGreen,
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                )),
            const SizedBox(
              width: 10.0,
            )
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    _finalSearch = _searchAndReturnNodes(value, originData);
                    data = _finalSearch;
                    map = convertListToMap(data);
                    getChildrenToList(data, map);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'بحث',
                      filled: true,
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: AppColors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.search,
                        ),
                        onPressed: () {},
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                FutureBuilder(
                    future: _future,
                    builder: (context, snapShot) {
                      //print(map);
                      if (snapShot.connectionState == ConnectionState.done) {
                        return Expanded(
                            child: data.isEmpty
                                ? Center(
                                    child: Text(
                                    'NoData',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ))
                                : ListView.separated(
                                    itemCount: map['main']!.length,
                                    itemBuilder: (_, index) {
                                      // AccountModel item = map['main']![index];
                                      // List<AccountModel?>? childrenItem =
                                      //     map[item.cardGuide];
                                      // // print('childrenItem');
                                      // // print(childrenItem);
                                      return buildExpansionTile(
                                          index.toString(),
                                          map['main']![index]);
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 10.0,
                                      );
                                    },
                                  ));
                      } else {
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
