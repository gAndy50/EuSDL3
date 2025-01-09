include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_error.e
include SDL_video.e

--SDL_MouseID C_UINT32
--typedef struct SDL_Cursor

public enum type SDL_SystemCursor
	SDL_SYSTEM_CURSOR_ARROW = 0,
	SDL_SYSTEM_CURSOR_IBEAM,
	SDL_SYSTEM_CURSOR_WAIT,
	SDL_SYSTEM_CURSOR_CROSSHAIR,
	SDL_SYSTEM_CURSOR_WAITARROW,
	SDL_SYSTEM_CURSOR_SIZENWSE,
	SDL_SYSTEM_CURSOR_SIZENESW,
	SDL_SYSTEM_CURSOR_SIZEWE,
	SDL_sYSTEM_CURSOR_SIZENS,
	SDL_SYSTEM_CURSOR_SIZEALL,
	SDL_SYSTEM_CURSOR_NO,
	SDL_SYSTEM_CURSOR_HAND,
	SDL_NUM_SYSTEM_CURSORS
end type

public enum type SDL_MouseWheelDirection
	SDL_MOUSEWHEEL_NORMAL = 0,
	SDL_MOUSEWHEEL_FLIPPED
end type

export constant xSDL_GetMouseFocus = define_c_func(sdl,"+SDL_GetMouseFocus",{},C_POINTER)

public function SDL_GetMouseFocus()
	return c_func(xSDL_GetMouseFocus,{})
end function

export constant xSDL_GetMouseState = define_c_func(sdl,"+SDL_GetMouseState",{C_POINTER,C_POINTER},C_UINT32)

public function SDL_GetMouseState(atom x,atom y)
	return c_func(xSDL_GetMouseState,{x,y})
end function

export constant xSDL_GetGlobalMouseState = define_c_func(sdl,"+SDL_GetGlobalMouseState",{C_POINTER,C_POINTER},C_UINT32)

public function SDL_GetGlobalMouseState(atom x,atom y)
	return c_func(xSDL_GetGlobalMouseState,{x,y})
end function

export constant xSDL_GetRelativeMouseState = define_c_func(sdl,"+SDL_GetRelativeMouseState",{C_POINTER,C_POINTER},C_UINT32)

public function SDL_GetRelativeMouseState(atom x,atom y)
	return c_func(xSDL_GetRelativeMouseState,{x,y})
end function

export constant xSDL_WarpMouseInWindow = define_c_proc(sdl,"+SDL_WarpMouseInWindow",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure SDL_WarpMouseInWindow(atom window,atom x,atom y)
	c_proc(xSDL_WarpMouseInWindow,{window,x,y})
end procedure

export constant xSDL_WarpMouseGlobal = define_c_func(sdl,"+SDL_WarpMouseGlobal",{C_FLOAT,C_FLOAT},C_INT)

public function SDL_WarpMouseGlobal(atom x,atom y)
	return c_func(xSDL_WarpMouseGlobal,{x,y})
end function

export constant xSDL_SetRelativeMouseMode = define_c_func(sdl,"+SDL_SetRelativeMouseMode",{C_BOOL},C_INT)

public function SDL_SetRelativeMouseMode(atom en)
	return c_func(xSDL_SetRelativeMouseMode,{en})
end function

export constant xSDL_CaptureMouse = define_c_func(sdl,"+SDL_CaptureMouse",{C_BOOL},C_INT)

public function SDL_CaptureMouse(atom en)
	return c_func(xSDL_CaptureMouse,{en})
end function

export constant xSDL_GetRelativeMouseMode = define_c_func(sdl,"+SDL_GetRelativeMouseMode",{},C_BOOL)

public function SDL_GetRelativeMouseMode()
	return c_func(xSDL_GetRelativeMouseMode,{})
end function

export constant xSDL_CreateCursor = define_c_func(sdl,"+SDL_CreateCursor",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT,C_INT},C_POINTER)

public function SDL_CreateCursor(atom data,atom mask,atom w,atom h,atom x,atom y)
	return c_func(xSDL_CreateCursor,{data,mask,w,h,x,y})
end function

export constant xSDL_CreateColorCursor = define_c_func(sdl,"+SDL_CreateColorCursor",{C_POINTER,C_INT,C_INT},C_POINTER)

public function SDL_CreateColorCursor(atom surf,atom x,atom y)
	return c_func(xSDL_CreateColorCursor,{surf,x,y})
end function

export constant xSDL_CreateSystemCursor = define_c_func(sdl,"+SDL_CreateSystemCursor",{C_INT},C_POINTER)

public function SDL_CreateSystemCursor(SDL_SystemCursor id)
	return c_func(xSDL_CreateSystemCursor,{id})
end function

export constant xSDL_SetCursor = define_c_func(sdl,"+SDL_SetCursor",{C_POINTER},C_INT)

public function SDL_SetCursor(atom cur)
	return c_func(xSDL_SetCursor,{cur})
end function

export constant xSDL_GetCursor = define_c_func(sdl,"+SDL_GetCursor",{},C_POINTER)

public function SDL_GetCursor()
	return c_func(xSDL_GetCursor,{})
end function

export constant xSDL_GetDefaultCursor = define_c_func(sdl,"+SDL_GetDefaultCursor",{},C_POINTER)

public function SDL_GetDefaultCursor()
	return c_func(xSDL_GetDefaultCursor,{})
end function

export constant xSDL_DestroyCursor = define_c_proc(sdl,"+SDL_DestroyCursor",{C_POINTER})

public procedure SDL_DestroyCursor(atom cur)
	c_proc(xSDL_DestroyCursor,{cur})
end procedure

export constant xSDL_ShowCursor = define_c_func(sdl,"+SDL_ShowCursor",{},C_INT)

public function SDL_ShowCursor()
	return c_func(xSDL_ShowCursor,{})
end function

export constant xSDL_HideCursor = define_c_func(sdl,"+SDL_HideCursor",{},C_INT)

public function SDL_HideCursor()
	return c_func(xSDL_HideCursor,{})
end function

export constant xSDL_CursorVisible = define_c_func(sdl,"+SDL_CursorVisible",{},C_BOOL)

public function SDL_CursorVisible()
	return c_func(xSDL_CursorVisible,{})
end function

public constant SDL_BUTTON = shift_bits(1,1)
public constant SDL_BUTTON_LEFT = 1
public constant SDL_BUTTON_MIDDLE = 2
public constant SDL_BUTTON_RIGHT = 3
public constant SDL_BUTTON_X1 = 4
public constant SDL_BUTTON_X2 = 5
public constant SDL_BUTTON_LMASK = SDL_BUTTON_LEFT
public constant SDL_BUTTON_MMASK = SDL_BUTTON_MIDDLE
public constant SDL_BUTTON_RMASK = SDL_BUTTON_RIGHT
public constant SDL_BUTTON_X1MASK = SDL_BUTTON_X1
public constant SDL_BUTTON_X2MASK = SDL_BUTTON_X2
­90.57