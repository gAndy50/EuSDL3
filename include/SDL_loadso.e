include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public constant xSDL_LoadObject = define_c_func(sdl,"+SDL_LoadObject",{C_STRING},C_POINTER)

public function SDL_LoadObject(sequence sofile)
	return c_func(xSDL_LoadObject,{sofile})
end function

public constant xSDL_LoadFunction = define_c_func(sdl,"+SDL_LoadFunction",{C_POINTER,C_STRING},C_POINTER)

public function SDL_LoadFunction(atom handle,sequence name)
	return c_func(xSDL_LoadFunction,{handle,name})
end function

public constant xSDL_UnloadObject = define_c_proc(sdl,"+SDL_UnloadObject",{C_POINTER})

public procedure SDL_UnloadObject(atom handle)
	c_proc(xSDL_UnloadObject,{handle})
end procedure
�23.35