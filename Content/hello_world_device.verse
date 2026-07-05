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
#compute 는 입출력이 void 인경우, 검증할 대상 자체가 없으니 조건을 만족하다고 친다.

#case 1
My_class:=class:

    var CArray1:[]int = array{1, 2}
    CArray2:[]int = array{3, 4}
    
    var CInt:int = 1000
    var CLogic:logic = true
    
    CTest1():void=
        if:
            CTest2[]
            if(CLogic?):
                Print("(if)CLogic : true", ?Duration := 100.0)
            else:
                Print("(if)CLogic : false", ?Duration := 100.0)
            CLogic?
        then:
            Print("(then)CLogic is true, CInt : {CInt}", ?Duration := 100.0)
        else:
            if(CLogic?):
                Print("(else)CLogic is true, CInt : {CInt}", ?Duration := 100.0)
            else:
                Print("(else)CLogic is false, CInt : {CInt}", ?Duration := 100.0)



    CTest2()<decides><reads>:void=
        CArray1[1]




#case 2
MyArray:[]int = array{1,2,3}

Test1():void=
    if:
        Test2[]

Test2()<decides><computes>:void=
    MyArray[2]




#device
hello_world_device := class(creative_device):
    OnBegin<override>()<suspends>:void=

        myclass:My_class = My_class{}
        myclass.CTest1()

     