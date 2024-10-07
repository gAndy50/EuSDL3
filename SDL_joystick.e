include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_error.e
include SDL_guid.e
include SDL_mutex.e

public enum type SDL_JoystickType
	SDL_JOYSTICK_TYPE_UNKNOWN = 0,
	SDL_JOYSTICK_TYPE_GAMEPAD,
	SDL_JOYSTICK_TYPE_WHEEL,
	SDL_JOYSTICK_TYPE_ARCADE_STICK,
	SDL_JOYSTICK_TYPE_FLIGHT_STICK,
	SDL_JOYSTICK_TYPE_DANCE_PAD,
	SDL_JOYSTICK_TYPE_GUITAR,
	SDL_JOYSTICK_TYPE_DRUM_KIT,
	SDL_JOYSTICK_TYPE_ARCADE_PAD,
	SDL_JOYSTICK_TYPE_THROTTLE
end type

public enum type SDL_JoystickPowerLevel
	SDL_JOYSTICK_POWER_UNKNOWN = -1,
	SDL_JOYSTICK_POWER_EMPTY = 0,
	SDL_JOYSTICK_POWER_LOW,
	SDL_JOYSTICK_POWER_MEDIUM,
	SDL_JOYSTICK_POWER_FULL,
	SDL_JOYSTICK_POWER_WIRED,
	SDL_JOYSTICK_POWER_MAX
end type

public constant SDL_JOYSTICK_AXIS_MAX = 32767,
				SDL_JOYSTICK_AXIS_MIN = -32768
				
public constant SDL_IPHONE_MAX_GFORCE = 5.0

export constant xSDL_LockJoysticks = define_c_proc(sdl,"+SDL_LockJoysticks",{})

public procedure SDL_LockJoysticks()
	c_proc(xSDL_LockJoysticks,{})
end procedure

export constant xSDL_UnlockJoysticks = define_c_proc(sdl,"+SDL_UnlockJoysticks",{})

public procedure SDL_UnlockJoysticks()
	c_proc(xSDL_UnlockJoysticks,{})
end procedure

export constant xSDL_GetJoysticks = define_c_func(sdl,"+SDL_GetJoysticks",{C_POINTER},C_POINTER)

public function SDL_GetJoysticks(atom count)
	return c_func(xSDL_GetJoysticks,{count})
end function

export constant xSDL_GetJoystickInstanceName = define_c_func(sdl,"+SDL_GetJoystickInstanceName",{C_UINT32},C_STRING)

public function SDL_GetJoystickInstanceName(atom instance_id)
	return c_func(xSDL_GetJoystickInstanceName,{instance_id})
end function

export constant xSDL_GetJoystickInstancePath = define_c_func(sdl,"+SDL_GetJoystickInstancePath",{C_UINT32},C_STRING)

public function SDL_GetJoystickInstancePath(atom instance_id)
	return c_func(xSDL_GetJoystickInstancePath,{instance_id})
end function

export constant xSDL_GetJoystickInstancePlayerIndex = define_c_func(sdl,"+SDL_GetJoystickInstancePlayerIndex",{C_UINT32},C_INT)

public function SDL_GetJoystickInstancePlayerIndex(atom instance_id)
	return c_func(xSDL_GetJoystickInstancePlayerIndex,{instance_id})
end function

export constant xSDL_GetJoystickInstanceGUID = define_c_func(sdl,"+SDL_GetJoystickInstanceGUID",{C_UINT32},SDL_GUID)

public function SDL_GetJoystickInstanceGUID(atom instance_id)
	return c_func(xSDL_GetJoystickInstanceGUID,{instance_id})
end function

export constant xSDL_GetJoystickInstanceVendor = define_c_func(sdl,"+SDL_GetJoystickInstanceVendor",{C_UINT32},C_UINT16)

public function SDL_GetJoystickInstanceVendor(atom instance_id)
	return c_func(xSDL_GetJoystickInstanceVendor,{instance_id})
end function

