import 'package:flutter/material.dart';
import 'package:statedemoapp/component/buttonhome.dart';
import 'package:statedemoapp/component/communication.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xFF008C4F), useMaterial3: true),
      title: 'Button Types',
      home: const Scaffold(
        body: ButtonTypesExample(),
      ),
    );
  }
}

class ButtonTypesExample extends StatelessWidget {
  const ButtonTypesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(4.0),
        child: Row(
          children: const [
            Spacer(),
            ButtonTypesGroup(enabled: true),
           ButtonTypesGroup(enabled: false),
            Spacer(),
            
          ],
        ),
      
    );
  }
}

class ButtonTypesGroup extends StatefulWidget {
  const ButtonTypesGroup({super.key, required this.enabled});

  final bool enabled;

  @override
  State<ButtonTypesGroup> createState() => _ButtonTypesGroupState();
}

class _ButtonTypesGroupState extends State<ButtonTypesGroup> {
  bool flag = false;
  final focusNodeTwo = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNodeTwo.addListener(() {
      Text("Has focus two: ${focusNodeTwo.hasFocus}");
    });
  }

  @override
  void dispose() {
    focusNodeTwo.dispose();
    super.dispose();
  }
    
  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.enabled ? () {} : null;
    return Padding(
     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 30),
      child: Column(
        children: [
          ElevatedButton(onPressed: onPressed, child: const Text('Elevated'),), // ElevatedButton sử dụng child là Text
          const SizedBox(height: 10,),
          ElevatedButton( // ElevatedButton sử dụng child bao gồm 2 icon + 1 text => Cho vào 1 Row và gọi 2 icon + 1 text bên trong Row           
           onPressed: onPressed,
            style: ElevatedButton.styleFrom(
             // primary: flag ? Colors.yellow : Colors.teal,
              backgroundColor: Colors.yellow[300], // primary ở đây là set màu nền background màu vàng
              foregroundColor: Colors.green, // foregroundColor: Thiết lập tông màu chủ đạo,ví dụ ở đây mặc định icon, text sẽ là màu xanh và khi onPressed thì cũng là màu xanh
              disabledForegroundColor: Colors.red, // disabledForegroundColor: Thiết lập tông màu khi ta disable, ở đây để là màu đỏ nên text và icon khi disable sẽ là màu đỏ mặc định
              disabledBackgroundColor: Colors.blue, // disabledBackgroundColor: set màu nền background khi disable ở đây là màu xanh
              elevation: 10, // độ cao nhô lên phía trên 10 so với mặc định 
              textStyle: const TextStyle(color: Colors.black, fontSize: 15),
              padding: const EdgeInsets.all(16),// set padding bên trong cho ElevatedButton 
              //padding: const EdgeInsets.symmetric(horizontal: 16), // padding horizontal ở đây là set padding chiều ngang, 
              //vì bên trong elevated có icon và text nên mặc định padding của mỗi cái là 8 nên mặc định padding của cả 2 cái cộng lại sẽ là 16
             // minimumSize: const Size(15, 10), // set min size dài rộng cho elevated button
              //maximumSize: const Size(166, 60), // set max size dài rộng cho elevated button 
            ), 
            child: Row (
              children: const [
              Icon(Icons.directions_bus),
              Icon(Icons.train),
              SizedBox(width: 5),
              Text("Phương tiện")
              ],
            ), 
            ),
            const SizedBox(height: 10,), 

          ElevatedButton(        
            onHover: (value) {
              setState(() => flag = !flag);
            },  
           onPressed: (){ setState(() => flag = !flag);},
            style: ElevatedButton.styleFrom(
              backgroundColor: flag ? Colors.yellow : Colors.teal,
              foregroundColor: Colors.green, // foregroundColor: Thiết lập tông màu chủ đạo,ví dụ ở đây mặc định icon, text sẽ là màu xanh và khi onPressed thì cũng là màu xanh
              disabledForegroundColor: Colors.red, // disabledForegroundColor: Thiết lập tông màu khi ta disable, ở đây để là màu đỏ nên text và icon khi disable sẽ là màu đỏ mặc định
              disabledBackgroundColor: Colors.blue, // disabledBackgroundColor: set màu nền background khi disable ở đây là màu xanh
              elevation: 10, // độ cao nhô lên phía trên 10 so với mặc định 
              textStyle: const TextStyle(color: Colors.black, fontSize: 15),
              padding: const EdgeInsets.all(16),// set padding bên trong cho ElevatedButton 
              //padding: const EdgeInsets.symmetric(horizontal: 16), // padding horizontal ở đây là set padding chiều ngang, 
              //vì bên trong elevated có icon và text nên mặc định padding của mỗi cái là 8 nên mặc định padding của cả 2 cái cộng lại sẽ là 16
             // minimumSize: const Size(15, 10), // set min size dài rộng cho elevated button
             // maximumSize: const Size(166, 60), // set max size dài rộng cho elevated button 
            // fixedSize: const Size.fromHeight(50) // set chiều cao cố định 100 và chiều rộng mặc định
             //fixedSize: const Size.fromWidth(166) // set chiều rộng cố định là 166 và chiều cao mặc định
            ), 
            child: Row (
              children: const [
              Icon(Icons.directions_bus),
              Icon(Icons.train),
              SizedBox(width: 5),
              Text("Phương tiện")
              ],
            ), 
            ),

            const SizedBox(height: 10,), 
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF008C4F),
                foregroundColor: Colors.white, 
                maximumSize: const Size(127, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
                padding: const EdgeInsets.all(16)), 
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  const [
              SizedBox(width: 24, height: 24 ,child: Icon(Icons.add_circle,)),
              SizedBox(width: 31, height: 24 ,child: Text("Text", style: TextStyle(fontSize: 16),)),
              SizedBox(width: 24, height: 24 , child: Icon(Icons.add_circle)),
            ],),),

             const SizedBox(height: 10,), 
            ElevatedButton(onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF008C4F),
              foregroundColor: Colors.white,
              maximumSize: const Size(119, 48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
              padding: const EdgeInsets.all(12)), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  const [
              SizedBox(width: 24, height: 24 , child: Icon(Icons.add_circle, size: 24,)),
              SizedBox(width: 31, height: 24, child: Text("Text", style: TextStyle(fontSize: 16),)),
              SizedBox(width: 24, height: 24 , child: Icon(Icons.add_circle)),
              
            ],),),

            const SizedBox(height: 10,), 
            ElevatedButton(onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF008C4F),
              foregroundColor: Colors.white,
              maximumSize: const Size(111, 40),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
               padding: const EdgeInsets.all(8)), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  const [
              SizedBox(width: 24, height: 24 ,child: Icon(Icons.add_circle,)),
              SizedBox(width: 31, height: 24,child: Text("Text", style: TextStyle(fontSize: 16),)),
              SizedBox(width: 24, height: 24 , child: Icon(Icons.add_circle)),
              
            ],),),

          const SizedBox(height: 10,),  
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              ), 
            child: const SizedBox( 
              height: 50, 
              width: 50,  
              child: TextField( 
                autofocus: true, 
                style: TextStyle(color: Colors.grey, fontSize: 10,), 
                decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide.none)),
                textInputAction: TextInputAction.next,
                ),
            ),
          ), 

          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: onPressed, 
            child: SizedBox( 
              height: 50, 
              width: 50,  
              child: TextField( focusNode: focusNodeTwo, style: const TextStyle(color: Colors.grey, fontSize: 10,),),
            ),
          ),  
          const SizedBox(height: 10,),

          ElevatedButton(
            onPressed: (){FocusScope.of(context).requestFocus(focusNodeTwo);},// Khi nhấn vào Next thì focus xuống textfield2
            style: ElevatedButton.styleFrom( 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
            ), 
            child: const Text('Next'),
            ), 
          const SizedBox(height: 10,),

          ElevatedButton.icon( // Nếu cần 1 icon + 1 text thì nên sử dụng ElevatedButton.icon
            onPressed: onPressed, 
            onLongPress: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => const ButtonHome()));}, // Khi nhấn giữ vào nút setting thì sẽ chuyển qua màn Home
            icon: const Icon(Icons.settings),
            label: const Text("Settings"),
            ),  
          const SizedBox(height: 10,),

          FilledButton(onPressed: onPressed, child: const Text('Filled'),),
          const SizedBox(height: 10,),
          FilledButton.tonal(
              onPressed: onPressed, child: const Text('Filled Tonal'),),
              const SizedBox(height: 10,),
          OutlinedButton(onPressed: onPressed, child: const Text('Outlined'),),
          const SizedBox(height: 10,),
          TextButton(onPressed: onPressed, child: const Text('Text'),),
          const SizedBox(height: 10,),
         // FloatingActionButton(onPressed: onPressed, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),), child: const Icon(Icons.add),),
          const SizedBox(height: 10,),
         //FloatingActionButton.extended(onPressed: onPressed, icon: const Icon(Icons.call), label: const Text('Float') ),
          const SizedBox(height: 10,),
         // FloatingActionButton.small(onPressed: onPressed),
          const SizedBox(height: 10,),
          // FloatingActionButton.large(onPressed: onPressed, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), ),
          IconButton(
              icon: const Icon(Icons.filter_drama), 
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BadgeDemo()),);
              }),      
          OutlinedButton.icon(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ButtonDemo()));
            }, 
            icon: const Icon(Icons.filter_drama),
            label: const SizedBox()
            ),
          const SizedBox(height: 10,),
           const SingleChoice(),
           const SizedBox(height: 10,),
           const MultipleChoice(),
           
        ],
      ),
    );
  }

  void onLogin() {

  }
}

