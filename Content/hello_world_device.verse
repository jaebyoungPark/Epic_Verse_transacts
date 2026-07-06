using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Fortnite.com/Playspaces }
using { /Verse.org/Simulation }
using { /Verse.org/Verse }
using { /UnrealEngine.com/Temporary/SpatialMath }




#실패코드. why? 다음 커밋은 성공일거임 
#device
hello_world_device := class(creative_device):
    OnBegin<override>()<suspends>:void=
        
        Playspace:fort_playspace = GetPlayspace()
        AllPlayers:[]player = Playspace.GetPlayers()

        var FirstPosition:transform = transform{}
        var SecondPosition:transform = transform{}

        if:
            Print("First if", ?Duration:=15.0)
            Player:player = AllPlayers[0]
            FortniteCharacter:fort_character = Player.GetFortCharacter[]
            set FirstPosition = FortniteCharacter.GetTransform()
        then:
            Print("Move or prepare to take damage!", ?Duration:=15.0)
            Sleep(10.0)

        var DistanceBetweenPositions:float = 0.0
        if:
            Print("Seconds if", ?Duration:=15.0)
            Player:player = AllPlayers[0]
            FortniteCharacter:fort_character = Player.GetFortCharacter[]
            set SecondPosition = FortniteCharacter.GetTransform()
            set DistanceBetweenPositions = DistanceXY(FirstPosition.Translation, SecondPosition.Translation)
            DistanceBetweenPositions < 1000.0
        then:
            Print("First : {FirstPosition.Translation}", ?Duration:=15.0)
            Print("Second: {SecondPosition.Translation}", ?Duration:=15.0)
            Print("Distance : {DistanceBetweenPositions}", ?Duration:=15.0)          
            Print("Applying Damage", ?Duration:=15.0)
            HurtPlayer(50.0)
        else:
            set DistanceBetweenPositions = DistanceXY(FirstPosition.Translation, SecondPosition.Translation)
            Print("else)First : {FirstPosition.Translation}", ?Duration:=15.0)
            Print("else)Second: {SecondPosition.Translation}", ?Duration:=15.0)
            Print("else)Distance : {DistanceBetweenPositions}", ?Duration:=15.0)




    HurtPlayer(DamageAmount:float):void=
        Playspace:fort_playspace = GetPlayspace()
        AllPlayers:[]player = Playspace.GetPlayers()
        if (Player:player = AllPlayers[0]):
            if(FortniteCharacter:fort_character = Player.GetFortCharacter[]):
                MyCharacterHealth:float = FortniteCharacter.GetHealth()
                DamageToDo:float = CalculateDamage(MyCharacterHealth, DamageAmount, 1.0)
                Print("Damage To Do : {DamageToDo}", ?Duration:=15.0)
                FortniteCharacter.Damage(DamageToDo)

    CalculateDamage(PlayerHealth:float, DesiredDamageAmount:float, MinHealth:float):float=
        
        if(PlayerHealth > DesiredDamageAmount):
            return DesiredDamageAmount
        else if(PlayerHealth > MinHealth):
            return PlayerHealth - MinHealth
        else:
            return PlayerHealth

    




            

     