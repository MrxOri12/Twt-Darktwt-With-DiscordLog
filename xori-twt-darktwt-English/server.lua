local webhookURL = GetConvar('xoritwt:webhookURL', 'https://discordapp.com/api/webhooks/646559439150776320/AlLMXzFc5o5ou9PavN7lckiovekdIJ5lfKB14DbXnfn3qAjUHVOpBYWHiBLSRrdiqfXZ')
local charLimit = GetConvarInt('xoritwt:charLimit', 150) -- Change This If You Want Change Max Letters


RegisterCommand("twt", function(source, args, rawCommand) 

    name = (source == 0) and 'console' or GetPlayerName(source)

    xori = table.concat(args, " ")


    if (xori == "") then
        errorMessage("You Cannot Post a Blank Tweet", source)
    elseif (xori:len() >= charLimit) then
        errorMessage("Too Many Letters Max Is " .. charLimit, source)
    else
        announcexori(name, xori)
        postDiscordWebhook(name, xori)
    end

end, false)

function errorMessage(message, id)
    TriggerClientEvent('chatMessage', id, "^8" .. message)
end

function announcexori(name, xori)
    TriggerClientEvent('chatMessage', -1, "^0[^4Twitter^0]", {30, 144, 255}, "^3@" .. name .."^0 " .. xori)
end

function postDiscordWebhook(name, xori)
    if webhookURL ~= "PasteHereYourWebhook" then -- Change "PasteHereYourWebhook" To Your Webhook If You Want Specific Discord Channel
            PerformHttpRequest(webhookURL, function(statusCode, text, headers)
                --print(statusCode)
            end, 'POST', json.encode({ content = xori, username = name}), { ["Content-Type"] = 'application/json' })
    end
end

---------------------------------------
---------------Twitter-----------------
---------------------------------------
----------This Chat Made By xOri-------
---------------------------------------
------------Mr.xOri#5834---------------
---------------------------------------
--------------DarkWeb------------------
---------------------------------------

RegisterCommand("dw", function(source, args, rawCommand) -- DarkWeb
    local message = table.concat(args, " ")
    TriggerClientEvent("chatMessage", -1, "Dark Web | Unknown User ", {255,0,0}, message) 

    xori = table.concat(args, " ")


    if (dw == "") then
        errorMessage("You Cannot Post a Blank Tweet", source)
        errorMessage("Too Many Letters Max Is " .. charLimits, source)
    else
        postDiscordWebhook(name, dw)
    end

end, false)


function postDiscordWebhook(name, dw)
    if webhookURL ~= "PasteHereYourWebhook" then --- If U Want Specific Text Channel In Discord Add Here Your Webhook 
            PerformHttpRequest(webhookURL, function(statusCode, text, headers)
                --print(statusCode)
            end, 'POST', json.encode({ content = xori, username = name}), { ["Content-Type"] = 'application/json' })
    end
end
