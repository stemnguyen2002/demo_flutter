import 'package:flutter/material.dart';

class BadgeDemo extends StatelessWidget {
  const BadgeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(onPressed: (){}, label: const SizedBox()),
      body: const Center(
        child: Badge(
          label: Text('5'),
          smallSize: 30,
          backgroundColor: Colors.blue,
          child: Icon(Icons.access_time, size: 100,),
        ),
      ),
    );
  }
}

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            _successMessage(context);  _errMessage(context);
            /*
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar( 
                content: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC72C41),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 48,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Oh Snap!", style: TextStyle(fontSize: 18, color: Colors.white),),
                                Text("Flutter default SnackBar is showing", 
                                style: TextStyle(fontSize: 12, color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0 , 
                ),
              );
         */
          },
           child: const Text('Show Message'), 
          
          ),
      ),
    );
  }

  _successMessage(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(8),
          height: 80,
          decoration:const  BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.white, size: 40),
              const SizedBox(width: 20,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Success", style: TextStyle(fontSize: 18, color: Colors.white), ),
                    Text("Flutter Custorm Snack Bar Success Message",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  ),
                ),
            ]
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0 , 
        )
      );
  }

 _errMessage(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(8),
          height: 80,
          decoration:const  BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Row(
            children: [
              const Icon(Icons.close, color: Colors.white, size: 40),
              const SizedBox(width: 20,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Opps. An Error Occured", 
                      style: TextStyle(fontSize: 18, color: Colors.white, ),
                      textAlign: TextAlign.end,),
                    Text("Flutter Custorm Snack Bar Error Message Flutter Code with Benji",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  ),
                ),
            ]
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0 , 
        )
      );
  }
}
