--SDL_RWOPS is now SDL_IOStream

include std/ffi.e
include std/machine.e

include SDL3.e

include SDL_properties.e

public enum type SDL_IOStatus
	SDL_IO_STATUS_READY = 0,
	SDL_IO_STATUS_ERROR,
	SDL_IO_STATUS_EOF,
	SDL_IO_STATUS_NOT_READY,
	SDL_IO_STATUS_READONLY,
	SDL_IO_STATUS_WRITEONLY
end type

public constant xSDL_IOFromFile = define_c_func(sdl,"+SDL_IOFromFile",{C_STRING,C_STRING},C_POINTER)

public function SDL_IOFromFile(sequence file,sequence mode)
	return c_func(xSDL_IOFromFile,{file,mode})
end function

public constant SDL_PROP_IOSTREAM_WINDOWS_HANLDE_POINTER = "SDL.iostream.windows.handle"
public constant SDL_PROP_IOSTREAM_STDIO_FILE_POINTER = "SDL.iostream_stdio.file"
public constant SDL_PROP_IOSTREAM_ANDROID_AASSET_POINTER = "SDL.iostream.android.aasset"

export constant xSDL_IOFromMem = define_c_func(sdl,"+SDL_IOFromMem",{C_POINTER,C_SIZE_T},C_POINTER)

public function SDL_IOFromMem(object mem,atom size)
	return c_func(xSDL_IOFromMem,{mem,size})
end function

export constant xSDL_IOFromConstMem = define_c_func(sdl,"+SDL_IOFromConstMem",{C_POINTER,C_INT},C_POINTER)

public function SDL_IOFromConstMem(object mem,atom size)
	return c_func(xSDL_IOFromConstMem,{mem,size})
end function

public constant xSDL_IOFromDynamicMem = define_c_func(sdl,"+SDL_IOFromDynamicMem",{},C_POINTER)

public function SDL_IOFromDynamicMem()
	return c_func(xSDL_IOFromDynamicMem,{})
end function

public constant SDL_PROP_IOSTREAM_DYNAMIC_MEMORY_POINTER = "SDL.iostream.dynamic.memory"
public constant SDL_PROP_IOSTREAM_DYNAMIC_CHUNKSIZE_NUMBER = "SDL.iostream.dynamic.chunksize"