/*
// ignore: must_be_immutable
class ButtonText extends StatelessWidget {
  IconData suffixIcon;
  IconData prefixIcon;
  String title;
  double height;
 double width;
  double pad;
  final bool enabled;
  ButtonText({super.key, required this.suffixIcon, required this.prefixIcon, required this.title, required this.height, required this.width, required this.enabled, required this.pad});

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
     // maximumSize: Size(width, height),
       minimumSize:  Size(width, height),
        backgroundColor: const Color(0xFF008C4F),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(0)
        ),
      onPressed: onPressed, 
      child: Row(
        children: [
          IconButton(onPressed: onPressed, icon: Icon(suffixIcon),padding: EdgeInsets.all(pad),),
          Text(title,),
          IconButton(onPressed: onPressed, icon: Icon(prefixIcon), padding: EdgeInsets.all(pad),),
          
        ],
      )
      );
  }
} */

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({super.key});

  @override
  State<ButtonDemo> createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  late final TextEditingController _userController ;
  late final TextEditingController _passController ;
   bool selected = false;
   bool enabled = false;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passController = TextEditingController();

    _userController.addListener(() {
      if(_userController.text.trim().isNotEmpty && _passController.text.trim().isNotEmpty) {
        setState(() {
          selected = true;
        });
      } else {
        selected = false;
      }
     });

   _passController.addListener(() {
     if(_userController.text.trim().isNotEmpty && _passController.text.trim().isNotEmpty) {
        setState(() {
          selected = true;
        });
      } else {
        selected = false;
      }
   }) ;
      
   }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
           SizedBox(
            width: 250, 
            height: 100,
            child: TextField(
              controller: _userController,
              textInputAction: TextInputAction.next,
            )),
           SizedBox(
            width: 250,
           height: 100,
          child: TextField(
            controller: _passController,
            textInputAction: TextInputAction.done,
          )),
          ElevatedButton(
            onPressed: selected ? (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SnackBarDemo()));} : null,
            style: ElevatedButton.styleFrom(backgroundColor: selected ? Colors.green : Colors.grey),
            child: const Text('Lưu'),
            )
        ],
      ),
    );
  }
}


enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}



