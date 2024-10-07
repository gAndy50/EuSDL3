include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_MAX_LOG_MESSAGE = 4096

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
	
	SDL_LOG_CATEGORY_RESERVED1,
	SDL_LOG_CATEGORY_RESERVED2,
	SDL_LOG_CATEGORY_RESERVED3,
	SDL_LOG_CATEGORY_RESERVED4,
	SDL_LOG_CATEGORY_RESERVED5,
	SDL_LOG_CATEGORY_RESERVED6,
	SDL_LOG_CATEGORY_RESERVED7,
	SDL_LOG_CATEGORY_RESERVED8,
	SDL_LOG_CATEGORY_RESERVED9,
	SDL_LOG_CATEGORY_RESERVED10,
	
	SDL_LOG_CATEGORY_CUSTOM
end type

public enum type SDL_LogPriority
	SDL_LOG_PRIORITY_VERBOSE = 1,
	SDL_LOG_PRIORITY_DEBUG,
	SDL_LOG_PRIORITY_INFO,
	SDL_LOG_PRIORITY_WARN,
	SDL_LOG_PRIORITY_ERROR,
	SDL_LOG_PRIORITY_CRITICAL,
	SDL_NUM_LOG_PRIORITIES
end type

export constant xSDL_LogSetAllPriority = define_c_proc(sdl,"+SDL_LogSetAllPriority",{C_INT})

public procedure SDL_LogSetAllPriority(atom priority)
	c_proc(xSDL_LogSetAllPriority,{priority})
end procedure

export constant xSDL_LogSetPriority = define_c_proc(sdl,"+SDL_LogSetPriority",{C_INT,C_INT})

public procedure SDL_LogSetPriority(atom category,atom priority)
	c_proc(xSDL_LogSetPriority,{category,priority})
end procedure

export constant xSDL_LogGetPriority = define_c_func(sdl,"+SDL_LogGetPriority",{C_INT},C_INT)

public function SDL_LogGetPriority(atom category)
	return c_func(xSDL_LogGetPriority,{category})
end function

export constant xSDL_LogResetPriorities = define_c_proc(sdl,"+SDL_LogResetPriorities",{})

public procedure SDL_LogResetPriorities()
	c_proc(xSDL_LogResetPriorities,{})
end procedure

export constant xSDL_Log = define_c_proc(sdl,"+SDL_Log",{C_STRING})

public procedure SDL_Log(sequence fmt)
	c_proc(xSDL_Log,{fmt})
end procedure

export constant xSDL_LogVerbose = define_c_proc(sdl,"+SDL_LogVerbose",{C_INT,C_STRING})

public procedure SDL_LogVerbose(atom category,sequence fmt)
	c_proc(xSDL_LogVerbose,{category,fmt})
end procedure

export constant xSDL_LogDebug = define_c_proc(sdl,"+SDL_LogDebug",{C_INT,C_STRING})

public procedure SDL_LogDebug(atom category,sequence fmt)
	c_proc(xSDL_LogDebug,{category,fmt})
end procedure

export constant xSDL_LogInfo = define_c_proc(sdl,"+SDL_LogInfo",{C_INT,C_STRING})

public procedure SDL_LogInfo(atom category,sequence fmt)
	c_proc(xSDL_LogInfo,{category,fmt})
end procedure

export constant xSDL_LogWarn = define_c_proc(sdl,"+SDL_LogWarn",{C_INT,C_STRING})

public procedure SDL_LogWarn(atom category,sequence fmt)
	c_proc(xSDL_LogWarn,{category,fmt})
end procedure

export constant xSDL_LogError = define_c_proc(sdl,"+SDL_LogError",{C_INT,C_STRING})

public procedure SDL_LogError(atom category,sequence fmt)
	c_proc(xSDL_LogError,{category,fmt})
end procedure

export constant xSDL_LogCritical = define_c_proc(sdl,"+SDL_LogCritical",{C_INT,C_STRING})

public procedure SDL_LogCritical(atom category,sequence fmt)
	c_proc(xSDL_LogCritical,{category,fmt})
end procedure

export constant xSDL_LogMessage = define_c_proc(sdl,"+SDL_LogMessage",{C_INT,C_INT,C_STRING})

public procedure SDL_LogMessage(atom category,atom priority,sequence fmt)
	c_proc(xSDL_LogMessage,{category,priority,fmt})
end procedure

export constant xSDL_LogMessageV = define_c_proc(sdl,"+SDL_LogMessageV",{C_INT,C_INT,C_STRING,C_POINTER})

public procedure SDL_LogMessageV(atom category,atom priority,sequence fmt,atom ap)
	c_proc(xSDL_LogMessageV,{category,priority,fmt,ap})
end procedure

export constant xSDL_LogGetOutputFunction = define_c_proc(sdl,"+SDL_LogGetOutputFunction",{C_POINTER,C_POINTER})

public procedure SDL_LogGetOutputFunction(atom cb,object data)
	c_proc(xSDL_LogGetOutputFunction,{cb,data})
end procedure

export constant xSDL_LogSetOutputFunction = define_c_proc(sdl,"+SDL_LogSetOutputFunction",{C_POINTER,C_POINTER})

public procedure SDL_LogSetOutputFunction(atom cb,object data)
	c_proc(xSDL_LogSetOutputFunction,{cb,data})
end procedure
­127.72
