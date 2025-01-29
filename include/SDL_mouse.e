include std/ffi.e
include std/machine.e
include std/math.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_surface.e
include SDL_video.e

public constant SDL_MouseID = C_UINT32

public enum type SDL_SystemCursor
	SDL_SYSTEM_CURSOR_DEFAULT = 0,      /**< Default cursor. Usually an arrow. */
    SDL_SYSTEM_CURSOR_TEXT,         /**< Text selection. Usually an I-beam. */
    SDL_SYSTEM_CURSOR_WAIT,         /**< Wait. Usually an hourglass or watch or spinning ball. */
    SDL_SYSTEM_CURSOR_CROSSHAIR,    /**< Crosshair. */
    SDL_SYSTEM_CURSOR_PROGRESS,     /**< Program is busy but still interactive. Usually it's WAIT with an arrow. */
    SDL_SYSTEM_CURSOR_NWSE_RESIZE,  /**< Double arrow pointing northwest and southeast. */
    SDL_SYSTEM_CURSOR_NESW_RESIZE,  /**< Double arrow pointing northeast and southwest. */
    SDL_SYSTEM_CURSOR_EW_RESIZE,    /**< Double arrow pointing west and east. */
    SDL_SYSTEM_CURSOR_NS_RESIZE,    /**< Double arrow pointing north and south. */
    SDL_SYSTEM_CURSOR_MOVE,         /**< Four pointed arrow pointing north, south, east, and west. */
    SDL_SYSTEM_CURSOR_NOT_ALLOWED,  /**< Not permitted. Usually a slashed circle or crossbones. */
    SDL_SYSTEM_CURSOR_POINTER,      /**< Pointer that indicates a link. Usually a pointing hand. */
    SDL_SYSTEM_CURSOR_NW_RESIZE,    /**< Window resize top-left. This may be a single arrow or a double arrow like NWSE_RESIZE. */
    SDL_SYSTEM_CURSOR_N_RESIZE,     /**< Window resize top. May be NS_RESIZE. */
    SDL_SYSTEM_CURSOR_NE_RESIZE,    /**< Window resize top-right. May be NESW_RESIZE. */
    SDL_SYSTEM_CURSOR_E_RESIZE,     /**< Window resize right. May be EW_RESIZE. */
    SDL_SYSTEM_CURSOR_SE_RESIZE,    /**< Window resize bottom-right. May be NWSE_RESIZE. */
    SDL_SYSTEM_CURSOR_S_RESIZE,     /**< Window resize bottom. May be NS_RESIZE. */
    SDL_SYSTEM_CURSOR_SW_RESIZE,    /**< Window resize bottom-left. May be NESW_RESIZE. */
    SDL_SYSTEM_CURSOR_W_RESIZE,     /**< Window resize left. May be EW_RESIZE. */
    SDL_SYSTEM_CURSOR_COUNT
end type

public enum type SDL_MouseWheelDirection
	SDL_MOUSEWHEEL_NORMAL = 0,    /**< The scroll direction is normal */
    SDL_MOUSEWHEEL_FLIPPED    /**< The scroll direction is flipped / natural */
end type

public constant SDL_MousebuttonFlags = C_UINT32

public constant SDL_BUTTON_LEFT = 1
public constant SDL_BUTTON_MIDDLE = 2
public constant SDL_BUTTON_RIGHT = 3
public constant SDL_BUTTON_X1 = 4
public constant SDL_BUTTON_X2 = 5

public constant SDL_BUTTON_MASK = shift_bits(1,-1)
public constant SDL_BUTTON_LMASK = SDL_BUTTON_LEFT
public constant SDL_BUTTON_MMASK = SDL_BUTTON_MIDDLE
public constant SDL_BUTTON_RMASK = SDL_BUTTON_RIGHT
public constant SDL_BUTTON_X1MASK = SDL_BUTTON_X1
public constant SDL_BUTTON_X2MASK = SDL_BUTTON_X2

public constant xSDL_HasMouse = define_c_func(sdl,"+SDL_HasMouse",{},C_BOOL)

public function SDL_HasMouse()
	return c_func(xSDL_HasMouse,{})
end function

public constant xSDL_GetMice = define_c_func(sdl,"+SDL_GetMice",{C_POINTER},C_POINTER)

public function SDL_GetMice(atom count)
	return c_func(xSDL_GetMice,{count})
end function

public constant xSDL_GetMouseNameForID = define_c_func(sdl,"+SDL_GetMouseNameForID",{C_UINT32},C_STRING)

public function SDL_GetMouseNameForID(atom id)
	return c_func(xSDL_GetMouseNameForID,{id})
end function

public constant xSDL_GetMouseFocus = define_c_func(sdl,"+SDL_GetMouseFocus",{},C_POINTER)

public function SDL_GetMouseFocus()
	return c_func(xSDL_GetMouseFocus,{})
end function

