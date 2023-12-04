extends "res://content/techtree/Tech2.gd"

var mod_upgrade_keys = ['teslaquickcharge1', 'teslaquickcharge2']

func build(id:String, tier: = - 1):
	.build(id, tier)
	
	if visualTechId in mod_upgrade_keys:
		icon = load("res://mods-unpacked/Freya-TeslaUpgrades/extensions/content/icons/" + visualTechId + ".png")
		find_node("Icon").texture = icon
	
