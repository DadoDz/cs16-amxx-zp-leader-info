# [ZP] Leader Info

A simple leader info plugin for **Zombie Plague** servers, designed for **Counter-Strike 1.6**.
The plugin automatically announces the players with the highest Ammo Packs and Points at the end of every round.

## Plugin Information

  - **Name**: [ZP] Leader Info
  - **Version**: 1.0
  - **Author**: DadoDz
  - **Game**: Counter-Strike 1.6
  - **Mod**: Zombie Plague

## Requirements

- AMX Mod X **1.9+**
- Zombie Plague Mod

## Installation
1. Place ```add_commas.inc``` in: **addons/amxmodx/scripting/include/zombie_plague**
1. Place ```zp_leader_info.sma``` in: **addons/amxmodx/scripting/**
2. Compile it with your AMXX compiler.
3. Place the compiled .amxx file in: **addons/amxmodx/plugins/**
4. Add this line to your plugins.ini: ```zp_leader_info.amxx```
5. Restart your server.

## Required Natives
This plugin uses custom natives to get points and ammo packs, you must change these natives based on your zombie plague version.
- ```native zp_get_user_packs(index)```
- ```native zp_get_user_points(index)```

## Notice
> Leaderboard systems already exist, this plugin was originally created for my own server.
> The current version was adapted for Zombie Plague, but it can easily be modified to support other mods.
