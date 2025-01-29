include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_atomic.e
include SDL_error.e
include SDL_thread.e

public constant xSDL_CreateMutex = define_c_func(sdl,"+SDL_CreateMutex",{},C_POINTER)

public function SDL_CreateMutex()
	return c_func(xSDL_CreateMutex,{})
end function

public constant xSDL_LockMutex = define_c_proc(sdl,"+SDL_LockMutex",{C_POINTER})

public procedure SDL_LockMutex(atom mutex)
	c_proc(xSDL_LockMutex,{mutex})
end procedure

public constant xSDL_TryLockMutex = define_c_func(sdl,"+SDL_TryLockMutex",{C_POINTER},C_BOOL)

public function SDL_TryLockMutex(atom mutex)
	return c_func(xSDL_TryLockMutex,{mutex})
end function

public constant xSDL_UnlockMutex = define_c_proc(sdl,"+SDL_UnlockMutex",{C_POINTER})

public procedure SDL_UnlockMutex(atom mutex)
	c_proc(xSDL_UnlockMutex,{mutex})
end procedure

public constant xSDL_DestroyMutex = define_c_proc(sdl,"+SDL_DestroyMutex",{C_POINTER})

public procedure SDL_DestroyMutex(atom mutex)
	c_proc(xSDL_DestroyMutex,{mutex})
end procedure

public constant xSDL_CreateRWLock = define_c_func(sdl,"+SDL_CreateRWLock",{},C_POINTER)

public function SDL_CreateRWLock()
	return c_func(xSDL_CreateRWLock,{})
end function

public constant xSDL_LockRWLockForReading = define_c_proc(sdl,"+SDL_LockRWLockForReading",{C_POINTER})

public procedure SDL_LockRWLockForReading(atom rwlock)
	c_proc(xSDL_LockRWLockForReading,{rwlock})
end procedure

public constant xSDL_LockRWLockForWriting = define_c_proc(sdl,"+SDL_LockRWLockForWriting",{C_POINTER})

public procedure SDL_LockRWLockForWriting(atom rwlock)
	c_proc(xSDL_LockRWLockForWriting,{rwlock})
end procedure

public constant xSDL_TryLockRWLockForReading = define_c_func(sdl,"+SDL_TryLockRWLockForReading",{C_POINTER},C_BOOL)

public function SDL_TryLockRWLockForReading(atom rwlock)
	return c_func(xSDL_TryLockRWLockForReading,{rwlock})
end function

public constant xSDL_TryLockRWLockForWriting = define_c_func(sdl,"+SDL_TryLockRWLockForWriting",{C_POINTER},C_BOOL)

public function SDL_TryLockRWLockForWriting(atom rwlock)
	return c_func(xSDL_TryLockRWLockForWriting,{rwlock})
end function

public constant xSDL_UnlockRWLock = define_c_proc(sdl,"+SDL_UnlockRWLock",{C_POINTER})

public procedure SDL_UnlockRWLock(atom rwlock)
	c_proc(xSDL_UnlockRWLock,{rwlock})
end procedure

public constant xSDL_DestroyRWLock = define_c_proc(sdl,"+SDL_DestroyRWLock",{C_POINTER})

public procedure SDL_DestroyRWLock(atom rwlock)
	c_proc(xSDL_DestroyRWLock,{rwlock})
end procedure

public constant xSDL_CreateSemaphore = define_c_func(sdl,"+SDL_CreateSemaphore",{C_UINT32},C_POINTER)

public function SDL_CreateSemaphore(atom initial_val)
	return c_func(xSDL_CreateSemaphore,{initial_val})
end function

public constant xSDL_DestroySemaphore = define_c_proc(sdl,"+SDL_DestroySemaphore",{C_POINTER})

public procedure SDL_DestroySemaphore(atom sem)
	c_proc(xSDL_DestroySemaphore,{sem})
end procedure

public constant xSDL_WaitSemaphore = define_c_proc(sdl,"+SDL_WaitSemaphore",{C_POINTER})

public procedure SDL_WaitSemaphore(atom sem)
	c_proc(xSDL_WaitSemaphore,{sem})
