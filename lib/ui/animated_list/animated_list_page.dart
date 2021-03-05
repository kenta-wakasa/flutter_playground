import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/animated_list/animated_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedListPage extends ConsumerWidget {
  AnimatedListPage({Key key}) : super(key: key);
  static const String title = 'AnimatedList';
  final animationKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final provider = watch(animatedListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationKey.currentState.insertItem(provider.itemList.length);
          provider.addItem();
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: AnimatedList(
        key: animationKey,
        initialItemCount: provider.itemList.length,
        itemBuilder: (context, index, animation) {
          final color = provider.itemList[index];
          Widget _itemBuilder(
            BuildContext context,
            int index,
            Animation<double> animation,
          ) {
            void _removeItem() {
              animationKey.currentState.removeItem(
                index,
                (context, animation) => _itemBuilder(context, index, animation),
              );
              provider.removeAt(index);
            }

            return Padding(
              padding: const EdgeInsets.all(2),
              child: SizeTransition(
                sizeFactor: animation,
                axis: Axis.vertical,
                child: InkWell(
                  child: Card(
                    color: color,
                    child: Container(height: 100),
                  ),
                  onTap: _removeItem,
                ),
              ),
            );
          }

          return _itemBuilder(context, index, animation);
        },
      ),
    );
  }
}
