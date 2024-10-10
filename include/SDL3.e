--EuSDL3
--Written by Andy P.
--Icy Viking Games
--SDL3 wrapper for Euphoria
--Icy Viking Games
--Copyright (c) 2024

include std/ffi.e
include std/os.e

public atom sdl

ifdef WINDOWS then
	sdl = open_dll("SDL3.dll")
	elsifdef LINUX or FREEBSD then
	sdl = open_dll("libSDL3.so")
	elsifdef OSX then
	sdl = open_dll("libSDL3.dylib")
end ifdef

if sdl = 0 then
	puts(1,"Failed to load SDL!\n")
	abort(0)
end if

public include SDL_assert.e
public include SDL_atomic.e
public include SDL_audio.e
--public include SDL_bits.e
public include SDL_blendmode.e
public include SDL_camera.e
public include SDL_clipboard.e
public include SDL_cpuinfo.e
public include SDL_endian.e
public include SDL_error.e
public include SDL_events.e
public include SDL_filesystem.e
public include SDL_gamepad.e
public include SDL_guid.e
public include SDL_haptic.e
public include SDL_hidapi.e
--public include SDL_hints.e
public include SDL_init.e
public include SDL_joystick.e
public include SDL_keyboard.e
public include SDL_keycode.e
public include SDL_loadso.e
public include SDL_locale.e
public include SDL_log.e
public include SDL_messagebox.e
public include SDL_metal.e
public include SDL_misc.e
public include SDL_mouse.e
public include SDL_mutex.e
public include SDL_pen.e
public include SDL_pixels.e
public include SDL_platform.e
public include SDL_power.e
public include SDL_properties.e
public include SDL_rect.e
public include SDL_render.e
public include SDL_rwops.e --SDL_IOSTREAM
public include SDL_scancode.e
public include SDL_sensor.e
public include SDL_shape.e
public include SDL_surface.e
public include SDL_system.e
public include SDL_thread.e
public include SDL_time.e
public include SDL_timer.e
public include SDL_storage.e
public include SDL_touch.e
public include SDL_version.e
public include SDL_video.e
public include SDL_video_capture.e
public include SDL_process.e
public include SDL_gpu.e
public include SDL_dialog.e
­78.27