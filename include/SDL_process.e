include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_iostream.e
include SDL_properties.e

public constant xSDL_CreateProcess = define_c_func(sdl,"+SDL_CreateProcess",{C_STRING,C_BOOL},C_POINTER)

public function SDL_CreateProcess(sequence char_args,atom pipe_stdio)
	return c_func(xSDL_CreateProcess,{char_args,pipe_stdio})
end function

public enum type SDL_ProcessIO
	 SDL_PROCESS_STDIO_INHERITED = 0,    /**< The I/O stream is inherited from the application. */
    SDL_PROCESS_STDIO_NULL,         /**< The I/O stream is ignored. */
    SDL_PROCESS_STDIO_APP,          /**< The I/O stream is connected to a new SDL_IOStream that the application can read or write */
    SDL_PROCESS_STDIO_REDIRECT      /**< The I/O stream is redirected to an existing SDL_IOStream. */
end type

public constant xSDL_CreateProcessWithProperties = define_c_func(sdl,"+SDL_CreateProcessWithProperties",{C_UINT32},C_POINTER)

public function SDL_CreateProcessWithProperties(atom props)
	return c_func(xSDL_CreateProcessWithProperties,{props})
end function

public constant SDL_PROP_PROCESS_CREATE_ARGS_POINTER   =             "SDL.process.create.args",
 SDL_PROP_PROCESS_CREATE_ENVIRONMENT_POINTER    =     "SDL.process.create.environment",
SDL_PROP_PROCESS_CREATE_STDIN_NUMBER           =     "SDL.process.create.stdin_option",
 SDL_PROP_PROCESS_CREATE_STDIN_POINTER          =     "SDL.process.create.stdin_source",
 SDL_PROP_PROCESS_CREATE_STDOUT_NUMBER          =     "SDL.process.create.stdout_option",
 SDL_PROP_PROCESS_CREATE_STDOUT_POINTER         =     "SDL.process.create.stdout_source",
 SDL_PROP_PROCESS_CREATE_STDERR_NUMBER          =     "SDL.process.create.stderr_option",
 SDL_PROP_PROCESS_CREATE_STDERR_POINTER         =     "SDL.process.create.stderr_source",
 SDL_PROP_PROCESS_CREATE_STDERR_TO_STDOUT_BOOLEAN =   "SDL.process.create.stderr_to_stdout",
 SDL_PROP_PROCESS_CREATE_BACKGROUND_BOOLEAN       =   "SDL.process.create.background"
 
public constant xSDL_GetProcessProperties = define_c_func(sdl,"+SDL_GetProcessProperties",{C_POINTER},C_UINT32)

public function SDL_GetProcessProperties(atom process)
	return c_func(xSDL_GetProcessProperties,{process})
end function

public constant SDL_PROP_PROCESS_PID_NUMBER  =       "SDL.process.pid",
 SDL_PROP_PROCESS_STDIN_POINTER     = "SDL.process.stdin",
SDL_PROP_PROCESS_STDOUT_POINTER    = "SDL.process.stdout",
 SDL_PROP_PROCESS_STDERR_POINTER    = "SDL.process.stderr",
 SDL_PROP_PROCESS_BACKGROUND_BOOLEAN = "SDL.process.background"
 
public constant xSDL_ReadProcess = define_c_func(sdl,"+SDL_ReadProcess",{C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_ReadProcess(atom process,atom datasize,atom exitcode)
	return c_func(xSDL_ReadProcess,{process,datasize,exitcode})
end function

public constant xSDL_GetProcessInput = define_c_func(sdl,"+SDL_GetProcessInput",{C_POINTER},C_POINTER)

public function SDL_GetProcessInput(atom process)
	return c_func(xSDL_GetProcessInput,{process})
end function

public constant xSDL_GetProcessOutput = define_c_func(sdl,"+SDL_GetProcessOutput",{C_POINTER},C_POINTER)

public function SDL_GetProcessOutput(atom process)
	return c_func(xSDL_GetProcessOutput,{process})
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
­85.38