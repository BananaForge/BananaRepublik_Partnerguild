# BananaRepublik Partnerguild

WoW 1.12 addon for sharing profession and recipe data between the own guild and a partner guild via a shared password-protected chat channel.

## Repository

This repository is prepared for GitHub and can be uploaded directly with Git for Windows.

### Addon files

- `BananaRepublik_Partnerguild.toc` — addon manifest
- `BananaRepublik_Partnerguild.lua` — main addon logic
- `BananaRepublik_Partnerguild_Partner.lua` — partner-guild communication
- `BananaRepublik_Partnerguild_Locale.lua` — German/English localization
- `BananaRepublik_Partnerguild_RecipeMaps.lua` — recipe mappings
- `BananaRepublik_Partnerguild.xml` — UI definitions
- `BRPP_MinimapIcon.tga` — minimap icon
- `BananaRepublik_Partnerguild_TestData.lua` — optional test data

## Installation

1. Download/clone this repository.
2. Copy the repository folder into:
   `World of Warcraft/Interface/AddOns/`
3. Make sure the folder contains `BananaRepublik_Partnerguild.toc` directly.
4. Start WoW and enable the addon.

## Main commands

```text
/brpp partner
/brpp partner create
/brpp partner add <Code>
/brpp partner push
/brpp partner code
/brpp partner newcode
/brpp partner list
/brpp partner remove <Guild>
/brpp partner leave
```

The addon also keeps the existing `/brpp` commands such as sync, export and version checks.

## Partner guild communication

WoW 1.12 does not provide cross-guild addon messaging. The partner-guild module therefore uses a shared chat channel protected by an invite code.

The 12-character code contains the channel identifier and password. The addon filters its protocol messages from the visible chat and throttles transmissions to reduce chat spam.

## Testing

Test data can be loaded in-game with:

```text
/brpptest load
/brpptest status
/brpptest clear
```

Test entries are marked as test data and are excluded from the real guild broadcast path.

## Detailed documentation

See `PARTNERGUILD_README.md` for the detailed technical documentation and migration notes.

## GitHub upload with Git for Windows

Open **Git Bash** and run:

```bash
cd /c/PATH/ZU/DEINEM/ORDNER/BananaRepublik_Partnerguild
git init
git add .
git commit -m "Initial release of BananaRepublik Partnerguild"
git branch -M main
git remote add origin https://github.com/BananaForge/BananaRepublik_Partnerguild.git
git push -u origin main
```

If the repository already exists on GitHub, these commands upload the complete package to it.

> If your GitHub repository has a different name, replace the URL in the `git remote add origin ...` command.
