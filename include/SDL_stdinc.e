include std/ffi.e

include SDL3.e

public function SDL_arraysize(object array)
	return sizeof(array/sizeof(array))
end function

public constant TRUE = 1,
				FALSE = 0
				
public constant SDL_FALSE = FALSE
public constant SDL_TRUE = TRUE

public constant SDL_bool = C_BOOL

--signed 8-bit integer
public constant SDL_MAX_SINT8 = 128
public constant SDL_MIN_SINT8 = -128

--unsigned 8-bit integer
public constant SDL_MAX_UINT8 = 255
public constant SDL_MIN_UINT8 = 0

--signed 16-bit integer
public constant SDL_MAX_SINT16 = 32767
public constant SDL_MIN_SINT16 = -32768

--unsigned 16-bit integer
public constant SDL_MAX_UINT16 = 65535
public constant SDL_MIN_UINT16 = 0

--signed 32-bit integer
public constant SDL_MAX_SINT32 = 2147483647
public constant SDL_MIN_SINT32 = -2147483647

--unsigned 32-bit integer
public constant SDL_MAX_UINT32 = 4294967295
public constant SDL_MIN_UINT32 = 0

--signed 64-bit integer
public constant SDL_MAX_SINT64 = 9223372036854775807
public constant SDL_MIN_SINT64 = -9223372036854775807

--unsigned 64-bit integer
public constant SDL_MAX_UINT64 = 18446744073709551615
public constant SDL_MIN_UINT64 = 0


public constant xSDL_malloc = define_c_func(sdl,"+SDL_malloc",{C_SIZE_T},C_POINTER)

public function SDL_malloc(atom size)
	return c_func(xSDL_malloc,{size})
end function

public constant xSDL_calloc = define_c_func(sdl,"+SDL_calloc",{C_SIZE_T,C_SIZE_T},C_POINTER)

public function SDL_calloc(atom nmemb,atom size)
	return c_func(xSDL_calloc,{nmemb,size})
end function

public constant xSDL_realloc = define_c_func(sdl,"+SDL_realloc",{C_POINTER,C_SIZE_T},C_POINTER)

public function SDL_realloc(atom mem,atom size)
	return c_func(xSDL_realloc,{mem,size})
end function

public constant xSDL_free = define_c_proc(sdl,"+SDL_free",{C_POINTER})

public procedure SDL_free(atom mem)
	c_proc(xSDL_free,{mem})
end procedure

