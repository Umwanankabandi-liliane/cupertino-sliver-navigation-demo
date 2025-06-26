import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyCupertinoApp());
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Home')),
      child: Center(
        child: CupertinoButton.filled(
          child: const Text('Open Demo'),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const SliverDemoScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SliverDemoScreen extends StatelessWidget {
  const SliverDemoScreen({super.key});

  final List<String> items = const [
    'Avocado Toast',
    'Caesar Salad',
    'Pasta Carbon',
    'Beef Tacos',
    'Veggie Stir Fry',
    'Grilled Cheese',
    'Smoothie Bowl',
    'Chicken Curry',
    'Garlic Bread',
    'Pancakes',
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text('My Recipes'),
            backgroundColor: CupertinoColors.systemGrey6,
            border: const Border(
              bottom: BorderSide(
                color: CupertinoColors.systemGrey3,
                width: 0.5,
              ),
            ),
            leading: CupertinoNavigationBarBackButton(
              onPressed: () => Navigator.pop(context),
              color: CupertinoColors.activeBlue,
            ),
            trailing: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder:
                      (context) => CupertinoAlertDialog(
                    title: const Text('Add Recipe'),
                    content: const Text('This is where a form could go.'),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text('OK'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(CupertinoIcons.add),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey4.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          items[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          CupertinoIcons.chevron_forward,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}