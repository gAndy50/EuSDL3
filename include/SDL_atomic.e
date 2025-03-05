include std/ffi.e
include std/machine.e

include SDL.e

include SDL_stdinc.e

public constant SDL_SPINLOCK = C_INT

public constant xSDL_TryLockSpinlock = define_c_func(sdl,"+SDL_TryLockSpinlock",{C_POINTER},C_BOOL)

public function SDL_TryLockSpinlock(atom lock)
	return c_func(xSDL_TryLockSpinlock,{lock})
end function

public constant xSDL_LockSpinlock = define_c_proc(sdl,"+SDL_LockSpinlock",{C_POINTER})

public procedure SDL_LockSpinlock(atom lock)
	c_proc(xSDL_LockSpinlock,{lock})
end procedure

public constant xSDL_UnlockSpinlock = define_c_proc(sdl,"+SDL_UnlockSpinlock",{C_POINTER})

public procedure SDL_UnlockSpinlock(atom lock)
	c_proc(xSDL_UnlockSpinlock,{lock})
end procedure

public constant xSDL_MemoryBarrierReleaseFunction = define_c_proc(sdl,"+SDL_MemoryBarrierReleaseFunction",{})

public procedure SDL_MemoryBarrierReleaseFunction()
	c_proc(xSDL_MemoryBarrierReleaseFunction,{})
end procedure

public constant xSDL_MemoryBarrierAcquireFunction = define_c_proc(sdl,"+SDL_MemoryBarrierAcquireFunction",{})

public procedure SDL_MemoryBarrierAcquireFunction()
	c_proc(xSDL_MemoryBarrierAcquireFunction,{})
end procedure

public constant SDL_AtomicInt = define_c_struct({
	C_INT --value
})

public constant xSDL_CompareAndSwapAtomicInt = define_c_func(sdl,"+SDL_CompareAndSwapAtomicInt",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_CompareAndSwapAtomicInt(atom a,atom oldval,atom newval)
	return c_func(xSDL_CompareAndSwapAtomicInt,{a,oldval,newval})
end function

public constant xSDL_SetAtomicInt = define_c_func(sdl,"+SDL_SetAtomicInt",{C_POINTER,C_INT},C_INT)

public function SDL_SetAtomicInt(atom a,atom v)
	return c_func(xSDL_SetAtomicInt,{a,v})
end function

public constant xSDL_GetAtomicInt = define_c_func(sdl,"+SDL_GetAtomicInt",{C_POINTER},C_INT)

public function SDL_GetAtomicInt(atom a)
	return c_func(xSDL_GetAtomicInt,{a})
end function

public constant xSDL_AddAtomicInt = define_c_func(sdl,"+SDL_AddAtomicInt",{C_POINTER,C_INT},C_INT)

public function SDL_AddAtomicInt(atom a,atom v)
	return c_func(xSDL_AddAtomicInt,{a,v})
end function

public constant SDL_AtomicU32 = define_c_struct({
	C_UINT32 --value
})

public constant xSDL_CompareAndSwapAtomicU32 = define_c_func(sdl,"+SDL_CompareAndSwapAtomicU32",{C_POINTER,C_UINT32,C_UINT32},C_BOOL)

public function SDL_CompareAndSwapAtomicU32(atom a,atom oldval,atom newval)
	return c_func(xSDL_CompareAndSwapAtomicU32,{a,oldval,newval})
end function

public constant xSDL_SetAtomicU32 = define_c_func(sdl,"+SDL_SetAtomicU32",{C_POINTER,C_UINT32},C_UINT32)

public function SDL_SetAtomicU32(atom a,atom v)
	return c_func(xSDL_SetAtomicU32,{a,v})
end function

public constant xSDL_GetAtomicU32 = define_c_func(sdl,"+SDL_GetAtomicU32",{C_POINTER},C_UINT32)

public function SDL_GetAtomicU32(atom a)
	return c_func(xSDL_GetAtomicU32,{a})
end function

public constant xSDL_CompareAndSwapAtomicPointer = define_c_func(sdl,"+SDL_CompareAndSwapAtomicPointer",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_CompareAndSwapAtomicPointer(atom a,atom oldval,atom newval)
	return c_func(xSDL_CompareAndSwapAtomicPointer,{a,oldval,newval})
end function

public constant xSDL_SetAtomicPointer = define_c_func(sdl,"+SDL_SetAtomicPointer",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_SetAtomicPointer(atom a,atom v)
	return c_func(xSDL_SetAtomicPointer,{a,v})
end function

public constant xSDL_GetAtomicPointer = define_c_func(sdl,"+SDL_GetAtomicPointer",{C_POINTER},C_POINTER)

public function SDL_GetAtomicPointer(atom a)
	return c_func(xSDL_GetAtomicPointer,{a})
end function
­105.41