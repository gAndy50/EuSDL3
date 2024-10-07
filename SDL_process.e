include std/ffi.e
include std/machine.e

include SDL3.e

include SDL_error.e

public constant xSDL_CreateProcess = define_c_func(sdl,"+SDL_CreateProcess",{C_STRING,C_POINTER,C_BOOL},C_POINTER)

public function SDL_CreateProcess(sequence name,object args,atom pipe)
	return c_func(xSDL_CreateProcess,{name,args,pipe})
end function

public enum type SDL_ProcessIO
	SDL_PROCESS_STDIO_INHERITED = 0,
	SDL_PROCESS_STDIO_NULL,
	SDL_PROCESS_STDIO_APP,
	SDL_PROCESS_STDIO_REDIRECT
end type

public constant xSDL_CreateProcessWithProperties = define_c_func(sdl,"+SDL_CreateProcessWithProperties",{C_UINT32},C_POINTER)

public function SDL_CreateProcessWithProperties(atom props)
	return c_func(xSDL_CreateProcessWithProperties,{props})
end function

public constant SDL_PROP_PROCESS_CREATE_ARGS_POINTER      =          "SDL.process.create.args"
public constant SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER =        "SDL.process.create.environment"
public constant SDL_PROP_PROCESS_CREATE_STDIN_NUMBER        =        "SDL.process.create.stdin_option"
public constant SDL_PROP_PROCESS_CREATE_STDIN_POINTER        =       "SDL.process.create.stdin_source"
public constant SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER        =       "SDL.process.create.stdout_option"
public constant SDL_PROP_PROCESS_CREATE_STDOUT_POINTER       =       "SDL.process.create.stdout_source"
public constant SDL_PROP_PROCESS_CREATE_STDERR_NUMBER        =       "SDL.process.create.stderr_option"
public constant SDL_PROP_PROCESS_CREATE_STDERR_POINTER        =      "SDL.process.create.stderr_source"
public constant SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN =   "SDL.process.create.stderr_to_stdout"

public constant xSDL_GetProcessProperties = define_c_func(sdl,"+SDL_GetProcessProperties",{C_POINTER},C_UINT32)

public function SDL_GetProcessProperties(atom process)
	return c_func(xSDL_GetProcessProperties,{process})
end function

public constant SDL_PROP_PROCESS_PID_NUMBER  =   "SDL.process.pid"
public constant SDL_PROP_PROCESS_STDIN_POINTER =  "SDL.process.stdin"
public constant SDL_PROP_PROCESS_STDOUT_POINTER = "SDL.process.stdout"
public constant SDL_PROP_PROCESS_STDERR_POINTER = "SDL.process.stderr"

public constant xSDL_ReadProcess = define_c_func(sdl,"+SDL_ReadProcess",{C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_ReadProcess(atom process,atom datasize,atom exitcode)
	return c_func(xSDL_ReadProcess,{process,datasize,exitcode})
end function

public constant xSDL_WriteProcess = define_c_func(sdl,"+SDL_WriteProcess",{C_POINTER,C_POINTER,C_SIZE_T,C_BOOL},C_BOOL)

public function SDL_WriteProcess(atom process,object ptr,atom size,atom closeio)
	return c_func(xSDL_WriteProcess,{process,ptr,size,closeio})
end function

public constant xSDL_KillProcess = define_c_func(sdl,"+SDL_KillProcess",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_KillProcess(atom process,atom force)
	return c_func(xSDL_KillProcess,{process,force})
end function

public constant xSDL_WaitProcess = define_c_func(sdl,"+SDL_WaitProcess",{C_POINTER,C_BOOL,C_POINTER},C_BOOL)

public function SDL_WaitProcess(atom process,atom block,atom exitcode)
	return c_func(xSDL_WaitProcess,{process,block,exitcode})
end function

public constant xSDL_DestroyProcess = define_c_proc(sdl,"+SDL_DestroyProcess",{C_POINTER})

public procedure SDL_DestroyProcess(atom process)
	c_proc(xSDL_DestroyProcess,{process})
end procedure
­5.0