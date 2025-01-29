include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public constant SDL_Locale = define_c_struct({
	C_STRING, --language
	C_STRING  --country
})

public constant xSDL_GetPreferredLocales = define_c_func(sdl,"+SDL_GetPreferredLocales",{C_POINTER},C_POINTER)

public function SDL_GetPreferredLocales(atom count)
	return c_func(xSDL_GetPreferredLocales,{count})
end function
­17.12