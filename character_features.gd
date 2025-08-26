extends Resource

enum FeatureType { HAIR, HAT, EYES, EARS, NOSE, MOUTH, CHIN, SKIN_COLOR, SHIRT_COLOR, FACIAL_HAIR, MISC }



# 1. Hair
enum Hair {
	NO_HAIR,
	BROWN,
	BLONDE,
	RED,
	BLUE,
	BLACK,
	GRAY,
}
var hair = ["Bald", "Brown hair", "Blonde hair", "Red hair", "Blue hair", "Black hair", "Gray hair"]

# 2. Hat
enum Hat {
	NO_HAT,
	TOP_HAT,
	FEDORA,
	BASEBALL_HAT,
	NO_BRIM,
	HORNS,
	WITCH_HAT,
}
var hat = ["", "Top hat", "Fedora", "Baseball cap", "Brimless hat", "Horns", "Witch hat"]

# 3. Eyes
enum Eyes {
	NO_EYES,
	CLOSED,
	SAD,
	HAPPY,
}
var eyes = ["No eyes", "Closed eyes", "Sad eyes", "Happy eyes"]

# 4. Ears
enum Ears {
	NO_EARS,
	BIG,
	SMALL,
	GIANT,
}
var ears = ["No ears", "Big ears", "Small ears", "Giant ears"]

# 5. Nose
enum Nose {
	NO_NOSE,
	BIG,
	SMALL,
	GIANT,
}
var nose = ["No nose", "Big nose", "Small nose", "Giant nose"]

# 6. Mouth
enum Mouth {
	NO_MOUTH,
	SMILE_BIG,
	SMILE_SMALL,
	INDIFFERENT_BIG,
	INDIFFERENT_SMALL,
	FROWN_BIG,
	FROWN_SMALL,
}
var mouth = ["Silent", "Big mouth", "Small mouth", "Indifferent", "Smiling", "Frowning"]

# 7. Chin
enum Chin {
	NO_CHIN,
	DOUBLE_CHIN,
	POINTY_CHIN,
}
var chin = ["No chin", "Double chin", "Pointy chin"]

# 8. Color (generic)
enum SkinColor {
	NONE,
	RED,
	ORANGE,
	YELLOW,
	GREEN,
	BLUE,
	PURPLE,
	BROWN,
	BLACK,
	WHITE,
	GRAY,
}
var skin_color = ["No skin", "Red skin", "Orange skin", "Yellow skin", "Green skin", "Blue skin", "Purple skin", "Brown skin", "Black skin", "White skin", "Gray skin"]

# 9. Shirt Color
enum ShirtColor {
	SHIRT_NONE,
	SHIRT_RED,
	SHIRT_BLUE,
	SHIRT_GREEN,
	SHIRT_BLACK,
	SHIRT_WHITE,
	SHIRT_GRAY,
	SHIRT_YELLOW,
}
var shirt_color = ["No shirt", "Red shirt", "Blue shirt", "Green shirt", "Black shirt", "White shirt", "Gray shirt", "Yellow shirt"]

# 10. Facial Hair
enum FacialHair {
	NO_FACIAL_HAIR,
	MUSTACHE,
	BEARD,
	GOATEE,
	SIDEBURNS,
}
var facial_hair = ["", "Mustache", "Beard", "Goatee", "Sideburns"]

# 11. Miscellaneous
enum Misc {
	NONE,
	MONOCLE,
	MOLE,
	SCAR,
	GLASSES,
}
var misc = ["", "Monocle", "Mole", "Scar", "Glasses"]
