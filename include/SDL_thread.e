include std/ffi.e
include std/machine.e

include SDL3.e

--SDL_Thread C_POINTER (struct)
--SDL_threadID - C_ULONG
--SDL_TLSID -- C_UINT

public enum type SDL_ThreadPriority
	SDL_THREAD_PRIORITY_LOW = 0,
	SDL_THREAD_PRIORITY_NORMAL,
	SDL_THREAD_PRIORITY_HIGH,
	SDL_THREAD_PRIORITY_TIME_CRITICAL
end type

--Only use these functions if you need them, you can un-comment them
--you will need to comment the other ones out to avoid same-name errors

--export constant xSDL_CreateThread = define_c_func(sdl,"+SDL_CreateThread",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_POINTER)

--public function SDL_CreateThread(atom fn,sequence name,object data,atom begin_t,atom end_t)
--	return c_func(xSDL_CreateThread,{fn,name,data,begin_t,end_t})
--end function

--export constant xSDL_CreateThreadWithStackSize = define_c_func(sdl,"+SDL_CreateThreadWithStackSize",{C_POINTER,C_STRINg,C_SIZE_T,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

--public function SDL_CreateThreadWithStackSize(atom fn,sequence name,atom size,object data,atom begin_t,atom end_t)
--	return c_func(xSDL_CreateThreadWithStackSize,{fn,name,size,data,begin_t,end_t})
--end function

export constant xSDL_CreateThread = define_c_func(sdl,"+SDL_CreateThread",{C_POINTER,C_STRING,C_POINTER},C_POINTER)

public function SDL_CreateThread(atom fun,sequence name,object data)
	return c_func(xSDL_CreateThread,{fun,name,data})
end function

export constant xSDL_CreateThreadWithStackSize = define_c_func(sdl,"+SDL_CreateThreadWithStackSize",{C_POINTER,C_STRING,C_SIZE_T,C_POINTER},C_POINTER)

public function SDL_CreateThreadWithStackSize(atom fn,sequence name,atom size,object data)
	return c_func(xSDL_CreateThreadWithStackSize,{fn,name,size,data})
end function

export constant xSDL_GetThreadName = define_c_func(sdl,"+SDL_GetThreadName",{C_POINTER},C_STRING)

public function SDL_GetThreadName(atom thread)
	return c_func(xSDL_GetThreadName,{thread})
end function

export constant xSDL_ThreadID = define_c_func(sdl,"+SDL_ThreadID",{},C_ULONG)

public function SDL_ThreadID()
	return c_func(xSDL_ThreadID,{})	
end function

export constant xSDL_SetThreadPriority = define_c_func(sdl,"+SDL_SetThreadPriority",{C_INT},C_INT)

public function SDL_SetThreadPriority(atom priority)
	return c_func(xSDL_SetThreadPriority,{priority})
end function

export constant xSDL_WaitThread = define_c_proc(sdl,"+SDL_WaitThread",{C_POINTER,C_POINTER})

public procedure SDL_WaitThread(atom thread,atom status)
	c_proc(xSDL_WaitThread,{thread,status})
end procedure

export constant xSDL_DetachThread = define_c_proc(sdl,"+SDL_DetachThread",{C_POINTER})

public procedure SDL_DetachThread(atom thread)
	c_proc(xSDL_DetachThread,{thread})
end procedure

export constant xSDL_TLSCreate = define_c_func(sdl,"+SDL_TLSCreate",{},C_UINT)

public function SDL_TLSCreate()
	return c_func(xSDL_TLSCreate,{})
end function

export constant xSDL_TLSGet = define_c_func(sdl,"+SDL_TLSGet",{C_UINT},C_POINTER)

public function SDL_TLSGet(atom id)
	return c_func(xSDL_TLSGet,{id})
end function

export constant xSDL_TLSSet = define_c_func(sdl,"+SDL_TLSSet",{C_UINT,C_POINTER,C_POINTER},C_INT)

public function SDL_TLSSet(atom id,object val,object des)
	return c_func(xSDL_TLSSet,{id,val,des})
end function

export constant xSDL_TLSCleanup = define_c_proc(sdl,"+SDL_TLSCleanup",{})

public procedure SDL_TLSCleanup()
	c_proc(xSDL_TLSCleanup,{})
end procedure
­95.27