public constant xSDL_OpenIO = define_c_func(sdl,"+SDL_OpenIO",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_OpenIO(atom iface,atom userdata)
	return c_func(xSDL_OpenIO,{iface,userdata})
end function

public constant xSDL_CloseIO = define_c_func(sdl,"+SDL_CloseIO",{C_POINTER},C_INT)

public function SDL_CloseIO(atom context)
	return c_func(xSDL_CloseIO,{context})
end function

export constant xSDL_CreateRW = define_c_func(sdl,"+SDL_CreateRW",{},C_POINTER)

public function SDL_CreateRW()
	return c_func(xSDL_CreateRW,{})
end function

export constant xSDL_DestroyRW = define_c_proc(sdl,"+SDL_DestroyRW",{C_POINTER})

public procedure SDL_DestroyRW(atom area)
	c_proc(xSDL_DestroyRW,{area})
end procedure

public constant xSDL_GetIOProperties = define_c_func(sdl,"+SDL_GetIOProperties",{C_POINTER},SDL_PropertiesID)

public function SDL_GetIOProperties(atom context)
	return c_func(xSDL_GetIOProperties,{context})
end function

public constant SDL_IO_SEEK_SET = 0
public constant SDL_IO_SEEK_CUR = 1
public constant SDL_IO_SEEK_END = 2

public constant xSDL_GetIOStatus = define_c_func(sdl,"+SDL_GetIOStatus",{C_POINTER},C_INT)

public function SDL_GetIOStatus(atom context)
	return c_func(xSDL_GetIOStatus,{context})
end function

public constant xSDL_GetIOSize = define_c_func(sdl,"+SDL_GetIOSize",{C_POINTER},C_INT64)

public function SDL_GetIOSize(atom context)
	return c_func(xSDL_GetIOSize,{context})
end function

public constant xSDL_SeekIO = define_c_func(sdl,"+SDL_SeekIO",{C_POINTER,C_INT64,C_INT},C_INT64)

public function SDL_SeekIO(atom context,atom offset,atom whence)
	return c_func(xSDL_SeekIO,{context,offset,whence})
end function

public constant xSDL_TellIO = define_c_func(sdl,"+SDL_TellIO",{C_POINTER},C_INT64)

public function SDL_TellIO(atom context)
	return c_func(xSDL_TellIO,{context})
end function

public constant xSDL_ReadIO = define_c_func(sdl,"+SDL_ReadIO",{C_POINTER,C_POINTER,C_SIZE_T},C_SIZE_T)

public function SDL_ReadIO(atom context,atom ptr,atom size)
	return c_func(xSDL_ReadIO,{context,ptr,size})
end function

public constant xSDL_WriteIO = define_c_func(sdl,"+SDL_WriteIO",{C_POINTER,C_POINTER,C_SIZE_T},C_SIZE_T)

public function SDL_WriteIO(atom context,atom ptr,atom size)
	return c_func(xSDL_WriteIO,{context,ptr,size})
end function

public constant xSDL_IOprintf = define_c_func(sdl,"+SDL_IOprintf",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_SIZE_T)

public function SDL_IOprintf(atom context,sequence fmt,atom x,atom parm)
	return c_func(xSDL_IOprintf,{context,fmt,x,parm})
end function

public constant xSDL_LoadFile_IO = define_c_func(sdl,"+SDL_LoadFile_IO",{C_POINTER,C_POINTER,C_BOOL},C_POINTER)

public function SDL_LoadFile_IO(atom src,atom datasize,atom closeio)
	return c_func(xSDL_LoadFile_IO,{src,datasize,closeio})
end function

public constant xSDL_LoadFile = define_c_func(sdl,"+SDL_LoadFile",{C_STRING,C_POINTER},C_POINTER)

public function SDL_LoadFile(sequence file,atom datasize)
	return c_func(xSDL_LoadFile,{file,datasize})
end function

public constant xSDL_ReadU8 = define_c_func(sdl,"+SDL_ReadU8",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadU8(atom src,atom val)
	return c_func(xSDL_ReadU8,{src,val})
end function

public constant xSDL_ReadU16LE = define_c_func(sdl,"+SDL_ReadU16LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadU16LE(atom src,atom val)
	return c_func(xSDL_ReadU16LE,{src,val})
end function

public constant xSDL_ReadS16LE = define_c_func(sdl,"+SDL_ReadS16LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadS16LE(atom src,atom val)
	return c_func(xSDL_ReadS16LE,{src,val})
end function

public constant xSDL_ReadU16BE = define_c_func(sdl,"+SDL_ReadU16BE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadU16BE(atom src,atom val)
	return c_func(xSDL_ReadU16BE,{src,val})
end function

public constant xSDL_ReadS16BE = define_c_func(sdl,"+SDL_ReadS16BE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadS16BE(atom src,atom val)
	return c_func(xSDL_ReadS16BE,{src,val})
end function

public constant xSDL_ReadU32LE = define_c_func(sdl,"+SDL_ReadU32LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadU32LE(atom src,atom val)
	return c_func(xSDL_ReadU32LE,{src,val})
end function

public constant xSDL_ReadS32LE = define_c_func(sdl,"+SDL_ReadS32LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadS32LE(atom src,atom val)
	return c_func(xSDL_ReadS32LE,{src,val})
end function

public constant xSDL_ReadU32BE = define_c_func(sdl,"+SDL_ReadU32LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadU32BE(atom src,atom val)
	return c_func(xSDL_ReadU32BE,{src,val})
end function

public constant xSDL_ReadS32BE = define_c_func(sdl,"+SDL_ReadS32LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadS32BE(atom src,atom val)
	return c_func(xSDL_ReadS32BE,{src,val})
end function

public constant xSDL_ReadU64LE = define_c_func(sdl,"+SDL_ReadU64LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadU64LE(atom src,atom val)
	return c_func(xSDL_ReadU64LE,{src,val})
end function

public constant xSDL_ReadS64LE = define_c_func(sdl,"+SDL_ReadS64LE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadS64LE(atom src,atom val)
	return c_func(xSDL_ReadS64LE,{src,val})
end function

public constant xSDL_ReadU64BE = define_c_func(sdl,"+SDL_ReadU64BE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadU64BE(atom src,atom val)
	return c_func(xSDL_ReadU64BE,{src,val})
end function

public constant xSDL_ReadS64BE = define_c_func(sdl,"+SDL_ReadS64BE",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadS64BE(atom src,atom val)
	return c_func(xSDL_ReadS64BE,{src,val})
end function

public constant xSDL_WriteU8 = define_c_func(sdl,"+SDL_WriteU8",{C_POINTER,C_UINT8},C_BOOL)

public function SDL_WriteU8(atom dst,atom val)
	return c_func(xSDL_WriteU8,{dst,val})
end function

public constant xSDL_WriteU16LE = define_c_func(sdl,"+SDL_WriteU16LE",{C_POINTER,C_UINT16},C_BOOL)

public function SDL_WriteU16LE(atom dst,atom val)
	return c_func(xSDL_WriteU16LE,{dst,val})
end function

public constant xSDL_WriteS16LE = define_c_func(sdl,"+SDL_WriteU16LE",{C_POINTER,C_INT16},C_BOOL)

public function SDL_WriteS16LE(atom dst,atom val)
	return c_func(xSDL_WriteS16LE,{dst,val})
end function

public constant xSDL_WriteU16BE = define_c_func(sdl,"+SDL_WriteU16BE",{C_POINTER,C_UINT16},C_BOOL)

public function SDL_WriteU16BE(atom dst,atom val)
	return c_func(xSDL_WriteU16BE,{dst,val})
end function

public constant xSDL_WriteS16BE = define_c_func(sdl,"+SDL_WriteS16BE",{C_POINTER,C_INT16},C_BOOL)

public function SDL_WriteS16BE(atom dst,atom val)
	return c_func(xSDL_WriteS16BE,{dst,val})
end function

public constant xSDL_WriteU32LE = define_c_func(sdl,"+SDL_WriteU32LE",{C_POINTER,C_UINT32},C_BOOL)

public function SDL_WriteU32LE(atom dst,atom val)
	return c_func(xSDL_WriteU32LE,{dst,val})
end function

public constant xSDL_WriteS32LE = define_c_func(sdl,"+SDL_WriteS32LE",{C_POINTER,C_INT32},C_BOOL)

public function SDL_WriteS32LE(atom dst,atom val)
	return c_func(xSDL_WriteS32LE,{dst,val})
end function

public constant xSDL_WriteU32BE = define_c_func(sdl,"+SDL_WriteU32BE",{C_POINTER,C_UINT32},C_BOOL)

public function SDL_WriteU32BE(atom dst,atom val)
	return c_func(xSDL_WriteU32BE,{dst,val})
end function

public constant xSDL_WriteS32BE = define_c_func(sdl,"+SDL_WriteS32BE",{C_POINTER,C_INT32},C_BOOL)

public function SDL_WriteS32BE(atom dst,atom val)
	return c_func(xSDL_WriteS32BE,{dst,val})
end function

public constant xSDL_WriteU64LE = define_c_func(sdl,"+SDL_WriteU64LE",{C_POINTER,C_UINT64},C_BOOL)

public function SDL_WriteU64LE(atom dst,atom val)
	return c_func(xSDL_WriteU64LE,{dst,val})
end function

public constant xSDL_WriteS64LE = define_c_func(sdl,"+SDL_WriteS64LE",{C_POINTER,C_INT64},C_BOOL)

public function SDL_WriteS64LE(atom dst,atom val)
	return c_func(xSDL_WriteS64LE,{dst,val})
end function

public constant xSDL_WriteU64BE = define_c_func(sdl,"+SDL_WriteU64BE",{C_POINTER,C_UINT64},C_BOOL)

public function SDL_WriteU64BE(atom dst,atom val)
	return c_func(xSDL_WriteU64BE,{dst,val})
end function

public constant xSDL_WriteS64BE = define_c_func(sdl,"+SDL_WriteS64BE",{C_POINTER,C_INT64},C_BOOL)

public function SDL_WriteS64BE(atom dst,atom val)
	return c_func(xSDL_WriteS64BE,{dst,val})
end function
­283.0