include std/ffi.e
include std/os.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public enum type SDL_PowerState
	SDL_POWERSTATE_ERROR = -1,
	SDL_POWERSTATE_UNKNOWN = 0,
	SDL_POWERSTATE_ON_BATTERY,
	SDL_POWERSTATE_NO_BATTERY,
	SDL_POWERSTATE_CHARGING,
	SDL_POWERSTATE_CHARGED
end type

public constant xSDL_GetPowerInfo = define_c_func(sdl,"+SDL_GetPowerInfo",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetPowerInfo(atom seconds,atom percent)
	return c_func(xSDL_GetPowerInfo,{seconds,percent})
end function
­20.51