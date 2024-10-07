include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_MS_PER_SECOND = 1000
public constant SDL_US_PER_SECOND = 1000000
public constant SDL_NS_PER_SECOND = 1000000000
public constant SDL_NS_PER_MS = 1000000
public constant SDL_NS_PER_US = 1000

export constant xSDL_GetTicks = define_c_func(sdl,"+SDL_GetTicks",{},C_UINT64)

public function SDL_GetTicks()
	return c_func(xSDL_GetTicks,{})
end function

export constant xSDL_GetTicksNS = define_c_func(sdl,"+SDL_GetTicksNS",{},C_UINT64)

public function SDL_GetTicksNS()
	return c_func(xSDL_GetTicksNS,{})
end function

export constant xSDL_GetPerformanceCounter = define_c_func(sdl,"+SDL_GetPerformanceCounter",{},C_UINT64)

public function SDL_GetPerformanceCounter()
	return c_func(xSDL_GetPerformanceCounter,{})
end function

export constant xSDL_GetPerformanceFrequency = define_c_func(sdl,"+SDL_GetPerformanceFrequency",{},C_UINT64)

public function SDL_GetPerformanceFrequency()
	return c_func(xSDL_GetPerformanceFrequency,{})
end function

export constant xSDL_Delay = define_c_proc(sdl,"+SDL_Delay",{C_UINT32})

public procedure SDL_Delay(atom ms)
	c_proc(xSDL_Delay,{ms})
end procedure

export constant xSDL_DelayNS = define_c_proc(sdl,"+SDL_DelayNS",{C_UINT64})

public procedure SDL_DelayNS(atom ns)
	c_proc(xSDL_DelayNS,{ns})
end procedure

export constant xSDL_AddTimer = define_c_func(sdl,"+SDL_AddTimer",{C_UINT32,C_POINTER,C_POINTER},C_INT)

public function SDL_AddTimer(atom interval,atom cb,object parm)
	return c_func(xSDL_AddTimer,{interval,cb,parm})
end function

export constant xSDL_RemoveTimer = define_c_func(sdl,"+SDL_RemoveTimer",{C_INT},C_BOOL)

public function SDL_RemoveTimer(atom id)
	return c_func(xSDL_RemoveTimer,{id})
end function
­57.37
