include std/ffi.e
include std/machine.e
include std/math.e

include SDL_pixels.e
include SDL_rect.e
include SDL_surface.e
include SDL_video.e

include SDL3.e

public constant SDL_NONSHAPEABLE_WINDOW = -1
public constant SDL_INVALID_SHAPE_ARGUMENT = -2
public constant SDL_WINDOW_LACKS_SHAPE = -3

export constant xSDL_CreateShapedWindow = define_c_func(sdl,"+SDL_CreateShapedWindow",{C_STRING,C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreateShapedWindow(sequence title,atom w,atom h,atom flags)
	return c_func(xSDL_CreateShapedWindow,{title,w,h,flags})
end function

export constant xSDL_IsShapedWindow = define_c_func(sdl,"+SDL_IsShapedWindow",{C_POINTER},C_BOOL)

public function SDL_IsShapedWindow(atom win)
	return c_func(xSDL_IsShapedWindow,{win})
end function

public enum type WindowShapeMode
	ShapeModeDefault = 0,
	ShapeModeBinarizeAlpha,
	ShapeModeReverseBinarizeAlpha,
	ShapeModeColorKey
end type

--Defined as a macro in SDL 3
public function SDL_SHAPEMODEALPHA(atom mode)

	if mode = ShapeModeDefault or mode = ShapeModeBinarizeAlpha or mode = ShapeModeReverseBinarizeAlpha then
		return mode
	end if
	
end function

public constant SDL_WindowShapeParams = define_c_union({
	C_UINT8, --binarizationCutoff
	SDL_Color --colorKey
})

public constant SDL_WindowShapeMode = define_c_struct({
	C_INT, --WindowShapeMode mode
	SDL_WindowShapeParams --parameters
})

export constant xSDL_SetWindowShape = define_c_func(sdl,"+SDL_SetWindowShape",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowShape(atom win,atom shape,atom shape_mode)
	return c_func(xSDL_SetWindowShape,{win,shape,shape_mode})
end function

export constant xSDL_GetShapedWindowMode = define_c_func(sdl,"+SDL_GetShapedWindowMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetShapedWindowMode(atom win,atom shape_mode)
	return c_func(xSDL_GetShapedWindowMode,{win,shape_mode})
end function
­63.57
