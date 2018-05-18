//: Playground - noun: a place where people can play

import UIKit
//Implementing the command pattern

protocol Command
{   func hire()
    func execute() // method named execute, let's look at the command types that the light type will use to turn the light on and off
    //command types which will be used
   
}
//create a protocol named Command ; all command types will conform to.

struct RockerSwitchLightOnCommand: Command{
    func hire()
    {}
    //conforms to the command protocol by implementing the hire() method;
    func execute()
    { // conform to the command protocol by implementing the execute() method;
        print("Rocker Switch: Turn light on")
    }
    
    
}


struct RockerSwitchLightOffCommand: Command{
    func hire(){}
    func execute()
    {
        print("Rocker Switch: Turn light off")
    }
}

struct PullSwitchLightOnCommand: Command{
    func hire(){}
    func execute()
    { // conform to the command protocol
        print("Pull Switch: Turn light on")
    }
}

struct PullSwitchLightOffCommand: Command{
    func hire(){}
    func execute()
    {
        print("Pull Switch: Turn light off")
    }
}
// Implement the light type:
// lightOnCommand & lightOffCommand creating 2 variables, named lightOnCommand, lightOffCommand.
//instances of types that conform to the command protocol.
class Light{
    
    var lightOnCommand: Command // variable created
    var lightOffCommand: Command
    init(lightOnCommand: Command, lightOffCommand: Command)
    {
        self.lightOnCommand = lightOnCommand
        self.lightOffCommand = lightOffCommand
        
    }
    func turnOnLight(){
        self.lightOnCommand.execute() //accessing the rocker
    }
    func turnOffLight(){
        self.lightOffCommand.execute()
    }
    
}

var on = PullSwitchLightOnCommand() // instance of pull on
var off = PullSwitchLightOffCommand() // instance of pull off

var light = Light(lightOnCommand: on, lightOffCommand : off)

light.turnOnLight() // -> rocker switch
//light.turnOffLight()

light.lightOnCommand = RockerSwitchLightOnCommand()
light.turnOnLight()
//light.lightOnCommand1 = PullSwitchLightOnCommand()
light.lightOnCommand = PullSwitchLightOnCommand()
light.turnOnLight()
light.lightOnCommand = RockerSwitchLightOnCommand()
light.turnOnLight()
light.lightOffCommand = PullSwitchLightOffCommand()
light.turnOffLight() // accesses the Pull off
light.lightOffCommand = RockerSwitchLightOffCommand()
light.turnOffLight() // accesses the Rocker off

//light.lightOffCommand = RockerSwitchLightOffCommand()

//light.turnOffLight()
//which command to invoke at runtime

/*
 PullSwitchLightOnCommand type named on and an instance of the Light type using the two commands that we just created and call the turnOnLight()
 set which command to invoke at runtime, lets us swap the commands out with different implementations that conform to the command protocol as needed throughout the life of the application.
 command types encapsulate the details of the command implementations

 Creating an instance of the command type on light instance - turnOnLight, turnOffLight methods of the light instance,
 */

/* Method named execute()
 command types -
 rocker on
 rocker off
 pull on
 pull off
 all of the commands conform to the command protocol by implementing the execute method
 use them in the Light type,
 implement the light type -
 
 class is created
 3 variables - lightOnCommand lightOffcommand lightOnCommand1
 initiators are created that let us set the three commands when type is initiated.
 appropriate command
 
 */
