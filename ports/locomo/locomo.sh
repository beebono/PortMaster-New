#!/bin/sh

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"

get_controls

GAMEDIR=/$directory/ports/locomo/
CONFDIR="$GAMEDIR/config/"

mkdir -p "$CONFDIR"

cd $GAMEDIR

> "$GAMEDIR/log.txt" && exec > >(tee "$GAMEDIR/log.txt") 2>&1

pm_platform_helper "$GAMEDIR/locomo.${DEVICE_ARCH}"

# Only preload libs when needed as fallbacks
PRELOAD_LIBS=""
LDCONFIG_OUTPUT=$(ldconfig -p 2>/dev/null)
if ! echo "$LDCONFIG_OUTPUT" | grep -q 'libSDL2-2\.0\.so\.0'; then
  PRELOAD_LIBS="$PRELOAD_LIBS $GAMEDIR/libs.${DEVICE_ARCH}/libSDL2-2.0.so.0"
fi
if ! echo "$LDCONFIG_OUTPUT" | grep -q 'librockchip_mpp\.so\.1'; then
  PRELOAD_LIBS="$PRELOAD_LIBS $GAMEDIR/libs.${DEVICE_ARCH}/librockchip_mpp.so.1"
fi
if [ -n "$PRELOAD_LIBS" ]; then
  # Trim leading whitespace
  PRELOAD_LIBS=$(echo "$PRELOAD_LIBS" | sed 's/^ *//')
  export LD_PRELOAD="$PRELOAD_LIBS"
fi

export SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"
./locomo.${DEVICE_ARCH}

pm_finish
