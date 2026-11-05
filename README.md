# SkyrimSE-FPInertia (1.7.x build)

Adds first person inertia to Skyrim Special Edition. Fork of [DCCStudios/SkyrimSE-FPInertia](https://github.com/DCCStudios/SkyrimSE-FPInertia) (First Person (FP) Inertia - SKSE, [Nexus 167883](https://www.nexusmods.com/skyrimspecialedition/mods/167883)) by TheShinyHaxorus. MIT licence, original copyright kept.

**This fork only exists until the original author updates theirs.** Once the original supports Skyrim 1.7.x and fixes the items below, use the original.

## What this fork changes (1.3.1)
- **Skyrim 1.7.x (1.7.99 / 1.7.104) support.** Built on alandtse's CommonLibSSE-NG so one DLL loads on 1.6.1170 and 1.7.x. The main update hook moved on AE 1.7.99+ (offset 0xC38) and is chosen per game version. Every hook site is checked to be a call before it is patched; if a game version moved it, the hook is skipped and logged instead of patching other bytes.
- **Flicker / ghosting above ~140 fps** (reported on Nexus): frames where the rate limiter skipped the physics step applied no inertia, so the hands popped back to the plain animation. The last offsets are now kept for those frames (dropped after 150 ms, on reset, or when the mod is disabled).
- **Stutters:** two log lines ran every frame, the log level was trace and every line was flushed to disk. They are now only written with debug logging on, and the log level is info.

Not changed: the "High Framerate Fix" checkbox in the menu is not used by the code (it did nothing before and still does nothing), the bow-drawn axis inversion and Skyrim Souls unpaused-menu reports are not addressed.

## Install
Install the original mod first (its weapon data and presets are needed), then put this `FPInertia.dll` over its `SKSE/Plugins/FPInertia.dll`. Settings stay as they are.

## Requirements

### Runtime
- Skyrim Special Edition (1.6.x+)
- [SKSE64](https://skse.silverlock.org/)
- [Address Library for SKSE Plugins](https://www.nexusmods.com/skyrimspecialedition/mods/32444)

### Building from Source
- **Visual Studio 2022** with "Desktop development with C++" workload
- **CMake 3.21+** (add to PATH)
- **vcpkg** (set `VCPKG_ROOT` environment variable to vcpkg install path)
- **MSVC Toolset** v14.43+ (included with VS2022)

## Building

1. Clone the repository:
   ```
   git clone https://github.com/DCCStudios/SkyrimSE-FPInertia.git
   cd SkyrimSE-FPInertia
   ```

2. Configure with CMake:
   ```
   cmake --preset release
   ```

3. Build:
   ```
   cmake --build build/release --config Release
   ```

4. The compiled plugin will be in `Compile/SKSE/Plugins/`.

## Configuration

Edit `Data/SKSE/Plugins/FPInertia.ini` to customize settings.

## License
The source files are MIT licensed (original copyright DCC Studios, `LICENSE-MIT.txt`). The compiled `FPInertia.dll` is built with alandtse's CommonLibSSE-NG (GPL-3.0 with a modding exception) and is therefore distributed under the **GNU General Public License, version 3 or later** (`LICENSE`). See `NOTICE.txt`. The source of every release is this repository at the release tag.
