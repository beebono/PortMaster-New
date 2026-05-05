## Notes

locomo is a minimal Steam Remote Play client designed for ARM64 Linux handhelds. It implements the Steam In-Home Streaming protocol via ihslib and is built in Zig.

### Navigation

Locomo is fully controller-driven. Use D-pad to move, **A** to confirm, **B** to go back.

**Host scan screen:**
- D-pad up/down - move cursor
- **A** - connect to selected host (pairs if not yet paired, otherwise streams directly)
- **Start** - open settings
- **B** - confirm quit prompt

**Pairing:**  
A 4-digit PIN is displayed. Enter it in Steam on the host when prompted, or under *Settings → Remote Play → Pair Steam Link*.

## Settings

Open the settings screen from the host scan with **Start**. Navigate rows with D-pad up/down, change values with D-pad left/right or **A**. Press **B** or **Start** to save and return.

| Setting | Options |
|---|---|
| Quality | Fast / Balanced / Beautiful |
| Resolution | Native (screen size), or fixed 16:9: 852×480 up to 3840×2160 |
| Bandwidth | Automatic, or fixed: 5–100 Mbps / Unlimited |
| Audio | No Audio / Mono / Stereo |
| Framerate | Automatic / 30 / 60 / 120 / 240 FPS |
| HEVC | Off / On |
| HW Decode | Off / On (requires V4L2 or Rockchip MPP) |
| Button Swap | None / Swap A-B / Swap X-Y / Swap All |


## Controls

| Button | Action |
|--|--| 
|Hold(Start + Select) + (X)x2|Quick Disconnect|
|Hold(Start + Select) + L3|Toggle Mouse Mode|
|(Mouse Mode) Left Stick|Move Cursor|
|(Mouse Mode) Right Stick|Scroll Content|
|(Mouse Mode) Left Trigger|Right Click|
|(Mouse Mode) Right Trigger|Left Click|


## Compile

```shell
See https://github.com/beebono/locomo for the full source code and compilation instructions.
```