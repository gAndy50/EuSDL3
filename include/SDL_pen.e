include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_guid.e

public constant SDL_PEN_INVALID = 0
public constant SDL_PEN_MOUSEID = -2
public constant SDL_PEN_INFO_UNKNOWN = -1

public enum type SDL_PenAxis
	SDL_PEN_AXIS_PRESSURE = 0,
	SDL_PEN_AXIS_XTILT,
	SDL_PEN_AXIS_YTILT,
	SDL_PEN_AXIS_DISTANCE,
	SDL_PEN_AXIS_ROTATION,
	SDL_PEN_AXIS_SLIDER,
	SDL_PEN_NUM_AXES,
	SDL_PEN_AXIS_LAST = SDL_PEN_NUM_AXES 
end type

public constant SDL_PEN_FLAG_DOWN_BIT_INDEX = 13,
				SDL_PEN_FLAG_INK_BIT_INDEX = 14,
				SDL_PEN_FLAG_ERASER_BIT_INDEX = 15,
				SDL_PEN_FLAG_AXIS_BIT_OFFSET = 16
				
public enum type SDL_PenSubtype
	SDL_PEN_TYPE_ERASER = 1,
	SDL_PEN_TYPE_PEN,
	SDL_PEN_TYPE_PENCIL,
	SDL_PEN_TYPE_BRUSH,
	SDL_PEN_TYPE_AIRBRUSH,
	SDL_PEN_TYPE_LAST = SDL_PEN_TYPE_AIRBRUSH
end type

public constant xSDL_GetPens = define_c_func(sdl,"+SDL_GetPens",{C_POINTER},C_POINTER)

public function SDL_GetPens(atom count)
	return c_func(xSDL_GetPens,{count})
end function

public constant xSDL_GetPenStatus = define_c_func(sdl,"+SDL_GetPenStatus",{C_INT,C_POINTER,C_POINTER,C_POINTER,C_SIZE_T},C_UINT32)

public function SDL_GetPenStatus(atom id,atom x,atom y,atom axes,atom num)
	return c_func(xSDL_GetPenStatus,{id,x,y,axes,num})
end function

public constant xSDL_GetPenFromGUID = define_c_func(sdl,"+SDL_GetPenFromGUID",{SDL_GUID},C_UINT32)

public function SDL_GetPenFromGUID(sequence guid)
	return c_func(xSDL_GetPenFromGUID,{guid})
end function

public constant xSDL_GetPenGUID = define_c_func(sdl,"+SDL_GetPenGUID",{C_INT},SDL_GUID)

public function SDL_GetPenGUID(atom id)
	return c_func(xSDL_GetPenGUID,{id})
end function

public constant xSDL_PenConnected = define_c_func(sdl,"+SDL_PenConnected",{C_INT},C_BOOL)

public function SDL_PenConnected(atom id)
	return c_func(xSDL_PenConnected,{id})
end function

public constant xSDL_GetPenName = define_c_func(sdl,"+SDL_GetPenName",{C_INT},C_STRING)

public function SDL_GetPenName(atom id)
	return c_func(xSDL_GetPenName,{id})
end function

public constant SDL_PenCapabilityInfo = define_c_struct({
	C_FLOAT, --max_tilt
	C_UINT32, --wacom_id
	C_INT8 --num_buttons
})

public constant xSDL_GetPenCapabilities = define_c_func(sdl,"+SDL_GetPenCapabilities",{C_INT,C_POINTER},C_UINT32)

public function SDL_GetPenCapabilities(atom id,atom cap)
	return c_func(xSDL_GetPenCapabilities,{id,cap})
end function

public constant xSDL_GetPenType = define_c_func(sdl,"+SDL_GetPenType",{C_INT},C_INT)

public function SDL_GetPenType(atom id)
	return c_func(xSDL_GetPenType,{id})
end function
­89.36
