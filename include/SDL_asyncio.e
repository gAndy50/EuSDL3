include std/ffi.e
include std/machine.e

include SDL3.e

public enum type SDL_AsyncIOTaskType
	SDL_ASYNCIO_TASK_READ = 0,
	SDL_ASYNCIO_TASK_WRITE,
	SDL_ASYNCIO_TASK_CLOSE
end type

public enum type SDL_ASyncIOResult
	SDL_ASYNCIO_COMPLETE = 0,
	SDL_ASYNCIO_FAILURE,
	SDL_ASYNCIO_CANCELED
end type

public constant SDL_AsyncIOOutcome = define_c_struct({
	C_POINTER, --asyncio
	C_INT, --tasktype
	C_INT, --result
	C_POINTER, --buffer
	C_UINT64, --offset
	C_UINT64, --bytes_requested
	C_UINT64, --bytes_transferred
	C_POINTER --userdata
})

public constant xSDL_AsyncIOFromFile = define_c_func(sdl,"+SDL_AsyncIOFromFile",{C_STRING,C_STRING},C_POINTER)

public function SDL_AsyncIOFromFile(sequence file,sequence mode)
	return c_func(xSDL_AsyncIOFromFile,{file,mode})
end function

public constant xSDL_GetAsyncIOSize = define_c_func(sdl,"+SDL_GetAsyncIOSize",{C_POINTER},C_INT64)

public function SDL_GetAsyncIOSize(atom sync)
	return c_func(xSDL_GetAsyncIOSize,{sync})
end function

public constant xSDL_ReadAsyncIO = define_c_func(sdl,"+SDL_ReadAsyncIO",{C_POINTER,C_POINTER,C_UINT64,C_UINT64,C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadAsyncIO(atom sync,atom ptr,atom offset,atom size,atom queue,atom userdata)
	return c_func(xSDL_ReadAsyncIO,{sync,ptr,offset,size,queue,userdata})
end function

public constant xSDL_WriteAsyncIO = define_c_func(sdl,"+SDL_WriteAsyncIO",{C_POINTER,C_POINTER,C_UINT64,C_UINT64,C_POINTER,C_POINTER},C_BOOL)

public function SDL_WriteAsyncIO(atom sync,atom ptr,atom offset,atom size,atom queue,atom userdata)
	return c_func(xSDL_WriteAsyncIO,{sync,ptr,offset,size,queue,userdata})
end function

public constant xSDL_CloseAsyncIO = define_c_func(sdl,"+SDL_CloseAsyncIO",{C_POINTER,C_BOOL,C_POINTER,C_POINTER},C_BOOL)

public function SDL_CloseAsyncIO(atom sync,atom _flush,atom queue,atom userdata)
	return c_func(xSDL_CloseAsyncIO,{sync,_flush,queue,userdata})
end function

public constant xSDL_CreateAsyncIOQueue = define_c_func(sdl,"+SDL_CreateAsyncIOQueue",{},C_POINTER)

public function SDL_CreateAsyncIOQueue()
	return c_func(xSDL_CreateAsyncIOQueue,{})
end function

public constant xSDL_DestroyAsyncIOQueue = define_c_proc(sdl,"+SDL_DestroyAsyncIOQueue",{C_POINTER})

public procedure SDL_DestroyAsyncIOQueue(atom queue)
	c_proc(xSDL_DestroyAsyncIOQueue,{queue})
end procedure

public constant xSDL_GetAsyncIOResult = define_c_func(sdl,"+SDL_GetAsyncIOResult",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetAsyncIOResult(atom queue,atom outcome)
	return c_func(xSDL_GetAsyncIOResult,{queue,outcome})
end function

public constant xSDL_WaitAsyncIOResult = define_c_func(sdl,"+SDL_WaitAsyncIOResult",{C_POINTER,C_POINTER,C_INT32},C_BOOL)

public function SDL_WaitAsyncIOResult(atom queue,atom outcome,atom timeoutMS)
	return c_func(xSDL_WaitAsyncIOResult,{queue,outcome,timeoutMS})
end function

public constant xSDL_SignalAsyncIOQueue = define_c_proc(sdl,"+SDL_SignalAsyncIOQueue",{C_POINTER})

public procedure SDL_SignalAsyncIOQueue(atom queue)
	c_proc(xSDL_SignalAsyncIOQueue,{queue})
end procedure

public constant xSDL_LoadFileAsync = define_c_func(sdl,"+SDL_LoadFileAsync",{C_STRING,C_POINTER,C_POINTER},C_BOOL)

public function SDL_LoadFileAsync(sequence file,atom queue,atom userdata)
	return c_func(xSDL_LoadFileAsync,{file,queue,userdata})
end function
­92.56