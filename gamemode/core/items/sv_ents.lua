util.AddNetworkString("playerBuyItem")

ndoc.table.items = {}

function fw.ents.createShipment(pl, item)
	local ship = ents.Create("fw_shipment")
	PrintTable(item)
	ship:SetItem(item.index)
	ship:SetCount(item.shipmentCount)
	ship:Spawn()
	ship:Activate()
	ship:FWSetOwner(ply)

	if (item.customRun) then
		item.customRun(ship, pl)
	end

	fw.ents.setPositionWithEntityTrace(pl, ship)
end

function fw.ents.createItem(pl, item)
	if (item.ammo and item.ammoCount) then
		print('AMMO', item.name, item.ammo, item.ammoCount)
		pl:GiveAmmo(item.ammoCount, item.ammo)

		return
	end

	local ent = ents.Create(item.entity)
	ent:Spawn()
	ent:Activate()
	ent:FWSetOwner(pl)

	if (item.customRun) then
		item.customRun(ent, pl)
	end

	fw.ents.setPositionWithEntityTrace(pl, ent)
end

function fw.ents.createWeapon(pl, item)
	local ent = ents.Create("fw_gun")
	ent:SetWeaponAndModel(item.weapon, item.model)
	ent.WeaponPrintName = item.name
	ent:Spawn()
	ent:Activate()
	ent:FWSetOwner(pl)

	if item.buff then
		ent:SetBuff(item.buff)
	end

	if (item.customRun) then
		item.customRun(ent, pl)
	end

	fw.ents.setPositionWithEntityTrace(pl, ent)
end

function fw.ents.setPositionWithEntityTrace(pl, ent)
	local tr = util.TraceEntity({
		start = pl:EyePos(),
		endpos = pl:EyePos() +  pl:GetAimVector() * 100,
		filter = function(ent) return ent ~= pl end
	}, ent)

	ent:SetPos(tr.HitPos)
end
