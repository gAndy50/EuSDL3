include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e

public constant SDL_CACHELINE_SIZE = 128

public constant xSDL_GetNumLogicalCPUCores = define_c_func(sdl,"+SDL_GetNumLogicalCPUCores",{},C_INT)

public function SDL_GetNumLogicalCPUCores()
	return c_func(xSDL_GetNumLogicalCPUCores,{})
end function

public constant xSDL_GetCPUCacheLineSize = define_c_func(sdl,"+SDL_GetCPUCacheLineSize",{},C_INT)

public function SDL_GetCPUCacheLineSize()
	return c_func(xSDL_GetCPUCacheLineSize,{})
end function

public constant xSDL_HasAltiVec = define_c_func(sdl,"+SDL_HasAltiVec",{},C_BOOL)

public function SDL_HasAltiVec()
	return c_func(xSDL_HasAltiVec,{})
end function

public constant xSDL_HasMMX = define_c_func(sdl,"+SDL_HasMMX",{},C_BOOL)

public function SDL_HasMMX()
	return c_func(xSDL_HasMMX,{})
end function

public constant xSDL_HasSSE = define_c_func(sdl,"+SDL_HasSSE",{},C_BOOL)

public function SDL_HasSSE()
	return c_func(xSDL_HasSSE,{})
end function

public constant xSDL_HasSSE2 = define_c_func(sdl,"+SDL_HasSSE2",{},C_BOOL)

public function SDL_HasSSE2()
	return c_func(xSDL_HasSSE2,{})
end function

public constant xSDL_HasSSE3 = define_c_func(sdl,"+SDL_HasSSE3",{},C_BOOL)

public function SDL_HasSSE3()
	return c_func(xSDL_HasSSE3,{})
end function

public constant xSDL_HasSSE41 = define_c_func(sdl,"+SDL_HasSSE41",{},C_BOOL)

public function SDL_HasSSE41()
	return c_func(xSDL_HasSSE41,{})
end function

public constant xSDL_HasSSE42 = define_c_func(sdl,"+SDL_HasSSE42",{},C_BOOL)

public function SDL_HasSSE42()
	return c_func(xSDL_HasSSE42,{})
end function

public constant xSDL_HasAVX = define_c_func(sdl,"+SDL_HasAVX",{},C_BOOL)

public function SDL_HasAVX()
	return c_func(xSDL_HasAVX,{})
end function

public constant xSDL_HasAVX2 = define_c_func(sdl,"+SDL_HasAVX2",{},C_BOOL)

public function SDL_HasAVX2()
	return c_func(xSDL_HasAVX2,{})
end function

public constant xSDL_HasAVX512F = define_c_func(sdl,"+SDL_HasAVX512F",{},C_BOOL)

public function SDL_HasAVX512F()
	return c_func(xSDL_HasAVX512F,{})
end function

public constant xSDL_HasARMSIMD = define_c_func(sdl,"+SDL_HasARMSIMD",{},C_BOOL)

public function SDL_HasARMSIMD()
	return c_func(xSDL_HasARMSIMD,{})
end function

public constant xSDL_HasNEON = define_c_func(sdl,"+SDL_HasNEON",{},C_BOOL)

public function SDL_HasNEON()
	return c_func(xSDL_HasNEON,{})
end function

public constant xSDL_HasLSX = define_c_func(sdl,"+SDL_HasLSX",{},C_BOOL)

public function SDL_HasLSX()
	return c_func(xSDL_HasLSX,{})
end function

public constant xSDL_HasLASX = define_c_func(sdl,"+SDL_HasLASX",{},C_BOOL)

public function SDL_HasLASX()
	return c_func(xSDL_HasLASX,{})
end function

public constant xSDL_GetSystemRAM = define_c_func(sdl,"+SDL_GetSystemRAM",{},C_INT)

public function SDL_GetSystemRAM()
	return c_func(xSDL_GetSystemRAM,{})
end function

public constant xSDL_GetSIMDAlignment = define_c_func(sdl,"+SDL_GetSIMDAlignment",{},C_SIZE_T)

public function SDL_GetSIMDAlignment()
	return c_func(xSDL_GetSIMDAlignment,{})
end function

public constant xSDL_GetSystemPageSize = define_c_func(sdl,"+SDL_GetSystemPageSize",{},C_INT)

public function SDL_GetSystemPageSize()
	return c_func(xSDL_GetSystemPageSize,{})
end function
­120.41