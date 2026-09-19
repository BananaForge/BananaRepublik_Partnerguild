-- BananaRepublik_Partnerguild - TEST DATA (v1.0.1)
-- ============================================================
--  NUR ZUM TESTEN DER OBERFLAECHE!
--  Erzeugt erfundene Gildenmitglieder mit erfundenen Rezepten,
--  damit man die UI im Vollzustand sehen kann.
--
--  Befehle:
--    /brpptest load   - Testdaten einspielen
--    /brpptest clear  - Testdaten restlos entfernen
--    /brpptest status - zeigt an, was gerade drin ist
--
--  Sicherheit:
--    * Alle Eintraege sind mit isTestData = true markiert.
--    * broadcastAll() ueberspringt markierte Eintraege, es wird
--      also NICHTS davon an die echte Gilde gesendet.
--    * "clear" loescht ausschliesslich markierte Eintraege,
--      echte gescannte Daten bleiben unangetastet.
-- ============================================================

local TEST_TAG = "BRPP_TESTDATA"

local function tmsg(text)
  DEFAULT_CHAT_FRAME:AddMessage("|cffffd200BRPP-Test:|r " .. text)
end

-- Erfundene Crafter und ihre Rezepte
local TestCrafters = {
  {
    name = "Bananenkoenig",
    profs = {
      {
        prof = "Alchemy", rank = 300, maxRank = 300,
        recipes = {
          { name = "Elixir of Water Breathing", reagents = { { count = 1, name = "Goldthorn" }, { count = 4, name = "Briarthorn" }, { count = 2, name = "Dreamfoil" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Water to Air", reagents = { { count = 2, name = "Mountain Silversage" }, { count = 1, name = "Briarthorn" }, { count = 4, name = "Silverleaf" }, { count = 6, name = "Mageroyal" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Fortitude", reagents = { { count = 4, name = "Black Lotus" }, { count = 2, name = "Peacebloom" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Flask of Supreme Power", reagents = { { count = 10, name = "Mountain Silversage" }, { count = 2, name = "Dreamfoil" }, { count = 3, name = "Goldthorn" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Major Healing Potion", reagents = { { count = 10, name = "Khadgar's Whisker" }, { count = 2, name = "Fadeleaf" }, { count = 6, name = "Crystal Vial" }, { count = 10, name = "Mageroyal" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Concoction of the Emerald Mongoose", reagents = { { count = 2, name = "Silverleaf" }, { count = 4, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Dreamshard Elixir", reagents = { { count = 4, name = "Fadeleaf" }, { count = 1, name = "Khadgar's Whisker" }, { count = 1, name = "Crystal Vial" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Superior Healing Potion", reagents = { { count = 3, name = "Goldthorn" }, { count = 3, name = "Briarthorn" }, { count = 1, name = "Fadeleaf" }, { count = 6, name = "Mountain Silversage" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Greater Shadow Protection Potion", reagents = { { count = 10, name = "Dreamfoil" }, { count = 10, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Defense", reagents = { { count = 3, name = "Fadeleaf" }, { count = 4, name = "Stonescale Oil" }, { count = 10, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Fire Protection Potion", reagents = { { count = 3, name = "Silverleaf" }, { count = 6, name = "Stonescale Oil" }, { count = 6, name = "Crystal Vial" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Lesser Healing Potion", reagents = { { count = 6, name = "Peacebloom" }, { count = 4, name = "Crystal Vial" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Discolored Healing Potion", reagents = { { count = 1, name = "Khadgar's Whisker" }, { count = 3, name = "Crystal Vial" }, { count = 2, name = "Goldthorn" }, { count = 2, name = "Fadeleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Greater Healing Potion", reagents = { { count = 10, name = "Silverleaf" }, { count = 2, name = "Khadgar's Whisker" }, { count = 2, name = "Peacebloom" }, { count = 6, name = "Mageroyal" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Greater Frost Power", reagents = { { count = 10, name = "Goldthorn" }, { count = 3, name = "Stonescale Oil" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Concoction of the Arcane Giant", reagents = { { count = 3, name = "Briarthorn" }, { count = 4, name = "Khadgar's Whisker" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Brute Force", reagents = { { count = 2, name = "Briarthorn" }, { count = 6, name = "Goldthorn" }, { count = 3, name = "Dreamfoil" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Ghost Dye", reagents = { { count = 2, name = "Mountain Silversage" }, { count = 1, name = "Goldthorn" }, { count = 2, name = "Mageroyal" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Frost Oil", reagents = { { count = 2, name = "Mageroyal" }, { count = 1, name = "Mountain Silversage" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Dreamless Sleep Potion", reagents = { { count = 2, name = "Black Lotus" }, { count = 1, name = "Briarthorn" }, { count = 2, name = "Crystal Vial" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Greater Water Breathing", reagents = { { count = 4, name = "Dreamfoil" }, { count = 2, name = "Fadeleaf" }, { count = 2, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Swim Speed Potion", reagents = { { count = 10, name = "Dreamfoil" }, { count = 10, name = "Black Lotus" }, { count = 10, name = "Peacebloom" }, { count = 6, name = "Khadgar's Whisker" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Gurubashi Mojo Madness", reagents = { { count = 1, name = "Goldthorn" }, { count = 3, name = "Stonescale Oil" }, { count = 6, name = "Mountain Silversage" }, { count = 3, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Frost Protection Potion", reagents = { { count = 2, name = "Mageroyal" }, { count = 3, name = "Silverleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Earth to Water", reagents = { { count = 4, name = "Silverleaf" }, { count = 1, name = "Fadeleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Holy Protection Potion", reagents = { { count = 2, name = "Peacebloom" }, { count = 4, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Detect Lesser Invisibility", reagents = { { count = 1, name = "Fadeleaf" }, { count = 1, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Greater Intellect", reagents = { { count = 2, name = "Black Lotus" }, { count = 6, name = "Goldthorn" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Lucidity Potion", reagents = { { count = 3, name = "Fadeleaf" }, { count = 1, name = "Black Lotus" }, { count = 1, name = "Stonescale Oil" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Philosopher's Stone", reagents = { { count = 2, name = "Khadgar's Whisker" }, { count = 1, name = "Stonescale Oil" }, { count = 2, name = "Mountain Silversage" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Elemental Earth", reagents = { { count = 6, name = "Stonescale Oil" }, { count = 2, name = "Fadeleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Restorative Potion", reagents = { { count = 1, name = "Stonescale Oil" }, { count = 2, name = "Briarthorn" }, { count = 4, name = "Dreamfoil" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Invisibility Potion", reagents = { { count = 10, name = "Briarthorn" }, { count = 4, name = "Dreamfoil" }, { count = 2, name = "Peacebloom" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Nature Protection Potion", reagents = { { count = 2, name = "Silverleaf" }, { count = 2, name = "Crystal Vial" }, { count = 10, name = "Dreamfoil" }, { count = 2, name = "Fadeleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Weak Troll's Blood Potion", reagents = { { count = 4, name = "Dreamfoil" }, { count = 10, name = "Stonescale Oil" }, { count = 10, name = "Fadeleaf" }, { count = 10, name = "Mageroyal" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Mithril to Truesilver", reagents = { { count = 6, name = "Mageroyal" }, { count = 10, name = "Goldthorn" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Potion of Quickness", reagents = { { count = 3, name = "Mageroyal" }, { count = 2, name = "Dreamfoil" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Concoction of the Dreamwater", reagents = { { count = 2, name = "Peacebloom" }, { count = 2, name = "Stonescale Oil" }, { count = 6, name = "Crystal Vial" }, { count = 4, name = "Khadgar's Whisker" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Healing Potion", reagents = { { count = 1, name = "Khadgar's Whisker" }, { count = 2, name = "Fadeleaf" }, { count = 1, name = "Mountain Silversage" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Dream Vision", reagents = { { count = 2, name = "Khadgar's Whisker" }, { count = 2, name = "Mageroyal" } }, icon = "Interface\\Icons\\INV_Potion_54" },
        },
      },
      {
        prof = "Engineering", rank = 285, maxRank = 300,
        recipes = {
          { name = "Moonsight Rifle", reagents = { { count = 2, name = "Mithril Bar" }, { count = 4, name = "Dense Blasting Powder" }, { count = 4, name = "Gold Power Core" }, { count = 2, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Smelt Thorium", reagents = { { count = 4, name = "Copper Bar" }, { count = 6, name = "Bronze Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Smelt Mithril", reagents = { { count = 10, name = "Solid Blasting Powder" }, { count = 10, name = "Thorium Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Advanced Target Dummy", reagents = { { count = 2, name = "Copper Bar" }, { count = 2, name = "Handful of Copper Bolts" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Mithril Tube", reagents = { { count = 3, name = "Thorium Bar" }, { count = 10, name = "Gold Power Core" }, { count = 2, name = "Mithril Bar" }, { count = 1, name = "Handful of Copper Bolts" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Spellpower Goggles Xtreme", reagents = { { count = 10, name = "Gold Power Core" }, { count = 4, name = "Dense Blasting Powder" }, { count = 3, name = "Mageweave Cloth" }, { count = 10, name = "Handful of Copper Bolts" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Hi-Impact Mithril Slugs", reagents = { { count = 1, name = "Mithril Bar" }, { count = 10, name = "Mageweave Cloth" }, { count = 3, name = "Handful of Copper Bolts" }, { count = 10, name = "Solid Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Snowmaster 9000", reagents = { { count = 2, name = "Copper Bar" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Copper Modulator", reagents = { { count = 6, name = "Bronze Bar" }, { count = 4, name = "Copper Bar" }, { count = 4, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Standard Scope", reagents = { { count = 2, name = "Dense Blasting Powder" }, { count = 2, name = "Bronze Bar" }, { count = 2, name = "Handful of Copper Bolts" }, { count = 1, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Dark Iron Rifle", reagents = { { count = 4, name = "Mageweave Cloth" }, { count = 1, name = "Dense Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Large Blue Rocket Cluster", reagents = { { count = 4, name = "Dense Blasting Powder" }, { count = 4, name = "Gold Power Core" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Force Reactive Disk", reagents = { { count = 3, name = "Mageweave Cloth" }, { count = 4, name = "Thorium Bar" }, { count = 4, name = "Gold Power Core" }, { count = 10, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Unstable Trigger", reagents = { { count = 4, name = "Mageweave Cloth" }, { count = 2, name = "Thorium Bar" }, { count = 4, name = "Gold Power Core" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Firework Cluster Launcher", reagents = { { count = 3, name = "Dense Blasting Powder" }, { count = 1, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Masterwork Target Dummy", reagents = { { count = 6, name = "Dense Blasting Powder" }, { count = 2, name = "Gold Power Core" }, { count = 3, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Snake Burst Firework", reagents = { { count = 10, name = "Thorium Bar" }, { count = 1, name = "Handful of Copper Bolts" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Heavy Blasting Powder", reagents = { { count = 2, name = "Gold Power Core" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Copper Tube", reagents = { { count = 3, name = "Thorium Bar" }, { count = 2, name = "Bronze Bar" }, { count = 6, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Large Green Rocket", reagents = { { count = 4, name = "Mithril Bar" }, { count = 3, name = "Solid Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Mithril Frag Bomb", reagents = { { count = 2, name = "Solid Blasting Powder" }, { count = 1, name = "Thorium Bar" }, { count = 6, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Large Green Rocket Cluster", reagents = { { count = 3, name = "Copper Bar" }, { count = 3, name = "Gold Power Core" }, { count = 6, name = "Handful of Copper Bolts" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Ultra-Flash Shadow Reflector", reagents = { { count = 4, name = "Solid Blasting Powder" }, { count = 4, name = "Gold Power Core" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "EZ-Thro Dynamite", reagents = { { count = 10, name = "Mageweave Cloth" }, { count = 2, name = "Bronze Bar" }, { count = 1, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Field Repair Bot 74A", reagents = { { count = 1, name = "Handful of Copper Bolts" }, { count = 10, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Deadly Scope", reagents = { { count = 10, name = "Handful of Copper Bolts" }, { count = 3, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Big Bronze Bomb", reagents = { { count = 4, name = "Handful of Copper Bolts" }, { count = 4, name = "Solid Blasting Powder" }, { count = 3, name = "Bronze Bar" }, { count = 6, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Dimensional Ripper: Everlook", reagents = { { count = 10, name = "Bronze Bar" }, { count = 6, name = "Handful of Copper Bolts" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Smelt Dark Iron", reagents = { { count = 6, name = "Bronze Bar" }, { count = 1, name = "Handful of Copper Bolts" }, { count = 10, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Mithril Gyro-Shot", reagents = { { count = 2, name = "Bronze Bar" }, { count = 10, name = "Thorium Bar" }, { count = 1, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
        },
      },
    },
  },
  {
    name = "Schmiedolf",
    profs = {
      {
        prof = "Blacksmithing", rank = 300, maxRank = 300,
        recipes = {
          { name = "Rune-Etched Greaves", reagents = { { count = 2, name = "Steel Bar" }, { count = 1, name = "Iron Bar" }, { count = 10, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Arcanite Skeleton Key", reagents = { { count = 6, name = "Copper Bar" }, { count = 6, name = "Bronze Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Ironvine Gloves", reagents = { { count = 1, name = "Heavy Leather" }, { count = 6, name = "Iron Bar" }, { count = 10, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Thorium Boots", reagents = { { count = 6, name = "Coarse Stone" }, { count = 2, name = "Mithril Bar" }, { count = 1, name = "Steel Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Radiant Belt", reagents = { { count = 3, name = "Iron Bar" }, { count = 1, name = "Dense Grinding Stone" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Heavy Copper Maul", reagents = { { count = 2, name = "Thorium Bar" }, { count = 1, name = "Coarse Stone" }, { count = 2, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Darkrune Breastplate", reagents = { { count = 1, name = "Thorium Bar" }, { count = 2, name = "Iron Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Bloodsoul Breastplate", reagents = { { count = 4, name = "Bronze Bar" }, { count = 6, name = "Rough Stone" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Steel Plate Boots", reagents = { { count = 1, name = "Coarse Stone" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Green Iron Hauberk", reagents = { { count = 4, name = "Iron Bar" }, { count = 1, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Dark Iron Destroyer", reagents = { { count = 6, name = "Copper Bar" }, { count = 2, name = "Mithril Bar" }, { count = 1, name = "Arcanite Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Dragonscale Belt Buckle", reagents = { { count = 6, name = "Coarse Stone" }, { count = 3, name = "Iron Bar" }, { count = 2, name = "Heavy Leather" }, { count = 2, name = "Thorium Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Heartseeker", reagents = { { count = 6, name = "Arcanite Bar" }, { count = 6, name = "Iron Bar" }, { count = 10, name = "Copper Bar" }, { count = 4, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Bloodstone Warblade", reagents = { { count = 4, name = "Coarse Stone" }, { count = 10, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Enchanted Battlehammer", reagents = { { count = 10, name = "Dense Grinding Stone" }, { count = 6, name = "Arcanite Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Fury of the Timbermaw", reagents = { { count = 1, name = "Dense Grinding Stone" }, { count = 2, name = "Steel Bar" }, { count = 6, name = "Bronze Bar" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Imperial Plate Gauntlets", reagents = { { count = 4, name = "Heavy Leather" }, { count = 1, name = "Rough Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Imperial Plate Boots", reagents = { { count = 2, name = "Copper Bar" }, { count = 1, name = "Coarse Stone" }, { count = 3, name = "Steel Bar" }, { count = 10, name = "Rough Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Steel Plate Helm", reagents = { { count = 1, name = "Coarse Stone" }, { count = 6, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Girdle of the Dawn", reagents = { { count = 10, name = "Bronze Bar" }, { count = 2, name = "Rough Stone" }, { count = 2, name = "Mithril Bar" }, { count = 6, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Heavy Timbermaw Belt", reagents = { { count = 3, name = "Steel Bar" }, { count = 10, name = "Rough Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Rough Sharpening Stone", reagents = { { count = 10, name = "Bronze Bar" }, { count = 1, name = "Rough Stone" }, { count = 4, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Silvered Bronze Boots", reagents = { { count = 2, name = "Dense Grinding Stone" }, { count = 2, name = "Steel Bar" }, { count = 6, name = "Bronze Bar" }, { count = 6, name = "Iron Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Elemental Sharpening Stone", reagents = { { count = 3, name = "Mithril Bar" }, { count = 1, name = "Arcanite Bar" }, { count = 3, name = "Iron Bar" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Heavy Grinding Stone", reagents = { { count = 6, name = "Bronze Bar" }, { count = 4, name = "Steel Bar" }, { count = 2, name = "Rough Stone" }, { count = 3, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Lionheart Helm", reagents = { { count = 2, name = "Rough Stone" }, { count = 2, name = "Bronze Bar" }, { count = 1, name = "Coarse Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Barbaric Iron Helm", reagents = { { count = 1, name = "Copper Bar" }, { count = 10, name = "Mithril Bar" }, { count = 4, name = "Rough Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Hateforge Belt", reagents = { { count = 2, name = "Mithril Bar" }, { count = 1, name = "Heavy Leather" }, { count = 4, name = "Steel Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Blazing Rapier", reagents = { { count = 2, name = "Iron Bar" }, { count = 2, name = "Coarse Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Barbaric Iron Breastplate", reagents = { { count = 2, name = "Arcanite Bar" }, { count = 1, name = "Coarse Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Silvered Bronze Gauntlets", reagents = { { count = 3, name = "Thorium Bar" }, { count = 1, name = "Steel Bar" }, { count = 2, name = "Rough Stone" }, { count = 1, name = "Coarse Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Thorium Belt Buckle", reagents = { { count = 2, name = "Dense Grinding Stone" }, { count = 6, name = "Rough Stone" }, { count = 2, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Fiery Chain Girdle", reagents = { { count = 1, name = "Thorium Bar" }, { count = 10, name = "Heavy Leather" }, { count = 2, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Solid Sharpening Stone", reagents = { { count = 10, name = "Thorium Bar" }, { count = 3, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Runic Breastplate", reagents = { { count = 6, name = "Steel Bar" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Green Iron Shoulders", reagents = { { count = 3, name = "Thorium Bar" }, { count = 10, name = "Bronze Bar" }, { count = 4, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Dark Iron Boots", reagents = { { count = 10, name = "Thorium Bar" }, { count = 2, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Rough Bronze Boots", reagents = { { count = 1, name = "Mithril Bar" }, { count = 10, name = "Bronze Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Shining Silver Breastplate", reagents = { { count = 3, name = "Mithril Bar" }, { count = 4, name = "Iron Bar" }, { count = 2, name = "Steel Bar" }, { count = 2, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Thick War Axe", reagents = { { count = 4, name = "Heavy Leather" }, { count = 4, name = "Copper Bar" }, { count = 2, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Ornate Mithril Shoulders", reagents = { { count = 4, name = "Bronze Bar" }, { count = 10, name = "Copper Bar" }, { count = 2, name = "Heavy Leather" }, { count = 6, name = "Rough Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Silvered Bronze Leggings", reagents = { { count = 2, name = "Rough Stone" }, { count = 2, name = "Copper Bar" }, { count = 3, name = "Coarse Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Imperial Plate Bracers", reagents = { { count = 2, name = "Thorium Bar" }, { count = 6, name = "Mithril Bar" }, { count = 6, name = "Arcanite Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Golden Rod", reagents = { { count = 3, name = "Mithril Bar" }, { count = 4, name = "Heavy Leather" }, { count = 6, name = "Steel Bar" }, { count = 3, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Golden Scale Shoulders", reagents = { { count = 1, name = "Iron Bar" }, { count = 2, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
        },
      },
    },
  },
  {
    name = "Zauberzicke",
    profs = {
      {
        prof = "Enchanting", rank = 300, maxRank = 300,
        recipes = {
          { name = "Enchant Weapon - Crusader", reagents = { { count = 6, name = "Nexus Crystal" }, { count = 4, name = "Dream Dust" }, { count = 4, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Weapon - Agility", reagents = { { count = 3, name = "Soul Dust" }, { count = 3, name = "Lesser Magic Essence" }, { count = 6, name = "Vision Dust" }, { count = 3, name = "Large Brilliant Shard" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Weapon - Minor Beastslayer", reagents = { { count = 1, name = "Vision Dust" }, { count = 3, name = "Strange Dust" }, { count = 6, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Vampirism", reagents = { { count = 1, name = "Nexus Crystal" }, { count = 3, name = "Small Radiant Shard" }, { count = 10, name = "Strange Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Gloves - Threat", reagents = { { count = 1, name = "Small Radiant Shard" }, { count = 2, name = "Nexus Crystal" }, { count = 2, name = "Soul Dust" }, { count = 2, name = "Illusion Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Cloak - Lesser Fire Resistance", reagents = { { count = 10, name = "Lesser Magic Essence" }, { count = 1, name = "Small Radiant Shard" }, { count = 1, name = "Nexus Crystal" }, { count = 10, name = "Vision Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Weapon - Strength", reagents = { { count = 6, name = "Soul Dust" }, { count = 6, name = "Strange Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Gloves - Nature Power", reagents = { { count = 6, name = "Greater Astral Essence" }, { count = 10, name = "Vision Dust" }, { count = 1, name = "Illusion Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Healing Power", reagents = { { count = 4, name = "Lesser Magic Essence" }, { count = 4, name = "Vision Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Spell Power", reagents = { { count = 2, name = "Illusion Dust" }, { count = 10, name = "Vision Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Chest - Lesser Health", reagents = { { count = 2, name = "Strange Dust" }, { count = 2, name = "Nexus Crystal" }, { count = 6, name = "Vision Dust" }, { count = 10, name = "Soul Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Boots - Spirit", reagents = { { count = 2, name = "Small Radiant Shard" }, { count = 4, name = "Large Brilliant Shard" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Minor Deflect", reagents = { { count = 6, name = "Strange Dust" }, { count = 6, name = "Illusion Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Cloak - Lesser Shadow Resistance", reagents = { { count = 3, name = "Strange Dust" }, { count = 6, name = "Nexus Crystal" }, { count = 6, name = "Soul Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Weapon - Lesser Striking", reagents = { { count = 6, name = "Lesser Magic Essence" }, { count = 3, name = "Vision Dust" }, { count = 2, name = "Soul Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Cloak - Greater Fire Resistance", reagents = { { count = 6, name = "Small Radiant Shard" }, { count = 2, name = "Strange Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Chest - Lesser Absorption", reagents = { { count = 1, name = "Illusion Dust" }, { count = 10, name = "Dream Dust" }, { count = 2, name = "Nexus Crystal" }, { count = 6, name = "Lesser Magic Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Cloak - Superior Defense", reagents = { { count = 2, name = "Lesser Magic Essence" }, { count = 10, name = "Soul Dust" }, { count = 10, name = "Small Radiant Shard" }, { count = 2, name = "Nexus Crystal" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Chest - Major Mana", reagents = { { count = 2, name = "Small Radiant Shard" }, { count = 10, name = "Soul Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Stamina", reagents = { { count = 2, name = "Lesser Magic Essence" }, { count = 3, name = "Small Radiant Shard" }, { count = 3, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant 2H Weapon - Lesser Spirit", reagents = { { count = 2, name = "Strange Dust" }, { count = 1, name = "Greater Astral Essence" }, { count = 4, name = "Illusion Dust" }, { count = 2, name = "Nexus Crystal" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Gloves - Advanced Herbalism", reagents = { { count = 3, name = "Strange Dust" }, { count = 3, name = "Nexus Crystal" }, { count = 6, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Gloves - Shadow Power", reagents = { { count = 2, name = "Lesser Magic Essence" }, { count = 2, name = "Nexus Crystal" }, { count = 2, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Strength", reagents = { { count = 6, name = "Large Brilliant Shard" }, { count = 6, name = "Small Radiant Shard" }, { count = 3, name = "Strange Dust" }, { count = 10, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Weapon - Mighty Intellect", reagents = { { count = 1, name = "Dream Dust" }, { count = 1, name = "Small Radiant Shard" }, { count = 1, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Shield - Spirit", reagents = { { count = 1, name = "Lesser Magic Essence" }, { count = 4, name = "Dream Dust" }, { count = 10, name = "Illusion Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Shield - Superior Spirit", reagents = { { count = 10, name = "Illusion Dust" }, { count = 10, name = "Dream Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Chest - Mana", reagents = { { count = 6, name = "Illusion Dust" }, { count = 3, name = "Lesser Magic Essence" }, { count = 2, name = "Strange Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Boots - Vampirism", reagents = { { count = 2, name = "Large Brilliant Shard" }, { count = 2, name = "Small Radiant Shard" }, { count = 6, name = "Soul Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Minor Strength", reagents = { { count = 10, name = "Strange Dust" }, { count = 6, name = "Illusion Dust" }, { count = 10, name = "Soul Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Greater Strength", reagents = { { count = 3, name = "Strange Dust" }, { count = 1, name = "Illusion Dust" }, { count = 10, name = "Nexus Crystal" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Bracer - Minor Agility", reagents = { { count = 6, name = "Vision Dust" }, { count = 1, name = "Soul Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Gloves - Advanced Mining", reagents = { { count = 4, name = "Dream Dust" }, { count = 1, name = "Nexus Crystal" }, { count = 2, name = "Vision Dust" }, { count = 6, name = "Greater Astral Essence" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant 2H Weapon - Major Spirit", reagents = { { count = 6, name = "Dream Dust" }, { count = 10, name = "Vision Dust" }, { count = 4, name = "Large Brilliant Shard" }, { count = 10, name = "Strange Dust" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
          { name = "Enchant Chest - Lesser Mana", reagents = { { count = 3, name = "Lesser Magic Essence" }, { count = 6, name = "Strange Dust" }, { count = 3, name = "Soul Dust" }, { count = 10, name = "Large Brilliant Shard" } }, icon = "Interface\\Icons\\Spell_Holy_GreaterHeal" },
        },
      },
      {
        prof = "Tailoring", rank = 290, maxRank = 300,
        recipes = {
          { name = "Festival Dress", reagents = { { count = 3, name = "Bolt of Runecloth" }, { count = 10, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Runed Stygian Belt", reagents = { { count = 1, name = "Mageweave Cloth" }, { count = 6, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Crimson Silk Belt", reagents = { { count = 4, name = "Rune Thread" }, { count = 2, name = "Bolt of Runecloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Sylvan Crown", reagents = { { count = 1, name = "Silken Thread" }, { count = 2, name = "Wool Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Frostweave Tunic", reagents = { { count = 3, name = "Wool Cloth" }, { count = 6, name = "Mageweave Cloth" }, { count = 3, name = "Ironweb Spider Silk" }, { count = 2, name = "Bolt of Runecloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Shadoweave Gloves", reagents = { { count = 3, name = "Silk Cloth" }, { count = 4, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Green Holiday Shirt", reagents = { { count = 10, name = "Mageweave Cloth" }, { count = 2, name = "Bolt of Runecloth" }, { count = 2, name = "Wool Cloth" }, { count = 2, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Blue Linen Vest", reagents = { { count = 2, name = "Runecloth" }, { count = 2, name = "Coarse Thread" }, { count = 3, name = "Ironweb Spider Silk" }, { count = 2, name = "Bolt of Runecloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Truefaith Vestments", reagents = { { count = 2, name = "Mageweave Cloth" }, { count = 2, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Green Linen Bracers", reagents = { { count = 2, name = "Mageweave Cloth" }, { count = 2, name = "Coarse Thread" }, { count = 4, name = "Wool Cloth" }, { count = 4, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Brown Linen Pants", reagents = { { count = 1, name = "Wool Cloth" }, { count = 1, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Argent Shoulders", reagents = { { count = 10, name = "Rune Thread" }, { count = 3, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Satchel of Cenarius", reagents = { { count = 1, name = "Linen Cloth" }, { count = 1, name = "Runecloth" }, { count = 2, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Tuxedo Pants", reagents = { { count = 4, name = "Ironweb Spider Silk" }, { count = 10, name = "Mageweave Cloth" }, { count = 2, name = "Wool Cloth" }, { count = 3, name = "Silk Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Robe of Winter Night", reagents = { { count = 4, name = "Runecloth" }, { count = 6, name = "Linen Cloth" }, { count = 4, name = "Wool Cloth" }, { count = 2, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Double-stitched Woolen Shoulders", reagents = { { count = 2, name = "Linen Cloth" }, { count = 2, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Shadoweave Pants", reagents = { { count = 1, name = "Mageweave Cloth" }, { count = 4, name = "Runecloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Red Mageweave Bag", reagents = { { count = 6, name = "Mageweave Cloth" }, { count = 2, name = "Linen Cloth" }, { count = 2, name = "Coarse Thread" }, { count = 4, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Runecloth Gloves", reagents = { { count = 10, name = "Wool Cloth" }, { count = 3, name = "Mageweave Cloth" }, { count = 4, name = "Linen Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Boots of Darkness", reagents = { { count = 10, name = "Wool Cloth" }, { count = 3, name = "Silken Thread" }, { count = 6, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Mooncloth Circlet", reagents = { { count = 2, name = "Silk Cloth" }, { count = 3, name = "Bolt of Runecloth" }, { count = 6, name = "Wool Cloth" }, { count = 2, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Cosmic Headdress", reagents = { { count = 1, name = "Runecloth" }, { count = 2, name = "Ironweb Spider Silk" }, { count = 6, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Dreamweave Circlet", reagents = { { count = 10, name = "Coarse Thread" }, { count = 10, name = "Silken Thread" }, { count = 10, name = "Bolt of Runecloth" }, { count = 2, name = "Linen Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Spider Belt", reagents = { { count = 1, name = "Mageweave Cloth" }, { count = 3, name = "Silken Thread" }, { count = 2, name = "Bolt of Runecloth" }, { count = 3, name = "Wool Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Dreamthread Kilt", reagents = { { count = 4, name = "Wool Cloth" }, { count = 2, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Glacial Wrists", reagents = { { count = 1, name = "Silk Cloth" }, { count = 4, name = "Ironweb Spider Silk" }, { count = 2, name = "Linen Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Felcloth Boots", reagents = { { count = 4, name = "Silken Thread" }, { count = 2, name = "Wool Cloth" }, { count = 2, name = "Coarse Thread" }, { count = 2, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Runecloth Shoulders", reagents = { { count = 1, name = "Silk Cloth" }, { count = 1, name = "Bolt of Runecloth" }, { count = 3, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Stormcloth Boots", reagents = { { count = 10, name = "Mageweave Cloth" }, { count = 1, name = "Runecloth" }, { count = 3, name = "Silk Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Mooncloth", reagents = { { count = 6, name = "Linen Cloth" }, { count = 4, name = "Silken Thread" }, { count = 6, name = "Wool Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
        },
      },
    },
  },
  {
    name = "Lederlotte",
    profs = {
      {
        prof = "Leatherworking", rank = 300, maxRank = 300,
        recipes = {
          { name = "Enchanted Armor Kit", reagents = { { count = 2, name = "Cured Heavy Hide" }, { count = 1, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Green Leather Bracers", reagents = { { count = 6, name = "Black Dragonscale" }, { count = 2, name = "Light Leather" }, { count = 1, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Raptor Hide Harness", reagents = { { count = 3, name = "Cured Heavy Hide" }, { count = 6, name = "Medium Leather" }, { count = 10, name = "Light Leather" }, { count = 2, name = "Rugged Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Frostsaber Leggings", reagents = { { count = 2, name = "Medium Leather" }, { count = 2, name = "Black Dragonscale" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Thick Leather Ammo Pouch", reagents = { { count = 10, name = "Rugged Leather" }, { count = 6, name = "Heavy Leather" }, { count = 2, name = "Cured Heavy Hide" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Fine Leather Pants", reagents = { { count = 2, name = "Cured Heavy Hide" }, { count = 2, name = "Rugged Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Green Leather Armor", reagents = { { count = 4, name = "Rugged Leather" }, { count = 3, name = "Rune Thread" }, { count = 2, name = "Medium Leather" }, { count = 4, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Blue Dragonscale Shoulders", reagents = { { count = 2, name = "Black Dragonscale" }, { count = 1, name = "Thick Leather" }, { count = 2, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Prismatic Scale Barbute", reagents = { { count = 6, name = "Silken Thread" }, { count = 2, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "White Leather Jerkin", reagents = { { count = 1, name = "Cured Heavy Hide" }, { count = 10, name = "Silken Thread" }, { count = 4, name = "Medium Leather" }, { count = 1, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Embossed Leather Pants", reagents = { { count = 4, name = "Cured Heavy Hide" }, { count = 6, name = "Rune Thread" }, { count = 1, name = "Rugged Leather" }, { count = 2, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Primal Batskin Gloves", reagents = { { count = 2, name = "Silken Thread" }, { count = 4, name = "Cured Heavy Hide" }, { count = 2, name = "Heavy Leather" }, { count = 2, name = "Thick Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Murloc Scale Breastplate", reagents = { { count = 2, name = "Medium Leather" }, { count = 4, name = "Rune Thread" }, { count = 6, name = "Black Dragonscale" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Dragonscale Leggings", reagents = { { count = 2, name = "Rugged Leather" }, { count = 6, name = "Black Dragonscale" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Earthguard Tunic", reagents = { { count = 2, name = "Cured Heavy Hide" }, { count = 2, name = "Light Leather" }, { count = 2, name = "Black Dragonscale" }, { count = 4, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Guardian Leather Bracers", reagents = { { count = 1, name = "Silken Thread" }, { count = 2, name = "Black Dragonscale" }, { count = 3, name = "Rugged Leather" }, { count = 2, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Frostsaber Boots", reagents = { { count = 4, name = "Light Leather" }, { count = 2, name = "Black Dragonscale" }, { count = 2, name = "Rune Thread" }, { count = 1, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Blue Dragonscale Breastplate", reagents = { { count = 2, name = "Cured Heavy Hide" }, { count = 4, name = "Thick Leather" }, { count = 2, name = "Rune Thread" }, { count = 2, name = "Rugged Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Light Leather", reagents = { { count = 1, name = "Rune Thread" }, { count = 10, name = "Heavy Leather" }, { count = 2, name = "Medium Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Dragonmaw Gloves", reagents = { { count = 6, name = "Heavy Leather" }, { count = 2, name = "Rune Thread" }, { count = 10, name = "Light Leather" }, { count = 6, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Primalist's Gloves", reagents = { { count = 1, name = "Silken Thread" }, { count = 6, name = "Rugged Leather" }, { count = 10, name = "Light Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Stormscale Leggings", reagents = { { count = 6, name = "Cured Heavy Hide" }, { count = 3, name = "Rune Thread" }, { count = 2, name = "Rugged Leather" }, { count = 2, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Icy Scale Bracers", reagents = { { count = 4, name = "Light Leather" }, { count = 1, name = "Black Dragonscale" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Rugged Leather Pants", reagents = { { count = 1, name = "Heavy Leather" }, { count = 10, name = "Thick Leather" }, { count = 1, name = "Medium Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Icy Scale Breastplate", reagents = { { count = 2, name = "Black Dragonscale" }, { count = 3, name = "Thick Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Guardian Pants", reagents = { { count = 10, name = "Black Dragonscale" }, { count = 4, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Runic Leather Belt", reagents = { { count = 1, name = "Black Dragonscale" }, { count = 2, name = "Rugged Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Nightscape Tunic", reagents = { { count = 1, name = "Light Leather" }, { count = 3, name = "Rune Thread" }, { count = 10, name = "Cured Heavy Hide" }, { count = 3, name = "Rugged Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Shifting Cloak", reagents = { { count = 3, name = "Rune Thread" }, { count = 2, name = "Medium Leather" }, { count = 2, name = "Cured Heavy Hide" }, { count = 1, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Turtle Scale Helm", reagents = { { count = 2, name = "Thick Leather" }, { count = 6, name = "Light Leather" }, { count = 6, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Sandstalker Breastplate", reagents = { { count = 4, name = "Light Leather" }, { count = 6, name = "Rugged Leather" }, { count = 3, name = "Cured Heavy Hide" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Fine Leather Cloak", reagents = { { count = 2, name = "Black Dragonscale" }, { count = 1, name = "Rugged Leather" }, { count = 4, name = "Heavy Leather" }, { count = 1, name = "Cured Heavy Hide" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Black Dragonscale Breastplate", reagents = { { count = 10, name = "Rugged Leather" }, { count = 6, name = "Thick Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Barbaric Bracers", reagents = { { count = 2, name = "Heavy Leather" }, { count = 3, name = "Cured Heavy Hide" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Tough Scorpid Leggings", reagents = { { count = 6, name = "Thick Leather" }, { count = 6, name = "Silken Thread" }, { count = 6, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Swift Boots", reagents = { { count = 6, name = "Rune Thread" }, { count = 1, name = "Black Dragonscale" }, { count = 10, name = "Silken Thread" }, { count = 1, name = "Rugged Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Grifter's Leggings", reagents = { { count = 2, name = "Thick Leather" }, { count = 3, name = "Rugged Leather" }, { count = 4, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Stormshroud Armor", reagents = { { count = 1, name = "Medium Leather" }, { count = 1, name = "Heavy Leather" }, { count = 1, name = "Black Dragonscale" }, { count = 4, name = "Light Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Deviate Scale Belt", reagents = { { count = 6, name = "Cured Heavy Hide" }, { count = 1, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
          { name = "Chromatic Leggings", reagents = { { count = 6, name = "Light Leather" }, { count = 6, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Misc_ArmorKit_17" },
        },
      },
    },
  },
  {
    name = "Juwelenjonny",
    profs = {
      {
        prof = "Jewelcrafting", rank = 275, maxRank = 300,
        recipes = {
          { name = "Serpent's Coil Staff", reagents = { { count = 2, name = "Star Ruby" }, { count = 1, name = "Thorium Bar" }, { count = 2, name = "Azerothian Diamond" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Azerothian Ruby Gemstone", reagents = { { count = 2, name = "Citrine" }, { count = 10, name = "Copper Bar" }, { count = 4, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Smoldering Brooch", reagents = { { count = 3, name = "Blue Sapphire" }, { count = 1, name = "Citrine" }, { count = 3, name = "Copper Bar" }, { count = 4, name = "Azerothian Diamond" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Bloodfire Circlet", reagents = { { count = 6, name = "Star Ruby" }, { count = 1, name = "Blue Sapphire" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Staff of Gallitrea", reagents = { { count = 10, name = "Thorium Bar" }, { count = 2, name = "Moss Agate" }, { count = 2, name = "Malachite" }, { count = 3, name = "Citrine" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Azure Ring", reagents = { { count = 2, name = "Large Opal" }, { count = 10, name = "Moss Agate" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Blazefury Circlet", reagents = { { count = 3, name = "Copper Bar" }, { count = 1, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Rough Gritted Paper", reagents = { { count = 10, name = "Tigerseye" }, { count = 4, name = "Blue Sapphire" }, { count = 2, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Stunning Imperial Gemstone", reagents = { { count = 2, name = "Tigerseye" }, { count = 3, name = "Citrine" }, { count = 2, name = "Moss Agate" }, { count = 1, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Heavy Gemstone Cluster", reagents = { { count = 2, name = "Malachite" }, { count = 2, name = "Blue Sapphire" }, { count = 1, name = "Thorium Bar" }, { count = 3, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Elaborate Golden Bracelets", reagents = { { count = 2, name = "Malachite" }, { count = 2, name = "Azerothian Diamond" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Pure Gold Ring", reagents = { { count = 3, name = "Azerothian Diamond" }, { count = 6, name = "Large Opal" }, { count = 2, name = "Tigerseye" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Shimmering Gold Necklace", reagents = { { count = 2, name = "Tigerseye" }, { count = 4, name = "Large Opal" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Topaz Studded Ring", reagents = { { count = 3, name = "Tigerseye" }, { count = 3, name = "Blue Sapphire" }, { count = 6, name = "Star Ruby" }, { count = 10, name = "Malachite" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Stormcloud Sigil", reagents = { { count = 2, name = "Thorium Bar" }, { count = 3, name = "Moss Agate" }, { count = 6, name = "Tigerseye" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Spectre Shade Ring", reagents = { { count = 2, name = "Moss Agate" }, { count = 10, name = "Large Opal" }, { count = 6, name = "Thorium Bar" }, { count = 10, name = "Tigerseye" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Ironbloom Ring", reagents = { { count = 2, name = "Tigerseye" }, { count = 4, name = "Thorium Bar" }, { count = 4, name = "Moss Agate" }, { count = 2, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Cinderfall Band", reagents = { { count = 2, name = "Moss Agate" }, { count = 2, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Ethereal Frostspark Crown", reagents = { { count = 3, name = "Malachite" }, { count = 2, name = "Tigerseye" }, { count = 2, name = "Thorium Bar" }, { count = 10, name = "Blue Sapphire" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Elegant Emerald Gemstone", reagents = { { count = 2, name = "Citrine" }, { count = 1, name = "Azerothian Diamond" }, { count = 6, name = "Thorium Bar" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Stellar Gemguards", reagents = { { count = 3, name = "Citrine" }, { count = 3, name = "Moss Agate" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Circlet of Dampening", reagents = { { count = 10, name = "Copper Bar" }, { count = 10, name = "Azerothian Diamond" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Arcanum Baton", reagents = { { count = 3, name = "Moss Agate" }, { count = 1, name = "Large Opal" }, { count = 2, name = "Citrine" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Twilight Opal Cascade", reagents = { { count = 6, name = "Thorium Bar" }, { count = 2, name = "Azerothian Diamond" }, { count = 10, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Voidheart Charm", reagents = { { count = 6, name = "Thorium Bar" }, { count = 6, name = "Azerothian Diamond" }, { count = 6, name = "Moss Agate" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Bronze Cuffed Bangles", reagents = { { count = 1, name = "Thorium Bar" }, { count = 3, name = "Moss Agate" }, { count = 3, name = "Tigerseye" }, { count = 2, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Sapphire Luminescence", reagents = { { count = 10, name = "Malachite" }, { count = 3, name = "Azerothian Diamond" }, { count = 6, name = "Moss Agate" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Spellweaver Rod", reagents = { { count = 3, name = "Tigerseye" }, { count = 1, name = "Citrine" }, { count = 4, name = "Azerothian Diamond" }, { count = 10, name = "Moss Agate" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Gleaming Jade Gemstone", reagents = { { count = 10, name = "Large Opal" }, { count = 1, name = "Tigerseye" }, { count = 3, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Opal Guided Bangles", reagents = { { count = 4, name = "Malachite" }, { count = 2, name = "Copper Bar" }, { count = 2, name = "Citrine" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Burning Star Gemstone", reagents = { { count = 10, name = "Moss Agate" }, { count = 4, name = "Large Opal" }, { count = 3, name = "Star Ruby" }, { count = 4, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Crown of Elegance", reagents = { { count = 1, name = "Blue Sapphire" }, { count = 6, name = "Large Opal" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Solid Gemstone Cluster", reagents = { { count = 6, name = "Large Opal" }, { count = 3, name = "Star Ruby" }, { count = 2, name = "Azerothian Diamond" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Shadowmoon Orb", reagents = { { count = 4, name = "Tigerseye" }, { count = 2, name = "Azerothian Diamond" }, { count = 6, name = "Malachite" }, { count = 1, name = "Star Ruby" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
          { name = "Starry Thorium Band", reagents = { { count = 1, name = "Citrine" }, { count = 1, name = "Azerothian Diamond" }, { count = 1, name = "Large Opal" } }, icon = "Interface\\Icons\\INV_Misc_Gem_01" },
        },
      },
    },
  },
  {
    name = "Kruemelmonster",
    profs = {
      {
        prof = "Tailoring", rank = 300, maxRank = 300,
        recipes = {
          { name = "Frostweave Gloves", reagents = { { count = 6, name = "Silk Cloth" }, { count = 6, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Sylvan Shoulders", reagents = { { count = 10, name = "Rune Thread" }, { count = 10, name = "Runecloth" }, { count = 3, name = "Silk Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Woolen Cape", reagents = { { count = 6, name = "Mageweave Cloth" }, { count = 2, name = "Runecloth" }, { count = 3, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Mooncloth Vest", reagents = { { count = 6, name = "Silk Cloth" }, { count = 10, name = "Rune Thread" }, { count = 2, name = "Linen Cloth" }, { count = 2, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Red Mageweave Gloves", reagents = { { count = 3, name = "Runecloth" }, { count = 3, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Pink Mageweave Shirt", reagents = { { count = 2, name = "Ironweb Spider Silk" }, { count = 2, name = "Wool Cloth" }, { count = 10, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Enchanter's Cowl", reagents = { { count = 10, name = "Linen Cloth" }, { count = 2, name = "Wool Cloth" }, { count = 4, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Linen Cloak", reagents = { { count = 2, name = "Ironweb Spider Silk" }, { count = 1, name = "Linen Cloth" }, { count = 6, name = "Bolt of Runecloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Crimson Silk Pantaloons", reagents = { { count = 10, name = "Runecloth" }, { count = 2, name = "Wool Cloth" }, { count = 2, name = "Silk Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Black Swashbuckler's Shirt", reagents = { { count = 3, name = "Coarse Thread" }, { count = 10, name = "Silk Cloth" }, { count = 4, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Cloak of Warding", reagents = { { count = 6, name = "Ironweb Spider Silk" }, { count = 4, name = "Wool Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Double-stitched Woolen Shoulders", reagents = { { count = 2, name = "Runecloth" }, { count = 4, name = "Mageweave Cloth" }, { count = 1, name = "Rune Thread" }, { count = 6, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Robe of Winter Night", reagents = { { count = 2, name = "Wool Cloth" }, { count = 3, name = "Bolt of Runecloth" }, { count = 2, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Flarecore Leggings", reagents = { { count = 4, name = "Rune Thread" }, { count = 1, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Hands of Darkness", reagents = { { count = 2, name = "Rune Thread" }, { count = 3, name = "Silk Cloth" }, { count = 2, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Cloak of Fire", reagents = { { count = 2, name = "Ironweb Spider Silk" }, { count = 3, name = "Linen Cloth" }, { count = 6, name = "Silk Cloth" }, { count = 4, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Satchel of Cenarius", reagents = { { count = 3, name = "Runecloth" }, { count = 3, name = "Rune Thread" }, { count = 6, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Flarecore Boots", reagents = { { count = 6, name = "Silk Cloth" }, { count = 6, name = "Coarse Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Gloves of Manathirst", reagents = { { count = 6, name = "Linen Cloth" }, { count = 6, name = "Ironweb Spider Silk" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Cindercloth Robe", reagents = { { count = 3, name = "Wool Cloth" }, { count = 10, name = "Bolt of Runecloth" }, { count = 2, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Brightcloth Cloak", reagents = { { count = 6, name = "Mageweave Cloth" }, { count = 2, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Blue Linen Vest", reagents = { { count = 3, name = "Wool Cloth" }, { count = 10, name = "Coarse Thread" }, { count = 4, name = "Bolt of Runecloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Runecloth Pants", reagents = { { count = 3, name = "Mageweave Cloth" }, { count = 2, name = "Runecloth" }, { count = 4, name = "Silken Thread" }, { count = 1, name = "Silk Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Barbaric Linen Vest", reagents = { { count = 3, name = "Runecloth" }, { count = 2, name = "Coarse Thread" }, { count = 4, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Shadoweave Boots", reagents = { { count = 6, name = "Bolt of Runecloth" }, { count = 3, name = "Coarse Thread" }, { count = 10, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Runed Stygian Leggings", reagents = { { count = 2, name = "Coarse Thread" }, { count = 6, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Orange Martial Shirt", reagents = { { count = 3, name = "Silk Cloth" }, { count = 6, name = "Wool Cloth" }, { count = 4, name = "Linen Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Cenarion Herb Bag", reagents = { { count = 2, name = "Bolt of Runecloth" }, { count = 1, name = "Linen Cloth" }, { count = 1, name = "Silken Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Gloves of Spell Mastery", reagents = { { count = 4, name = "Mageweave Cloth" }, { count = 10, name = "Rune Thread" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Phoenix Gloves", reagents = { { count = 2, name = "Linen Cloth" }, { count = 6, name = "Bolt of Runecloth" }, { count = 6, name = "Silken Thread" }, { count = 6, name = "Runecloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Lesser Wizard's Robe", reagents = { { count = 6, name = "Ironweb Spider Silk" }, { count = 6, name = "Wool Cloth" }, { count = 3, name = "Mageweave Cloth" }, { count = 6, name = "Linen Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
          { name = "Reinforced Linen Cape", reagents = { { count = 10, name = "Wool Cloth" }, { count = 1, name = "Silk Cloth" } }, icon = "Interface\\Icons\\INV_Fabric_Linen_01" },
        },
      },
      {
        prof = "Alchemy", rank = 210, maxRank = 300,
        recipes = {
          { name = "Frost Oil", reagents = { { count = 2, name = "Goldthorn" }, { count = 1, name = "Peacebloom" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Rage Potion", reagents = { { count = 1, name = "Black Lotus" }, { count = 3, name = "Mountain Silversage" }, { count = 4, name = "Stonescale Oil" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Defense", reagents = { { count = 3, name = "Peacebloom" }, { count = 1, name = "Silverleaf" }, { count = 1, name = "Goldthorn" }, { count = 6, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Iron to Gold", reagents = { { count = 3, name = "Black Lotus" }, { count = 10, name = "Stonescale Oil" }, { count = 3, name = "Briarthorn" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Mithril to Truesilver", reagents = { { count = 2, name = "Silverleaf" }, { count = 6, name = "Stonescale Oil" }, { count = 1, name = "Khadgar's Whisker" }, { count = 3, name = "Mageroyal" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Major Healing Potion", reagents = { { count = 6, name = "Peacebloom" }, { count = 1, name = "Mountain Silversage" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Arcane Elixir", reagents = { { count = 2, name = "Mageroyal" }, { count = 3, name = "Silverleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Flask of Chromatic Resistance", reagents = { { count = 2, name = "Crystal Vial" }, { count = 3, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Earth to Life", reagents = { { count = 10, name = "Stonescale Oil" }, { count = 6, name = "Briarthorn" }, { count = 6, name = "Peacebloom" }, { count = 6, name = "Fadeleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Superior Healing Potion", reagents = { { count = 2, name = "Stonescale Oil" }, { count = 6, name = "Silverleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Dream Vision", reagents = { { count = 1, name = "Stonescale Oil" }, { count = 6, name = "Khadgar's Whisker" }, { count = 1, name = "Mountain Silversage" }, { count = 1, name = "Crystal Vial" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Restorative Potion", reagents = { { count = 6, name = "Peacebloom" }, { count = 10, name = "Mountain Silversage" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Shadow Power", reagents = { { count = 6, name = "Silverleaf" }, { count = 4, name = "Goldthorn" }, { count = 2, name = "Crystal Vial" }, { count = 10, name = "Black Lotus" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Healing Potion", reagents = { { count = 2, name = "Black Lotus" }, { count = 4, name = "Peacebloom" }, { count = 6, name = "Fadeleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Minor Healing Potion", reagents = { { count = 2, name = "Khadgar's Whisker" }, { count = 10, name = "Mountain Silversage" }, { count = 1, name = "Briarthorn" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Minor Agility", reagents = { { count = 3, name = "Mountain Silversage" }, { count = 3, name = "Briarthorn" }, { count = 10, name = "Goldthorn" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Transmute: Arcanite", reagents = { { count = 2, name = "Crystal Vial" }, { count = 2, name = "Black Lotus" }, { count = 1, name = "Fadeleaf" } }, icon = "Interface\\Icons\\INV_Potion_54" },
          { name = "Elixir of Rapid Growth", reagents = { { count = 10, name = "Mountain Silversage" }, { count = 2, name = "Black Lotus" }, { count = 4, name = "Fadeleaf" }, { count = 10, name = "Peacebloom" } }, icon = "Interface\\Icons\\INV_Potion_54" },
        },
      },
    },
  },
  {
    name = "Nietennarr",
    profs = {
      {
        prof = "Engineering", rank = 300, maxRank = 300,
        recipes = {
          { name = "Green Rocket Cluster", reagents = { { count = 4, name = "Mageweave Cloth" }, { count = 3, name = "Bronze Bar" }, { count = 10, name = "Handful of Copper Bolts" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Smelt Bronze", reagents = { { count = 4, name = "Thorium Bar" }, { count = 1, name = "Mageweave Cloth" }, { count = 6, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Major Recombobulator", reagents = { { count = 4, name = "Dense Blasting Powder" }, { count = 10, name = "Thorium Bar" }, { count = 1, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Goblin Bomb Dispenser", reagents = { { count = 10, name = "Dense Blasting Powder" }, { count = 2, name = "Bronze Bar" }, { count = 10, name = "Handful of Copper Bolts" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Jewelry Lens", reagents = { { count = 4, name = "Thorium Bar" }, { count = 4, name = "Solid Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Large Blue Rocket Cluster", reagents = { { count = 4, name = "Mageweave Cloth" }, { count = 4, name = "Gold Power Core" }, { count = 2, name = "Thorium Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Thorium Shells", reagents = { { count = 1, name = "Thorium Bar" }, { count = 2, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Unstable Trigger", reagents = { { count = 2, name = "Handful of Copper Bolts" }, { count = 3, name = "Gold Power Core" }, { count = 10, name = "Mageweave Cloth" }, { count = 4, name = "Solid Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Smelt Gold", reagents = { { count = 3, name = "Thorium Bar" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Gnomish Net-o-Matic Projector", reagents = { { count = 10, name = "Gold Power Core" }, { count = 1, name = "Dense Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Minor Recombobulator", reagents = { { count = 2, name = "Gold Power Core" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Goblin Rocket Boots", reagents = { { count = 10, name = "Copper Bar" }, { count = 10, name = "Bronze Bar" }, { count = 4, name = "Mageweave Cloth" }, { count = 3, name = "Dense Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Thorium Tube", reagents = { { count = 3, name = "Thorium Bar" }, { count = 1, name = "Handful of Copper Bolts" }, { count = 3, name = "Solid Blasting Powder" }, { count = 10, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Advanced Target Dummy", reagents = { { count = 2, name = "Mithril Bar" }, { count = 2, name = "Handful of Copper Bolts" }, { count = 2, name = "Solid Blasting Powder" }, { count = 3, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Gyrofreeze Ice Reflector", reagents = { { count = 1, name = "Copper Bar" }, { count = 4, name = "Mageweave Cloth" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Goblin Jumper Cables XL", reagents = { { count = 1, name = "Dense Blasting Powder" }, { count = 10, name = "Mageweave Cloth" }, { count = 4, name = "Solid Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Goblin Land Mine", reagents = { { count = 2, name = "Solid Blasting Powder" }, { count = 2, name = "Bronze Bar" }, { count = 4, name = "Gold Power Core" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Lovingly Crafted Boomstick", reagents = { { count = 10, name = "Bronze Bar" }, { count = 2, name = "Solid Blasting Powder" }, { count = 2, name = "Mageweave Cloth" }, { count = 2, name = "Thorium Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "EZ-Thro Dynamite", reagents = { { count = 2, name = "Thorium Bar" }, { count = 1, name = "Mithril Bar" }, { count = 4, name = "Copper Bar" }, { count = 1, name = "Dense Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Smelt Copper", reagents = { { count = 1, name = "Handful of Copper Bolts" }, { count = 1, name = "Dense Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Bloodvine Goggles", reagents = { { count = 2, name = "Gold Power Core" }, { count = 6, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Goblin Rocket Fuel Recipe", reagents = { { count = 1, name = "Handful of Copper Bolts" }, { count = 3, name = "Dense Blasting Powder" }, { count = 2, name = "Solid Blasting Powder" }, { count = 2, name = "Gold Power Core" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Dense Dynamite", reagents = { { count = 3, name = "Solid Blasting Powder" }, { count = 3, name = "Bronze Bar" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Small Green Rocket", reagents = { { count = 1, name = "Thorium Bar" }, { count = 3, name = "Mithril Bar" }, { count = 6, name = "Gold Power Core" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Dimensional Ripper - Everlook", reagents = { { count = 10, name = "Copper Bar" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Goblin Mortar", reagents = { { count = 10, name = "Gold Power Core" }, { count = 3, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Salt Shaker", reagents = { { count = 6, name = "Solid Blasting Powder" }, { count = 1, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
          { name = "Portable Bronze Mortar", reagents = { { count = 2, name = "Gold Power Core" }, { count = 3, name = "Mageweave Cloth" }, { count = 1, name = "Solid Blasting Powder" } }, icon = "Interface\\Icons\\INV_Gizmo_02" },
        },
      },
      {
        prof = "Blacksmithing", rank = 180, maxRank = 300,
        recipes = {
          { name = "Mithril Scale Pants", reagents = { { count = 4, name = "Copper Bar" }, { count = 10, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Dawn's Edge", reagents = { { count = 3, name = "Thorium Bar" }, { count = 1, name = "Iron Bar" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Iron Shield Spike", reagents = { { count = 4, name = "Rough Stone" }, { count = 1, name = "Bronze Bar" }, { count = 6, name = "Iron Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Golden Scale Coif", reagents = { { count = 1, name = "Steel Bar" }, { count = 2, name = "Coarse Stone" }, { count = 10, name = "Rough Stone" }, { count = 2, name = "Mithril Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Bronze Battle Axe", reagents = { { count = 2, name = "Heavy Leather" }, { count = 1, name = "Mithril Bar" }, { count = 3, name = "Steel Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Enchanted Battlehammer", reagents = { { count = 10, name = "Heavy Leather" }, { count = 6, name = "Iron Bar" }, { count = 2, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Rune-Etched Crown", reagents = { { count = 3, name = "Dense Grinding Stone" }, { count = 10, name = "Copper Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Thorium Boots", reagents = { { count = 1, name = "Thorium Bar" }, { count = 10, name = "Coarse Stone" }, { count = 10, name = "Iron Bar" }, { count = 4, name = "Rough Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Dawnbringer Shoulders", reagents = { { count = 1, name = "Iron Bar" }, { count = 3, name = "Thorium Bar" }, { count = 2, name = "Heavy Leather" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Rough Bronze Leggings", reagents = { { count = 10, name = "Arcanite Bar" }, { count = 2, name = "Iron Bar" }, { count = 4, name = "Dense Grinding Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Dazzling Mithril Rapier", reagents = { { count = 4, name = "Iron Bar" }, { count = 1, name = "Steel Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Heavy Copper Broadsword", reagents = { { count = 10, name = "Arcanite Bar" }, { count = 2, name = "Rough Stone" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Radiant Boots", reagents = { { count = 4, name = "Steel Bar" }, { count = 6, name = "Iron Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Persuader", reagents = { { count = 1, name = "Dense Grinding Stone" }, { count = 1, name = "Steel Bar" }, { count = 6, name = "Mithril Bar" }, { count = 6, name = "Arcanite Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
          { name = "Hammer of the Titans", reagents = { { count = 2, name = "Heavy Leather" }, { count = 2, name = "Copper Bar" }, { count = 10, name = "Coarse Stone" }, { count = 6, name = "Thorium Bar" } }, icon = "Interface\\Icons\\INV_Hammer_20" },
        },
      },
    },
  },
}

-- Testdaten einspielen
function BRPP_TestData_Load()
  -- Datenbank notfalls selbst anlegen, falls das Hauptaddon
  -- sie noch nicht initialisiert hat.
  if not BRPPDB then BRPPDB = {} end
  if not BRPPDB.guild then BRPPDB.guild = {} end
  if not BRPPDB.characters then BRPPDB.characters = {} end
  if not BRPPDB.settings then BRPPDB.settings = {} end

  local players, recipes = 0, 0

  -- Gildenbewusste Schluessel: "Name@Gilde".
  --
  -- Jeder Test-Crafter wird ZWEIMAL angelegt: einmal in der eigenen Gilde
  -- und einmal als Zwilling in einer fiktiven Partnergilde. Vorher wurde
  -- nach Crafter-Index verteilt (jeder zweite) -- dabei blieben je nach
  -- Reihenfolge der Liste ganze Berufe ohne Partnereintrag. So hat
  -- garantiert JEDER Beruf beide Seiten, und die Partnerkennzeichnung ist
  -- ueberall pruefbar.
  local ownGuild = (BRPP_OwnGuild and BRPP_OwnGuild()) or "Banana Republic"
  local fakePartnerGuild = "Testgilde Partner"

  local function addEntry(charName, guildName, c)
    local entry = {
      updated = time(),
      isTestData = true,   -- Markierung: wird niemals gesendet
      profs = {},
    }
    for p = 1, table.getn(c.profs) do
      local pr = c.profs[p]
      entry.profs[pr.prof] = {
        rank = pr.rank,
        maxRank = pr.maxRank,
        recipes = pr.recipes,
        scannedAt = time(),
        isTestData = true,
      }
      recipes = recipes + table.getn(pr.recipes)
    end

    local key = charName .. "@" .. guildName
    if BRPP_MakeKey then key = BRPP_MakeKey(charName, guildName) end

    BRPPDB.guild[key] = entry
    players = players + 1
  end

  for i = 1, table.getn(TestCrafters) do
    local c = TestCrafters[i]
    addEntry(c.name, ownGuild, c)
    -- Zwilling in der Partnergilde. Eigener Name, damit in der Crafterliste
    -- klar erkennbar ist, welcher Eintrag von wo kommt.
    addEntry("P-" .. c.name, fakePartnerGuild, c)

    -- Echte Partner gelten als erreichbar, wenn sie im Partnerkanal sitzen.
    -- Testdaten sitzen in keinem Kanal, waeren also immer "nicht erreichbar".
    -- Damit die Anzeige und das Anfluestern pruefbar sind, wird jeder zweite
    -- Zwilling kuenstlich als anwesend markiert.
    if BRPP_Partner and mod(i, 2) == 1 then
      BRPP_Partner.SetOnline("P-" .. c.name)
    end
  end

  -- Die fiktive Partnergilde auch in der Partnerliste sichtbar machen,
  -- damit /brpp partner list und /brpp partner remove testbar sind.
  if not BRPPDB.partner then BRPPDB.partner = { guilds = {} } end
  if not BRPPDB.partner.guilds then BRPPDB.partner.guilds = {} end
  BRPPDB.partner.guilds[fakePartnerGuild] = {
    firstSeen = date("%Y-%m-%d %H:%M:%S"),
    lastSeen = date("%Y-%m-%d %H:%M:%S"),
    isTestData = true,
  }

  tmsg("|cff00ff00" .. players .. " Test-Crafter|r mit |cff00ff00" .. recipes .. " Rezepten|r eingespielt.")
  tmsg("Jeder Crafter existiert doppelt: einmal in |cffffff00" .. ownGuild .. "|r, einmal als |cff66ccffP-...|r in |cff66ccff" .. fakePartnerGuild .. "|r.")
  tmsg("Diese Daten werden |cffff8800nicht|r an die Gilde gesendet.")
  tmsg("Entfernen mit |cffffff00/brpptest clear|r")

  if BRPP_UI and BRPP_UI:IsShown() then
    BRPP_UI_Refresh()
  end
end

-- Testdaten restlos entfernen (echte Daten bleiben erhalten)
function BRPP_TestData_Clear()
  if not BRPPDB or not BRPPDB.guild then
    tmsg("Nichts zu loeschen.")
    return
  end

  local removed = 0
  -- Namen zuerst sammeln, dann loeschen (nicht waehrend pairs veraendern)
  local doomed = {}
  for name, entry in pairs(BRPPDB.guild) do
    if type(entry) == "table" and entry.isTestData then
      table.insert(doomed, name)
    end
  end
  for i = 1, table.getn(doomed) do
    BRPPDB.guild[doomed[i]] = nil
    removed = removed + 1
  end

  -- Auch die fiktive Partnergilde wieder aus der Partnerliste nehmen.
  -- Nur Eintraege mit isTestData -- echte Partnergilden bleiben unangetastet.
  if BRPPDB.partner and BRPPDB.partner.guilds then
    local doomedGuilds = {}
    for g, info in pairs(BRPPDB.partner.guilds) do
      if type(info) == "table" and info.isTestData then
        table.insert(doomedGuilds, g)
      end
    end
    for i = 1, table.getn(doomedGuilds) do
      BRPPDB.partner.guilds[doomedGuilds[i]] = nil
    end
  end

  -- Kuenstliche Anwesenheit der Test-Zwillinge wieder zuruecknehmen.
  -- Echte Anwesenheit baut sich beim naechsten Kanal-Abgleich neu auf.
  if BRPP_Partner and BRPP_Partner.ClearPresence then
    BRPP_Partner.ClearPresence()
  end

  tmsg("|cffff8800" .. removed .. " Test-Crafter entfernt.|r Echte Daten unveraendert.")

  if BRPP_UI and BRPP_UI:IsShown() then
    BRPP_UI_Refresh()
  end
end

function BRPP_TestData_Status()
  tmsg("--- Diagnose ---")

  if not BRPPDB then
    tmsg("BRPPDB: |cffff0000fehlt|r (Hauptaddon nicht geladen?)")
    return
  end
  tmsg("BRPPDB: |cff00ff00vorhanden|r")

  if not BRPPDB.guild then
    tmsg("BRPPDB.guild: |cffff0000fehlt|r")
    return
  end

  local test, real, recipes = 0, 0, 0
  for name, entry in pairs(BRPPDB.guild) do
    if type(entry) == "table" then
      if entry.isTestData then test = test + 1 else real = real + 1 end
      for prof, pdata in pairs(entry.profs or {}) do
        if type(pdata) == "table" and pdata.recipes then
          recipes = recipes + table.getn(pdata.recipes)
        end
      end
    end
  end

  tmsg("Test-Crafter:  |cffffff00" .. test .. "|r")
  tmsg("Echte Crafter: |cff00ff00" .. real .. "|r")
  tmsg("Rezepte gesamt: |cff00ff00" .. recipes .. "|r")

  if BRPP_RecipeMaps then
    tmsg("RecipeMaps: |cff00ff00geladen|r")
  else
    tmsg("RecipeMaps: |cffff0000fehlt|r")
  end

  if BRPP_UI then
    tmsg("UI-Fenster: |cff00ff00erstellt|r")
  else
    tmsg("UI-Fenster: noch nicht geoeffnet (|cffffff00/brpp show|r)")
  end

  if test == 0 and real == 0 then
    tmsg("|cffff8800=> Datenbank ist leer. Jetzt |cffffff00/brpptest load|r|cffff8800 ausfuehren.|r")
  end
end

-- Slash-Befehl
SLASH_BRPPTEST1 = "/brpptest"
SlashCmdList["BRPPTEST"] = function(input)
  local cmd = string.lower(input or "")
  if cmd == "load" then
    BRPP_TestData_Load()
  elseif cmd == "clear" then
    BRPP_TestData_Clear()
  elseif cmd == "status" then
    BRPP_TestData_Status()
  else
    tmsg("Befehle:")
    tmsg("  |cffffff00/brpptest load|r   - Testdaten einspielen")
    tmsg("  |cffffff00/brpptest clear|r  - Testdaten entfernen")
    tmsg("  |cffffff00/brpptest status|r - Uebersicht anzeigen")
  end
end

-- Ladebestaetigung: erscheint beim Login, wenn diese Datei geladen wurde.
DEFAULT_CHAT_FRAME:AddMessage("|cffffd200BRPP-Test:|r Testdaten-Modul geladen. Befehl: |cffffff00/brpptest load|r")
