---------------------------------
--EuSDL 3
--Written by Andy P.
--SDL3 wrapper for OpenEuphoria
--SDL Ver: 3.2.24
--Eu Ver: 4.1.0 Beta 2
--Copyright (c) 2025
---------------------------------
include std/ffi.e
include std/machine.e
include std/os.e

public atom sdl

ifdef WINDOWS then
	sdl = open_dll("SDL3.dll")
	elsifdef LINUX or FREEBSD then
	sdl = open_dll("libSDL3.so")
	elsifdef OSX then
	sdl = open_dll("libSDL3.dylib")
end ifdef

if sdl = -1 then
	puts(1,"Failed to load SDL3!\n")
	abort(0)
end if

public include Include/SDL_stdinc.e
public include Include/SDL_assert.e
public include Include/SDL_asyncio.e
public include Include/SDL_atomic.e
public include Include/SDL_audio.e
--public include SDL_bits.e
public include Include/SDL_blendmode.e
public include Include/SDL_camera.e
public include Include/SDL_clipboard.e
public include Include/SDL_cpuinfo.e
public include Include/SDL_dialog.e
--public include SDL_endian.e
public include Include/SDL_error.e
public include Include/SDL_event.e
public include Include/SDL_filesystem.e
public include Include/SDL_gamepad.e
public include Include/SDL_gpu.e
public include Include/SDL_guid.e
public include Include/SDL_haptic.e
public include Include/SDL_hidapi.e
--public include SDL_hints.e
public include Include/SDL_init.e
public include Include/SDL_iostream.e
public include Include/SDL_joystick.e
public include Include/SDL_keyboard.e
public include Include/SDL_keycode.e
public include Include/SDL_loadso.e
public include Include/SDL_locale.e
public include Include/SDL_log.e
public include Include/SDL_messagebox.e
public include Include/SDL_metal.e
public include Include/SDL_misc.e
public include Include/SDL_mouse.e
public include Include/SDL_mutex.e
public include Include/SDL_pen.e
public include Include/SDL_pixels.e
public include Include/SDL_platform.e
public include Include/SDL_power.e
public include Include/SDL_process.e
public include Include/SDL_properties.e
public include Include/SDL_rect.e
public include Include/SDL_render.e
public include Include/SDL_scancode.e
public include Include/SDL_sensor.e
public include Include/SDL_storage.e
public include Include/SDL_surface.e
public include Include/SDL_system.e
public include Include/SDL_thread.e
public include Include/SDL_time.e
public include Include/SDL_timer.e
public include Include/SDL_tray.e
public include Include/SDL_touch.e
public include Include/SDL_version.e
public include Include/SDL_video.e
--public include SDL_oldnames.e
­17.10

