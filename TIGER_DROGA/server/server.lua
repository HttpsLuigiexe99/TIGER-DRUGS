
ESX = exports.es_extended:getSharedObject()
local lspd = 0

----------------------------------TIGER DEVELOPMENT ™----------------------------------

function ConteggioLSPD()
	local xPlayers = ESX.GetPlayers()
	lspd = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == TIGERDROGA.Other.job_police then
			lspd = lspd + 1
		end
	end
	SetTimeout(15000, ConteggioLSPD)
end

ConteggioLSPD()

----------------------------------TIGER DEVELOPMENT ™----------------------------------

local function parse_time(str) 
    if TIGERDROGA.Other.block_time then
	local hour, min = str:match("(%d+):(%d+)")
	if hour == '00' then
		hour = 0
	end
	if min == '00' then
		min = 0
	end
	return os.time{hour = hour, min = min,sec = 1, day = 1, month = 1, year = 1971}
end
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

local function BetweenTimes(between,start,stop) 
    if TIGERDROGA.Other.block_time then
	between = parse_time(between)
	start = parse_time(start)
	stop = parse_time(stop)
	if stop < start then
		stop = stop + 24*60*60 
	end
	return (start <= between) and (between <= stop)
end
end

----------------------------------TIGER DEVELOPMENT ™----------------------------------

RegisterServerEvent('tiger_dev:raccolta')
AddEventHandler('tiger_dev:raccolta', function(item, quantity, police, raccolta, block, unlock)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xItem = xPlayer.getInventoryItem(item)
    local now = os.date('%H:%M')
    local name = GetPlayerName(source)
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(raccolta)
	local distanza = #(dista1 - dista2)

    if lspd >= police then
        if BetweenTimes(now, block, unlock) then 
            TriggerClientEvent('esx:showNotification', source, Lang.ORARIOON)
        else
            if distanza > 5 then
                print("^8ID: ["..source.."] "..GetPlayerName(source).. TIGERDROGA.AntiCheat.MessaggioConsole.."^0")
                local Descrizione = LangSdroga.mod ..GetCurrentResourceName()
                tigerDev(source, Descrizione, Configdroga.Webhook.anticheat, Configdroga.Embed_Color.anticheat)
                DropPlayer(source, TIGERDROGA.AntiCheat.MessaggioKick)
            else
                xPlayer.addInventoryItem(xItem.name, quantity)
            --    local Descrizione = LangSdroga.raccolta ..xItem.label 
                
            end
        end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.POLIZIANONDIPONIBILE)
    end
end)
-- PROCESSO DROGA --
RegisterServerEvent('tiger_dev:processo')
AddEventHandler('tiger_dev:processo', function(itemremove, itemadd, police, processo, quantityremove, quantityadd, block, unlock)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local name = GetPlayerName(source)
    local xItem, xItem2 = xPlayer.getInventoryItem(itemremove), xPlayer.getInventoryItem(itemadd)
    local now = os.date('%H:%M')
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(processo)
	local distanza = #(dista1 - dista2)

    if lspd >= police then
        if BetweenTimes(now, block, unlock) then 
            TriggerClientEvent('esx:showNotification', source, Lang.ORARIOON)
        else
            if distanza > 5 then
                print("^8ID: ["..source.."] "..GetPlayerName(source).. TIGERDROGA.AntiCheat.MessaggioConsole.."^0")
                local Descrizione = LangSdroga.mod ..GetCurrentResourceName()
                tigerDev(source, Descrizione, Configdroga.Webhook.anticheat, Configdroga.Embed_Color.anticheat)
                DropPlayer(source, TIGERDROGA.AntiCheat.MessaggioKick)
            else
                if xItem.count >= quantityremove then
                    xPlayer.removeInventoryItem(itemremove, quantityremove)
                    xPlayer.addInventoryItem(itemadd, quantityadd)
                else
                    TriggerClientEvent("esx:showNotification", source, Lang.DROGATERMINATA)
                end
            end
        end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.POLIZIANONDIPONIBILE)
    end
end)

----------------------------------TIGER DEVELOPMENT ™----------------------------------

RegisterServerEvent('tiger_dev:vendita')
AddEventHandler('tiger_dev:vendita', function(police, itemremove, prezzo, vendita, block, unlock)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xItem = xPlayer.getInventoryItem(itemremove)
    local totale = math.floor(prezzo*xItem.count)
    local now = os.date('%H:%M')
    local name = GetPlayerName(source)
    local ped = GetPlayerPed(source)
	local dista1 = GetEntityCoords(ped)
	local dista2 = vector3(vendita)
	local distanza = #(dista1 - dista2)

    if lspd >= police then
        if BetweenTimes(now, block, unlock) then 
            TriggerClientEvent('esx:showNotification', source, Lang.ORARIOON)
        else
            if distanza > 5 then
                print("^8ID: ["..source.."] "..GetPlayerName(source).. TIGERDROGA.AntiCheat.MessaggioConsole.."^0")
                local Descrizione = LangSdroga.mod ..GetCurrentResourceName()
                tigerDev(source, Descrizione, Configdroga.Webhook.anticheat, Configdroga.Embed_Color.anticheat)
                DropPlayer(source, TIGERDROGA.AntiCheat.MessaggioKick)
            else
                if xItem.count ~= 0 then
                    xPlayer.removeInventoryItem(itemremove, xItem.count)
                    xPlayer.addAccountMoney('black_money', prezzo*xItem.count)
                    TriggerClientEvent("esx:showNotification", source, Lang.DROGAVENDUTA)
                else
                    TriggerClientEvent("esx:showNotification", source, Lang.drogavendita)
                end
            end
        end
    else
        TriggerClientEvent("esx:showNotification", source, Lang.POLIZIANONDIPONIBILE)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    tigerlogo()
end)

function tigerlogo()
    print([[^3  
          |TIGER DEVELOPMENT|^3
----------------------------------------                                                        
^21| Powered By HttpsLuigiexe99#6956 ^2
2| tiger System Drugs
3| Versione: 1.0 "BETA" 
4| https://discord.gg/n8mvtaPmFS 
5| NON MODIFICARE IL CODICE ]])
end


----------------------------------TIGER DEVELOPMENT ™----------------------------------
