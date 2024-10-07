include std/ffi.e
include std/machine.e

include SDL3.e

public constant xSDL_SetError = define_c_func(sdl,"+SDL_SetError",{C_STRING},C_INT)

public function SDL_SetError(sequence fmt)
	return c_func(xSDL_SetError,{fmt})
end function

export constant xSDL_GetError = define_c_func(sdl,"+SDL_GetError",{},C_STRING)

public function SDL_GetError()
	return c_func(xSDL_GetError,{})
end function

export constant xSDL_GetErrorMsg = define_c_func(sdl,"+SDL_GetErrorMsg",{C_STRING,C_INT},C_STRING)

public function SDL_GetErrorMsg(sequence errstr,atom maxlen)
	return c_func(xSDL_GetErrorMsg,{errstr,maxlen})
end function

export constant xSDL_ClearError = define_c_proc(sdl,"+SDL_ClearError",{})

public procedure SDL_ClearError()
	c_proc(xSDL_ClearError,{})
end procedure

public enum type SDL_errorcode
	SDL_ENOMEM = 0,
	SDL_EFREAD,
	SDL_EFWRITE,
	SDL_EFSEEK,
	SDL_UNSUPPORTED,
	SDL_LASTERROR
end type

export constant xSDL_Error = define_c_func(sdl,"+SDL_Error",{C_INT},C_INT)

public function SDL_Error(SDL_errorcode code)
	return c_func(xSDL_Error,{code})
end function
­42.33