export constant xSDL_GetJoystickInstanceProduct = define_c_func(sdl,"+SDL_GetJoystickInstanceProduct",{C_UINT32},C_UINT16)

public function SDL_GetJoystickInstanceProduct(atom id)
	return c_func(xSDL_GetJoystickInstanceProduct,{id})
end function

export constant xSDL_GetJoystickInstanceProductVersion = define_c_func(sdl,"+SDL_GetJoystickInstanceProductVersion",{C_UINT32},C_UINT16)

public function SDL_GetJoystickInstanceProductVersion(atom id)
	return c_func(xSDL_GetJoystickInstanceProductVersion,{id})
end function

export constant xSDL_GetJoystickInstanceType = define_c_func(sdl,"+SDL_GetJoystickInstanceType",{C_UINT32},C_INT)

public function SDL_GetJoystickInstanceType(atom id)
	return c_func(xSDL_GetJoystickInstanceType,{id})
end function

export constant xSDL_OpenJoystick = define_c_func(sdl,"+SDL_OpenJoystick",{C_UINT32},C_POINTER)

public function SDL_OpenJoystick(atom id)
	return c_func(xSDL_OpenJoystick,{id})
end function

export constant xSDL_GetJoystickFromInstanceID = define_c_func(sdl,"+SDL_GetJoystickFromInstanceID",{C_UINT32},C_POINTER)

public function SDL_GetJoystickFromInstanceID(atom id)
	return c_func(xSDL_GetJoystickFromInstanceID,{id})
end function

export constant xSDL_GetJoystickFromPlayerIndex = define_c_func(sdl,"+SDL_GetJoystickFromPlayerIndex",{C_INT},C_POINTER)

public function SDL_GetJoystickFromPlayerIndex(atom p_index)
	return c_func(xSDL_GetJoystickFromPlayerIndex,{p_index})
end function

export constant xSDL_AttachVirtualJoystick = define_c_func(sdl,"+SDL_AttachVirtualJoystick",{C_INT,C_INT,C_INT,C_INT},C_UINT32)

public function SDL_AttachVirtualJoystick(SDL_JoystickType jtype,atom naxes,atom nbuttons,atom nhats)
	return c_func(xSDL_AttachVirtualJoystick,{jtype,naxes,nbuttons,nhats})
end function

public constant SDL_VirtualJoystickDesc = define_c_struct({
	C_UINT16, --version
	C_UINT16, --type
	C_UINT16, --naxes
	C_UINT16, --nbuttons
	C_UINT16, --nhats
	C_UINT16, --vendor_id
	C_UINT16, --product_id
	C_UINT16, --padding
	C_UINT32, --button_mask
	C_UINT32, --axis_mask
	C_STRING, --name
	C_POINTER --userdata
})

public constant SDL_VIRTUAL_JOYSTICK_DESC_VERISON = 1

export constant xSDL_AttachVirtualJoystickEx = define_c_func(sdl,"+SDL_AttachVirtualJoystickEx",{C_POINTER},C_INT)

public function SDL_AttachVirtualJoystickEx(atom desc)
	return c_func(xSDL_AttachVirtualJoystickEx,{desc})
end function

export constant xSDL_DetachVirtualJoystick = define_c_func(sdl,"+SDL_DetachVirtualJoystick",{C_UINT32},C_INT)

public function SDL_DetachVirtualJoystick(atom id)
	return c_func(xSDL_DetachVirtualJoystick,{id})
end function

export constant xSDL_IsJoystickVirtual = define_c_func(sdl,"+SDL_IsJoystickVirtual",{C_UINT32},C_BOOL)

public function SDL_IsJoystickVirtual(atom id)
	return c_func(xSDL_IsJoystickVirtual,{id})
end function

export constant xSDL_SetJoystickVirtualAxis = define_c_func(sdl,"+SDL_SetJoystickVirtualAxis",{C_POINTER,C_INT,C_INT16},C_INT)

public function SDL_SetJoystickVirtualAxis(atom joystick,atom axis,atom val)
	return c_func(xSDL_SetJoystickVirtualAxis,{joystick,axis,val})
