include std/ffi.e
include std/machine.e

include SDL.e

public constant xSDL_GetPlatform = define_c_func(sdl,"+SDL_GetPlatform",{},C_STRING)

public function SDL_GetPlatform()
	return c_func(xSDL_GetPlatform,{})
end function
­9.35