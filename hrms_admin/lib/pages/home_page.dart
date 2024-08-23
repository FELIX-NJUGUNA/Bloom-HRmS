import 'package:flutter/material.dart';
import 'package:hrms_admin/components/add_btn.dart';
import 'package:hrms_admin/components/event_notif.dart';
import 'package:hrms_admin/components/leave_employees.dart';
import 'package:hrms_admin/components/quickinfo.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [

          // section 1
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                children: [
              
                  // container 1
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back Felix"),
                          Text("Good Morning", style: Theme.of(context).textTheme.headlineMedium),
                       
                        ],
                      ),
                      
                    ),
                  ),
              
              
                  // container 2
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Row(
                        
                        children: [
                          Flexible(
                            child: Container(
                              width: 250, // Calculate width dynamically
                              height: 150, // Adjust height as needed
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(226, 216, 255, 0.482),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: QuickInfo(icon: Icon(Icons.person), title: "Total Employees", remainder: "200", totalCount: "200"),
                            ),
                          ),
                                  
                         const SizedBox(width: 10,),
                                  
                                  
                         // cont 2
                         Flexible(
                           child: Container(
                              width: 250, // Calculate width dynamically
                              height: 150, // Adjust height as needed
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(216, 255, 218, 0.49),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: QuickInfo(icon: Icon(Icons.note), title: "On Leave", remainder: "10", totalCount: "200"),

                            ),
                         ),
                                  
                         const SizedBox(width: 10,),
                                  
                         // cont 3
                         Flexible(
                           child: Container(
                              width: 250, // Calculate width dynamically
                              height: 150, // Adjust height as needed
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 216, 216, 0.486),
                                borderRadius: BorderRadius.circular(10),
                              ),

                             child: QuickInfo(icon: Icon(Icons.check), title: "Today's Attendance", remainder: "200", totalCount: "200"),
                            ),
                         ),
                                  
                         const SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          // section 2
          Expanded(
            
            child: Row(
              children: [
            
                // attendance graph
                Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary
                    ),
                                    
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Attendance Overview",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontSize: 20
                              )
                            ),
                        ],
                      ),
                    ),
                    
                  ),
                ),

                const SizedBox(width: 20,),
            
                // news and events
                Expanded(
                  flex: 2,
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("News & Events", style: Theme.of(context).textTheme.headlineSmall,),

                          AddBtn(text: "Add Event", onBtnTap: () {}, icon: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary,),)
                        ],
                      ),

                      const SizedBox(height: 10,),
                      Expanded(
                        child: ListView(
                          children: List.generate(7, (index){
                            return Card(
                                elevation: 4.0, // Adds shadow to the card
                                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adds margin around the card
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0), // Rounded corners for the card
                                ),
                             
                              
                              child: ListTile(
                                title: Text('Event ${index + 1}'),
                                subtitle: Text('Details of event ${index + 1}'),
                              ),
                            );
                          }),
                        )
                        )
                    ],
                  )
                  
                )
                  
              ],
            ),
          ),
        
          // section 3
          const SizedBox(height: 10,),

          Expanded(
            
            child: Row(
              
              children: [

                // cont 1
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),


                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Employees On Leave", style: TextStyle(fontSize: 20)),
                      
                            ],
                          ),
                          const SizedBox(height: 10,),
                      
                          Expanded(
                            
                            child: ListView(
                             children: [
                               Container(
                                 
                                decoration: BoxDecoration(
                                
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                
                              
                                child: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Column(
                                    children: [
                                      LeaveEmployees(name: "Felix Njugush", leaveType: "Education", duration: "10 JUNE "),
                                       LeaveEmployees(name: "Felix Njugush", leaveType: "Education", duration: "10 JUNE"),
                                      
                                    ],
                                  ),
                                ),
                               )
                              
                             ],
                          ),
                          )
                        ],
                      ),
                    ) ,
                  )
                  
                ),

                const SizedBox(width: 10,),

                // cont 2
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Employees", style: TextStyle(fontSize: 20),),

                              AddBtn(text: "View All", onBtnTap: () {}, icon: Icon(Icons.keyboard_arrow_left, color: Theme.of(context).colorScheme.secondary,))
                              
                            ],
                          )
                      
                      
                        ],
                      ),
                    ) ,
                  )
                  
                ),

                const SizedBox(width: 10,),

                // cont 3
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: [
                              
                              
                                  Text("My Tasks", style: TextStyle(fontSize: 20),),
                              
                                  AddBtn(text: "Add Task", onBtnTap: () {}, icon: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary,),)
                              
                              
                                ],
                              ),
                            ],
                          ),
                        )
                        
                      ],
                    ) ,
                  )
                  
                ),
              ],


            ),
            
          ),
        
        ],
      )
    );
  }
}

