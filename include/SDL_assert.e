include std/ffi.e
include std/machine.e

include SDL3.e

public enum type SDL_AssertState
	SDL_ASSERTION_RETRY = 0,
	SDL_ASSERTION_BREAK,
	SDL_ASSERTION_ABORT,
	SDL_ASSERTION_IGNORE,
	SDL_ASSERTION_ALWAYS_IGNORE
end type

public constant SDL_AssertData = define_c_struct({
	C_INT, --always_ignore
	C_UINT, --trigger_count
	C_STRING, --condition
	C_STRING, --filename
	C_INT, --linenum
	C_STRING, --function
	C_POINTER --SDL_AssertData *next
})

export constant xSDL_AssertState = define_c_func(sdl,"+SDL_AssertState",{C_POINTER,C_STRING,C_STRING,C_INT},C_INT)

public function sSDL_AssertState(atom data,sequence func,sequence file,atom line)
	return c_func(xSDL_AssertState,{data,func,file,line})
end function

export constant xSDL_SetAssertionHandler = define_c_proc(sdl,"+SDL_SetAssertionHandler",{C_POINTER,C_POINTER})

public procedure SDL_SetAssertionHandler(atom handle,object userdata)
	c_proc(xSDL_SetAssertionHandler,{handle,userdata})
end procedure

export constant xSDL_GetDefaultAssertionHandler = define_c_func(sdl,"+SDL_GetDefaultAssertionHandler",{},C_POINTER)

public function SDL_GetDefaultAssertionHandler()
	return c_func(xSDL_GetDefaultAssertionHandler,{})
end function

export constant xSDL_GetAssertionHandler = define_c_func(sdl,"+SDL_GetAssertionHandler",{C_POINTER},C_POINTER)

public function SDL_GetAssertionHandler(object puserdata)
	return c_func(xSDL_GetAssertionHandler,{puserdata})
end function

export constant xSDL_GetAssertionReport = define_c_func(sdl,"+SDL_GetAssertionReport",{},C_POINTER)

public function SDL_GetAssertionReport()
	return c_func(xSDL_GetAssertionReport,{})
end function

export constant xSDL_ResetAssertionReport = define_c_proc(sdl,"+SDL_ResetAssertionReport",{})

public procedure SDL_ResetAssertionReport()
	c_proc(xSDL_ResetAssertionReport,{})
end procedure
­26.17