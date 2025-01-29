include std/ffi.e
include std/machine.e

--Many functions left unwrapped as Euphoria has many of the same functions
include SDL.e

public constant SDL_NOLONGLONG = 1

public constant SDL_MAX_SINT8 = 127
public constant SDL_MIN_SINT8 = -128

public constant SDL_MAX_UINT8 = 255
public constant SDL_MIN_UINT8 = 0

public constant SDL_MAX_SINT16 = 32767
public constant SDL_MIN_SINT16 = -32768

public constant SDL_MAX_UINT16 = 65535
public constant SDL_MIN_UINT16 = 0

public constant SDL_MAX_SINT32 = 2147483647
public constant SDL_MIN_SINT32 = -2147483648

public constant SDL_MAX_UINT32 = 4294967295
public constant SDL_MIN_UNIT32 = 0

public constant SDL_MAX_SINT64 = 9223372036854775807
public constant SDL_MIN_SINT64 = -9223372036854775808

public constant SDL_MAX_UINT64 = 18446744073709551615
public constant SDL_MIN_UINT64 = 0

public constant SDL_MAX_TIME = SDL_MAX_SINT64
public constant SDL_MIN_TIME = SDL_MIN_SINT64

public constant SDL_FLT_EPSILON = 18446744073709551615

public constant xSDL_malloc = define_c_proc(sdl,"+SDL_malloc",{C_SIZE_T})

public procedure SDL_malloc(atom size)
	c_proc(xSDL_malloc,{size})
end procedure

public constant xSDL_free = define_c_proc(sdl,"+SDL_free",{C_POINTER})

public procedure SDL_free(atom mem)
	c_proc(xSDL_free,{mem})
end procedure

public constant xSDL_aligned_free = define_c_proc(sdl,"+SDL_aligned_free",{C_POINTER})

public procedure SDL_aligned_free(atom mem)
	c_proc(xSDL_aligned_free,{mem})
end procedure

public constant xSDL_GetNumAllocations = define_c_func(sdl,"+SDL_GetNumAllocations",{},C_INT)

public function SDL_GetNumAllocations()
	return c_func(xSDL_GetNumAllocations,{})
end function

public constant xSDL_GetEnvironment = define_c_func(sdl,"+SDL_GetEnvironment",{},C_POINTER)

public function SDL_GetEnvironment()
	return c_func(xSDL_GetEnvironment,{})
end function

public constant xSDL_CreateEnvironment = define_c_func(sdl,"+SDL_CreateEnvironment",{C_BOOL},C_POINTER)

public function SDL_CreateEnvironment(atom populated)
	return c_func(xSDL_CreateEnvironment,{populated})
end function

public constant xSDL_GetEnvironmentVariable = define_c_func(sdl,"+SDL_GetEnvironmentVariable",{C_POINTER,C_STRING},C_STRING)

public function SDL_GetEnvironmentVariable(atom env,sequence name)
	return c_func(xSDL_GetEnvironmentVariable,{env,name})
end function

public constant xSDL_GetEnvironmentVariables = define_c_func(sdl,"+SDL_GetEnvironmentVariables",{C_POINTER},C_POINTER)

public function SDL_GetEnvironmentVariables(atom env)
	return c_func(xSDL_GetEnvironmentVariables,{env})
end function

public constant xSDL_SetEnvironmentVariable = define_c_func(sdl,"+SDL_SetEnvironmentVariable",{C_POINTER,C_STRING,C_STRING,C_BOOL},C_BOOL)

public function SDL_SetEnvironmentVariable(atom env,sequence name,sequence val,atom overwrite)
	return c_func(xSDL_SetEnvironmentVariable,{env,name,val,overwrite})
end function

public constant xSDL_UnsetEnvironmentVariable = define_c_func(sdl,"+SDL_UnsetEnvironmentVariable",{C_POINTER,C_STRING},C_BOOL)

public function SDL_UnsetEnvironmentVariable(atom env,sequence name)
	return c_func(xSDL_UnsetEnvironmentVariable,{env,name})
end function

public constant xSDL_DestroyEnvironment = define_c_proc(sdl,"+SDL_DestroyEnvironment",{C_POINTER})

public procedure SDL_DestroyEnvironment(atom env)
	c_proc(xSDL_DestroyEnvironment,{env})
end procedure

public constant xSDL_getenv = define_c_func(sdl,"+ DL_getenv",{C_STRING},C_STRING)

public function SDL_getenv(sequence name)
	return c_func(xSDL_getenv,{name})
end function

public constant xSDL_getenv_unsafe = define_c_func(sdl,"+SDL_getenv_unsafe",{C_STRING},C_STRING)

public function SDL_getenv_unsafe(sequence name)
	return c_func(xSDL_getenv_unsafe,{name})
end function

public constant xSDL_setenv_unsafe = define_c_func(sdl,"+SDL_setenv_unsafe",{C_STRING,C_STRING,C_INT},C_INT)

