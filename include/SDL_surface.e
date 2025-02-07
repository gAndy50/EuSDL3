include std/ffi.e
include std/machine.e

include SDL.e
include SDL_error.e
include SDL_blendmode.e
include SDL_pixels.e
include SDL_properties.e
include SDL_rect.e
include SDL_iostream.e

public constant SDL_SurfaceFlags = C_UINT32

public constant SDL_SURFACE_PREALLOCATED = 0x00000001,
				SDL_SURFACE_LOCK_NEEDED = 0x00000002,
				SDL_SURFACE_LOCKED = 0x00000004,
				SDL_SURFACE_SIMD_ALIGNED = 0x00000008
				
public enum type SDL_ScaleMode
	SDL_SCALEMODE_NEAREST = 0,
	SDL_SCALEMODE_LINEAR
end type

public enum type SDL_FlipMode
	SDL_FLIP_NONE = 0,
	SDL_FLIP_HORIZONTAL,
	SDL_FLIP_VERTICAL
end type

ifdef SDL_INTERNAL then

public constant SDL_Surface = define_c_struct({
	C_UINT32, --flags
	C_INT, --format
	C_INT, --w
	C_INT, --h
	C_POINTER, --pixels
	C_INT, --refcount
	C_POINTER --reserved
})

end ifdef

public constant xSDL_CreateSurface = define_c_func(sdl,"+SDL_CreateSurface",{C_INT,C_INT,C_INT},C_POINTER)

public function SDL_CreateSurface(atom width,atom height,SDL_PixelFormat format)
	return c_func(xSDL_CreateSurface,{width,height,format})
end function

public constant xSDL_CreateSurfaceFrom = define_c_func(sdl,"+SDL_CreateSurfaceFrom",{C_INT,C_INT,C_INT,C_POINTER,C_INT},C_POINTER)

public function SDL_CreateSurfaceFrom(atom width,atom height,SDL_PixelFormat format,atom pixels,atom pitch)
	return c_func(xSDL_CreateSurfaceFrom,{width,height,format,pixels,pitch})
end function

public constant xSDL_DestroySurface = define_c_proc(sdl,"+SDL_DestroySurface",{C_POINTER})

public procedure SDL_DestroySurface(atom surface)
	c_proc(xSDL_DestroySurface,{surface})
end procedure

public constant xSDL_GetSurfaceProperties = define_c_func(sdl,"+SDL_GetSurfaceProperties",{C_POINTER},C_UINT32)

public function SDL_GetSurfaceProperties(atom surface)
	return c_func(xSDL_GetSurfaceProperties,{surface})
end function

public constant SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT = "SDL.surface.SDR_white_point",
				SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT = "SDL.surface.HDR_headroom",
				SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING = "SDL.surface.tonemap"
				
