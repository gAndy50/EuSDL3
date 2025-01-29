include std/ffi.e
include std/machine.e

include SDL.e

public enum type SDL_AssertState
	SDL_ASSERTION_RETRY = 0,
	SDL_ASSERTION_BREAK,
	SDL_ASSERTION_ABORT,
	SDL_ASSERTION_IGNORE,
	SDL_ASSERTION_ALWAYS_IGNORE
end type

public constant SDL_AssertData = define_c_struct({
	C_BOOL, --always_ignore
	C_UINT, --trigger_count
	C_STRING, --condition
	C_STRING, --filename
	C_INT, --linenum
	C_STRING, --function
	C_POINTER --next
})

public constant xSDL_ReportAssertion = define_c_func(sdl,"+SDL_ReportAssertion",{C_POINTER,C_STRING,C_STRING,C_INT},C_INT)

public function SDL_ReportAssertion(atom data,sequence func,sequence file,atom line)
	return c_func(xSDL_ReportAssertion,{data,func,file,line})
end function

public constant xSDL_SetAssertionHandler = define_c_proc(sdl,"+SDL_SetAssertionHandler",{C_POINTER,C_POINTER})

public procedure SDL_SetAssertionHandler(atom handler,atom userdata)
	c_proc(xSDL_SetAssertionHandler,{handler,userdata})
end procedure

public constant xSDL_GetDefaultAssertionHandler = define_c_func(sdl,"+SDL_GetDefaultAssertionHandler",{},C_POINTER)

public function SDL_GetDefaultAssertionHandler()
	return c_func(xSDL_GetDefaultAssertionHandler,{})
end function

public constant xSDL_GetAssertionHandler = define_c_func(sdl,"+SDL_GetAssertionHandler",{C_POINTER},C_POINTER)

public function SDL_GetAssertionHandler(atom userdata)
	return c_func(xSDL_GetAssertionHandler,{userdata})
end function

public constant xSDL_GetAssertionReport = define_c_func(sdl,"+SDL_GetAssertionReport",{},C_POINTER)

public function SDL_GetAssertionReport()
	return c_func(xSDL_GetAssertionReport,{})
end function

public constant xSDL_ResetAssertionReport = define_c_proc(sdl,"+SDL_ResetAssertionReport",{})

public procedure SDL_ResetAssertionReport()
	c_proc(xSDL_ResetAssertionReport,{})
end procedure
­57.37