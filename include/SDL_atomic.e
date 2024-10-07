include std/ffi.e
include std/machine.e

include SDL3.e

--SDL_SpinLock - C_INT

export constant xSDL_AtomicTryLock = define_c_func(sdl,"+SDL_AtomicTryLock",{C_POINTER},C_BOOL)

public function SDL_AtomicTryLock(atom lock)
	return c_func(xSDL_AtomicTryLock,{lock})
end function

export constant xSDL_AtomicLock = define_c_proc(sdl,"+SDL_AtomicLock",{C_POINTER})

public procedure SDL_AtomicLock(atom lock)
	c_proc(xSDL_AtomicLock,{lock})
end procedure

export constant xSDL_AtomicUnlock = define_c_proc(sdl,"+SDL_AtomicUnlock",{C_POINTER})

public procedure SDL_AtomicUnlock(atom lock)
	c_proc(xSDL_AtomicUnlock,{lock})
end procedure

export constant xSDL_MemoryBarrierReleaseFunction = define_c_proc(sdl,"+SDL_MemoryBarrierReleaseFunction",{})

public procedure SDL_MemoryBarrierReleaseFunction()
	c_proc(xSDL_MemoryBarrierReleaseFunction,{})
end procedure

--SDL_AtomicInt typedefstruct {int value}

export constant xSDL_AtomicCAS = define_c_func(sdl,"+SDL_AtomicCAS",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_AtomicCAS(atom a,atom old,atom new)
	return c_func(xSDL_AtomicCAS,{a,old,new})
end function

export constant xSDL_AtomicSet = define_c_func(sdl,"+SDL_AtomicSet",{C_POINTER,C_INT},C_INT)

public function SDL_AtomicSet(atom a,atom v)
	return c_func(xSDL_AtomicSet,{a,v})
end function

export constant xSDL_AtomicGet = define_c_func(sdl,"+SDL_AtomicGet",{C_POINTER},C_INT)

public function SDL_AtomicGet(atom a)
	return c_func(xSDL_AtomicGet,{a})
end function

export constant xSDL_AtomicAdd = define_c_func(sdl,"+SDL_AtomicAdd",{C_POINTER,C_INT},C_INT)

public function SDL_AtomicAdd(atom a,atom v)
	return c_func(xSDL_AtomicAdd,{a,v})
end function

export constant xSDL_AtomicCASPtr = define_c_func(sdl,"+SDL_AtomicCASPtr",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_AtomicCASPtr(atom a,atom old,atom new)
	return c_func(xSDL_AtomicCASPtr,{a,old,new})
end function

export constant xSDL_AtomicSetPtr = define_c_func(sdl,"+SDL_AtomicSetPtr",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_AtomicSetPtr(atom a,atom v)
	return c_func(xSDL_AtomicSetPtr,{a,v})
end function

export constant xSDL_AtomicGetPtr = define_c_func(sdl,"+SDL_ATomicGetPtr",{C_POINTER},C_POINTER)

public function SDL_AtomicGetPtr(atom a)
	return c_func(xSDL_AtomicGetPtr,{a})
end function
­73.37