public constant xSDL_GetMouseState = define_c_func(sdl,"+SDL_GetMouseState",{C_POINTER,C_POINTER},C_UINT32)

public function SDL_GetMouseState(atom x,atom y)
	return c_func(xSDL_GetMouseState,{x,y})
end function

public constant xSDL_GetGlobalMouseState = define_c_func(sdl,"+SDL_GetGlobalMouseState",{C_POINTER,C_POINTER},C_UINT32)

public function SDL_GetGlobalMouseState(atom x,atom y)
	return c_func(xSDL_GetGlobalMouseState,{x,y})
end function

public constant xSDL_GetRelativeMouseState = define_c_func(sdl,"+SDL_GetRelativeMouseState",{C_POINTER,C_POINTER},C_UINT32)

public function SDL_GetRelativeMouseState(atom x,atom y)
	return c_func(xSDL_GetRelativeMouseState,{x,y})
end function

public constant xSDL_WarpMouseInWindow = define_c_proc(sdl,"+SDL_WarpMouseInWindow",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure SDL_WarpMouseInWindow(atom window,atom x,atom y)
	c_proc(xSDL_WarpMouseInWindow,{window,x,y})
end procedure

public constant xSDL_WarpMouseGlobal = define_c_func(sdl,"+SDL_WarpMouseGlobal",{C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_WarpMouseGlobal(atom x,atom y)
	return c_func(xSDL_WarpMouseGlobal,{x,y})
end function

public constant xSDL_SetWindowRelativeMouseMode = define_c_func(sdl,"+SDL_SetWindowRelativeMouseMode",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowRelativeMouseMode(atom window,atom enabled)
	return c_func(xSDL_SetWindowRelativeMouseMode,{window,enabled})
end function

public constant xSDL_GetWindowRelativeMouseMode = define_c_func(sdl,"+SDL_GetWindowRelativeMouseMode",{C_POINTER},C_BOOL)

public function SDL_GetWindowRelativeMouseMode(atom window)
	return c_func(xSDL_GetWindowRelativeMouseMode,{window})
end function

public constant xSDL_CaptureMouse = define_c_func(sdl,"+SDL_CaptureMouse",{C_BOOL},C_BOOL)

public function SDL_CaptureMouse(atom enabled)
	return c_func(xSDL_CaptureMouse,{enabled})
end function

public constant xSDL_CreateCursor = define_c_func(sdl,"+SDL_CreateCursor",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT,C_INT},C_POINTER)

public function SDL_CreateCursor(atom data,atom mask,atom w,atom h,atom x,atom y)
	return c_func(xSDL_CreateCursor,{data,mask,w,h,x,y})
end function

public constant xSDL_CreateColorCursor = define_c_func(sdl,"+SDL_CreateColorCursor",{C_POINTER,C_INT,C_INT},C_POINTER)

public function SDL_CreateColorCursor(atom surface,atom x,atom y)
	return c_func(xSDL_CreateColorCursor,{surface,x,y})
end function

public constant xSDL_CreateSystemCursor = define_c_func(sdl,"+SDL_CreateSystemCursor",{C_INT},C_POINTER)

public function SDL_CreateSystemCursor(SDL_SystemCursor id)
	return c_func(xSDL_CreateSystemCursor,{id})
end function

public constant xSDL_SetCursor = define_c_func(sdl,"+SDL_SetCursor",{C_POINTER},C_BOOL)

public function SDL_SetCursor(atom cursor)
	return c_func(xSDL_SetCursor,{cursor})
end function

public constant xSDL_GetCursor = define_c_func(sdl,"+SDL_GetCursor",{},C_POINTER)

public function SDL_GetCursor()
	return c_func(xSDL_GetCursor,{})
end function

public constant xSDL_GetDefaultCursor = define_c_func(sdl,"+SDL_GetDefaultCursor",{},C_POINTER)

public function SDL_GetDefaultCursor()
	return c_func(xSDL_GetDefaultCursor,{})
end function

public constant xSDL_DestroyCursor = define_c_proc(sdl,"+SDL_DestroyCursor",{C_POINTER})

public procedure SDL_DestroyCursor(atom cursor)
	c_proc(xSDL_DestroyCursor,{cursor})
end procedure

public constant xSDL_ShowCursor = define_c_func(sdl,"+SDL_ShowCursor",{},C_BOOL)

public function SDL_ShowCursor()
	return c_func(xSDL_ShowCursor,{})
end function

public constant xSDL_HideCursor = define_c_func(sdl,"+SDL_HideCursor",{},C_BOOL)

public function SDL_HideCursor()
	return c_func(xSDL_HideCursor,{})
end function

public constant xSDL_CursorVisible = define_c_func(sdl,"+SDL_CursorVisible",{},C_BOOL)

public function SDL_CursorVisible()
	return c_func(xSDL_CursorVisible,{})
end function
­186.37