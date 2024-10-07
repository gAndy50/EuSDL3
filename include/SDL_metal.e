include std/ffi.e
include std/machine.e

include SDL_video.e

include SDL3.e

export constant xSDL_Metal_CreateView = define_c_func(sdl,"+SDL_Metal_CreateView",{C_POINTER},C_POINTER)

public function SDL_Metal_CreateView(atom win)
	return c_func(xSDL_Metal_CreateView,{win})
end function

export constant xSDL_Metal_DestroyView = define_c_proc(sdl,"+SDL_Metal_DestroyView",{C_POINTER})

public procedure SDL_Metal_DestroyView(atom view)
	c_proc(xSDL_Metal_DestroyView,{view})
end procedure

export constant xSDL_Metal_GetLayer = define_c_func(sdl,"+SDL_Metal_GetLayer",{C_POINTER},C_POINTER)

public function SDL_Metal_GetLayer(atom view)
	return c_func(xSDL_Metal_GetLayer,{view})
end function
­17.38
