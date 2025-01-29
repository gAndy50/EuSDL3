include std/ffi.e
include std/machine.e

include SDL.e
include SDL_video.e

public constant xSDL_Metal_CreateView = define_c_func(sdl,"+SDL_Metal_CreateView",{C_POINTER},C_POINTER)

public function SDL_Metal_CreateView(atom window)
	return c_func(xSDL_Metal_CreateView,{window})
end function

public constant xSDL_Metal_DestroyView = define_c_proc(sdl,"+SDL_Metal_DestroyView",{C_POINTER})

public procedure SDL_Metal_DestroyView(atom view)
	c_proc(xSDL_Metal_DestroyView,{view})
end procedure

public constant xSDL_Metal_GetLayer = define_c_func(sdl,"+SDL_Metal_GetLayer",{C_POINTER},C_POINTER)

public function SDL_Metal_GetLayer(atom view)
	return c_func(xSDL_Metal_GetLayer,{view})
end function
­16.36