import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.searchCtr,
  });

  final TextEditingController searchCtr;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      backgroundColor: const Color(0xff1b1b1b),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      prefixInsets: const EdgeInsets.only(left: 15),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      placeholder: 'Search Projects',
      placeholderStyle: Theme.of(context).textTheme.bodyMedium,
      controller: searchCtr,
      onChanged: (value) {},
    );
  }
}
