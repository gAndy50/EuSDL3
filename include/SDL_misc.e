include std/ffi.e
include std/machine.e

include SDL3.e

public constant xSDL_OpenURL = define_c_func(sdl,"+SDL_OpenURL",{C_STRING},C_INT)

public function SDL_OpenURL(sequence url)
	return c_func(xSDL_OpenURL,{url})
end function
­9.34