public constant xSDL_GetOriginalMemoryFunctions = define_c_proc(sdl,"+SDL_GetOriginalMemoryFunctions",{C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetOriginalMemoryFunctions(atom malloc_func,atom calloc_func,atom realloc_func,atom free_func)
	c_proc(xSDL_GetOriginalMemoryFunctions,{malloc_func,calloc_func,realloc_func,free_func})
end procedure

public constant xSDL_GetMemoryFunctions = define_c_proc(sdl,"+SDL_GetMemoryFunctions",{C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetMemoryFunctions(atom malloc_func,atom calloc_func,atom realloc_func,atom free_func)
	c_proc(xSDL_GetMemoryFunctions,{malloc_func,calloc_func,realloc_func,free_func})
end procedure

public constant xSDL_SetMemoryFunctions = define_c_func(sdl,"+SDL_SetMemoryFunctions",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SetMemoryFunctions(atom malloc_func,atom calloc_func,atom realloc_func,atom free_func)
	return c_func(xSDL_SetMemoryFunctions,{malloc_func,calloc_func,realloc_func,free_func})
end function

public constant xSDL_aligned_alloc = define_c_func(sdl,"+SDL_aligned_alloc",{C_SIZE_T,C_SIZE_T},C_POINTER)

public function SDL_aligned_alloc(atom align,atom size)
	return c_func(xSDL_aligned_alloc,{align,size})
end function

public constant xSDL_aligned_free = define_c_proc(sdl,"+SDL_aligned_free",{C_POINTER})

public procedure SDL_aligned_free(atom mem)
	c_proc(xSDL_aligned_free,{mem})
end procedure

public constant xSDL_GetNumAllocations = define_c_func(sdl,"+SDL_GetNumAllocations",{},C_INT)

public function SDL_GetNumAllocations()
	return c_func(xSDL_GetNumAllocations,{})
end function

public constant xSDL_getenv = define_c_func(sdl,"+SDL_getenv",{C_STRING},C_STRING),
				xSDL_setenv = define_c_func(sdl,"+SDL_setenv",{C_STRING,C_STRING,C_INT},C_INT)
				
public function SDL_getenv(sequence name)
	return c_func(xSDL_getenv,{name})
end function

public function SDL_setenv(sequence name,sequence val,atom overwrite)
	return c_func(xSDL_setenv,{name,val,overwrite})
end function

public constant xSDL_qsort = define_c_proc(sdl,"+SDL_qsort",{C_POINTER,C_SIZE_T,C_SIZE_T,C_POINTER,C_POINTER,C_POINTER}),
				xSDL_bsearch = define_c_func(sdl,"+SDL_bsearch",{C_POINTER,C_POINTER,C_SIZE_T,C_SIZE_T,C_POINTER,C_POINTER,C_POINTER},C_POINTER)
				
public procedure SDL_qsort(atom base,atom nmemb,atom size,atom comp,atom p,atom p2)
	c_proc(xSDL_qsort,{base,nmemb,size,comp,p,p2})
end procedure

public function SDL_bsearch(atom key,atom base,atom nmemb,atom size,atom comp,atom p,atom p2)
	return c_func(xSDL_bsearch,{key,base,nmemb,size,comp,p,p2})
end function

public constant xSDL_abs = define_c_func(sdl,"+SDL_abs",{C_INT},C_INT)

public function SDL_abs(atom x)
	return c_func(xSDL_abs,{x})
end function

public constant xSDL_isalpha = define_c_func(sdl,"+SDL_isalpha",{C_INT},C_INT),
				xSDL_isalnum = define_c_func(sdl,"+SDL_isalnum",{C_INT},C_INT),
				xSDL_isblank = define_c_func(sdl,"+SDL_isblank",{C_INT},C_INT),
				xSDL_iscntrl = define_c_func(sdl,"+SDL_iscntrl",{C_INT},C_INT),
				xSDL_isdigit = define_c_func(sdl,"+SDL_isdigit",{C_INT},C_INT),
				xSDL_isxdigit = define_c_func(sdl,"+SDL_isxdigit",{C_INT},C_INT),
				xSDL_ispunct = define_c_func(sdl,"+SDL_ispunct",{C_INT},C_INT),
				xSDL_isspace = define_c_func(sdl,"+SDL_isspace",{C_INT},C_INT),
				xSDL_isupper = define_c_func(sdl,"+SDL_isupper",{C_INT},C_INT),
				xSDL_islower = define_c_func(sdl,"+SDL_islower",{C_INT},C_INT),
				xSDL_isprint = define_c_func(sdl,"+SDL_isprint",{C_INT},C_INT),
				xSDL_isgraph = define_c_func(sdl,"+SDL_isgraph",{C_INT},C_INT),
				xSDL_toupper = define_c_func(sdl,"+SDL_toupper",{C_INT},C_INT),
				xSDL_tolower = define_c_func(sdl,"+SDL_tolower",{C_INT},C_INT)
				
public function SDL_isalpha(atom x)
	return c_func(xSDL_isalpha,{x})
end function

public function SDL_isalnum(atom x)
	return c_func(xSDL_isalnum,{x})
end function

public function SDL_isblank(atom x)
	return c_func(xSDL_isblank,{x})
end function

public function SDL_iscntrl(atom x)
	return c_func(xSDL_iscntrl,{x})
end function

public function SDL_isdigit(atom x)
	return c_func(xSDL_isdigit,{x})
end function

public function SDL_isxdigit(atom x)
	return c_func(xSDL_isxdigit,{x})
end function

public function SDL_ispunct(atom x)
	return c_func(xSDL_ispunct,{x})
end function

public function SDL_isspace(atom x)
	return c_func(xSDL_isspace,{x})
end function

public function SDL_isupper(atom x)
	return c_func(xSDL_isupper,{x})
end function

public function SDL_islower(atom x)
	return c_func(xSDL_islower,{x})
end function

public function SDL_isprint(atom x)
	return c_func(xSDL_isprint,{x})
end function

public function SDL_isgraph(atom x)
	return c_func(xSDL_isgraph,{x})
end function

public function SDL_toupper(atom x)
	return c_func(xSDL_toupper,{x})
end function

public function SDL_tolower(atom x)
	return c_func(xSDL_tolower,{x})
end function

public constant xSDL_crc16 = define_c_func(sdl,"+SDL_crc16",{C_UINT16,C_POINTER,C_SIZE_T},C_UINT16),
				xSDL_crc32 = define_c_func(sdl,"+SDL_crc32",{C_UINT32,C_POINTER,C_SIZE_T},C_UINT32)
				
public function SDL_crc16(atom crc,atom data,atom len)
	return c_func(xSDL_crc16,{crc,data,len})
end function

public function SDL_crc32(atom crc,atom data,atom len)
	return c_func(xSDL_crc32,{crc,data,len})
end function

public constant xSDL_memcpy = define_c_func(sdl,"+SDL_memcpy",{C_POINTER,C_POINTER,C_SIZE_T},C_POINTER)

public function SDL_memcpy(atom dst,atom src,atom len)
	return c_func(xSDL_memcpy,{dst,src,len})
end function

public constant xSDL_memmove = define_c_func(sdl,"+SDL_memmove",{C_POINTER,C_POINTER,C_SIZE_T},C_POINTER),
				xSDL_memcmp = define_c_func(sdl,"+SDL_memcmp",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)
				
public function SDL_memmove(atom dst,atom src,atom len)
	return c_func(xSDL_memmove,{dst,src,len})
end function

public function SDL_memcmp(atom s1,atom s2,atom len)
	return c_func(xSDL_memcmp,{s1,s2,len})
end function

public constant xSDL_wcslen = define_c_func(sdl,"+SDL_wcslen",{C_WSTRING},C_SIZE_T),
				xSDL_wcsnlen = define_c_func(sdl,"+SDL_wcsnlen",{C_WSTRING,C_SIZE_T},C_SIZE_T),
				xSDL_wcslcpy = define_c_func(sdl,"+SDL_wcslcpy",{C_WSTRING,C_WSTRING,C_SIZE_T},C_SIZE_T),
				xSDL_wcslcat = define_c_func(sdl,"+SDL_wcslcat",{C_WSTRING,C_WSTRING,C_SIZE_T},C_SIZE_T),
				xSDL_wcsdup = define_c_func(sdl,"+SDL_wcsdup",{C_WSTRING},C_WSTRING),
				xSDL_wcsstr = define_c_func(sdl,"+SDL_wcsstr",{C_WSTRING,C_WSTRING},C_WSTRING)
				
public function SDL_wcslen(sequence str)
	return c_func(xSDL_wcslen,{str})
end function

public function SDL_wcsnlen(sequence str,atom len)
	return c_func(xSDL_wcsnlen,{str,len})
end function

public function SDL_wcslcpy(sequence dst,sequence src,atom len)
	return c_func(xSDL_wcslcpy,{dst,src,len})
end function

public function SDL_wcslcat(sequence dst,sequence src,atom len)
	return c_func(xSDL_wcslcat,{dst,src,len})
end function

public function SDL_wcsdup(sequence str)
	return c_func(xSDL_wcsdup,{str})
end function

public function SDL_wcsstr(sequence haystack,sequence needle)
	return c_func(xSDL_wcsstr,{haystack,needle})
end function

public constant xSDL_wcscmp = define_c_func(sdl,"+SDL_wcscmp",{C_WSTRING,C_WSTRING},C_INT),
				xSDL_wcsncmp = define_c_func(sdl,"+SDL_wcsncmp",{C_WSTRING,C_WSTRING,C_SIZE_T},C_INT),
				xSDL_wcscasecmp = define_c_func(sdl,"+SDL_wccasecmp",{C_WSTRING,C_WSTRING},C_INT),
				xSDL_wcsncasecmp = define_c_func(sdl,"+SDL_wcsncasecmp",{C_WSTRING,C_WSTRING,C_SIZE_T},C_INT),
				xSDL_wcstol = define_c_func(sdl,"+SDL_wcstol",{C_WSTRING,C_WSTRING,C_INT},C_LONG)
				
public function SDL_wcscmp(sequence str,sequence str2)
	return c_func(xSDL_wcscmp,{str,str2})
end function

public function SDL_wcsncmp(sequence str,sequence str2,atom len)
	return c_func(xSDL_wcsncmp,{str,str2,len})
end function

public function SDL_wcscasecmp(sequence str,sequence str2)
	return c_func(xSDL_wcscasecmp,{str,str2})
end function

public function SDL_wcsncasecmp(sequence str,sequence str2,atom len)
	return c_func(xSDL_wcsncasecmp,{str,str2,len})
end function

public function SDL_wcstol(sequence str,sequence endp,atom base)
	return c_func(xSDL_wcstol,{str,endp,base})
end function

public constant xSDL_strlen = define_c_func(sdl,"+SDL_strlen",{C_STRING},C_SIZE_T),
				xSDL_strnlen = define_c_func(sdl,"+SDL_strnlen",{C_STRING,C_SIZE_T},C_SIZE_T),
				xSDL_strlcpy = define_c_func(sdl,"+SDL_strlcpy",{C_STRING,C_STRING,C_SIZE_T},C_SIZE_T),
				xSDL_utf8strlcpy = define_c_func(sdl,"+SDL_utf8strlcpy",{C_STRING,C_STRING,C_SIZE_T},C_SIZE_T),
				xSDL_strlcat = define_c_func(sdl,"+SDL_strlcat",{C_STRING,C_STRING,C_SIZE_T},C_SIZE_T),
				xSDL_strdup = define_c_func(sdl,"+SDL_strdup",{C_STRING},C_STRING),
				xSDL_strndup = define_c_func(sdl,"+SDL_strndup",{C_STRING,C_SIZE_T},C_STRING),
				xSDL_strrev = define_c_func(sdl,"+SDL_strrev",{C_STRING},C_STRING),
				xSDL_strupr = define_c_func(sdl,"+SDL_strupr",{C_STRING},C_STRING),
				xSDL_strlwr = define_c_func(sdl,"+SDL_strlwr",{C_STRING},C_STRING),
				xSDL_strchr = define_c_func(sdl,"+SDL_strchr",{C_STRING,C_INT},C_STRING),
				xSDL_strrchr = define_c_func(sdl,"+SDL_strrchr",{C_STRING,C_INT},C_STRING),
				xSDL_strcasestr = define_c_func(sdl,"+SDL_strcasestr",{C_STRING,C_STRING},C_STRING),
				xSDL_strtok_r = define_c_func(sdl,"+SDL_strtok_r",{C_STRING,C_STRING,C_STRING},C_STRING),
				xSDL_utf8strlen = define_c_func(sdl,"+SDL_utf8strlen",{C_STRING},C_SIZE_T),
				xSDL_utf8strnlen = define_c_func(sdl,"+SDL_utf8strnlen",{C_STRING,C_SIZE_T},C_SIZE_T)
				
public function SDL_strlen(sequence str)
	return c_func(xSDL_strlen,{str})
end function

public function SDL_strnlen(sequence str,atom len)
	return c_func(xSDL_strnlen,{str,len})
end function

public function SDL_strlcpy(sequence dst,sequence src,atom len)
	return c_func(xSDL_strlcpy,{dst,src,len})
end function

public function SDL_utf8strlcpy(sequence dst,sequence src,atom bytes)
	return c_func(xSDL_utf8strlcpy,{dst,src,bytes})
end function

public function SDL_strlcat(sequence dst,sequence src,atom len)
	return c_func(xSDL_strlcat,{dst,src,len})
end function

public function SDL_strdup(sequence str)
	return c_func(xSDL_strdup,{str})
end function

public function SDL_strndup(sequence str,atom len)
	return c_func(xSDL_strndup,{str,len})
end function

--public function SDL_streev(sequence str)
--	return c_func(xSDL_streev,{str})
--end function

public function SDL_strupr(sequence str)
	return c_func(xSDL_strupr,{str})
end function

public function SDL_strlwr(sequence str)
	return c_func(xSDL_strlwr,{str})
end function

public function SDL_strchr(sequence str,atom c)
	return c_func(xSDL_strchr,{str,c})
end function

public function SDL_strrchr(sequence str,atom c)
	return c_func(xSDL_strrchr,{str,c})
end function

--public function SDL_strstr(sequence hay,sequence need)
--	return c_func(xSDL_strstr,{hay,need})
--end function

public function SDL_strcasestr(sequence hay,sequence need)
	return c_func(xSDL_strcasestr,{hay,need})
end function

public function SDL_strtok_r(sequence s1,sequence s2,sequence save)
	return c_func(xSDL_strtok_r,{s1,s2,save})
end function

public function SDL_utf8strlen(sequence str)
	return c_func(xSDL_utf8strlen,{str})
end function

public function SDL_utf8strnlen(sequence str,atom bytes)
	return c_func(xSDL_utf8strnlen,{str,bytes})
end function

public constant xSDL_itoa = define_c_func(sdl,"+SDL_itoa",{C_INT,C_STRING,C_INT},C_STRING),
				xSDL_uitoa = define_c_func(sdl,"+SDL_uitoa",{C_UINT,C_STRING,C_INT},C_STRING),
				xSDL_ltoa = define_c_func(sdl,"+SDL_ltoa",{C_LONG,C_STRING,C_INT},C_STRING),
				xSDL_ultoa = define_c_func(sdl,"+SDL_ultoa",{C_ULONG,C_STRING,C_INT},C_STRING),
				xSDL_lltoa = define_c_func(sdl,"+SDL_lltoa",{C_INT64,C_STRING,C_INT},C_STRING),
				xSDL_ulltoa = define_c_func(sdl,"+SDL_ulltoa",{C_UINT64,C_STRING,C_INT},C_STRING)
				
public function SDL_itoa(atom val,sequence str,atom x)
	return c_func(xSDL_itoa,{val,str,x})
end function

public function SDL_uitoa(atom val,sequence str,atom x)
	return c_func(xSDL_uitoa,{val,str,x})
end function

public function SDL_ltoa(atom val,sequence str,atom x)
	return c_func(xSDL_ltoa,{val,str,x})
end function

public function SDL_ultoa(atom val,sequence str,atom x)
	return c_func(xSDL_ultoa,{val,str,x})
end function

public function SDL_lltoa(atom val,sequence str,atom x)
	return c_func(xSDL_lltoa,{val,str,x})
end function

public function SDL_ulltoa(atom val,sequence str,atom x)
	return c_func(xSDL_ulltoa,{val,str,x})
end function

public constant xSDL_atoi = define_c_func(sdl,"+SDL_atoi",{C_STRING},C_INT),
				xSDL_atof = define_c_func(sdl,"+SDL_atof",{C_STRING},C_DOUBLE),
				xSDL_strtol = define_c_func(sdl,"+SDL_strtol",{C_STRING,C_STRING,C_INT},C_LONG),
				xSDL_strtoul = define_c_func(sdl,"+SDL_strtoul",{C_STRING,C_STRING,C_INT},C_ULONG),
				xSDL_strtoll = define_c_func(sdl,"+SDL_strtoll",{C_STRING,C_STRING,C_INT},C_INT64),
				xSDL_strtoull = define_c_func(sdl,"+SDL_strtoull",{C_STRING,C_STRING,C_INT},C_UINT64),
				xSDL_strtod = define_c_func(sdl,"+SDL_strtod",{C_STRING,C_STRING},C_DOUBLE)
				
public function SDL_atoi(sequence str)
	return c_func(xSDL_atoi,{str})
end function

public function SDL_atof(sequence str)
	return c_func(xSDL_atof,{str})
end function

public function SDL_strtol(sequence str,sequence e,atom base)
	return c_func(xSDL_strtol,{str,e,base})
end function

public function SDL_strtoul(sequence str,sequence e,atom base)
	return c_func(xSDL_strtoul,{str,e,base})
end function

public function SDL_strtoll(sequence str,sequence e,atom base)
	return c_func(xSDL_strtoll,{str,e,base})
end function

public function SDL_strtoull(sequence str,sequence e,atom base)
	return c_func(xSDL_strtoull,{str,e,base})
end function

public function SDL_strtod(sequence str,sequence e)
	return c_func(xSDL_strtod,{str,e})
end function

public constant xSDL_strcmp = define_c_func(sdl,"+SDL_strcmp",{C_STRING,C_STRING},C_INT),
				xSDL_strncmp = define_c_func(sdl,"+SDL_strncmp",{C_STRING,C_STRING,C_SIZE_T},C_INT),
				xSDL_strcasecmp = define_c_func(sdl,"+SDL_strcasecmp",{C_STRING,C_STRING},C_INT),
				xSDL_strncasecmp = define_c_func(sdl,"+SDL_strncasecmp",{C_STRING,C_STRING,C_SIZE_T},C_INT)
				
public function SDL_strcmp(sequence str,sequence str2)
	return c_func(xSDL_strcmp,{str,str2})
end function

public function SDL_strncmp(sequence str,sequence str2,atom len)
	return c_func(xSDL_strncmp,{str,str2,len})
end function

public function SDL_strcasecmp(sequence str,sequence str2)
	return c_func(xSDL_strcasecmp,{str,str2})
end function

public function SDL_strncasecmp(sequence str,sequence str2,atom len)
	return c_func(xSDL_strncasecmp,{str,str2,len})
end function

public constant xSDL_sscanf = define_c_func(sdl,"+SDL_sscanf",{C_STRING,C_STRING,C_STRING},C_INT),
				xSDL_vsscanf = define_c_func(sdl,"+SDL_vsscanf",{C_STRING,C_STRING,C_INT},C_INT),
				xSDL_snprintf = define_c_func(sdl,"+SDL_snprintf",{C_STRING,C_SIZE_T,C_STRING,C_STRING},C_INT),
				xSDL_swprintf = define_c_func(sdl,"+SDL_swprintf",{C_WSTRING,C_SIZE_T,C_WSTRING,C_WSTRING},C_INT),
				xSDL_vsnprintf = define_c_func(sdl,"+SDL_vsnprintf",{C_STRING,C_SIZE_T,C_STRING,C_INT},C_INT),
				xSDL_vswprintf = define_c_func(sdl,"+SDL_vswprintf",{C_WSTRING,C_SIZE_T,C_WSTRING,C_INT},C_INT),
				xSDL_asprintf = define_c_func(sdl,"+SDL_asprintf",{C_STRING,C_STRING,C_STRING},C_INT),
				xSDL_vasprintf = define_c_func(sdl,"+SDL_vasprintf",{C_STRING,C_STRING,C_INT},C_INT)
				
public function SDL_sscanf(sequence text,sequence fmt,sequence x)
	return c_func(xSDL_sscanf,{text,fmt,x})
end function

public function SDL_vsscanf(sequence text,sequence fmt,atom ap)
	return c_func(xSDL_vsscanf,{text,fmt,ap})
end function

public function SDL_snprintf(sequence text,atom len,sequence fmt,sequence x)
	return c_func(xSDL_snprintf,{text,len,fmt,x})
end function

public function SDL_swprintf(sequence text,atom len,sequence fmt,sequence x)
	return c_func(xSDL_swprintf,{text,len,fmt,x})
end function

public function SDL_vsnprintf(sequence text,atom len,sequence fmt,atom ap)
	return c_func(xSDL_vsnprintf,{text,len,fmt,ap})
end function

public function SDL_vswprintf(sequence text,atom len,sequence fmt,atom ap)
	return c_func(xSDL_vswprintf,{text,len,fmt,ap})
end function

public function SDL_asprintf(sequence str,sequence fmt,sequence x)
	return c_func(xSDL_asprintf,{str,fmt,x})
end function

public function SDL_vasprintf(sequence str,sequence fmt,atom ap)
	return c_func(xSDL_vasprintf,{str,fmt,ap})
end function
				
public constant SDL_PI_D = 3.141592653589793238462643383279502884

public constant xSDL_acos = define_c_func(sdl,"+SDL_acos",{C_DOUBLE},C_DOUBLE),
				xSDL_acosf = define_c_func(sdl,"+SDL_acosf",{C_FLOAT},C_FLOAT),
				xSDL_asin = define_c_func(sdl,"+SDL_asin",{C_DOUBLE},C_DOUBLE),
				xSDL_asinf = define_c_func(sdl,"+SDL_asinf",{C_FLOAT},C_FLOAT),
				xSDL_atan = define_c_func(sdl,"+SDL_atan",{C_DOUBLE},C_DOUBLE),
				xSDL_atanf = define_c_func(sdl,"+SDL_atanf",{C_FLOAT},C_FLOAT),
				xSDL_atan2 = define_c_func(sdl,"+SDL_atan2",{C_DOUBLE,C_DOUBLE},C_DOUBLE),
				xSDL_atan2f = define_c_func(sdl,"+SDL_atan2f",{C_FLOAT,C_FLOAT},C_FLOAT),
				xSDL_ceil = define_c_func(sdl,"+SDL_ceil",{C_DOUBLE},C_DOUBLE),
				xSDL_ceilf = define_c_func(sdl,"+SDL_ceilf",{C_FLOAT},C_FLOAT),
				xSDL_copysign = define_c_func(sdl,"+SDL_copysign",{C_DOUBLE,C_DOUBLE},C_DOUBLE),
				xSDL_copysignf = define_c_func(sdl,"+SDL_copysignf",{C_FLOAT,C_FLOAT},C_FLOAT),
				xSDL_cos = define_c_func(sdl,"+SDL_cos",{C_DOUBLE},C_DOUBLE),
				xSDL_cosf = define_c_func(sdl,"+SDL_cosf",{C_FLOAT},C_FLOAT),
				xSDL_exp = define_c_func(sdl,"+SDL_exp",{C_DOUBLE},C_DOUBLE),
				xSDL_expf = define_c_func(sdl,"+SDL_expf",{C_FLOAT},C_FLOAT),
				xSDL_fabs = define_c_func(sdl,"+SDL_fabs",{C_DOUBLE},C_DOUBLE),
				xSDL_fabsf = define_c_func(sdl,"+SDL_fabsf",{C_FLOAT},C_FLOAT),
				xSDL_floor = define_c_func(sdl,"+SDL_floor",{C_DOUBLE},C_DOUBLE),
				xSDL_floorf = define_c_func(sdl,"+SDL_floorf",{C_FLOAT},C_FLOAT),
				xSDL_trunc = define_c_func(sdl,"+SDL_trunc",{C_DOUBLE},C_DOUBLE),
				xSDL_truncf = define_c_func(sdl,"+SDL_truncf",{C_FLOAT},C_FLOAT),
				xSDL_fmod = define_c_func(sdl,"+SDL_fmod",{C_DOUBLE,C_DOUBLE},C_DOUBLE),
				xSDL_fmodf = define_c_func(sdl,"+SDL_fmodf",{C_FLOAT,C_FLOAT},C_FLOAT),
				xSDL_log = define_c_func(sdl,"+SDL_log",{C_DOUBLE},C_DOUBLE),
				xSDL_logf = define_c_func(sdl,"+SDL_logf",{C_FLOAT},C_FLOAT),
				xSDL_log10 = define_c_func(sdl,"+SDL_log10",{C_DOUBLE},C_DOUBLE),
				xSDL_log10f = define_c_func(sdl,"+SDL_log10f",{C_FLOAT},C_FLOAT),
				xSDL_modf = define_c_func(sdl,"+SDL_modf",{C_DOUBLE,C_POINTER},C_DOUBLE),
				xSDL_modff = define_c_func(sdl,"+SDL_modff",{C_FLOAT,C_POINTER},C_FLOAT),
				xSDL_pow = define_c_func(sdl,"+SDL_pow",{C_DOUBLE,C_DOUBLE},C_DOUBLE),
				xSDL_powf = define_c_func(sdl,"+SDL_powf",{C_FLOAT,C_FLOAT},C_FLOAT),
				xSDL_round = define_c_func(sdl,"+SDL_round",{C_DOUBLE},C_DOUBLE),
				xSDL_roundf = define_c_func(sdl,"+SDL_roundf",{C_FLOAT},C_FLOAT),
				xSDL_lround = define_c_func(sdl,"+SDL_lround",{C_DOUBLE},C_LONG),
				xSDL_lroundf = define_c_func(sdl,"+SDL_lroundf",{C_FLOAT},C_LONG),
				xSDL_scalbn = define_c_func(sdl,"+SDL_scalbn",{C_DOUBLE,C_INT},C_DOUBLE),
				xSDL_scalbnf = define_c_func(sdl,"+SDL_scalbnf",{C_FLOAT,C_INT},C_FLOAT),
				xSDL_sin = define_c_func(sdl,"+SDL_sin",{C_DOUBLE},C_DOUBLE),
				xSDL_sinf = define_c_func(sdl,"+SDL_sinf",{C_FLOAT},C_FLOAT),
				xSDL_sqrt = define_c_func(sdl,"+SDL_sqrt",{C_DOUBLE},C_DOUBLE),
				xSDL_sqrtf = define_c_func(sdl,"+SDL_sqrtf",{C_FLOAT},C_FLOAT),
				xSDL_tan = define_c_func(sdl,"+SDL_tan",{C_DOUBLE},C_DOUBLE),
				xSDL_tanf = define_c_func(sdl,"+SDL_tanf",{C_FLOAT},C_FLOAT)
				
public function SDL_acos(atom x)
	return c_func(xSDL_acos,{x})
end function

public function SDL_acosf(atom x)
	return c_func(xSDL_acosf,{x})
end function

public function SDL_asin(atom x)
	return c_func(xSDL_asin,{x})
end function

public function SDL_asinf(atom x)
	return c_func(xSDL_asinf,{x})
end function

public function SDL_atan(atom x)
	return c_func(xSDL_atan,{x})
end function

public function SDL_atanf(atom x)
	return c_func(xSDL_atanf,{x})
end function

public function SDL_atan2(atom y,atom x)
	return c_func(xSDL_atan2,{y,x})
end function

public function SDL_atan2f(atom y,atom x)
	return c_func(xSDL_atan2f,{y,x})
end function

public function SDL_ceil(atom x)
	return c_func(xSDL_ceil,{x})
end function

public function SDL_ceilf(atom x)
	return c_func(xSDL_ceilf,{x})
end function

public function SDL_copysign(atom x,atom y)
	return c_func(xSDL_copysign,{x,y})
end function

public function SDL_copysignf(atom x,atom y)
	return c_func(xSDL_copysignf,{x,y})
end function

public function SDL_cos(atom x)
	return c_func(xSDL_cos,{x})
end function

public function SDL_cosf(atom x)
	return c_func(xSDL_cosf,{x})
end function

public function SDL_exp(atom x)
	return c_func(xSDL_exp,{x})
end function

public function SDL_expf(atom x)
	return c_func(xSDL_expf,{x})
end function

public function SDL_fabs(atom x)
	return c_func(xSDL_fabs,{x})
end function

public function SDL_fabsf(atom x)
	return c_func(xSDL_fabsf,{x})
end function

public function SDL_floor(atom x)
	return c_func(xSDL_floor,{x})
end function

public function SDL_floorf(atom x)
	return c_func(xSDL_floorf,{x})
end function

public function SDL_trunc(atom x)
	return c_func(xSDL_trunc,{x})
end function

public function SDL_truncf(atom x)
	return c_func(xSDL_truncf,{x})
end function

public function SDL_fmod(atom x,atom y)
	return c_func(xSDL_fmod,{x,y})
end function

public function SDL_fmodf(atom x,atom y)
	return c_func(xSDL_fmodf,{x,y})
end function

public function SDL_log(atom x)
	return c_func(xSDL_log,{x})
end function

public function SDL_logf(atom x)
	return c_func(xSDL_logf,{x})
end function

public function SDL_log10(atom x)
	return c_func(xSDL_log10,{x})
end function

public function SDL_log10f(atom x)
	return c_func(xSDL_log10f,{x})
end function

public function SDL_modf(atom x,atom y)
	return c_func(xSDL_modf,{x,y})
end function

public function SDL_modff(atom x,atom y)
	return c_func(xSDL_modff,{x,y})
end function

public function SDL_pow(atom x,atom y)
	return c_func(xSDL_pow,{x,y})
end function

public function SDL_powf(atom x,atom y)
	return c_func(xSDL_powf,{x,y})
end function

public function SDL_round(atom x)
	return c_func(xSDL_round,{x})
end function

public function SDL_roundf(atom x)
	return c_func(xSDL_roundf,{x})
end function

public function SDL_lround(atom x)
	return c_func(xSDL_lround,{x})
end function

public function SDL_lroundf(atom x)
	return c_func(xSDL_lroundf,{x})
end function

public function SDL_scalbn(atom x,atom n)
	return c_func(xSDL_scalbn,{x,n})
end function

public function SDL_scalbnf(atom x,atom n)
	return c_func(xSDL_scalbnf,{x,n})
end function

public function SDL_sin(atom x)
	return c_func(xSDL_sin,{x})
end function

public function SDL_sinf(atom x)
	return c_func(xSDL_sinf,{x})
end function

public function SDL_sqrt(atom x)
	return c_func(xSDL_sqrt,{x})
end function

public function SDL_sqrtf(atom x)
	return c_func(xSDL_sqrtf,{x})
end function

public function SDL_tan(atom x)
	return c_func(xSDL_tan,{x})
end function

public function SDL_tanf(atom x)
	return c_func(xSDL_tanf,{x})
end function

public constant xSDL_iconv_open = define_c_func(sdl,"+SDL_iconv_open",{C_STRING,C_STRING},C_POINTER),
				xSDL_iconv_close = define_c_func(sdl,"+SDL_iconv_close",{C_POINTER},C_INT),
				xSDL_iconv = define_c_func(sdl,"+SDL_iconv",{C_POINTER,C_STRING,C_POINTER,C_STRING,C_POINTER},C_SIZE_T)
				
public function SDL_iconv_open(sequence tocode,sequence fromcode)
	return c_func(xSDL_iconv_open,{tocode,fromcode})
end function

public function SDL_iconv_close(atom cd)
	return c_func(xSDL_iconv_close,{cd})
end function

public function SDL_iconv(atom cd,sequence inbuf,atom bytesleft,sequence outbuf,atom bl)
	return c_func(xSDL_iconv,{cd,inbuf,bytesleft,outbuf,bl})
end function

public constant xSDL_iconv_string = define_c_func(sdl,"+SDL_iconv_string",{C_STRING,C_STRING,C_STRING,C_SIZE_T},C_STRING)

public function SDL_iconv_string(sequence tocode,sequence fromcode,sequence inbuf,atom left)
	return c_func(xSDL_iconv_string,{tocode,fromcode,inbuf,left})
end function
­17.22
