include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_mouse.e

public constant SDL_TouchID = C_UINT64

public constant SDL_FingerID = C_UINT64

public enum type SDL_TouchDeviceType
	 SDL_TOUCH_DEVICE_INVALID = -1,
    SDL_TOUCH_DEVICE_DIRECT = 0,            /**< touch screen with window-relative coordinates */
    SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE, /**< trackpad with absolute device coordinates */
    SDL_TOUCH_DEVICE_INDIRECT_RELATIVE  /**< trackpad with screen cursor-relative coordinates */
end type

public constant SDL_Finger = define_c_struct({
	C_UINT64, --id
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT  --pressure
})

public constant SDL_TOUCH_MOUSEID = -1

public constant SDL_MOUSE_TOUCHID = -1

public constant xSDL_GetTouchDevices = define_c_func(sdl,"+SDL_GetTouchDevices",{C_POINTER},C_POINTER)

public function SDL_GetTouchDevices(atom count)
	return c_func(xSDL_GetTouchDevices,{count})
end function

public constant xSDL_GetTouchDeviceName = define_c_func(sdl,"+SDL_GetTouchDeviceName",{C_UINT64},C_STRING)

public function SDL_GetTouchDeviceName(atom touchID)
	return c_func(xSDL_GetTouchDeviceName,{touchID})
end function

public constant xSDL_GetTouchDeviceType = define_c_func(sdl,"+SDL_GetTouchDeviceType",{C_UINT64},C_INT)

public function SDL_GetTouchDeviceType(atom touchID)
	return c_func(xSDL_GetTouchDeviceType,{touchID})
end function

public constant xSDL_GetTouchFingers = define_c_func(sdl,"+SDL_GetTouchFingers",{C_UINT64,C_POINTER},C_POINTER)

public function SDL_GetTouchFingers(atom touchID,atom count)
	return c_func(xSDL_GetTouchFingers,{touchID,count})
end function
­52.52