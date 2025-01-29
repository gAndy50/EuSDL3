include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public constant xSDL_OpenURL = define_c_func(sdl,"+SDL_OpenURL",{C_STRING},C_BOOL)

public function SDL_OpenURL(sequence url)
	return c_func(xSDL_OpenURL,{url})
end function
�11.34