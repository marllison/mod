Config.java

REFERÊNCIA -> public static int BUFFS_MAX_AMOUNT;

+    public static boolean ENABLE_AUTO_REWARD_NEW_CHAR;
+    public static int[][] HUMAN_MAGE_ITEMS, HUMAN_FIGHTER_ITEMS; // all lists humans
+    public static int[][] ELF_MAGE_ITEMS, ELF_FIGHTER_ITEMS; // all lists elfs
+    public static int[][] DARK_ELF_MAGE_ITEMS, DARK_ELF_FIGHTER_ITEMS; // all lists dark elfs
+    public static int[][] ORC_MAGE_ITEMS, ORC_FIGHTER_ITEMS; // all lists orc
+    public static int[][] DWARF_ITEMS; // list dwarf

REFERÊNCIA ->  STORE_SKILL_COOLTIME = players.getProperty("StoreSkillCooltime", true);

+    ENABLE_AUTO_REWARD_NEW_CHAR = players.getProperty("EnableItemsNewChar", false);
+    HUMAN_MAGE_ITEMS = parseItemsList(players.getProperty("HumanMageItemList", "123,456"));
+    HUMAN_FIGHTER_ITEMS = parseItemsList(players.getProperty("HumanFighterItemList", "123,456"));
+    ELF_MAGE_ITEMS = parseItemsList(players.getProperty("ElfMageItemList", "123,456"));
+    ELF_FIGHTER_ITEMS = parseItemsList(players.getProperty("ElfFighterItemList", "123,456"));
+    DARK_ELF_MAGE_ITEMS = parseItemsList(players.getProperty("DarkElfMageItemList", "123,456"));
+    DARK_ELF_FIGHTER_ITEMS = parseItemsList(players.getProperty("DarkElfFighterItemList", "123,456"));    
+    ORC_MAGE_ITEMS = parseItemsList(players.getProperty("OrcMageItemList", "123,456"));
+    ORC_FIGHTER_ITEMS = parseItemsList(players.getProperty("OrcFighterItemList", "123,456"));            
+    DWARF_ITEMS = parseItemsList(players.getProperty("DwarfItemList", "123,456"));

CharacterCreate.java

REFERÊNCIA -> newChar.getInventory().equipItemAndRecord(item);


+        if (Config.ENABLE_AUTO_REWARD_NEW_CHAR)        
+             newCharItems(newChar);

REFERÊNCIA -> getClient().setCharSelection(cl.getCharInfo())

+    private static void newCharItems(L2PcInstance newChar)
+    {    
+        // by Bluur aCis version
+        ItemInstance newItem;
+        
+        if (newChar.getRace() == Race.Human)
+        {
+            if (newChar.isMageClass())
+            {
+                for (int item[] : Config.HUMAN_MAGE_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != Item.TYPE2_WEAPON))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }    
+            }
+            else
+            {
+                for (int item[] : Config.HUMAN_FIGHTER_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != Item.TYPE2_WEAPON))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }
+            }
+        }
+        else if (newChar.getRace() == Race.Elf)
+        {
+            if (newChar.isMageClass())
+            {
+                for (int item[] : Config.ELF_MAGE_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != Item.TYPE2_WEAPON))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }    
+            }
+            else
+            {
+                for (int item[] : Config.ELF_FIGHTER_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != Item.TYPE2_WEAPON))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }
+            }
+        }
+        else if (newChar.getRace() == Race.DarkElf)
+        {    
+            if (newChar.isMageClass())
+            {
+                for (int item[] : Config.DARK_ELF_MAGE_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != Item.TYPE2_WEAPON))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }    
+            }
+            else
+            {
+                for (int item[] : Config.DARK_ELF_FIGHTER_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("",item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != Item.TYPE2_WEAPON))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }
+            }
+        }
+        else if (newChar.getRace() == Race.Orc)
+        {
+            if (newChar.isMageClass())
+            {
+                for (int item[] : Config.ORC_MAGE_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != newItem.getItem().getBodyPart()))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }    
+            }
+            else
+            {
+                for (int item[] : Config.ORC_FIGHTER_ITEMS)
+                {
+                    newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                    
+                    if (newItem.isEquipable())            
+                        if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != newItem.getItem().getBodyPart()))
+                            newChar.getInventory().equipItemAndRecord(newItem);                                
+                }
+            }
+        }
+        else if (newChar.getRace() == Race.Dwarf)
+        {                    
+            for (int item[]: Config.DWARF_ITEMS)
+            {
+                newItem = newChar.getInventory().addItem("", item[0], item[1], newChar, null);
+                
+                if (newItem.isEquipable())            
+                    if (newChar.getActiveWeaponItem() == null || !(newItem.getItem().getType2() != newItem.getItem().getBodyPart()))
+                        newChar.getInventory().equipItemAndRecord(newItem);                                
+            }                
+        }
+    }

Properties

#=============================================================
#                   Character Create Settings
#=============================================================

# Enable System
EnableItemsNewChar = True

# ID,COUNT; EX: 57,2000000;
# Human
HumanMageItemList = 57,15000000;100,1;42,1;1101,1;1104,1;909,1;846,2;878,2;5146,1
HumanFighterItemList = 57,15000000;44,1;23,1;2386,1;909,1;846,2;878,2;5134,1
# Elf
ElfMageItemList = 100,1;42,1;1101,1;1104,1;909,1;846,2;878,2;5146,1
ElfFighterItemList = 44,1;23,1;2386,1;909,1;846,2;878,2;5134,1
# Darl Elf
DarkElfMageItemList = 100,1;42,1;1101,1;1104,1;909,1;846,2;878,2;5146,1
DarkElfFighterItemList = 44,1;23,1;2386,1;909,1;846,2;878,2;5134,1
# Orc
OrcMageItemList = 100,1;42,1;1101,1;1104,1;909,1;846,2;878,2;5146,1
OrcFighterItemList = 44,1;23,1;2386,1;909,1;846,2;878,2;5134,1
# Dwarf
DwarfItemList = 44,1;23,1;2386,1;909,1;846,2;878,2;5134,1
