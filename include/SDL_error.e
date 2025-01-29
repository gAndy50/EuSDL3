include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e

public constant xSDL_SetError = define_c_func(sdl,"+SDL_SetError",{C_STRING,C_POINTER},C_BOOL)

public function SDL_SetError(sequence fmt,object x)
	return c_func(xSDL_SetError,{fmt,x})
end function

public constant xSDL_SetErrorV = define_c_func(sdl,"+SDL_SetErrorV",{C_STRING,C_POINTER},C_BOOL)

public function SDL_SetErrorV(sequence fmt,atom ap)
	return c_func(xSDL_SetErrorV,{fmt,ap})
end function

public constant xSDL_OutOfMemory = define_c_func(sdl,"+SDL_OutOfMemory",{},C_BOOL)

public function SDL_OutOfMemory()
	return c_func(xSDL_OutOfMemory,{})
end function

public constant xSDL_GetError = define_c_func(sdl,"+SDL_GetError",{},C_STRING)

public function SDL_GetError()
	return c_func(xSDL_GetError,{})
end function

public constant xSDL_ClearError = define_c_func(sdl,"+SDL_ClearError",{},C_BOOL)

public function SDL_ClearError()
	return c_func(xSDL_ClearError,{})
end function
­34.34