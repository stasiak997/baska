--------------------------------------------
------ Napisane przez stasiak#1695 ------
--------------------------------------------

ESX                           = nil
Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

local treatment = false


local timer = false


local blips = {
  {name="Hospital", id=80, x= 308.19, y= -592.8, z= 43.6, color= 1},
}


function Notify(text)
  SetNotificationTextEntry('STRING')
  AddTextComponentString(text)
  DrawNotification(false, false)
end


function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, item in pairs(blips) do
	  if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 20 then
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x,item.y,item.z, true) <= 5 then
          ShowInfo("Uzyj ~INPUT_VEH_HORN~ aby doktor pomogl osobie obok Ciebie koszt: ~g~10000$~s~(placi osoba obok)", 0)
          
          local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
          
          
          if (IsControlJustPressed(1,38)) and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 5) and closestDistance ~= -1 and closestDistance <= 5.0 then
            print(mozna)
            TriggerServerEvent('sprawdz:ambulans')
            
            treatment = true
          end
          end
        end
      end
    end
    end)

    RegisterNetEvent('stasiak:lekarz')
    AddEventHandler('stasiak:lekarz', function(source)
      
        Notify("~h~~g~Doktor ~s~pomaga~h~~r~~s~ osobie obok Ciebie , ~h~~b~poczekaj az skonczy~s~.")
        playerPed = PlayerPedId()
        FreezeEntityPosition(playerPed, true)
      Citizen.Wait(1000)
      Notify("15 sekund")
      Citizen.Wait(1000)
      Notify("14 sekund")
      Citizen.Wait(1000)
      Notify("13 sekund")
      Citizen.Wait(1000)
      Notify("12 sekund")
      Citizen.Wait(1000)
      Notify("11 sekund")
      Citizen.Wait(1000)
      Notify("10 sekund")
      Citizen.Wait(1000)
      Notify("9 sekund")
      Citizen.Wait(1000)
      Notify("8 sekund")
      Citizen.Wait(1000)
      Notify("7 sekund")
      Citizen.Wait(1000)
      Notify("6 sekund")
      Citizen.Wait(1000)
      Notify("5 sekund")
      Citizen.Wait(1000)
      Notify("4 sekundy")
      Citizen.Wait(1000)
      Notify("3 sekundy")
      Citizen.Wait(1000)
      Notify("2 sekundy")      
      Citizen.Wait(1000)
      Notify("1 sekunda")
      FreezeEntityPosition(playerPed, false)
        timer = true

        if timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -677.39, 340.22, 83.12, true) <= 10) then
          --print('player lezy')
          local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
          local clos = GetPlayerServerId(closestPlayer)
          TriggerServerEvent('hospital:price', clos)
          
          TriggerServerEvent('baska:revive', clos)
        --  print('revive u lekarza')
         Notify("~h~~g~Doktor ~h~~r~pomogl~s~ osobie obok Ciebie.")
   
          timer = false
        end
        if timer == true and (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -677.39, 340.22, 83.12, true) > 10) then
         Notify("BŁAD SKRYPTU ZGŁOŚ DO ADMINISTRACJI!")
          treatment = false
          timer = false            
        end
   
    
end)
RegisterNetEvent('stasiak:zaduzomedykow')
AddEventHandler('stasiak:zaduzomedykow', function(source)
  Notify("Medycy są na służbie, doktor nie pomoże...")
end)
Citizen.CreateThread(function()
    
    RequestModel(GetHashKey("s_m_m_doctor_01"))
    while not HasModelLoaded(GetHashKey("s_m_m_doctor_01")) do
      Wait(1)
    end

      local hospitalped =  CreatePed(4, 0xd47303ac, -677.20, 340.32, 82.12, 180.6, false, true)
      SetEntityHeading(hospitalped, -90.404)
      FreezeEntityPosition(hospitalped, true)
      SetEntityInvincible(hospitalped, true)
      SetBlockingOfNonTemporaryEvents(hospitalped, true)
end)

--------------------------------------------
------ Napisane przez stasiak#1695 ------
--------------------------------------------