include std/ffi.e
include std/machine.e
include std/math.e

include SDL_error.e

include SDL3.e

public constant SDL_Locale = define_c_struct({
	C_STRING, --language
	C_STRING --country
})

export constant xSDL_GetPreferredLocales = define_c_func(sdl,"+SDL_GetPreferredLocales",{},C_POINTER)

public function SDL_GetPreferredLocales()
	return c_func(xSDL_GetPreferredLocales,{})
end function
­17.39