end procedure

public constant xSDL_TryWaitSemaphore = define_c_func(sdl,"+SDL_TryWaitSemaphore",{C_POINTER},C_BOOL)

public function SDL_TryWaitSemaphore(atom sem)
	return c_func(xSDL_TryWaitSemaphore,{sem})
end function

public constant xSDL_WaitSemaphoreTimeout = define_c_func(sdl,"+SDL_WaitSemaphoreTimeout",{C_POINTER,C_INT32},C_BOOL)

public function SDL_WaitSemaphoreTimeout(atom sem,atom timeoutMS)
	return c_func(xSDL_WaitSemaphoreTimeout,{sem,timeoutMS})
end function

public constant xSDL_SignalSemaphore = define_c_proc(sdl,"+SDL_SignalSemaphore",{C_POINTER})

public procedure SDL_SignalSemaphore(atom sem)
	c_proc(xSDL_SignalSemaphore,{sem})
end procedure

public constant xSDL_GetSemaphoreValue = define_c_func(sdl,"+SDL_GetSemaphoreValue",{C_POINTER},C_UINT32)

public function SDL_GetSemaphoreValue(atom sem)
	return c_func(xSDL_GetSemaphoreValue,{sem})
end function

public constant xSDL_CreateCondition = define_c_func(sdl,"+SDL_CreateCondition",{},C_POINTER)

public function SDL_CreateCondition()
	return c_func(xSDL_CreateCondition,{})
end function

public constant xSDL_DestroyCondition = define_c_proc(sdl,"+SDL_DestroyCondition",{C_POINTER})

public procedure SDL_DestroyCondition(atom cond)
	c_proc(xSDL_DestroyCondition,{cond})
end procedure

public constant xSDL_SignalCondition = define_c_proc(sdl,"+SDL_SignalCondition",{C_POINTER})

public procedure SDL_SignalCondition(atom cond)
	c_proc(xSDL_SignalCondition,{cond})
end procedure

public constant xSDL_BroadcastCondition = define_c_proc(sdl,"+SDL_BroadcastCondition",{C_POINTER})

public procedure SDL_BroadcastCondition(atom cond)
	c_proc(xSDL_BroadcastCondition,{cond})
end procedure

public constant xSDL_WaitCondition = define_c_proc(sdl,"+SDL_WaitCondition",{C_POINTER,C_POINTER})

public procedure SDL_WaitCondition(atom cond,atom mutex)
	c_proc(xSDL_WaitCondition,{cond,mutex})
end procedure

public constant xSDL_WaitConditionTimeout = define_c_func(sdl,"+SDL_WaitConditionTimeout",{C_POINTER,C_POINTER,C_INT32},C_BOOL)

public function SDL_WaitConditionTimeout(atom cond,atom mutex,atom timeoutMS)
	return c_func(xSDL_WaitConditionTimeout,{cond,mutex,timeoutMS})
end function

public enum type SDL_InitStatus
	SDL_INIT_STATUS_UNINITIALIZED = 0,
	SDL_INIT_STATUS_INITIALIZING,
	SDL_INIT_STATUS_INITIALIZED,
	SDL_INIT_STATUS_UNINITIALIZING
end type

public constant SDL_InitState = define_c_struct({
	C_UINT32, --status
	C_UINT32, --thread
	C_POINTER --reserved
})

public constant xSDL_ShouldInit = define_c_func(sdl,"+SDL_ShouldInit",{C_POINTER},C_BOOL)

public function SDL_ShouldInit(atom state)
	return c_func(xSDL_ShouldInit,{state})
end function

public constant xSDL_ShouldQuit = define_c_func(sdl,"+SDL_ShouldQuit",{C_POINTER},C_BOOL)

public function SDL_ShouldQuit(atom state)
	return c_func(xSDL_ShouldQuit,{state})
end function

public constant xSDL_SetInitialized = define_c_proc(sdl,"+SDL_SetInitialized",{C_POINTER,C_BOOL})

public procedure SDL_SetInitialized(atom state,atom init)
	c_proc(xSDL_SetInitialized,{state,init})
end procedure
­188.41