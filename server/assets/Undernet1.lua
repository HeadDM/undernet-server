local ezmemory = require('scripts/ezlibs-scripts/ezmemory')

local sfx = {
    item_get='/server/assets/ezlibs-assets/sfx/item_get.ogg'
}

local persist_health_and_emotion = function (player_id,encounter_info,stats)
    if stats.emotion == 1 then
        Net.set_player_emotion(player_id, stats.emotion)
    else
        Net.set_player_emotion(player_id, 0)
    end
    ezmemory.set_player_health(player_id,stats.health)
end

local give_result_awards = function (player_id,encounter_info,stats)
    -- stats = { health: number, score: number, time: number, ran: bool, emotion: number, turns: number, npcs: { id: String, health: number }[] }
    persist_health_and_emotion(player_id,encounter_info,stats)
    if stats.ran then
        return -- no rewards for wimps
    end
    local reward_monies = (stats.score*50)
    ezmemory.spend_player_money(player_id,-reward_monies) -- spending money backwards gives money
    if reward_monies > 0 then
        Net.message_player(player_id,"Got $"..reward_monies.."!")
        Net.play_sound_for_player(player_id,sfx.item_get)
    end
end

local give_result_awards_rare = function (player_id,encounter_info,stats)
    -- stats = { health: number, score: number, time: number, ran: bool, emotion: number, turns: number, npcs: { id: String, health: number }[] }
    if stats.ran then
        return -- no rewards for wimps
    end
    local reward_monies = (stats.score*200)
    ezmemory.spend_player_money(player_id,-reward_monies) -- spending money backwards gives money
    if reward_monies > 0 then
        Net.message_player(player_id,"Got $"..reward_monies.."!")
        Net.play_sound_for_player(player_id,sfx.item_get)
    end
end

local FIREBROS = {
    name="FIREBROS",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="Spikey",rank=4},
        {name="MetFire",rank=8},
    },
    obstacles={
        {name="BlastCube"},
    },
    positions={
        {0,0,0,0,0,1},
        {0,0,0,0,2,0},
        {0,0,0,0,0,1},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,1,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {9,9,9,1,1,1},
        {9,9,9,1,1,1},
        {9,9,9,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

local SlipperySlope = {
    name="SlipperySlope",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="ColdHead",rank=1},
        {name="Tark",rank=1},
    },
    obstacles={
    },
    positions={
        {0,0,0,2,0,1},
        {0,0,0,0,0,1},
        {0,0,0,2,0,1},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {12,12,12,1,1,1},
        {12,12,12,1,1,1},
        {12,12,12,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

local DOThell = {
    name="DOThell",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="Skelly",rank=1},
        {name="VacuumFan",rank=4},
        {name="WindBox",rank=8},
        {name="GregarBeast",rank=1},
    },
    obstacles={
        {name="BlastCube"},
        {name="BlastCube"},
    },
    positions={
        {0,0,0,0,0,2},
        {0,0,0,1,0,1},
        {0,0,0,0,0,3},
    },
    obstacle_positions={
        {0,0,0,0,2,0},
        {0,0,0,0,0,0},
        {0,0,0,0,1,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {14,14,14,1,1,11},
        {14,14,14,1,1,1},
        {14,14,14,1,1,11},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

local Roundandround = {
    name="Roundandround",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="CirSmash",rank=1},
    },
    obstacles={
    },
    positions={
        {0,0,0,0,1,0},
        {0,0,0,0,0,0},
        {0,0,0,0,1,0},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {5,6,6,1,1,1},
        {5,7,4,1,1,1},
        {7,7,4,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

local Orbit = {
    name="Orbit",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="Yurarion",rank=1},
        {name="Spikey",rank=4},
    },
    obstacles={
        {name="BlastCube"},
    },
    positions={
        {0,0,0,0,0,0},
        {0,0,0,1,0,1},
        {0,0,0,0,0,2},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {1,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

local DRAGONS = {
    name="DRAGONS",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="HeelNavi",rank=4},
        {name="Juragon",rank=1},
    },
    obstacles={
    },
    positions={
        {0,0,0,0,0,2},
        {0,0,0,0,0,1},
        {0,0,0,0,0,2},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

local GUN = {
    name="GUN",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="Sniper",rank=1},
        {name="Doomer",rank=1},
    },
    obstacles={
        {name="BlastCube"},
        {name="BlastCube"},
        {name="BlastCube"},
    },
    positions={
        {0,0,0,0,0,1},
        {0,0,0,0,0,2},
        {0,0,0,0,0,1},
    },
    obstacle_positions={
        {0,0,0,0,3,0},
        {0,0,0,0,2,0},
        {0,0,0,0,1,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {1,1,1,1,1,11},
        {1,1,1,1,1,11},
        {1,1,1,1,1,11},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

local StunBun = {
    name="StunBun",
    path="/server/assets/ezlibs-assets/ezencounters/ezencounters.zip",
    weight=10,
    enemies={
        {name="MegaBunny",rank=1},
    },
    obstacles={
    },
    positions={
        {0,0,0,0,0,1},
        {0,0,0,1,0,1},
        {0,0,0,0,0,1},
    },
    obstacle_positions={
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
        {0,0,0,0,0,0},
    },
    player_positions={
        {0,0,0,0,0,0},
        {0,1,0,0,0,0},
        {0,0,0,0,0,0},
    },
    tiles={
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
        {1,1,1,1,1,1},
    },
    teams={
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
        {2,2,2,1,1,1},
    },
    results_callback = give_result_awards
}

return {
    minimum_steps_before_encounter=100,
    encounter_chance_per_step=0.05,
    encounters={FIREBROS,SlipperySlope,DOThell,Roundandround,Orbit,DRAGONS,GUN,StunBun}
}