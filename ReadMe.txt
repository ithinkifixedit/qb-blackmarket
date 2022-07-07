  _   _     _       _           _      _    __   _                     _   _   _   
 (_) | |   | |     (_)         | |    (_)  / _| (_)                   | | (_) | |  
  _  | |_  | |__    _   _ __   | | __  _  | |_   _  __  __   ___    __| |  _  | |_ 
 | | | __| | '_ \  | | | '_ \  | |/ / | | |  _| | | \ \/ /  / _ \  / _` | | | | __|
 | | | |_  | | | | | | | | | | |   <  | | | |   | |  >  <  |  __/ | (_| | | | | |_ 
 |_|  \__| |_| |_| |_| |_| |_| |_|\_\ |_| |_|   |_| /_/\_\  \___|  \__,_| |_|  \__|
                                                                                   
                                                                                   

QB-BLACKMARKET

i have tried to make this script as user friendly as possible with constant commeting explaining what certain functions do.
i am continously learning different things within fivem so any bugs or issues please feel free to ask for support DM me on discord ithinkifixedit#2303

Here are the items you need to add into your shared.lua found in [qb-core/shared.lua] and image assets can be found in the included folder.

	["sdcard"] 					 = {["name"] = "sdcard", 			 	  	  	["label"] = "SD Card", 				["weight"] = 0.9, 		["type"] = "item", 		["image"] = "sdcard.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil, ["expire"] = 14,    ["description"] = "Find the guns if you can!"},
	["jokercard"] 					 = {["name"] = "jokercard", 			 	  	  	["label"] = "Joker Card", 				["weight"] = 0.9, 		["type"] = "item", 		["image"] = "jokercard.png", 			["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil, ["expire"] = 14,    ["description"] = "You Should use this for a blackmarket or something stupid!"},

Everything to do with these items can be changed, just make sure if you change item Codes (eg. "sdcard") you change it in both client and server files where
required.


For The notifications, you can either use your own notification system for your server or add this to your QB Core in main.lua

RegisterNetEvent('DoLongHudText')
AddEventHandler('DoLongHudText', function(text, color, time)
	SendNUIMessage({text = text, color = color or 1 or 2, time = time or 10000})
end)

If you would like to replace with your own notifications edit:

Lines 20 and 91 in client,lua


I would reccomend using a target system for the blackmarket dealer as the Text box can be buggy at times.