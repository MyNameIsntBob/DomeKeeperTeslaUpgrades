extends "res://systems/data/Data.gd"


func parseUpgradesYaml(upgradesPath:String):
	.parseUpgradesYaml(upgradesPath)
	addLock("teslatiming1", "teslaquickcharge1")
	var keys_to_move = ["teslaquickcharge1", "teslaquickcharge2"]
	changeUpgradeKeyOrder("teslatiming1", keys_to_move)

# Takes the existing_key and adds a lock for the new key to it
func addLock(existing_key: String, new_key: String):
	if Data.upgrades[existing_key].has("lock"):
		Data.upgrades[existing_key]["locks"].append(new_key)
	
	else:
		Data.upgrades[existing_key]["locks"] = [new_key]

# Takes the keys to move out of the array and puts them infront of the target_key
func changeUpgradeKeyOrder(target_key: String, keys_to_move: Array):
	var upgradeKeys = Data.orderedUpgradeKeys.duplicate()
	for key in keys_to_move:
		upgradeKeys.erase(key)
	
	var target_index = upgradeKeys.find(target_key)
	var first_section = upgradeKeys.slice(0, target_index - 1)
	var second_section = upgradeKeys.slice(target_index, len(upgradeKeys))
	
	var final_array = first_section + keys_to_move + second_section
	Data.orderedUpgradeKeys = final_array
