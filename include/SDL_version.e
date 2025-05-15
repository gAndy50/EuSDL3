include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e

public constant SDL_MAJOR_VERSION = 3
public constant SDL_MINOR_VERSION = 2
public constant SDL_MICRO_VERSION = 14

public constant xSDL_GetVersion = define_c_func(sdl,"+SDL_GetVersion",{},C_INT)

public function SDL_GetVersion()
	return c_func(xSDL_GetVersion,{})
end function

public constant xSDL_GetRevision = define_c_func(sdl,"+SDL_GetRevision",{},C_STRING)

public function SDL_GetRevision()
	return c_func(xSDL_GetRevision,{})
end function
­9.38