public constant xSDL_SetSurfaceColorspace = define_c_func(sdl,"+SDL_SetSurfaceColorspace",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetSurfaceColorspace(atom surface,SDL_Colorspace color)
	return c_func(xSDL_SetSurfaceColorspace,{surface,color})
end function

public constant xSDL_GetSurfaceColorspace = define_c_func(sdl,"+SDL_GetSurfaceColorspace",{C_POINTER},C_INT)

public function SDL_GetSurfaceColorspace(atom surface)
	return c_func(xSDL_GetSurfaceColorspace,{surface})
end function

public constant xSDL_CreateSurfacePalette = define_c_func(sdl,"+SDL_CreateSurfacePalette",{C_POINTER},C_POINTER)

public function SDL_CreateSurfacePalette(atom surface)
	return c_func(xSDL_CreateSurfacePalette,{surface})
end function

public constant xSDL_SetSurfacePalette = define_c_func(sdl,"+SDL_SetSurfacePalette",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetSurfacePalette(atom surface,atom palette)
	return c_func(xSDL_SetSurfacePalette,{surface,palette})
end function

public constant xSDL_GetSurfacePalette = define_c_func(sdl,"+SDL_GetSurfacePalette",{C_POINTER},C_POINTER)

public function SDL_GetSurfacePalette(atom surface)
	return c_func(xSDL_GetSurfacePalette,{surface})
end function

public constant xSDL_AddSurfaceAlternateImage = define_c_func(sdl,"+SDL_AddSurfaceAlternateImage",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_AddSurfaceAlternateImage(atom surface,atom image)
	return c_func(xSDL_AddSurfaceAlternateImage,{surface,image})
end function

public constant xSDL_SurfaceHasAlternateImages = define_c_func(sdl,"+SDL_SurfaceHasAlternateImages",{C_POINTER},C_BOOL)

public function SDL_SurfaceHasAlternateImages(atom surface)
	return c_func(xSDL_SurfaceHasAlternateImages,{surface})
end function

public constant xSDL_GetSurfaceImages = define_c_func(sdl,"+SDL_GetSurfaceImages",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetSurfaceImages(atom surface,atom count)
	return c_func(xSDL_GetSurfaceImages,{surface,count})
end function

public constant xSDL_RemoveSurfaceAlternateImages = define_c_proc(sdl,"+SDL_RemoveSurfaceAlternateImages",{C_POINTER})

public procedure SDL_RemoveSurfaceAlternateImages(atom surface)
	c_proc(xSDL_RemoveSurfaceAlternateImages,{surface})
end procedure

public constant xSDL_LockSurface = define_c_func(sdl,"+SDL_LockSurface",{C_POINTER},C_BOOL)

public function SDL_LockSurface(atom surface)
	return c_func(xSDL_LockSurface,{surface})
end function

public constant xSDL_UnlockSurface = define_c_proc(sdl,"+SDL_UnlockSurface",{C_POINTER})

public procedure SDL_UnlockSurface(atom surface)
	c_proc(xSDL_UnlockSurface,{surface})
end procedure

public constant xSDL_LoadBMP_IO = define_c_func(sdl,"+SDL_LoadBMP_IO",{C_POINTER,C_BOOL},C_POINTER)

public function SDL_LoadBMP_IO(atom src,atom closeio)
	return c_func(xSDL_LoadBMP_IO,{src,closeio})
end function

public constant xSDL_LoadBMP = define_c_func(sdl,"+SDL_LoadBMP",{C_STRING},C_POINTER)

public function SDL_LoadBMP(sequence file)
	return SDL_LoadBMP_IO(SDL_IOFromFile(file,"rb"),1)
end function

public constant xSDL_SaveBMP_IO = define_c_func(sdl,"+SDL_SaveBMP_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function SDL_SaveBMP_IO(atom surface,atom dst,atom closeio)
	return c_func(xSDL_SaveBMP_IO,{surface,dst,closeio})
end function

public constant xSDL_SaveBMP = define_c_func(sdl,"+SDL_SaveBMP",{C_POINTER,C_STRING},C_BOOL)

public function SDL_SaveBMP(atom surface,sequence file)
	return SDL_SaveBMP_IO(surface,SDL_IOFromFile(file,"wb"),1)
end function

public constant xSDL_SetSurfaceRLE = define_c_func(sdl,"+SDL_SetSurfaceRLE",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetSurfaceRLE(atom surface,atom enabled)
	return c_func(xSDL_SetSurfaceRLE,{surface,enabled})
end function

public constant xSDL_SurfaceHasRLE = define_c_func(sdl,"+SDL_SurfaceHasRLE",{C_POINTER},C_BOOL)

public function SDL_SurfaceHasRLE(atom surface)
	return c_func(xSDL_SurfaceHasRLE,{surface})
end function

public constant xSDL_SetSurfaceColorKey = define_c_func(sdl,"+SDL_SetSurfaceColorKey",{C_POINTER,C_BOOL,C_UINT32},C_BOOL)

public function SDL_SetSurfaceColorKey(atom surface,atom enabled,atom key)
	return c_func(xSDL_SetSurfaceColorKey,{surface,enabled,key})
end function

public constant xSDL_SurfaceHasColorKey = define_c_func(sdl,"+SDL_SurfaceHasColorKey",{C_POINTER},C_BOOL)

public function SDL_SurfaceHasColorKey(atom surface)
	return c_func(xSDL_SurfaceHasColorKey,{surface})
end function

public constant xSDL_GetSurfaceColorKey = define_c_func(sdl,"+SDL_GetSurfaceColorKey",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetSurfaceColorKey(atom surface,atom key)
	return c_func(xSDL_GetSurfaceColorKey,{surface,key})
end function

public constant xSDL_SetSurfaceColorMod = define_c_func(sdl,"+SDL_SetSurfaceColorMod",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_BOOL)

public function SDL_SetSurfaceColorMod(atom surface,atom r,atom g,atom b)
	return c_func(xSDL_SetSurfaceColorMod,{surface,r,g,b})
end function

public constant xSDL_GetSurfaceColorMod = define_c_func(sdl,"+SDL_GetSurfaceColorMod",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetSurfaceColorMod(atom surface,atom r,atom g,atom b)
	return c_func(xSDL_GetSurfaceColorMod,{surface,r,g,b})
end function

public constant xSDL_SetSurfaceAlphaMod = define_c_func(sdl,"+SDL_SetSurfaceAlphaMod",{C_POINTER,C_UINT8},C_BOOL)

public function SDL_SetSurfaceAlphaMod(atom surface,atom alpha)
	return c_func(xSDL_SetSurfaceAlphaMod,{surface,alpha})
end function

public constant xSDL_GetSurfaceAlphaMod = define_c_func(sdl,"+SDL_GetSurfaceAlphaMod",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetSurfaceAlphaMod(atom surface,atom alpha)
	return c_func(xSDL_GetSurfaceAlphaMod,{surface,alpha})
end function

public constant xSDL_SetSurfaceBlendMode = define_c_func(sdl,"+SDL_SetSurfaceBlendMode",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetSurfaceBlendMode(atom surface,atom mode)
	return c_func(xSDL_SetSurfaceBlendMode,{surface,mode})
end function

public constant xSDL_GetSurfaceBlendMode = define_c_func(sdl,"+SDL_GetSurfaceBlendMode",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetSurfaceBlendMode(atom surface,atom mode)
	return c_func(xSDL_GetSurfaceBlendMode,{surface,mode})
end function

public constant xSDL_SetSurfaceClipRect = define_c_func(sdl,"+SDL_SetSurfaceClipRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetSurfaceClipRect(atom surface,atom rect)
	return c_func(xSDL_SetSurfaceClipRect,{surface,rect})
end function

public constant xSDL_GetSurfaceClipRect = define_c_func(sdl,"+SDL_GetSurfaceClipRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetSurfaceClipRect(atom surface,atom rect)
	return c_func(xSDL_GetSurfaceClipRect,{surface,rect})
end function

public constant xSDL_FlipSurface = define_c_func(sdl,"+SDL_FlipSurface",{C_POINTER,C_INT},C_BOOL)

public function SDL_FlipSurface(atom surface,SDL_FlipMode flip)
	return c_func(xSDL_FlipSurface,{surface,flip})
end function

public constant xSDL_DuplicateSurface = define_c_func(sdl,"+SDL_DuplicateSurface",{C_POINTER},C_POINTER)

public function SDL_DuplicateSurface(atom surface)
	return c_func(xSDL_DuplicateSurface,{surface})
end function

public constant xSDL_ScaleSurface = define_c_func(sdl,"+SDL_ScaleSurface",{C_POINTER,C_INT,C_INT,C_INT},C_POINTER)

public function SDL_ScaleSurface(atom surface,atom width,atom height,SDL_ScaleMode mode)
	return c_func(xSDL_ScaleSurface,{surface,width,height,mode})
end function

public constant xSDL_ConvertSurface = define_c_func(sdl,"+SDL_ConvertSurface",{C_POINTER,C_INT},C_POINTER)

public function SDL_ConvertSurface(atom surface,SDL_PixelFormat format)
	return c_func(xSDL_ConvertSurface,{surface,format})
end function

public constant xSDL_ConvertSurfaceAndColorspace = define_c_func(sdl,"+SDL_ConvertSurfaceAndColorspace",{C_POINTER,C_INT,C_POINTER,C_INT,C_UINT32},C_POINTER)

public function SDL_ConvertSurfaceAndColorspace(atom surface,SDL_PixelFormat format,atom palette,SDL_Colorspace color,atom props)
	return c_func(xSDL_ConvertSurfaceAndColorspace,{surface,format,palette,color,props})
end function

public constant xSDL_ConvertPixels = define_c_func(sdl,"+SDL_ConvertPixels",{C_INT,C_INT,C_INT,C_POINTER,C_INT,C_INT,C_POINTER,C_INT},C_BOOL)

public function SDL_ConvertPixels(atom width,atom height,SDL_PixelFormat src_format,atom src,atom src_pitch,SDL_PixelFormat dst_format,atom dst,atom dst_pitch)
	return c_func(xSDL_ConvertPixels,{width,height,src_format,src,src_pitch,dst_format,dst,dst_pitch})
end function

public constant xSDL_ConvertPixelsAndColorspace = define_c_func(sdl,"+SDL_ConvertPixelsAndColorspace",{C_INT,C_INT,C_INT,C_INT,C_UINT32,C_POINTER,C_INT,C_INT,C_POINTER,C_INT,C_INT,C_INT,C_UINT32,C_POINTER,C_INT},C_BOOL)

public function SDL_ConvertPixelsAndColorspace(atom width,atom height,SDL_PixelFormat src_format,SDL_Colorspace src_colorspace,atom src_prop,atom src,atom src_pitch,SDL_PixelFormat dst_format,SDL_Colorspace dst_colorspace,atom dst_prop,atom dst,atom dst_pitch)
	return c_func(xSDL_ConvertPixelsAndColorspace,{width,height,src_format,src_colorspace,src_prop,src,src_pitch,dst_format,dst_colorspace,dst_prop,dst,dst_pitch})
end function

public constant xSDL_PremultiplyAlpha = define_c_func(sdl,"+SDL_PremultiplyAlpha",{C_INT,C_INT,C_INT,C_POINTER,C_INT,C_INT,C_POINTER,C_INT,C_BOOL},C_BOOL)

public function SDL_PremultiplyAlpha(atom width,atom height,SDL_PixelFormat src_format,atom src,atom src_pitch,SDL_PixelFormat dst_format,atom dst,atom dst_pitch,atom linear)
	return c_func(xSDL_PremultiplyAlpha,{width,height,src_format,src,src_pitch,dst_format,dst,dst_pitch,linear})
end function

public constant xSDL_PremultiplySurfaceAlpha = define_c_func(sdl,"+SDL_PremultiplySurfaceAlpha",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_PremultiplySurfaceAlpha(atom surface,atom linear)
	return c_func(xSDL_PremultiplySurfaceAlpha,{surface,linear})
end function

public constant xSDL_ClearSurface = define_c_func(sdl,"+SDL_ClearSurface",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_ClearSurface(atom surface,atom r,atom g,atom b,atom a)
	return c_func(xSDL_ClearSurface,{surface,r,g,b,a})
end function

public constant xSDL_FillSurfaceRect = define_c_func(sdl,"+SDL_FillSurfaceRect",{C_POINTER,C_POINTER,C_UINT32},C_BOOL)

public function SDL_FillSurfaceRect(atom dst,atom rect,atom color)
	return c_func(xSDL_FillSurfaceRect,{dst,rect,color})
end function

public constant xSDL_FillSurfaceRects = define_c_func(sdl,"+SDL_FillSurfaceRects",{C_POINTER,C_POINTER,C_INT,C_UINT32},C_BOOL)

public function SDL_FillSurfaceRects(atom dst,atom rects,atom count,atom color)
	return c_func(xSDL_FillSurfaceRects,{dst,rects,count,color})
end function

public constant xSDL_BlitSurface = define_c_func(sdl,"+SDL_BlitSurface",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_BlitSurface(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurface,{src,srcrect,dst,dstrect})
end function

public constant xSDL_BlitSurfaceUnchecked = define_c_func(sdl,"+SDL_BlitSurfaceUnchecked",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_BlitSurfaceUnchecked(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurfaceUnchecked,{src,srcrect,dst,dstrect})
end function

public constant xSDL_BlitSurfaceScaled = define_c_func(sdl,"+SDL_BlitSurfaceScaled",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_BlitSurfaceScaled(atom src,atom srcrect,atom dst,atom dstrect,SDL_ScaleMode mode)
	return c_func(xSDL_BlitSurfaceScaled,{src,srcrect,dst,dstrect,mode})
end function

public constant xSDL_BlitSurfaceUncheckedScaled = define_c_func(sdl,"+SDL_BlitSurfaceUncheckedScaled",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_BlitSurfaceUncheckedScaled(atom src,atom srcrect,atom dst,atom dstrect,SDL_ScaleMode mode)
	return c_func(xSDL_BlitSurfaceUncheckedScaled,{src,srcrect,dst,dstrect,mode})
end function

public constant xSDL_BlitSurfaceTiled = define_c_func(sdl,"+SDL_BlitSurfaceTiled",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_BlitSurfaceTiled(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurfaceTiled,{src,srcrect,dst,dstrect})
end function

public constant xSDL_BlitSurfaceTiledWithScale = define_c_func(sdl,"+SDL_BlitSurfaceTiledWithScale",{C_POINTER,C_POINTER,C_FLOAT,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_BlitSurfaceTiledWithScale(atom src,atom srcrect,atom scale,SDL_ScaleMode mode,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurfaceTiledWithScale,{src,srcrect,scale,mode,dst,dstrect})
end function

public constant xSDL_BlitSurface9Grid = define_c_func(sdl,"+SDL_BlitSurface9Grid",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT,C_INT,C_FLOAT,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_BlitSurface9Grid(atom src,atom srcrect,atom left_width,atom right_width,atom top_height,atom bottom_height,atom scale,SDL_ScaleMode mode,atom dst,atom dstrect)
	return c_func(xSDL_BlitSurface9Grid,{src,srcrect,left_width,right_width,top_height,bottom_height,mode,dst,dstrect})
end function

public constant xSDL_MapSurfaceRGB = define_c_func(sdl,"+SDL_MapSurfaceRGB",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_UINT32)

public function SDL_MapSurfaceRGB(atom surface,atom r,atom g,atom b)
	return c_func(xSDL_MapSurfaceRGB,{surface,r,g,b})
end function

public constant xSDL_MapSurfaceRGBA = define_c_func(sdl,"+SDL_MapSurfaceRGBA",{C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_UINT32)

public function SDL_MapSurfaceRGBA(atom surface,atom r,atom g,atom b,atom a)
	return c_func(xSDL_MapSurfaceRGBA,{surface,r,g,b,a})
end function

public constant xSDL_ReadSurfacePixel = define_c_func(sdl,"+SDL_ReadSurfacePixel",{C_POINTER,C_INT,C_INT,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadSurfacePixel(atom surface,atom x,atom y,atom r,atom g,atom b,atom a)
	return c_func(xSDL_ReadSurfacePixel,{surface,x,y,r,g,b,a})
end function

public constant xSDL_ReadSurfacePixelFloat = define_c_func(sdl,"+SDL_ReadSurfacePixelFloat",{C_POINTER,C_INT,C_INT,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_ReadSurfacePixelFloat(atom surface,atom x,atom y,atom r,atom g,atom b,atom a)
	return c_func(xSDL_ReadSurfacePixelFloat,{surface,x,y,r,g,b,a})
end function

public constant xSDL_WriteSurfacePixel = define_c_func(sdl,"+SDL_WriteSurfacePixel",{C_POINTER,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_BOOL)

public function SDL_WriteSurfacePixel(atom surface,atom x,atom y,atom r,atom g,atom b,atom a)
	return c_func(xSDL_WriteSurfacePixel,{surface,x,y,r,g,b,a})
end function

public constant xSDL_WriteSurfacePixelFloat = define_c_func(sdl,"+SDL_WriteSurfacePixelFloat",{C_POINTER,C_INT,C_INT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_WriteSurfacePixelFloat(atom surface,atom x,atom y,atom r,atom g,atom b,atom a)
	return c_func(xSDL_WriteSurfacePixelFloat,{surface,x,y,r,g,b,a})
end function

public constant xSDL_StretchSurface = define_c_func(sdl,"+SDL_StretchSurface",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_StretchSurface(atom src,atom srcrect,atom dst,atom dstrect,SDL_ScaleMode scale)
	return c_func(xSDL_StretchSurface,{src,srcrect,dst,dstrect,scale})
end function
­393.67