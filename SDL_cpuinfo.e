include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_CACHELINE_SIZE = 128

export constant xSDL_GetCPUCount = define_c_func(sdl,"+SDL_GetCPUCount",{},C_INT)

public function SDL_GetCPUCount()
	return c_func(xSDL_GetCPUCount,{})
end function

export constant xSDL_GetCPUCacheLineSize = define_c_func(sdl,"+SDL_GetCPUCacheLineSize",{},C_INT)

public function SDL_GetCPUCacheLineSize()
	return c_func(xSDL_GetCPUCacheLineSize,{})
end function

export constant xSDL_HasAltiVec = define_c_func(sdl,"+SDL_HasAltiVec",{},C_BOOL)

public function SDL_HasAltiVec()
	return c_func(xSDL_HasAltiVec,{})
end function

export constant xSDL_HasMMX = define_c_func(sdl,"+SDL_HasMMX",{},C_BOOL)

public function SDL_HasMMX()
	return c_func(xSDL_HasMMX,{})
end function

export constant xSDL_HasSSE = define_c_func(sdl,"+SDL_HasSSE",{},C_BOOL)

public function SDL_HasSSE()
	return c_func(xSDL_HasSSE,{})
end function

export constant xSDL_HasSSE2 = define_c_func(sdl,"+SDL_HasSSE2",{},C_BOOL)

public function SDL_HasSSE2()
	return c_func(xSDL_HasSSE2,{})
end function

export constant xSDL_HasSSE3 = define_c_func(sdl,"+SDL_HasSSE3",{},C_BOOL)

public function SDL_HasSSE3()
	return c_func(xSDL_HasSSE3,{})
end function

export constant xSDL_HasSSE41 = define_c_func(sdl,"+SDL_HasSSE41",{},C_BOOL)

public function SDL_HasSSE41()
	return c_func(xSDL_HasSSE41,{})
end function

export constant xSDL_HasSSE42 = define_c_func(sdl,"+SDL_HasSSE42",{},C_BOOL)

public function SDL_HasSSE42()
	return c_func(xSDL_HasSSE42,{})
end function

export constant xSDL_HasAVX = define_c_func(sdl,"+SDL_HasAVX",{},C_BOOL)

public function SDL_HasAVX()
	return c_func(xSDL_HasAVX,{})
end function

export constant xSDL_HasAVX2 = define_c_func(sdl,"+SDL_HasAVX2",{},C_BOOL)

public function SDL_HasAVX2()
	return c_func(xSDL_HasAVX2,{})
end function

export constant xSDL_HasAVX512F = define_c_func(sdl,"+SDL_HasAVX512F",{},C_BOOL)

public function SDL_HasAVX512F()
	return c_func(xSDL_HasAVX512F,{})
end function

export constant xSDL_HasARMSIMD = define_c_func(sdl,"+SDL_HasARMSIMD",{},C_BOOL)

public function SDL_HasARMSIMD()
	return c_func(xSDL_HasARMSIMD,{})
end function

export constant xSDL_HasNEON = define_c_func(sdl,"+SDL_HasNEON",{},C_BOOL)

public function SDL_HasNEON()
	return c_func(xSDL_HasNEON,{})
end function

export constant xSDL_HasLSX = define_c_func(sdl,"+SDL_HasLSX",{},C_BOOL)

public function SDL_HasLSX()
	return c_func(xSDL_HasLSX,{})
end function

export constant xSDL_HasLASX = define_c_func(sdl,"+SDL_HasLASX",{},C_BOOL)

public function SDL_HasLASX()
	return c_func(xSDL_HasLASX,{})
end function

export constant xSDL_GetSystemRAM = define_c_func(sdl,"+SDL_GetSystemRAM",{},C_INT)

public function SDL_GetSystemRAM()
	return c_func(xSDL_GetSystemRAM,{})
end function

export constant xSDL_SIMDGetAlignment = define_c_func(sdl,"+SDL_SIMDGetAlignment",{},C_SIZE_T)

public function SDL_SIMDGetAlignment()
	return c_func(xSDL_SIMDGetAlignment,{})
end function

export constant xSDL_RWsize = define_c_func(sdl,"+SDL_RWsize",{C_POINTER},C_INT64)

public function SDL_RWsize(atom context)
	return c_func(xSDL_RWsize,{context})
end function

export constant xSDL_RWseek = define_c_func(sdl,"+SDL_RWseek",{C_POINTER,C_INT64,C_INT},C_INT64)

public function SDL_RWseek(atom context,atom offset,atom whence)
	return c_func(xSDL_RWseek,{context,offset,whence})
end function

export constant xSDL_RWtell = define_c_func(sdl,"+SDL_RWtell",{C_POINTER},C_INT64)

public function SDL_RWtell(atom context)
	return c_func(xSDL_RWtell,{context})
end function

export constant xSDL_RWread = define_c_func(sdl,"+SDL_RWread",{C_POINTER,C_POINTER,C_INT64},C_INT64)

