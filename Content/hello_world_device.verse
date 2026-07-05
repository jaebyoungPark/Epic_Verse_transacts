using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Verse.org/Verse }


TestFunc():void =
     
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




#둘다 reads 를 필요로 하는거 같은데, CTest2에선 transacts 를 요구함(근데 reads 를 추가하면 에러 x)
#반면 Test2에선 reads를 요구함(사실상 transacts를 요구하는 듯). 
#어쨌든 둘다 transacts 이건 세개 추가이건 요구하는바는 같긴함

My_class:=class:

    var TArray:[]int = array{1, 2}
    
    CTest1():void=
        if:
            Value:?int = false
            Test2[]
            Value?

    CTest2()<decides><allocates><writes>:void=
        set TArray = array{3}



Test1():void=
    if:
        Test2[]

Test2()<decides><allocates><writes>:void=
    var TArray:[]int = array{1, 2}
    set TArray = array{3}





hello_world_device := class(creative_device):
    OnBegin<override>()<suspends>:void=
        ()

     