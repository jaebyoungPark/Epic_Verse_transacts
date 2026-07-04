using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Verse }


Test1():void =
     
    MousetrapsSet:int = 5
    var MiceCaught:int = 0
    var BreakTime:logic = false
    
    if:
        MousetrapsSet > 0
        set BreakTime = true
        MiceCaught > 0
    
    if (BreakTime?):
        Print("BreakTime is True!", ?Duration:=100.0) 
    else:
        Print("BreakTime is False!", ?Duration:= 100.0)



        
Test_class:=class:
    var TVar1:int = 55

    Test2()<decides>:void=
        if:
            TArray:[]int = array{}
            LVar:int = TArray[2]


hello_world_device := class(creative_device):
     OnBegin<override>()<suspends>:void=

        My_class:Test_class = Test_class{}
        if (My_class.Test2[]):
            Print("성공")
        else:
            Print("실패")
