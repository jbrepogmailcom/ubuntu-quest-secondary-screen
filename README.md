# Immersed Dual-Screen Setup for Ubuntu (Meta Quest 3)

This script helps you **create a virtual secondary display** on **Ubuntu 24.04** and **24.10** for use with **Meta Quest 3** and the **Immersed** app.  
It ensures smooth dual-screen experience in VR, automatically adjusting settings based on whether you're using **X11** or **Wayland**.

---

## How it works

- On **X11**, it:
  - Creates a 3200x1800 virtual screen.
  - Launches Immersed.
  - Resets display configuration after closing Immersed.
  
- On **Wayland**, it:
  - Temporarily disables the **Compiz Windows Effect** extension (to prevent graphical glitches).
  - Launches Immersed.
  - Re-enables the extension afterward.

---

## Requirements

- Ubuntu 24.04 or 24.10
- [Immersed AppImage](https://immersed.com/download/)
- (For X11 only) `xrandr` must be installed (`sudo apt install x11-xserver-utils`)
- (Wayland only) GNOME Extensions with `compiz-windows-effect@hermes83.github.com` installed and enabled.

---

## Setup

1. **Clone the repository** or download `vr.sh`.
2. Make sure `vr.sh` is executable:

   ```bash
   chmod +x vr.sh
   ```

3. Place the [Immersed-x86_64.AppImage](https://immersed.com/download/) in your `~/Downloads/` directory (or adjust the path in the script).
4. (X11 only) Create the helper script `set3200.sh` to add a 3200x1800 mode:

   Example `set3200.sh`:

   ```bash
   #!/bin/bash
   xrandr --newmode "3200x1800_60.00"  379.00  3200 3448 3800 4400  1800 1803 1807 1865 -hsync +vsync
   xrandr --addmode VIRTUAL1 "3200x1800_60.00"
   xrandr --output VIRTUAL1 --mode "3200x1800_60.00" --right-of eDP1
   ```

   Make it executable:

   ```bash
   chmod +x set3200.sh
   ```

5. Run the script:

   ```bash
   ./vr.sh
   ```

---

## Notes

- If you are on X11, your laptop display may briefly turn off during setup/reset.
- On Wayland, the script temporarily disables the **Compiz Windows Effect** extension to prevent visual issues when launching Immersed.
- You can modify the AppImage path if you store it elsewhere.
- If you modify screen resolutions or display settings manually, you might need to adjust the commands in `set3200.sh` or `vr.sh`.

---

## Troubleshooting

- **Virtual display not showing?**  
  Make sure your system supports creating virtual screens (`xrandr` + VIRTUAL1).
  
- **Immersed crashes on startup?**  
  Try setting `export LIBVA_DRIVER_NAME=i965` before launching if you experience GPU decoding issues (Wayland only, optional).

- **Session type not detected?**  
  Ensure your session is either `x11` or `wayland`. Check with:

  ```bash
  echo $XDG_SESSION_TYPE
  ```

---

## License

MIT License
