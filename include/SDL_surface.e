include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_pixels.e
include SDL_rect.e
include SDL_blendmode.e
include SDL_rwops.e --SDL_IOStream

public constant SDL_SWSURFACE = 0
public constant SDL_PREALLOC = 0x00000001
public constant SDL_RLEACCEL = 0x00000002
public constant SDL_DONTFREE = 0x00000004
public constant SDL_SIMD_ALIGNED = 0x00000008

public enum type SDL_ScaleMode
	SDL_SCALEMODE_NEAREST = 0,
	SDL_SCALEMODE_LINEAR,
	SDL_SCALEMODE_BEST
end type

--typedef struct SDL_Blitmap --opaque

public constant SDL_Surface = define_c_struct({
	C_UINT32, --flags
	C_POINTER, --format SDL_PixelFormat
	C_INT,C_INT, --w,h
	C_INT, --pitch
	C_POINTER, --pixels
	C_POINTER, --userdata
	C_INT, --locked
	C_POINTER, --list_blitmap
	SDL_Rect, --clip_rect
	C_POINTER, --map
	C_INT --refcount
})

public enum type SDL_YUV_CONVERSION_MODE
	SDL_YUV_CONVERSION_JPEG = 0,
	SDL_YUV_CONVERSION_BT601,
	SDL_YUV_CONVERSION_BT709,
	SDL_YUV_CONVERSION_AUTOMATIC
end type

