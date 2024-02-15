extends ContentInfo

const MOD_STRINGS := [
	preload("mod_strings.en.translation"),
]
# Settings
var setting_b2flee_mod_status: bool = true

const RESOURCES := [
	{
		"resource": "battle/ui/cassette_player/xy_CassetteButton.gd",
		"resource_path": "res://battle/ui/cassette_player/CassetteButton.gd",
	},
]

# Mod interop
const MODUTILS: Dictionary = {
	"updates": "https://gist.githubusercontent.com/xy172/0ea9c940b9282d483571c94c3bda4d84/raw/updates.json",
	"settings": [
		{
			"property": "setting_b2flee_mod_status",
			"type": "toggle",
			"label": "UI_SETTINGS_XY_B2FLEE_MOD",
		},
	],
	"class_patch": [
		{
			"patch": "res://mods/xy_b2flee_modutils/battle/ui/cassette_player/xy_CassetteButton.gd",
			"target": "res://battle/ui/cassette_player/CassetteButton.gd",
		},
	],
}
		
func init_content() -> void:

	# Add translation strings
	for translation in MOD_STRINGS:
		TranslationServer.add_translation(translation)

# Show MissingDependencies screen if cat_modutils isn't loaded
	if not DLC.has_mod("cat_modutils", 0):
		DLC.get_tree().connect("idle_frame", SceneManager, "change_scene", ["res://mods/xy_b2flee/menus/MissingDependency.tscn"], CONNECT_ONESHOT)
		return

