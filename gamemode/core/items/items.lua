fw.ents.registerItem("Blowtorch", {
	stringID = "blowtorch",
	color = Color(0, 0, 0),
	model = "", --this is the model shown on the menu display, and doesn't have to mach the ent model
	entity = "ent_class", --this MUST be the entity classname 
	max = 0,
	price = 100,
	--optional
	--removeOnDisc = true/false, remove this when the player leaves
	--category = "General Merch, custom cat",
	--factionOnly = true/false for all factions, or "FACTION_*" for one faction,
	--jobOnly = {table of teams, TEAM_*}
	--onSpawn = function(item, ply) end,
	--canBuy = function(item, ply) return true/false end
})

fw.ents.registerItem("Tier 1 Money Printer", {
	stringID = "t1printer",
	color =  Color(211, 84, 0),
	model = "models/props_c17/consolebox01a.mdl", --this is the model shown on the menu display, and doesn't have to mach the ent model
	entity = "ent_class", --this MUST be the entity classname 
	max = 0,
	price = 5000,
	removeOnDisc = true,
	category = "Printers",
})