public function SDL_setenv_unsafe(sequence name,sequence val,atom overwrite)
	return c_func(xSDL_setenv_unsafe,{name,val,overwrite})
end function

public constant xSDL_unsetenv_unsafe = define_c_func(sdl,"+SDL_unsetenv_unsafe",{C_STRING},C_INT)

public function SDL_unsetenv_unsafe(sequence name)
	return c_func(xSDL_unsetenv_unsafe,{name})
end function

public constant xSDL_isalpha = define_c_func(sdl,"+SDL_isalpha",{C_INT},C_INT)

public function SDL_isalpha(atom x)
	return c_func(xSDL_isalpha,{x})
end function

public constant xSDL_isalnum = define_c_func(sdl,"+SDL_isalnum",{C_INT},C_INT)

public function SDL_isalnum(atom x)
	return c_func(xSDL_isalnum,{x})
end function

public constant xSDL_isblank = define_c_func(sdl,"+SDL_isblank",{C_INT},C_INT)

public function SDL_isblank(atom x)
	return c_func(xSDL_isblank,{x})
end function

public constant xSDL_iscntrl = define_c_func(sdl,"+SDL_iscntrl",{C_INT},C_INT)

public function SDL_iscntrl(atom x)
	return c_func(xSDL_iscntrl,{x})
end function

public constant xSDL_isdigit = define_c_func(sdl,"+SDL_isdigit",{C_INT},C_INT)

public function SDL_isdigit(atom x)
	return c_func(xSDL_isdigit,{x})
end function

public constant xSDL_isxdigit = define_c_func(sdl,"+SDL_isxdigit",{C_INT},C_INT)

public function SDL_isxdigit(atom x)
	return c_func(xSDL_isxdigit,{x})
end function

public constant xSDL_ispunct = define_c_func(sdl,"+SDL_ispunct",{C_INT},C_INT)

public function SDL_ispunct(atom x)
	return c_func(xSDL_ispunct,{x})
end function

public constant xSDL_isspace = define_c_func(sdl,"+SDL_isspace",{C_INT},C_INT)

public function SDL_isspace(atom x)
	return c_func(xSDL_isspace,{x})
end function

public constant xSDL_isupper = define_c_func(sdl,"+SDL_isupper",{C_INT},C_INT)

public function SDL_isupper(atom x)
	return c_func(xSDL_isupper,{x})
end function

public constant xSDL_islower = define_c_func(sdl,"+SDL_islower",{C_INT},C_INT)

public function SDL_islower(atom x)
	return c_func(xSDL_islower,{x})
end function

public constant xSDL_isprint = define_c_func(sdl,"+SDL_isprint",{C_INT},C_INT)

public function SDL_isprint(atom x)
	return c_func(xSDL_isprint,{x})
end function

public constant xSDL_isgraph = define_c_func(sdl,"+SDL_isgraph",{C_INT},C_INT)

public function SDL_isgraph(atom x)
	return c_func(xSDL_isgraph,{x})
end function

public constant xSDL_toupper = define_c_func(sdl,"+SDL_toupper",{C_INT},C_INT)

public function SDL_toupper(atom x)
	return c_func(xSDL_toupper,{x})
end function

public constant xSDL_tolower = define_c_func(sdl,"+SDL_tolower",{C_INT},C_INT)

public function SDL_tolower(atom x)
	return c_func(xSDL_tolower,{x})
end function

public constant xSDL_crc16 = define_c_func(sdl,"+SDL_crc16",{C_UINT16,C_POINTER,C_SIZE_T},C_UINT16)

public function SDL_crc16(atom crc,atom data,atom len)
	return c_func(xSDL_crc16,{crc,data,len})
end function

public constant xSDL_crc32 = define_c_func(sdl,"+SDL_crc32",{C_UINT32,C_POINTER,C_SIZE_T},C_UINT32)

public function SDL_crc32(atom crc,atom data,atom len)
	return c_func(xSDL_crc32,{crc,data,len})
end function

public constant xSDL_murmur3_32 = define_c_func(sdl,"+SDL_murmur3_32",{C_POINTER,C_SIZE_T,C_UINT32},C_UINT32)

public function SDL_murmur3_32(atom data,atom len,atom seed)
	return c_func(xSDL_murmur3_32,{data,len,seed})
end function

public constant xSDL_memcmp = define_c_func(sdl,"+SDL_memcmp",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)

public function  SDL_memcmp(atom s1,atom s2,atom len)
	return c_func(xSDL_memcmp,{s1,s2,len})
end function

public constant xSDL_wcslen = define_c_func(sdl,"+SDL_wcslen",{C_STRING},C_SIZE_T)

public function SDL_wcslen(sequence wstr)
	return c_func(xSDL_wcslen,{wstr})
end function

public constant xSDL_wcsnlen = define_c_func(sdl,"+SDL_wcsnlen",{C_STRING,C_SIZE_T},C_SIZE_T)

public function SDL_wcsnlen(sequence wstr,atom maxlen)
	return c_func(xSDL_wcsnlen,{wstr,maxlen})
end function
­92.54