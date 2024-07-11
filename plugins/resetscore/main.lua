local resetCmd = function(playerid, args, argsCount, silent)
    if playerid == -1 then return end
    local player = GetPlayer(playerid)
    if not player then return end

    local roundstats = player:CCSPlayerController().ActionTrackingServices.MatchStats.Parent
	if roundstats.Kills == 0 and roundstats.Deaths == 0 and roundstats.Assists == 0 and roundstats.Damage == 0 then
        return ReplyToCommand(player, config:Fetch("resetscore.prefix"), FetchTranslation("resetscore.already_resetted"))
    end
    
    roundstats.Kills = 0
    roundstats.Deaths = 0
    roundstats.Assists = 0
    roundstats.Damage = 0
    ReplyToCommand(player, config:Fetch("resetscore.prefix"), FetchTranslation("resetscore.resetscore"))
end

AddEventHandler("OnPluginStart", function(event)
    for i=1, config:FetchArraySize("resetscore.commands") do
        commands:Register(config:Fetch("resetscore.commands[" .. (i - 1) .. "]"), resetCmd)
    end
	return EventResult.Continue   
end)

function GetPluginAuthor()
    return "Swiftly Solutions"
end

function GetPluginVersion()
    return "1.0.0"
end

function GetPluginName()
    return "Reset Score"
end

function GetPluginWebsite()
    return "https://github.com/swiftly-solution/resetscore"
end
