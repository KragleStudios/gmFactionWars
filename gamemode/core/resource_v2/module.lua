if SERVER then
	AddCSLuaFile()
end

require 'ra'

fw.resource = fw.resource or {}

local resource_entities = fw.resource.resource_entities or {}
fw.resource.resource_entities = resource_entities

fw.resource.types = {}
fw.resource.typeById = {}
function fw.resource.register(type, meta)
	meta.type = type
	meta.id = table.insert(fw.resource.typeById, meta)
	fw.resource.types[type] = meta
	return meta.id
end

function fw.resource.getIdByStringName(stringName)
	return fw.resource.typeById[stringName].id
end

function fw.resource.resourceEntity(ent)
	ent.fwResources = {}
	ent.fwConsumption = {} -- special resources that are consumed using :ConsumeResource
	table.insert(resource_entities, ent)
	if SERVER then
		fw.resource.updateNetworks()
	end
end

function fw.resource.removeEntity(ent)
	table.RemoveByValue(resource_entities, ent)
end

ra.include_sv 'resource_sv.lua'
ra.include_cl 'resource_cl.lua'
ra.include_sh 'def_resources.lua'