end function

export constant xSDL_SetJoystickVirtualButton = define_c_func(sdl,"+SDL_SetJoystickVirtualButton",{C_POINTER,C_INT,C_UINT8},C_INT)

public function SDL_SetJoystickVirtualButton(atom joystick,atom button,atom val)
	return c_func(xSDL_SetJoystickVirtualButton,{joystick,button,val})
end function

export constant xSDL_SetJoystickVirtualHat = define_c_func(sdl,"+SDL_SetJoystickVirtualHat",{C_POINTER,C_INT,C_UINT8},C_INT)

public function SDL_SetJoystickVirtualHat(atom joystick,atom hat,atom val)
	return c_func(xSDL_SetJoystickVirtualHat,{joystick,hat,val})
end function

export constant xSDL_GetJoystickName = define_c_func(sdl,"+SDL_GetJoystickName",{C_POINTER},C_STRING)

public function SDL_GetJoystickName(atom joystick)
	return c_func(xSDL_GetJoystickName,{joystick})
end function

export constant xSDL_GetJoystickPath = define_c_func(sdl,"+SDL_GetJoystickPath",{C_POINTER},C_STRING)

public function SDL_GetJoystickPath(atom joystick)
	return c_func(xSDL_GetJoystickPath,{joystick})
end function

export constant xSDL_GetJoystickPlayerIndex = define_c_func(sdl,"+SDL_GetJoystickPlayerIndex",{C_POINTER},C_INT)

public function SDL_GetJoystickPlayerIndex(atom joystick)
	return c_func(xSDL_GetJoystickPlayerIndex,{joystick})
end function

export constant xSDL_SetJoystickPlayerIndex = define_c_func(sdl,"+SDL_SetJoystickPlayerIndex",{C_POINTER,C_INT},C_INT)

public function SDL_SetJoystickPlayerIndex(atom joystick,atom p_index)
	return c_func(xSDL_SetJoystickPlayerIndex,{joystick,p_index})
end function

export constant xSDL_GetJoystickGUID = define_c_func(sdl,"+SDL_GetJoystickGUID",{C_POINTER},SDL_GUID)

public function SDL_GetJoystickGUID(atom joystick)
	return c_func(xSDL_GetJoystickGUID,{joystick})
end function

export constant xSDL_GetJoystickVendor = define_c_func(sdl,"+SDL_GetJoystickVendor",{C_POINTER},C_UINT16)

public function SDL_GetJoystickVendor(atom joystick)
	return c_func(xSDL_GetJoystickVendor,{joystick})
end function

export constant xSDL_GetJoystickProduct = define_c_func(sdl,"+SDL_GetJoystickProduct",{C_POINTER},C_UINT16)

public function SDL_GetJoystickProduct(atom joy)
	return c_func(xSDL_GetJoystickProduct,{joy})
end function

export constant xSDL_GetJoystickProductVersion = define_c_func(sdl,"+SDL_GetJoystickProductVersion",{C_POINTER},C_UINT16)

public function SDL_GetJoystickProductVersion(atom joy)
	return c_func(xSDL_GetJoystickProductVersion,{joy})
end function

export constant xSDL_GetJoystickFirmwareVersion = define_c_func(sdl,"+SDL_GetJoystickFirmwareVersion",{C_POINTER},C_UINT16)

public function SDL_GetJoystickFirmwareVersion(atom joy)
	return c_func(xSDL_GetJoystickFirmwareVersion,{joy})
end function

export constant xSDL_GetJoystickSerial = define_c_func(sdl,"+SDL_GetJoystickSerial",{C_POINTER},C_STRING)

public function SDL_GetJoystickSerial(atom joy)
	return c_func(xSDL_GetJoystickSerial,{joy})
end function

export constant xSDL_GetJoystickType = define_c_func(sdl,"+SDL_GetJoystickType",{C_POINTER},C_INT)

public function SDL_GetJoystickType(atom joy)
	return c_func(xSDL_GetJoystickType,{joy})
end function

