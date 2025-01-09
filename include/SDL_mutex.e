include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_MUTEX_TIMEDOUT = 1

public constant SDL_MUTEX_MAXWAIT = -1

export constant xSDL_CreateMutex = define_c_func(sdl,"+SDL_CreateMutex",{},C_POINTER)

public function SDL_CreateMutex()
	return c_func(xSDL_CreateMutex,{})
end function

export constant xSDL_LockMutex = define_c_func(sdl,"+SDL_LockMutex",{C_POINTER},C_INT)

public function SDL_LockMutex(atom mutex)
	return c_func(xSDL_LockMutex,{mutex})
end function

export constant xSDL_TryLockMutex = define_c_func(sdl,"+SDL_TryLockMutex",{C_POINTER},C_INT)

public function SDL_TryLockMutex(atom mutex)
	return c_func(xSDL_TryLockMutex,{mutex})
end function

export constant xSDL_UnlockMutex = define_c_func(sdl,"+SDL_UnlockMutex",{C_POINTER},C_INT)

public function SDL_UnlockMutex(atom mutex)
	return c_func(xSDL_UnlockMutex,{mutex})
end function

export constant xSDL_DestroyMutex = define_c_proc(sdl,"+SDL_DestroyMutex",{C_POINTER})

public procedure SDL_DestroyMutex(atom mutex)
	c_proc(xSDL_DestroyMutex,{mutex})
end procedure

public constant SDL_RWLOCK_TIMEDOUT = SDL_MUTEX_TIMEDOUT

export constant xSDL_CreateRWLock = define_c_func(sdl,"+SDL_CreateRWLock",{},C_POINTER)

public function SDL_CreateRWLock()
	return c_func(xSDL_CreateRWLock,{})
end function

export constant xSDL_LockRWLockForReading = define_c_func(sdl,"+SDL_LockRWLockForReading",{C_POINTER},C_INT)

public function SDL_LockRWLockForReading(atom rwlock)
	return c_func(xSDL_LockRWLockForReading,{rwlock})
end function

export constant xSDL_LockRWLockForWriting = define_c_func(sdl,"+SDL_LockRWLockForWriting",{C_POINTER},C_INT)

public function SDL_LockRWLockForWriting(atom rwlock)
	return c_func(xSDL_LockRWLockForWriting,{rwlock})
end function

export constant xSDL_TryLockRWLockForReading = define_c_func(sdl,"+SDL_TryLockRWLockForReading",{C_POINTER},C_INT)

public function SDL_TryLockRWLockForReading(atom rwlock)
	return c_func(xSDL_TryLockRWLockForReading,{rwlock})
end function

export constant xSDL_TryLockRWLockForWriting = define_c_func(sdl,"+SDL_TryLockRWLockForWriting",{C_POINTER},C_INT)

public function SDL_TryLockRWLockForWriting(atom rwlock)
	return c_func(xSDL_TryLockRWLockForWriting,{rwlock})
end function

export constant xSDL_UnlockRWLock = define_c_func(sdl,"+SDL_UnlockRWLock",{C_POINTER},C_INT)

public function SDL_UnlockRWLock(atom rwlock)
	return c_func(xSDL_UnlockRWLock,{rwlock})
end function

export constant xSDL_DestroyRWLock = define_c_proc(sdl,"+SDL_DestroyRWLock",{C_POINTER})

public procedure SDL_DestroyRWLock(atom rwlock)
	 c_proc(xSDL_DestroyRWLock,{rwlock})
end procedure

export constant xSDL_CreateSemaphore = define_c_func(sdl,"+SDL_CreateSemaphore",{C_UINT32},C_POINTER)

public function SDL_CreateSemaphore(atom init_value)
	return c_func(xSDL_CreateSemaphore,{init_value})
end function

export constant xSDL_DestroySemaphore = define_c_proc(sdl,"+SDL_DestroySemaphore",{C_POINTER})

public procedure SDL_DestroySemaphore(atom sem)
	c_proc(xSDL_DestroySemaphore,{sem})
end procedure

export constant xSDL_WaitSemaphore = define_c_func(sdl,"+SDL_WaitSemaphore",{C_POINTER},C_INT)

public function SDL_WaitSemaphore(atom sem)
	return c_func(xSDL_WaitSemaphore,{sem})
end function

export constant xSDL_TryWaitSemaphore = define_c_func(sdl,"+SDL_TryWaitSemaphore",{C_POINTER},C_INT)

public function SDL_TryWaitSemaphore(atom sem)
	return c_func(xSDL_TryWaitSemaphore,{sem})
end function

export constant xSDL_WaitSemaphoreTimeout = define_c_func(sdl,"+SDL_WaitSemaphoreTimeout",{C_POINTER,C_INT32},C_INT)

public function SDL_WaitSemaphoreTimeout(atom sem,atom timeoutMS)
	return c_func(xSDL_WaitSemaphoreTimeout,{sem,timeoutMS})
end function

export constant xSDL_PostSemaphore = define_c_func(sdl,"+SDL_PostSemaphore",{C_POINTER},C_INT)

public function SDL_PostSemaphore(atom sem)
	return c_func(xSDL_PostSemaphore,{sem})
end function

export constant xSDL_GetSemaphoreValue = define_c_func(sdl,"+SDL_GetSemaphoreValue",{C_POINTER},C_UINT32)

public function SDL_GetSemaphoreValue(atom sem)
	return c_func(xSDL_GetSemaphoreValue,{sem})
end function

export constant xSDL_CreateCondition = define_c_func(sdl,"+SDL_CreateCondition",{},C_POINTER)

public function SDL_CreateCondition()
	return c_func(xSDL_CreateCondition,{})
end function

export constant xSDL_DestroyCondition = define_c_proc(sdl,"+SDL_DestroyCondition",{C_POINTER})

public procedure SDL_DestroyCondition(atom cond)
	c_proc(xSDL_DestroyCondition,{cond})
end procedure

export constant xSDL_SignalCondition = define_c_func(sdl,"+SDL_SignalCondition",{C_POINTER},C_INT)

public function SDL_SignalCondition(atom cond)
	return c_func(xSDL_SignalCondition,{cond})
end function

export constant xSDL_BroadcastCondition = define_c_func(sdl,"+SDL_BroadcastCondition",{C_POINTER},C_INT)

public function SDL_BroadcastCondition(atom cond)
	return c_func(xSDL_BroadcastCondition,{cond})
end function

export constant xSDL_WaitCondition = define_c_func(sdl,"+SDL_WaitCondition",{C_POINTER,C_POINTER},C_INT)

public function SDL_WaitCondition(atom cond,atom mutex)
	return c_func(xSDL_WaitCondition,{cond,mutex})
end function

export constant xSDL_WaitConditionTimeout = define_c_func(sdl,"+SDL_WaitConditionTimeout",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_WaitConditionTimeout(atom cond,atom mutex,atom timeoutMS)
	return c_func(xSDL_WaitConditionTimeout,{cond,mutex,timeoutMS})
end function

public enum type SDL_InitStatus
	SDL_INIT_STATUS_UNINITIALIZED = 0,
	SDL_INIT_STATUS_INITIALZING,
	SDL_INIT_STATUS_INITIALIZED,
	SDL_INIT_STATUS_UNINITIALIZING
end type

public constant SDL_InitState = define_c_struct({
	C_POINTER, --status
	C_POINTER, --thread
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

public procedure SDL_SetSetInitialized(atom state,atom init)
	c_proc(xSDL_SetInitialized,{state,init})
end procedure
­190.13