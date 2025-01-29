include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e

public enum type SDL_LogCategory
	SDL_LOG_CATEGORY_APPLICATION = 0,
    SDL_LOG_CATEGORY_ERROR,
    SDL_LOG_CATEGORY_ASSERT,
    SDL_LOG_CATEGORY_SYSTEM,
    SDL_LOG_CATEGORY_AUDIO,
    SDL_LOG_CATEGORY_VIDEO,
    SDL_LOG_CATEGORY_RENDER,
    SDL_LOG_CATEGORY_INPUT,
    SDL_LOG_CATEGORY_TEST,
    SDL_LOG_CATEGORY_GPU,

    /* Reserved for future SDL library use */
    SDL_LOG_CATEGORY_RESERVED2,
    SDL_LOG_CATEGORY_RESERVED3,
    SDL_LOG_CATEGORY_RESERVED4,
    SDL_LOG_CATEGORY_RESERVED5,
    SDL_LOG_CATEGORY_RESERVED6,
    SDL_LOG_CATEGORY_RESERVED7,
    SDL_LOG_CATEGORY_RESERVED8,
    SDL_LOG_CATEGORY_RESERVED9,
    SDL_LOG_CATEGORY_RESERVED10,

    /* Beyond this point is reserved for application use, e.g.
       enum {
           MYAPP_CATEGORY_AWESOME1 = SDL_LOG_CATEGORY_CUSTOM,
           MYAPP_CATEGORY_AWESOME2,
           MYAPP_CATEGORY_AWESOME3,
           ...
       };
     */
    SDL_LOG_CATEGORY_CUSTOM
end type

public enum type SDL_LogPriority
	SDL_LOG_PRIORITY_INVALID = 0,
    SDL_LOG_PRIORITY_TRACE,
    SDL_LOG_PRIORITY_VERBOSE,
    SDL_LOG_PRIORITY_DEBUG,
    SDL_LOG_PRIORITY_INFO,
    SDL_LOG_PRIORITY_WARN,
    SDL_LOG_PRIORITY_ERROR,
    SDL_LOG_PRIORITY_CRITICAL,
    SDL_LOG_PRIORITY_COUNT
end type

public constant xSDL_SetLogPriorities = define_c_proc(sdl,"+SDL_SetLogPriorities",{C_INT})

public procedure SDL_SetLogPriorities(SDL_LogPriority priority)
	c_proc(xSDL_SetLogPriorities,{priority})
end procedure

public constant xSDL_SetLogPriority = define_c_proc(sdl,"+SDL_SetLogPriority",{C_INT,C_INT})

public procedure SDL_SetLogPriority(atom category,SDL_LogPriority priority)
	c_proc(xSDL_SetLogPriority,{category,priority})
end procedure

public constant xSDL_GetLogPriority = define_c_func(sdl,"+SDL_GetLogPriority",{C_INT},C_INT)

public function SDL_GetLogPriority(atom category)
	return c_func(xSDL_GetLogPriority,{category})
end function

public constant xSDL_ResetLogPriorities = define_c_proc(sdl,"+SDL_ResetLogPriorities",{})

public procedure SDL_ResetLogPriorities()
	c_proc(xSDL_ResetLogPriorities,{})
end procedure

public constant xSDL_SetLogPriorityPrefix = define_c_func(sdl,"+SDL_SetLogPriorityPrefix",{C_INT,C_STRING},C_BOOL)

public function SDL_SetLogPriorityPrefix(SDL_LogPriority priority,sequence prefix)
	return c_func(xSDL_SetLogPriorityPrefix,{priority,prefix})
end function

public constant xSDL_Log = define_c_proc(sdl,"+SDL_Log",{C_STRING,C_POINTER})

public procedure SDL_Log(sequence fmt,object x)
	c_proc(xSDL_Log,{fmt,x})
end procedure

public constant xSDL_LogTrace = define_c_proc(sdl,"+SDL_LogTrae",{C_INT,C_STRING,C_POINTER})

public procedure SDL_LogTrace(atom category,sequence fmt,object x)
	c_proc(xSDL_LogTrace,{category,fmt,x})
end procedure

public constant xSDL_LogVerbose = define_c_proc(sdl,"+SDL_LogVerbose",{C_INT,C_STRING,C_POINTER})

public procedure SDL_LogVerbose(atom category,sequence fmt,object x)
	c_proc(xSDL_LogVerbose,{category,fmt,x})
end procedure

public constant xSDL_LogDebug = define_c_proc(sdl,"+SDL_LogDebug",{C_INT,C_STRING,C_POINTER})

public procedure SDL_LogDebug(atom category,sequence fmt,object x)
	c_proc(xSDL_LogDebug,{category,fmt,x})
end procedure

public constant xSDL_LogInfo = define_c_proc(sdl,"+SDL_LogInfo",{C_INT,C_STRING,C_POINTER})

public procedure SDL_LogInfo(atom category,sequence fmt,object x)
	c_proc(xSDL_LogInfo,{category,fmt,x})
end procedure

public constant xSDL_LogWarn = define_c_proc(sdl,"+SDL_LogWarn",{C_INT,C_STRING,C_POINTER})

public procedure SDL_LogWarn(atom category,sequence fmt,object x)
	c_proc(xSDL_LogWarn,{category,fmt,x})
end procedure

public constant xSDL_LogError = define_c_proc(sdl,"+SDL_LogError",{C_INT,C_STRING,C_POINTER})

public procedure SDL_LogError(atom category,sequence fmt,object x)
	c_proc(xSDL_LogError,{category,fmt,x})
end procedure

public constant xSDL_LogCritical = define_c_proc(sdl,"+SDL_LogCritical",{C_INT,C_STRING,C_POINTER})

public procedure SDL_LogCritical(atom category,sequence fmt,object x)
	c_proc(xSDL_LogCritical,{category,fmt,x})
end procedure

public constant xSDL_LogMessage = define_c_proc(sdl,"+SDL_LogMessage",{C_INT,C_INT,C_STRING,C_POINTER})

public procedure SDL_LogMessage(atom category,SDL_LogPriority priority,sequence fmt,object x)
	c_proc(xSDL_LogMessage,{category,priority,fmt,x})
end procedure

public constant xSDL_LogMessageV = define_c_proc(sdl,"+SDL_LogMessageV",{C_INT,C_INT,C_STRING,C_POINTER})

public procedure SDL_LogMessageV(atom category,SDL_LogPriority priority,sequence fmt,atom ap)
	c_proc(xSDL_LogMessageV,{category,priority,fmt,ap})
end procedure

public constant xSDL_GetDefaultLogOutputFunction = define_c_func(sdl,"+SDL_GetDefaultLogOutputFunction",{},C_POINTER)

public function SDL_GetDefaultLogOutputFunction()
	return c_func(xSDL_GetDefaultLogOutputFunction,{})
end function

public constant xSDL_GetLogOutputFunction = define_c_proc(sdl,"+SDL_GetLogOutputFunction",{C_POINTER,C_POINTER})

public procedure SDL_GetLogOutputFunction(object cb,atom userdata)
	c_proc(xSDL_GetLogOutputFunction,{cb,userdata})
end procedure

public constant xSDL_SetLogOutputFunction = define_c_proc(sdl,"+SDL_SetLogOutputFunction",{C_POINTER,C_POINTER})

public procedure SDL_SetLogOutputFunction(object cb,atom userdata)
	c_proc(xSDL_SetLogOutputFunction,{cb,userdata})
end procedure
­61.45