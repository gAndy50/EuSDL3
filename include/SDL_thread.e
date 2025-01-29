include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_properties.e

public enum type SDL_ThreadPriority
	SDL_THREAD_PRIORITY_LOW = 0,
	SDL_THREAD_PRIORITY_NORMAL,
	SDL_THREAD_PRIORITY_HIGH,
	SDL_THREAD_PRIORITY_TIME_CRITICAL
end type

public enum type SDL_ThreadState
	SDL_THREAD_UNKNOWN = 0,
	SDL_THREAD_ALIVE,
	SDL_THREAD_DETACHED,
	SDL_THREAD_COMPLETE
end type

public constant xSDL_CreateThread = define_c_func(sdl,"+SDL_CreateThread",{C_POINTER,C_STRING,C_POINTER},C_POINTER)

public function SDL_CreateThread(object fn,sequence name,atom data)
	return c_func(xSDL_CreateThread,{fn,name,data})
end function

public constant xSDL_CreateThreadWithProperties = define_c_func(sdl,"+SDL_CreateThreadWithProperties",{C_UINT32},C_POINTER)

public function SDL_CreateThreadWithProperties(atom props)
	return c_func(xSDL_CreateThreadWithProperties,{props})
end function

public constant SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER  =         "SDL.thread.create.entry_function",
 SDL_PROP_THREAD_CREATE_NAME_STRING                     =        "SDL.thread.create.name",
 SDL_PROP_THREAD_CREATE_USERDATA_POINTER                =        "SDL.thread.create.userdata",
 SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER                =        "SDL.thread.create.stacksize"
 
public constant xSDL_CreateThreadRuntime = define_c_func(sdl,"+SDL_CreateThreadRuntime",{C_POINTER,C_STRING,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateThreadRuntime(object fn,sequence name,atom data,object beginthread,object endthread)
	return c_func(xSDL_CreateThreadRuntime,{fn,name,data,beginthread,endthread})
end function

public constant xSDL_CreateThreadWithPropertiesRuntime = define_c_func(sdl,"+SDL_CreateThreadWithPropertiesRuntime",{C_UINT32,C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateThreadWithPropertiesRuntime(atom props,object beginthread,object endthread)
	return c_func(xSDL_CreateThreadWithPropertiesRuntime,{props,beginthread,endthread})
end function

--public constant SDL_PROP_THREAD_CREATE_ENTRY_FUNCTION_POINTER  =         "SDL.thread.create.entry_function",
-- SDL_PROP_THREAD_CREATE_NAME_STRING                     =        "SDL.thread.create.name",
-- SDL_PROP_THREAD_CREATE_USERDATA_POINTER                =        "SDL.thread.create.userdata",
-- SDL_PROP_THREAD_CREATE_STACKSIZE_NUMBER                =        "SDL.thread.create.stacksize"
 
public constant xSDL_GetThreadName = define_c_func(sdl,"+SDL_GetThreadName",{C_POINTER},C_STRING)

public function SDL_GetThreadName(atom thread)
	return c_func(xSDL_GetThreadName,{thread})
end function

public constant xSDL_GetCurrentThreadID = define_c_func(sdl,"+SDL_GetCurrentThreadID",{},C_INT)

public function SDL_GetCurrentThreadID()
	return c_func(xSDL_GetCurrentThreadID,{})
end function

public constant xSDL_GetThreadID = define_c_func(sdl,"+SDL_GetThreadID",{C_POINTER},C_INT)

public function SDL_GetThreadID(atom thread)
	return c_func(xSDL_GetThreadID,{thread})
end function

public constant xSDL_SetCurrentThreadPriority = define_c_func(sdl,"+SDL_SetCurrentThreadPriority",{C_INT},C_BOOL)

public function SDL_SetCurrentThreadPriority(SDL_ThreadPriority priority)
	return c_func(xSDL_SetCurrentThreadPriority,{priority})
end function

public constant xSDL_WaitThread = define_c_proc(sdl,"+SDL_WaitThread",{C_POINTER,C_POINTER})

public procedure SDL_WaitThread(atom thread,atom status)
	c_proc(xSDL_WaitThread,{thread,status})
end procedure

public constant xSDL_GetThreadState = define_c_func(sdl,"+SDL_GetThreadState",{C_POINTER},C_INT)

public function SDL_GetThreadState(atom thread)
	return c_func(xSDL_GetThreadState,{thread})
end function

public constant xSDL_DetachThread = define_c_proc(sdl,"+SDL_DetachThread",{C_POINTER})

public procedure SDL_DetachThread(atom thread)
	c_proc(xSDL_DetachThread,{thread})
end procedure

public constant xSDL_GetTLS = define_c_func(sdl,"+SDL_GetTLS",{C_POINTER},C_POINTER)

public function SDL_GetTLS(atom id)
	return c_func(xSDL_GetTLS,{id})
end function

public constant xSDL_SetTLS = define_c_func(sdl,"+SDL_SetTLS",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetTLS(atom id,atom val,object destructor)
	return c_func(xSDL_SetTLS,{id,val,destructor})
end function

public constant xSDL_CleanupTLS = define_c_proc(sdl,"+SDL_CleanupTLS",{})

public procedure SDL_CleanupTLS()
	c_proc(xSDL_CleanupTLS,{})
end procedure
­55.2