export constant xSDL_CreateSurface = define_c_func(sdl,"+SDL_CreateSurface",{C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreateSurface(atom w,atom h,atom format)
	return c_func(xSDL_CreateSurface,{w,h,format})
end function

export constant xSDL_CreateSurfaceFrom = define_c_func(sdl,"+SDL_CreateSurfaceFrom",{C_POINTER,C_INT,C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreateSurfaceFrom(object pixels,atom w,atom h,atom pitch,atom format)
	return c_func(xSDL_CreateSurfaceFrom,{pixels,w,h,pitch,format})
end function

export constant xSDL_DestroySurface = define_c_proc(sdl,"+SDL_DestroySurface",{C_POINTER})

public procedure SDL_DestroySurface(atom surf)
	c_proc(xSDL_DestroySurface,{surf})
end procedure

export constant xSDL_SetSurfacePalette = define_c_func(sdl,"+SDL_SetSurfacePalette",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetSurfacePalette(atom surf,atom pal)
	return c_func(xSDL_SetSurfacePalette,{surf,pal})
end function

export constant xSDL_LockSurface = define_c_func(sdl,"+SDL_LockSurface",{C_POINTER},C_INT)

public function SDL_LockSurface(atom surf)
	return c_func(xSDL_LockSurface,{surf})
end function

export constant xSDL_UnlockSurface = define_c_proc(sdl,"+SDL_UnlockSurface",{C_POINTER})

public procedure SDL_UnlockSurface(atom surf)
	c_proc(xSDL_UnlockSurface,{surf})
end procedure

export constant xSDL_LoadBMP_IO = define_c_func(sdl,"+SDL_LoadBMP_IO",{C_POINTER,C_INT},C_POINTER)

public function SDL_LoadBMP_IO(atom src,atom freesrc)
	return c_func(xSDL_LoadBMP_IO,{src,freesrc})
end function

public function SDL_LoadBMP(sequence file)
	return SDL_LoadBMP_IO(SDL_IOFromFile(file,"rb"),1)
end function

export constant xSDL_SaveBMP_IO = define_c_func(sdl,"+SDL_SaveBMP_IO",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_SaveBMP_IO(atom surf,atom dst,atom freedst)
	return c_func(xSDL_SaveBMP_IO,{surf,dst,freedst})
end function

public function SDL_SaveBMP(atom surf,sequence file)
	return SDL_SaveBMP_IO(surf, SDL_IOFromFile(file,"wb"),1)
end function

export constant xSDL_SetSurfaceRLE = define_c_func(sdl,"+SDL_SetSurfaceRLE",{C_POINTER,C_INT},C_INT)

public function SDL_SetSurfaceRLE(atom surf,atom flag)
	return c_func(xSDL_SetSurfaceRLE,{surf,flag})
end function

export constant xSDL_SurfaceHasRLE = define_c_func(sdl,"+SDL_SurfaceHasRLE",{C_POINTER},C_BOOL)

public function SDL_SurfaceHasRLE(atom surf)
	return c_func(xSDL_SurfaceHasRLE,{surf})
end function

export constant xSDL_SetSurfaceColorKey = define_c_func(sdl,"+SDL_SetSurfaceColorKey",{C_POINTER,C_INT,C_UINT32},C_INT)

public function SDL_SetSurfaceColorKey(atom surf,atom flag,atom key)
	return c_func(xSDL_SetSurfaceColorKey,{surf,flag,key})
end function

export constant xSDL_SurfaceHasColorKey = define_c_func(sdl,"+SDL_SurfaceHasColorKey",{C_POINTER},C_BOOL)

public function SDL_SurfaceHasColorKey(atom surf)
	return c_func(xSDL_SurfaceHasColorKey,{surf})
end function

export constant xSDL_GetSurfaceColorKey = define_c_func(sdl,"+SDL_GetSurfaceColorKey",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceColorKey(atom surf,atom key)
	return c_func(xSDL_GetSurfaceColorKey,{surf,key})
end function

export constant xSDL_SetSurfaceColorMod = define_c_func(sdl,"+SDL_SetSurfaceColorMod",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_INT)

public function SDL_SetSurfaceColorMod(atom surf,atom r,atom g,atom b)
	return c_func(xSDL_SetSurfaceColorMod,{surf,r,g,b})
end function

export constant xSDL_GetSurfaceColorMod = define_c_func(sdl,"+SDL_GetSurfaceColorMod",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceColorMod(atom surf,atom r,atom g,atom b)
	return c_func(xSDL_GetSurfaceColorMod,{surf,r,g,b})
end function

export constant xSDL_SetSurfaceAlphaMod = define_c_func(sdl,"+SDL_SetSurfaceAlphaMod",{C_POINTER,C_UINT8},C_INT)

public function SDL_SetSurfaceAlphaMod(atom surf,atom alpha)
	return c_func(xSDL_SetSurfaceAlphaMod,{surf,alpha})
end function

export constant xSDL_GetSurfaceAlphaMod = define_c_func(sdl,"+SDL_GetSurfaceAlphaMod",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceAlphaMod(atom surf,atom alpha)
	return c_func(xSDL_GetSurfaceAlphaMod,{surf,alpha})
end function

export constant xSDL_SetSurfaceBlendMode = define_c_func(sdl,"+SDL_SetSurfaceBlendMode",{C_POINTER,C_INT},C_INT)

public function SDL_SetSurfaceBlendMode(atom surf,SDL_BlendMode mode)
	return c_func(xSDL_SetSurfaceBlendMode,{surf,mode})
end function

export constant xSDL_GetSurfaceBlendMode = define_c_func(sdl,"+SDL_GetSurfaceBlendMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceBlendMode(atom surf,atom mode)
	return c_func(xSDL_GetSurfaceBlendMode,{surf,mode})
end function

export constant xSDL_SetSurfaceClipRect = define_c_func(sdl,"+SDL_SetSurfaceClipRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetSurfaceClipRect(atom surf,atom rect)
	return c_func(xSDL_SetSurfaceClipRect,{surf,rect})
end function

export constant xSDL_GetSurfaceClipRect = define_c_func(sdl,"+SDL_GetSurfaceClipRect",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceClipRect(atom surf,atom rect)
	return c_func(xSDL_GetSurfaceClipRect,{surf,rect})
end function

export constant xSDL_DuplicateSurface = define_c_func(sdl,"+SDL_DuplicateSurface",{C_POINTER},C_POINTER)

public function SDL_DuplicateSurface(atom surf)
	return c_func(xSDL_DuplicateSurface,{surf})
end function

export constant xSDL_ConvertSurface = define_c_func(sdl,"+SDL_ConvertSurface",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_ConvertSurface(atom surf,atom format)
	return c_func(xSDL_ConvertSurface,{surf,format})
end function

export constant xSDL_ConvertSurfaceFormat = define_c_func(sdl,"+SDL_ConvertSurfaceFormat",{C_POINTER,C_UINT32},C_POINTER)

public function SDL_ConvertSurfaceFormat(atom surf,atom pixel_format)
	return c_func(xSDL_ConvertSurfaceFormat,{surf,pixel_format})
end function

export constant xSDL_ConvertPixels = define_c_func(sdl,"+SDL_ConvertPixels",{C_INT,C_INT,C_UINT32,C_POINTER,C_INT,C_UINT32,C_POINTER,C_INT},C_INT)

public function SDL_ConvertPixels(atom w,atom h,atom src_format,atom src,atom src_pitch,atom dst_format,atom dst,atom dst_pitch)
	return c_func(xSDL_ConvertPixels,{w,h,src_format,src,src_pitch,dst_format,dst,dst_pitch})
end function

export constant xSDL_PremultiplyAlpha = define_c_func(sdl,"+SDL_PremultiplyAlpha",{C_INT,C_INT,C_UINT32,C_POINTER,C_INT,C_UINT32,C_POINTER,C_INT},C_INT)

public function SDL_PremultiplyAlpha(atom w,atom h,atom src_format,atom src,atom src_pitch,atom dst_format,atom dst,atom dst_pitch)
	return c_func(xSDL_PremultiplyAlpha,{w,h,src_format,src,src_pitch,dst_format,dst,dst_pitch})
end function

export constant xSDL_FillSurfaceRect = define_c_func(sdl,"+SDL_FillSurfaceRect",{C_POINTER,C_POINTER,C_UINT32},C_INT)

public function SDL_FillSurfaceRect(atom dst,atom rect,atom color)
	return c_func(xSDL_FillSurfaceRect,{dst,rect,color})
end function

export constant xSDL_FillSurfaceRects = define_c_func(sdl,"+SDL_FillSurfaceRects",{C_POINTER,C_POINTER,C_INT,C_UINT32},C_INT)

public function SDL_FillSurfaceRects(atom dst,atom rects,atom count,atom color)
	return c_func(xSDL_FillSurfaceRects,{dst,rects,count,color})
end function

export constant xSDL_BlitSurface = define_c_func(sdl,"+SDL_BlitSurface",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_BlitSurface(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurface,{src,srcrect,dst,dstrect})
end function

export constant xSDL_BlitSurfaceUnchecked = define_c_func(sdl,"+SDL_BlitSurfaceUnchecked",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_BlitSurfaceUnchecked(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurfaceUnchecked,{src,srcrect,dst,dstrect})
end function

export constant xSDL_SoftStretch = define_c_func(sdl,"+SDL_SoftStretch",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SoftStretch(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_SoftStretch,{src,srcrect,dst,dstrect})
end function

export constant xSDL_SoftStretchLinear = define_c_func(sdl,"+SDL_SoftStretchLinear",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SoftStretchLinear(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_SoftStretchLinear,{src,srcrect,dst,dstrect})
end function

export constant xSDL_BlitSurfaceScaled = define_c_func(sdl,"+SDL_BlitSurfaceScaled",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_BlitSurfaceScaled(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurfaceScaled,{src,srcrect,dst,dstrect})
end function

export constant xSDL_BlitSurfaceUncheckedScaled = define_c_func(sdl,"+SDL_BlitSurfaceUncheckedScaled",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_BlitSurfaceUncheckedScaled(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurfaceUncheckedScaled,{src,srcrect,dst,dstrect})
end function

export constant xSDL_SetYUVConversionMode = define_c_proc(sdl,"+SDL_SetYUVConversionMode",{C_INT})

public procedure SDL_SetYUVConversionMode(SDL_YUV_CONVERSION_MODE mode)
	c_proc(xSDL_SetYUVConversionMode,{mode})
end procedure

export constant xSDL_GetYUVConversionMode = define_c_func(sdl,"+SDL_GetYUVConversionMode",{},C_INT)

public function SDL_GetYUVConversionMode()
	return c_func(xSDL_GetYUVConversionMode,{})
end function

export constant xSDL_GetYUVConversionModeForResolution = define_c_func(sdl,"+SDL_GetYUVConversionModeForResolution",{C_INT,C_INT},C_INT)

public function SDL_GetYUVConversionModeForResolution(atom w,atom h)
	return c_func(xSDL_GetYUVConversionModeForResolution,{w,h})
end function
­99.52