import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: GestureDetector(
        onTap: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
        child: Container(
          height: 49,
          // width: 130,
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: const Color(0xFFEDEDED),
                strokeAlign: 1,
                style: BorderStyle.solid),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.search_rounded,
                color: Color(0xFF878787),
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Search clothes...',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF878787),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //     child: GestureDetector(
  //       onTap: () {
  //         showSearch(
  //           context: context,
  //           delegate: CustomSearchDelegate(),
  //         );
  //       },
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(50),
  //                 color: Colors.amber,
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.grey.withOpacity(0.8),
  //                     spreadRadius: 0,
  //                     blurRadius: 4,
  //                     offset: Offset(1, 4),
  //                   ),
  //                 ],
  //               ),
  //               child: TextField(
  //                 textAlign: TextAlign.start,
  //                 textAlignVertical: TextAlignVertical.center,
  //                 decoration: InputDecoration(
  //                   hintText: 'Search',
  //                   hintStyle: TextStyle(
  //                     color: Colors.blue,
  //                   ),
  //                   contentPadding: EdgeInsets.symmetric(horizontal: 15),
  //                   prefixIcon: Padding(
  //                     padding: EdgeInsets.all(12),
  //                     child: IconButton(
  //                       icon: Icon(Icons.search_rounded),
  //                       onPressed: () {
  //                         showSearch(
  //                           context: context,
  //                           delegate: CustomSearchDelegate(),
  //                         );
  //                       },
  //                       // color: Colors.blue,
  //                     ),
  //                   ),
  //                   border: InputBorder.none,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             width: 15,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'men\'s clothing',
    'jewelery',
    'electronics',
    'women\'s clothing',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.chevron_left_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchTerms) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
