extends Node

const MYMODNAME_MOD_DIR = "Freya-TeslaUpgrades/"
const MYMODNAME_LOG = "Freya-TeslaUpgrades"

var dir = ""
var ext_dir = ""

func _init():
	ModLoaderLog.info("Init", MYMODNAME_LOG)
	dir = ModLoaderMod.get_unpacked_dir() + MYMODNAME_MOD_DIR
	ext_dir = dir + "extensions/"
	
	# Add extensions
	loadExtension(ext_dir, "content/achievements/Achievements.gd")
	loadExtension(ext_dir, "content/techtree/Tech2.gd")
	loadExtension(ext_dir, "systems/data/Data.gd")
	
	# Add Translations
	ModLoaderMod.add_translation(dir + "localization/tesla_upgrades.en.translation")

func loadExtension(ext_dir, fileName):
	ModLoaderMod.install_script_extension(ext_dir + fileName)

func _ready():
	ModLoaderLog.info("Done", MYMODNAME_LOG)
	add_to_group("mod_init")

func modInit():
	var pathToModYaml : String = ModLoaderMod.get_unpacked_dir() + MYMODNAME_MOD_DIR + "yaml/"
	Data.parseUpgradesYaml(pathToModYaml + "upgrades.yaml")