export constant xSDL_GetJoystickGUIDString = define_c_func(sdl,"+SDL_GetJoystickGUIDString",{SDL_GUID,C_STRING,C_INT},C_INT)

public function SDL_GetJoystickGUIDString(sequence guid,sequence psz,atom cb)
	return c_func(xSDL_GetJoystickGUIDString,{guid,psz,cb})
end function

export constant xSDL_GetJoystickGUIDFromString = define_c_func(sdl,"+SDL_GetJoystickGUIDFromString",{C_STRING},SDL_GUID)

public function SDL_GetJoystickGUIDFromString(sequence pch)
	return c_func(xSDL_GetJoystickGUIDFromString,{pch})
end function

export constant xSDL_GetJoystickGUIDInfo = define_c_proc(sdl,"+SDL_GetJoystickGUIDInfo",{SDL_GUID,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetJoystickGUIDInfo(sequence guid,atom vendor,atom product,atom ver,atom crc)
	c_proc(xSDL_GetJoystickGUIDInfo,{guid,vendor,product,ver,crc})
end procedure

export constant xSDL_JoystickConnected = define_c_func(sdl,"+SDL_JoystickConnected",{C_POINTER},C_BOOL)

public function SDL_JoystickConnected(atom joy)
	return c_func(xSDL_JoystickConnected,{joy})
end function

export constant xSDL_GetJoystickInstanceID = define_c_func(sdl,"+SDL_GetJoystickInstanceID",{C_POINTER},C_UINT32)

public function SDL_GetJoystickInstanceID(atom joy)
	return c_func(xSDL_GetJoystickInstanceID,{joy})
end function

export constant xSDL_GetNumJoystickAxes = define_c_func(sdl,"+SDL_GetNumJoystickAxes",{C_POINTER},C_INT)

public function SDL_GetNumJoystickAxes(atom joy)
	return c_func(xSDL_GetNumJoystickAxes,{joy})
end function

export constant xSDL_GetNumJoystickHats = define_c_func(sdl,"+SDL_GetNumJoystickHats",{C_POINTER},C_INT)

public function SDL_GetNumJoystickHats(atom joy)
	return c_func(xSDL_GetNumJoystickHats,{joy})
end function

export constant xSDL_GetNumJoystickButtons = define_c_func(sdl,"+SDL_GetNumJoystickButtons",{C_POINTER},C_INT)

public function SDL_GetNumJoystickButtons(atom joy)
	return c_func(xSDL_GetNumJoystickButtons,{joy})
end function

export constant xSDL_SetJoystickEventsEnabled = define_c_proc(sdl,"+SDL_SetJoystickEventsEnabled",{C_BOOL})

public procedure SDL_SetJoystickEventsEnabled(atom en)
	c_proc(xSDL_SetJoystickEventsEnabled,{en})
end procedure

export constant xSDL_JoystickEventsEnabled = define_c_func(sdl,"+SDL_JoystickEventsEnabled",{},C_BOOL)

public function SDL_JoystickEventsEnabled()
	return c_func(xSDL_JoystickEventsEnabled,{})
end function

export constant xSDL_UpdateJoysticks = define_c_proc(sdl,"+SDL_UpdateJoysticks",{})

public procedure SDL_UpdateJoysticks()
	c_proc(xSDL_UpdateJoysticks,{})
end procedure

export constant xSDL_GetJoystickAxis = define_c_func(sdl,"+SDL_GetJoystickAxis",{C_POINTER,C_INT},C_INT16)

public function SDL_GetJoystickAxis(atom joy,atom axis)
	return c_func(xSDL_GetJoystickAxis,{joy,axis})
end function

export constant xSDL_GetJoystickAxisInitialState = define_c_func(sdl,"+SDL_GetJoystickAxisInitialState",{C_POINTER,C_INT,C_POINTER},C_BOOL)

public function SDL_GetJoystickAxisInitialState(atom joy,atom axis,atom state)
	return c_func(xSDL_GetJoystickAxisInitialState,{joy,axis,state})
end function

public constant SDL_HAT_CENTERED = 0x00,
				SDL_HAT_UP = 0x01,
				SDL_HAT_RIGHT = 0x02,
				SDL_HAT_DOWN = 0x04,
				SDL_HAT_LEFT = 0x08,
				SDL_HAT_RIGHTUP = or_all({SDL_HAT_RIGHT,SDL_HAT_UP}),
				SDL_HAT_RIGHTDOWN = or_all({SDL_HAT_RIGHT,SDL_HAT_DOWN}),
				SDL_HAT_LEFTUP = or_all({SDL_HAT_LEFT,SDL_HAT_UP}),
				SDL_HAT_LEFTDOWN = or_all({SDL_HAT_LEFT,SDL_HAT_DOWN})
				
export constant xSDL_GetJoystickHat = define_c_func(sdl,"+SDL_GetJoystickHat",{C_POINTER,C_INT},C_UINT8)

public function SDL_GetJoystickHat(atom joy,atom hat)
	return c_func(xSDL_GetJoystickHat,{joy,hat})
end function

export constant xSDL_GetJoystickButton = define_c_func(sdl,"+SDL_GetJoystickButton",{C_POINTER,C_INT},C_UINT8)

public function SDL_GetJoystickButton(atom joy,atom button)
	return c_func(xSDL_GetJoystickButton,{joy,button})
end function

export constant xSDL_RumbleJoystick = define_c_func(sdl,"+SDL_RumbleJoystick",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_INT)

public function SDL_RumbleJoystick(atom joy,atom low_freq,atom high_freq,atom duration)
	return c_func(xSDL_RumbleJoystick,{joy,low_freq,high_freq,duration})
end function

export constant xSDL_RumbleJoystickTriggers = define_c_func(sdl,"+SDL_RumbleJoystickTriggers",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_INT)

public function SDL_RumbleJoystickTriggers(atom joy,atom left,atom right,atom duration)
	return c_func(xSDL_RumbleJoystickTriggers,{joy,left,right,duration})
end function

export constant xSDL_JoystickHasLED = define_c_func(sdl,"+SDL_JoystickHasLED",{C_POINTER},C_BOOL)

public function SDL_JoystickHasLED(atom joy)
	return c_func(xSDL_JoystickHasLED,{joy})
end function

export constant xSDL_JoystickHasRumble = define_c_func(sdl,"+SDL_JoystickHasRumble",{C_POINTER},C_BOOL)

public function SDL_JoystickHasRumble(atom joy)
	return c_func(xSDL_JoystickHasRumble,{joy})
end function

export constant xSDL_JoystickHasRumbleTriggers = define_c_func(sdl,"+SDL_JoystickHasRumbleTriggers",{C_POINTER},C_BOOL)

public function SDL_JoystickHasRumbleTriggers(atom joy)
	return c_func(xSDL_JoystickHasRumbleTriggers,{joy})
end function

export constant xSDL_SetJoystickLED = define_c_func(sdl,"+SDL_SetJoystickLED",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_INT)

public function SDL_SetJoystickLED(atom joy,atom r,atom g,atom b)
	return c_func(xSDL_SetJoystickLED,{joy,r,g,b})
end function

export constant xSDL_SendJoystickEffect = define_c_func(sdl,"+SDL_SendJoystickEffect",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_SendJoystickEffect(atom joy,object data,atom size)
	return c_func(xSDL_SendJoystickEffect,{joy,data,size})
end function

export constant xSDL_CloseJoystick = define_c_proc(sdl,"+SDL_CloseJoystick",{C_POINTER})

public procedure SDL_CloseJoystick(atom joy)
	c_proc(xSDL_CloseJoystick,{joy})
end procedure

export constant xSDL_GetJoystickPowerLevel = define_c_func(sdl,"+SDL_GetJoystickPowerLevel",{C_POINTER},C_INT)

public function SDL_GetJoystickPowerLevel(atom joy)
	return c_func(xSDL_GetJoystickPowerLevel,{joy})
end function
­399.48