import 'package:cubitconnectivity/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context,state){
              if(state is InternetGained){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet connected"),
                backgroundColor: Colors.green,
                ),

                );

              }
              else if( state is InternetLost){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Not connected'), backgroundColor: Colors.red,));
              }
            },
            builder: (context,state){
              if(state is InternetGained){
                return Text("Connected");
                
              }else if (state is InternetLost){
                return Text("Not connected");
              }else{
                return Text("Loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}
