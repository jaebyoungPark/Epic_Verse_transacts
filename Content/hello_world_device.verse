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

Test3()<decides>:void=
    Test2[]


Test2()<decides>:void=
        var TArray:[]int = array{1,2,3,4}
        set TArray = array{5}
        TArray[10]


hello_world_device := class(creative_device):
    OnBegin<override>()<suspends>:void=
       ()