public function SDL_RWread(atom context,object ptr,atom size)
	return c_func(xSDL_RWread,{context,ptr,size})
end function

export constant xSDL_RWwrite = define_c_func(sdl,"+SDL_RWwrite",{C_POINTER,C_POINTER,C_INT64},C_INT64)

public function SDL_RWwrite(atom context,object ptr,atom size)
	return c_func(xSDL_RWwrite,{context,ptr,size})
end function

export constant xSDL_RWclose = define_c_func(sdl,"+SDL_RWclose",{C_POINTER},C_INT)

public function SDL_RWclose(atom context)
	return c_func(xSDL_RWclose,{context})
end function

export constant xSDL_LoadFile_RW = define_c_func(sdl,"+SDL_LoadFile_RW",{C_POINTER,C_POINTER,C_INT},C_POINTER)

public function SDL_LoadFile_RW(atom src,atom datasize,atom freesrc)
	return c_func(xSDL_LoadFile_RW,{src,datasize,freesrc})
end function

export constant xSDL_LoadFile = define_c_func(sdl,"+SDL_LoadFile",{C_STRING,C_POINTER},C_POINTER)

public function SDL_LoadFile(sequence file,atom datasize)
	return c_func(xSDL_LoadFile,{file,datasize})
end function

export constant xSDL_ReadU8 = define_c_func(sdl,"+SDL_ReadU8",{C_POINTER},C_UINT8)

public function SDL_ReadU8(atom src)
	return c_func(xSDL_ReadU8,{src})
end function

export constant xSDL_ReadLE16 = define_c_func(sdl,"+SDL_ReadLE16",{C_POINTER},C_UINT16)

public function SDL_ReadLE16(atom src)
	return c_func(xSDL_ReadLE16,{src})
end function

export constant xSDL_ReadBE16 = define_c_func(sdl,"+SDL_ReadBE16",{C_POINTER},C_UINT16)

public function SDL_ReadBE16(atom src)
	return c_func(xSDL_ReadBE16,{src})
end function

export constant xSDL_ReadLE32 = define_c_func(sdl,"+SDL_ReadLE32",{C_POINTER},C_UINT32)

public function SDL_ReadLE32(atom src)
	return c_func(xSDL_ReadLE32,{src})
end function

export constant xSDL_ReadBE32 = define_c_func(sdl,"+SDL_ReadBE32",{C_POINTER},C_UINT32)

public function SDL_ReadBE32(atom src)
	return c_func(xSDL_ReadBE32,{src})
end function

export constant xSDL_ReadLE64 = define_c_func(sdl,"+SDL_ReadLE64",{C_POINTER},C_UINT64)

public function SDL_ReadLE64(atom src)
	return c_func(xSDL_ReadLE64,{src})
end function

export constant xSDL_ReadBE64 = define_c_func(sdl,"+SDL_ReadBE64",{C_POINTER},C_UINT64)

public function SDL_ReadBE64(atom src)
	return c_func(xSDL_ReadBE64,{src})
end function

export constant xSDL_WriteU8 = define_c_func(sdl,"+SDL_WriteU8",{C_POINTER,C_UINT8},C_SIZE_T)

public function SDL_WriteU8(atom dst,atom val)
	return c_func(xSDL_WriteU8,{dst,val})
end function

export constant xSDL_WriteLE16 = define_c_func(sdl,"+SDL_WriteLE16",{C_POINTER,C_UINT16},C_SIZE_T)

public function SDL_WriteLE16(atom dst,atom val)
	return c_func(xSDL_WriteLE16,{dst,val})
end function

export constant xSDL_WriteBE16 = define_c_func(sdl,"+SDL_WriteBE16",{C_POINTER,C_UINT16},C_SIZE_T)

public function SDL_WriteBE16(atom dst,atom val)
	return c_func(xSDL_WriteBE16,{dst,val})
end function

export constant xSDL_WriteLE32 = define_c_func(sdl,"+SDL_WriteLE32",{C_POINTER,C_UINT32},C_SIZE_T)

public function SDL_WriteLE32(atom dst,atom val)
	return c_func(xSDL_WriteLE32,{dst,val})
end function

export constant xSDL_WriteBE32 = define_c_func(sdl,"+SDL_WriteBE32",{C_POINTER,C_UINT32},C_SIZE_T)

public function SDL_WriteBE32(atom dst,atom val)
	return c_func(xSDL_WriteBE32,{dst,val})
end function

export constant xSDL_WriteLE64 = define_c_func(sdl,"+SDL_WriteLE64",{C_POINTER,C_UINT64},C_SIZE_T)

public function SDL_WriteLE64(atom dst,atom val)
	return c_func(xSDL_WriteLE64,{dst,val})
end function

export constant xSDL_WriteBE64 = define_c_func(sdl,"+SDL_WriteBE64",{C_POINTER,C_UINT64},C_SIZE_T)

public function SDL_WriteBE64(atom dst,atom val)
	return c_func(xSDL_WriteBE64,{dst,val})
end function
­115.0