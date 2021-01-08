-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Smells like the work\rof an enemy stand.", "Poseur is posing like his\rlife depends on it.", "Poseur's limbs shouldn't be\rmoving in this way."}
commands = {"Reset KARMA", "Inc KARMA", "Dec KARMA", "Inc Drain", "Dec Drain"}
randomdialogue = {"Random\nDialogue\n1.", "Random\nDialogue\n2.", "Random\nDialogue\n3."}

sprite = "poseur" --Always PNG. Extension is added automatically.
name = "Poseur"
hp = 100
atk = 1
def = 1
check = "Check message goes here."
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true

-- Happens after the slash animation but before 
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end
 
-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    local Karma = Encounter["Karma"]
    local i, v
    for i, v in ipairs({
        {"RESET KARMA", "kr", 0},
        {"INC KARMA", "kr", Karma.kr + 5},
        {"DEC KARMA", "kr", Karma.kr - 5},
        {"INC DRAIN", "drain", Karma.drain + 1},
        {"DEC DRAIN", "drain", Karma.drain - 1}
    }) do
        if command == v[1] then
            Karma[v[2]] = v[3]
            break
        end
    end
    BattleDialog({"You selected " .. command .. "."})
end