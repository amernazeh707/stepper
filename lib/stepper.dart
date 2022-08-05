import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SteeperScreen extends StatefulWidget {
  const SteeperScreen({Key? key}) : super(key: key);

  @override
  State<SteeperScreen> createState() => _SteeperScreenState();
}

class _SteeperScreenState extends State<SteeperScreen> {
  int currentStep =0;
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepContinue: currentStep<1 ? () =>
          setState(() => currentStep +=1):null,

        onStepCancel:currentStep>0 ? () =>
            setState(() => currentStep -=1):null,
        onStepTapped: (step) => setState(()=> currentStep=step) ,
        steps: [
          Step(
            state: currentStep >0 ? StepState.complete: StepState.indexed ,
            isActive: currentStep >= 0,
            title: Text('Description'),
              content: Text('A very warm welcome to you It is lovely to have you among us')

          ),
          Step(
            state: currentStep >1 ? StepState.complete: StepState.indexed,
            isActive: currentStep >= 1,
            title: Text('LOGIN'),
              content:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(

                      controller: TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: Icon(
                          Icons.email_outlined,
                        ),

                        border: OutlineInputBorder(),
                      )
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(

                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText:isPassword,
                      decoration: InputDecoration(
                        labelText:   'Password ',
                        prefixIcon: Icon(
                            Icons.lock_outlined
                        ),
                        suffixIcon: IconButton(
                            onPressed: (){
                              isPassword =! isPassword;
                              setState((){
                                isPassword ;
                              });
                            },
                            icon: Icon (
                                isPassword?Icons.visibility_outlined: Icons.visibility_off_outlined
                            )
                        ),

                        border: OutlineInputBorder(),
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: double.infinity,
                      height: 50,
                      child: MaterialButton(
                          onPressed: (){},
                          child: Text('login',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          )
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            3
                        ),
                        color: Colors.blue,
                      )
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}
