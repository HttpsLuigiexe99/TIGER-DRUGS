
ESX = exports.es_extended:getSharedObject()

----------------------------------TIGER DEVELOPMENT ™----------------------------------
local droga = false

----------------------------------TIGER DEVELOPMENT ™----------------------------------

Citizen.CreateThread(function()
    for k, v in pairs(TIGERDROGA.Droga) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'raccolta:'..k,
            pos = v.raccolta.pos,
			size = vector3(0.5, 0.5, 0.5),
			scale = vector3(0.9, 0.9, 0.9),
			drawDistance = 5,
			type = 9, 
			ytd = "konar", ------"konar"
			ytd2 = "aereo", ------"moonlight"                        
			rotate = 90.0,
            color = { r = 255, g = 255, b = 255 },
			rotate2 = 0.0,
			shouldBob = false,
			shouldRotate = true,
			trasparent = 255,
            msg = v.raccolta.other.info,
            control = v.raccolta.other.key,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        raccolta()
                        Citizen.Wait(5000)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent("tiger_dev:raccolta", v.raccolta.item.add, v.raccolta.item.add_quantity, v.raccolta.police, v.raccolta.pos, v.raccolta.time.block, v.raccolta.time.unblock)
                        tiger0()
                        tiger1()
                        tiger2()
                        tiger3()
                        tiger4()
                        tiger5()
                        droga = false
                    end
                end 
            end
        })
        
        TriggerEvent('gridsystem:registerMarker', {
            name = 'processo'..k,
            pos = v.processo.pos,
			size = vector3(0.5, 0.5, 0.5),
			scale = vector3(0.9, 0.9, 0.9),
			drawDistance = 5,
			type = 9, -- Type Marker
			ytd = "konar", ----"konar"
			ytd2 = "aereo", ---"moonlight"
			rotate = 90.0,
            color = { r = 255, g = 255, b = 255 },
			rotate2 = 0.0,
			shouldBob = false,
			shouldRotate = true,
			trasparent = 255,
            msg = v.processo.other.info,
            control = v.processo.other.key,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        processo()
                        Citizen.Wait(5000)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent("tiger_dev:processo", v.processo.item.remove, v.processo.item.add, v.processo.police, v.processo.pos, v.processo.item.remove_quantity, v.processo.item.add_quantity, v.processo.time.block, v.processo.time.unblock)
                        tiger0()
                        tiger1()
                        tiger2()
                        tiger3()
                        tiger4()
                        tiger5() 

                        droga = false
                    end
                end
            end
        })
        
        TriggerEvent('gridsystem:registerMarker', {
            name = 'venditadroga:'..k,
            pos = v.vendita.pos,
			size = vector3(0.5, 0.5, 0.5),
			scale = vector3(0.9, 0.9, 0.9),
			drawDistance = 5,
			type = 9, -- Type Marker
			ytd = "konar", ----"konar"
			ytd2 = "aereo", ---"moonlight"
			rotate = 90.0,
            color = { r = 255, g = 255, b = 255 },
			rotate2 = 0.0,
			shouldBob = false,
			shouldRotate = true,
			trasparent = 255,
            msg = v.vendita.other.info,
            control = v.vendita.marker.key,
            action = function()
                if droga == false then
                    if IsPedInAnyVehicle(PlayerPedId()) then
                        ESX.ShowNotification(Lang.veicolo)
                    else
                        droga = true
                        FreezeEntityPosition(PlayerPedId(), true)
                        vendita()
                        Citizen.Wait(5000)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        TriggerServerEvent("tiger_dev:vendita", v.vendita.police, v.vendita.item.remove, v.vendita.item.add_money, v.vendita.pos, v.vendita.time.block, v.vendita.time.unblock)
                        tiger0()
                        tiger1()
                        tiger2()
                        tiger3()
                        tiger4()
                        tiger5()



                        droga = false
                    end
                end
            end
        })
    end
end)

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function raccolta()
    for k, v in pairs(TIGERDROGA.Droga) do
        if v.raccolta.other.animazione then
            RequestAnimDict("mini@repair")
            while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
            TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
        end
        if v.raccolta.other.abilitato then
            ExecuteCommand(v.raccolta.other.messaggio)
        end
        if v.raccolta.other.pogressbar then
            exports['progressBars']:startUI(5000, v.raccolta.other.messaggio_progressbar)
        end
    end
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function processo()
    for k, v in pairs(TIGERDROGA.Droga) do
        if v.processo.other.animazione then
            RequestAnimDict("mini@repair")
            while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
            TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
        end
        if v.processo.other.abilitato then
            ExecuteCommand(v.processo.other.messaggio)
        end
        if v.processo.other.pogressbar then
            exports['progressBars']:startUI(5000, v.processo.other.messaggio_progressbar)
        end
    end
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function vendita()
    for k, v in pairs(TIGERDROGA.Droga) do
        if v.vendita.other.animazione then
            RequestAnimDict("mini@repair")
            while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
            TaskPlayAnim(PlayerPedId(),"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
        end
        if v.vendita.other.abilitato then
            ExecuteCommand(v.vendita.other.messaggio)
        end
        if v.vendita.other.pogressbar then
            exports['progressBars']:startUI(5000, v.vendita.other.messaggio_progressbar)
        end
    end
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

Citizen.CreateThread(function()
	for i=1, #TIGERDROGA.Blip, 1 do
		local blip = AddBlipForCoord(TIGERDROGA.Blip[i].x, TIGERDROGA.Blip[i].y, TIGERDROGA.Blip[i].z)
		SetBlipSprite(blip, TIGERDROGA.Blip[i].id)
		SetBlipDisplay(blip, 4)
		SetBlipColour(blip, TIGERDROGA.Blip[i].color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		SetBlipScale(blip, TIGERDROGA.Blip[i].grandezza)
		AddTextComponentString(TIGERDROGA.Blip[i].name)
		EndTextCommandSetBlipName(blip)
	end
end)

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function tiger0()
    print("^3 |TIGER DEVELOPMENT| ^3")
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function tiger1()
    print("^3 1| Powered By HttpsLuigiexe99#6956 ^2")
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function tiger2()
    print("^3 2| tiger System Drugs ^2")
end
----------------------------------TIGER DEVELOPMENT ™----------------------------------

function tiger3()
    print("^3 3| Versione: 1.0 'BETA' ^2")
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function tiger4()
    print("^3 4| https://discord.gg/n8mvtaPmFS ^2")
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function tiger5()
    print("^3 5| NON MODIFICARE IL CODICE ")
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------















