include std/ffi.e
include std/machine.e
include std/math.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_guid.e
include SDL_mutex.e
include SDL_power.e
include SDL_properties.e
include SDL_sensor.e

public constant SDL_JoystickID = C_UINT32

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
    SDL_JOYSTICK_TYPE_THROTTLE,
    SDL_JOYSTICK_TYPE_COUNT
end type

public enum type SDL_JoystickConnectionState
	SDL_JOYSTICK_CONNECTION_INVALID = -1,
    SDL_JOYSTICK_CONNECTION_UNKNOWN = 0,
    SDL_JOYSTICK_CONNECTION_WIRED,
    SDL_JOYSTICK_CONNECTION_WIRELESS
end type

public constant SDL_JOYSTICK_AXIS_MAX = 32767

public constant SDL_JOYSTICK_AXIS_MIN = -32768

public constant xSDL_LockJoysticks = define_c_proc(sdl,"+SDL_LockJoysticks",{})

public procedure SDL_LockJoysticks()
	c_proc(xSDL_LockJoysticks,{})
end procedure

public constant xSDL_UnlockJoysticks = define_c_proc(sdl,"+SDL_UnlockJoysticks",{})

public procedure SDL_UnlockJoysticks()
	c_proc(xSDL_UnlockJoysticks,{})
end procedure

public constant xSDL_HasJoystick = define_c_func(sdl,"+SDL_HasJoystick",{},C_BOOL)

public function SDL_HasJoystick()
	return c_func(xSDL_HasJoystick,{})
end function

public constant xSDL_GetJoysticks = define_c_func(sdl,"+SDL_GetJoysticks",{C_POINTER},C_POINTER)

public function SDL_GetJoysticks(atom count)
	return c_func(xSDL_GetJoysticks,{count})
end function

public constant xSDL_GetJoystickNameForID = define_c_func(sdl,"+SDL_GetJoystickNameForID",{C_UINT32},C_STRING)

public function SDL_GetJoystickNameForID(atom id)
	return c_func(xSDL_GetJoystickNameForID,{id})
end function

public constant xSDL_GetJoystickPathForID = define_c_func(sdl,"+SDL_GetJoystickPathForID",{C_UINT32},C_STRING)

public function SDL_GetJoystickPathForID(atom id)
	return c_func(xSDL_GetJoystickPathForID,{id})
end function

public constant xSDL_GetJoystickPlayerIndexForID = define_c_func(sdl,"+SDL_GetJoystickPlayerIndexForID",{C_UINT32},C_INT)

public function SDL_GetJoystickPlayerIndexForID(atom id)
	return c_func(xSDL_GetJoystickPlayerIndexForID,{id})
end function

public constant xSDL_GetJoystickGUIDForID = define_c_func(sdl,"+SDL_GetJoystickGUIDForID",{C_UINT32},C_UINT32)

public function SDL_GetJoystickGUIDForID(atom id)
	return c_func(xSDL_GetJoystickGUIDForID,{id})
end function

public constant xSDL_GetJoystickVendorForID = define_c_func(sdl,"+SDL_GetJoystickVendorForID",{C_UINT32},C_UINT16)

public function SDL_GetJoystickVendorForID(atom id)
	return c_func(xSDL_GetJoystickVendorForID,{id})
end function

public constant xSDL_GetJoystickProductForID = define_c_func(sdl,"+SDL_GetJoystickProductForID",{C_UINT32},C_UINT16)

public function SDL_GetJoystickProductForID(atom id)
	return c_func(xSDL_GetJoystickProductForID,{id})
end function

public constant xSDL_GetJoystickProductVersionForID = define_c_func(sdl,"+SDL_GetJoystickProductVersionForID",{C_UINT32},C_UINT16)

public function SDL_GetJoystickProductVersionForID(atom id)
	return c_func(xSDL_GetJoystickProductVersionForID,{id})
end function

public constant xSDL_GetJoystickTypeForID = define_c_func(sdl,"+SDL_GetJoystickTypeForID",{C_UINT32},C_INT)

public function SDL_GetJoystickTypeForID(atom id)
	return c_func(xSDL_GetJoystickTypeForID,{id})
end function

public constant xSDL_OpenJoystick = define_c_func(sdl,"+SDL_OpenJoystick",{C_UINT32},C_POINTER)

public function SDL_OpenJoystick(atom id)
	return c_func(xSDL_OpenJoystick,{id})
end function

public constant xSDL_GetJoystickFromID = define_c_func(sdl,"+SDL_GetJoystickFromID",{C_UINT32},C_POINTER)

public function SDL_GetJoystickFromID(atom id)
	return c_func(xSDL_GetJoystickFromID,{id})
end function

public constant xSDL_GetJoystickFromPlayerIndex = define_c_func(sdl,"+SDL_GetJoystickFromPlayerIndex",{C_INT},C_POINTER)

public function SDL_GetJoystickFromPlayerIndex(atom index)
	return c_func(xSDL_GetJoystickFromPlayerIndex,{index})
end function

public constant SDL_VirtualJoystickTouchpadDesc = define_c_struct({
	C_UINT16, --nfingers
	{C_UINT16,3} --padding[3]
})

public constant SDL_VirtualJoystickSensorDesc = define_c_struct({
	C_INT, --type
	C_FLOAT --rate
})

public constant SDL_VirtualJoystickDesc = define_c_struct({
	C_UINT32, --version
	C_UINT16, --type
	C_UINT16, --padding
	C_UINT16, --vendor_id
	C_UINT16, --product_id
	C_UINT16, --naxes
	C_UINT16, --nbuttons
	C_UINT16, --nhats
	C_UINT16, --ntouchpads
	C_UINT16, --nsensors
	{C_UINT16,2}, --padding2[2]
	C_UINT32, --button_mask
	C_UINT32, --axis_mask
	C_STRING, --name
	C_POINTER, --touchpads
	C_POINTER, --sensors
	C_POINTER  --userdata
})

public constant xSDL_AttachVirtualJoystick = define_c_func(sdl,"+SDL_AttachVirtualJoystick",{C_POINTER},C_UINT32)

public function SDL_AttachVirtualJoystick(atom desc)
	return c_func(xSDL_AttachVirtualJoystick,{desc})
end function

public constant xSDL_DetachVirtualJoystick = define_c_func(sdl,"+SDL_DetachVirtualJoystick",{C_UINT32},C_BOOL)

public function SDL_DetachVirtualJoystick(atom id)
	return c_func(xSDL_DetachVirtualJoystick,{id})
end function

public constant xSDL_IsJoystickVirtual = define_c_func(sdl,"+SDL_IsJoystickVirtual",{C_UINT32},C_BOOL)

public function SDL_IsJoystickVirtual(atom id)
	return c_func(xSDL_IsJoystickVirtual,{id})
end function

public constant xSDL_SetJoystickVirtualAxis = define_c_func(sdl,"+SDL_SetJoystickVirtualAxis",{C_POINTER,C_INT,C_INT16},C_BOOL)

public function SDL_SetJoystickVirtualAxis(atom joystick,atom axis,atom val)
	return c_func(xSDL_SetJoystickVirtualAxis,{joystick,axis,val})
end function

public constant xSDL_SetJoystickVirtualBall = define_c_func(sdl,"+SDL_SetJoystickVirtualBall",{C_POINTER,C_INT,C_INT16,C_INT16},C_BOOL)

public function SDL_SetJoystickVirtualBall(atom joystick,atom ball,atom xrel,atom yrel)
	return c_func(xSDL_SetJoystickVirtualBall,{joystick,ball,xrel,yrel})
end function

public constant xSDL_SetJoystickVirtualButton = define_c_func(sdl,"+SDL_SetJoystickVirtualButton",{C_POINTER,C_INT,C_BOOL},C_BOOL)

public function SDL_SetJoystickVirtualButton(atom joystick,atom button,atom down)
	return c_func(xSDL_SetJoystickVirtualButton,{joystick,button,down})
end function

public constant xSDL_SetJoystickVirtualHat = define_c_func(sdl,"+SDL_SetJoystickVirtualHat",{C_POINTER,C_INT,C_UINT8},C_BOOL)

public function SDL_SetJoystickVirtualHat(atom joystick,atom hat,atom val)
	return c_func(xSDL_SetJoystickVirtualHat,{joystick,hat,val})
end function

public constant xSDL_SetJoystickVirtualTouchpad = define_c_func(sdl,"+SDL_SetJoystickVirtualTouchpad",{C_POINTER,C_INT,C_INT,C_BOOL,C_FLOAT,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_SetJoystickVirtualTouchpad(atom joystick,atom touchpad,atom finger,atom down,atom x,atom y,atom pressure)
	return c_func(xSDL_SetJoystickVirtualTouchpad,{joystick,touchpad,finger,down,x,y,pressure})
end function

public constant xSDL_SendJoystickVirtualSensorData = define_c_func(sdl,"+SDL_SendJoystickVirtualSensorData",{C_POINTER,C_INT,C_UINT64,C_POINTER,C_INT},C_BOOL)

public function SDL_SendJoystickVirtualSensorData(atom joystick,SDL_SensorType stype,atom sensor_timestamp,atom data,atom num_val)
	return c_func(xSDL_SendJoystickVirtualSensorData,{joystick,stype,sensor_timestamp,data,num_val})
end function

public constant xSDL_GetJoystickProperties = define_c_func(sdl,"+SDL_GetJoystickProperties",{C_POINTER},C_UINT32)

public function SDL_GetJoystickProperties(atom joystick)
	return c_func(xSDL_GetJoystickProperties,{joystick})
end function

public constant SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN  =        "SDL.joystick.cap.mono_led"
public constant SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN          = "SDL.joystick.cap.rgb_led"
public constant SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN       = "SDL.joystick.cap.player_led"
public constant SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN           = "SDL.joystick.cap.rumble"
public constant SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN   = "SDL.joystick.cap.trigger_rumble"

public constant xSDL_GetJoystickName = define_c_func(sdl,"+SDL_GetJoystickName",{C_POINTER},C_STRING)

public function SDL_GetJoystickName(atom joystick)
	return c_func(xSDL_GetJoystickName,{joystick})
end function

public constant xSDL_GetJoystickPath = define_c_func(sdl,"+SDL_GetJoystickPath",{C_POINTER},C_STRING)

public function SDL_GetJoystickPath(atom joystick)
	return c_func(xSDL_GetJoystickPath,{joystick})
end function

public constant xSDL_GetJoystickPlayerIndex = define_c_func(sdl,"+SDL_GetJoystickPlayerIndex",{C_POINTER},C_INT)

public function SDL_GetJoystickPlayerIndex(atom joystick)
	return c_func(xSDL_GetJoystickPlayerIndex,{joystick})
end function

public constant xSDL_SetJoystickPlayerIndex = define_c_func(sdl,"+SDL_SetJoystickPlayerIndex",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetJoystickPlayerIndex(atom joystick,atom index)
	return c_func(xSDL_SetJoystickPlayerIndex,{joystick,index})
end function

public constant xSDL_GetJoystickGUID = define_c_func(sdl,"+SDL_GetJoystickGUID",{C_POINTER},C_UINT32)

public function SDL_GetJoystickGUID(atom joystick)
	return c_func(xSDL_GetJoystickGUID,{joystick})
end function

public constant xSDL_GetJoystickVendor = define_c_func(sdl,"+SDL_GetJoystickVendor",{C_POINTER},C_UINT16)

public function SDL_GetJoystickVendor(atom joystick)
	return c_func(xSDL_GetJoystickVendor,{joystick})
end function

public constant xSDL_GetJoystickProduct = define_c_func(sdl,"+SDL_GetJoystickProduct",{C_POINTER},C_UINT16)

public function SDL_GetJoystickProduct(atom joystick)
	return c_func(xSDL_GetJoystickProduct,{joystick})
end function

public constant xSDL_GetJoystickProductVersion = define_c_func(sdl,"+SDL_GetJoystickProductVersion",{C_POINTER},C_UINT16)

public function SDL_GetJoystickProductVersion(atom joystick)
	return c_func(xSDL_GetJoystickProductVersion,{joystick})
end function

public constant xSDL_GetJoystickFirmwareVersion = define_c_func(sdl,"+SDL_GetJoystickFirmwareVersion",{C_POINTER},C_UINT16)

public function SDL_GetJoystickFirmwareVersion(atom joystick)
	return c_func(xSDL_GetJoystickFirmwareVersion,{joystick})
end function

public constant xSDL_GetJoystickSerial = define_c_func(sdl,"+SDL_GetJoystickSerial",{C_POINTER},C_STRING)

public function SDL_GetJoystickSerial(atom joystick)
	return c_func(xSDL_GetJoystickSerial,{joystick})
end function

public constant xSDL_GetJoystickType = define_c_func(sdl,"+SDL_GetJoystickType",{C_POINTER},C_INT)

public function SDL_GetJoystickType(atom joystick)
	return c_func(xSDL_GetJoystickType,{joystick})
end function

public constant xSDL_GetJoystickGUIDInfo = define_c_proc(sdl,"+SDL_GetJoystickGUIDInfo",{C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetJoystickGUIDInfo(atom guid,atom vendor,atom product,atom version,atom crc16)
	c_proc(xSDL_GetJoystickGUIDInfo,{guid,vendor,product,version,crc16})
end procedure

public constant xSDL_JoystickConnected = define_c_func(sdl,"+SDL_JoystickConnected",{C_POINTER},C_BOOL)

public function SDL_JoystickConnected(atom joystick)
	return c_func(xSDL_JoystickConnected,{joystick})
end function

public constant xSDL_GetJoystickID = define_c_func(sdl,"+SDL_GetJoystickID",{C_POINTER},C_UINT32)

public function SDL_GetJoystickID(atom joystick)
	return c_func(xSDL_GetJoystickID,{joystick})
end function

public constant xSDL_GetNumJoystickAxes = define_c_func(sdl,"+SDL_GetNumJoystickAxes",{C_POINTER},C_INT)

public function SDL_GetNumJoystickAxes(atom joystick)
	return c_func(xSDL_GetNumJoystickAxes,{joystick})
end function

public constant xSDL_GetNumJoystickBalls = define_c_func(sdl,"+SDL_GetNumJoystickBalls",{C_POINTER},C_INT)

public function SDL_GetNumJoystickBalls(atom joystick)
	return c_func(xSDL_GetNumJoystickBalls,{joystick})
end function

public constant xSDL_GetNumJoystickHats = define_c_func(sdl,"+SDL_GetNumJoystickHats",{C_POINTER},C_INT)

public function SDL_GetNumJoystickHats(atom joystick)
	return c_func(xSDL_GetNumJoystickHats,{joystick})
end function

public constant xSDL_GetNumJoystickButtons = define_c_func(sdl,"+SDL_GetNumJoystickButtons",{C_POINTER},C_INT)

public function SDL_GetNumJoystickButtons(atom joystick)
	return c_func(xSDL_GetNumJoystickButtons,{joystick})
end function

public constant xSDL_SetJoystickEventsEnabled = define_c_proc(sdl,"+SDL_SetJoystickEventsEnabled",{C_BOOL})

public procedure SDL_SetJoystickEventsEnabled(atom enabled)
	c_proc(xSDL_SetJoystickEventsEnabled,{enabled})
end procedure

public constant xSDL_JoystickEventsEnabled = define_c_func(sdl,"+SDL_JoystickEventsEnabled",{},C_BOOL)

public function SDL_JoystickEventsEnabled()
	return c_func(xSDL_JoystickEventsEnabled,{})
end function

public constant xSDL_UpdateJoysticks = define_c_proc(sdl,"+SDL_UpdateJoysticks",{})

public procedure SDL_UpdateJoysticks()
	c_proc(xSDL_UpdateJoysticks,{})
end procedure

public constant xSDL_GetJoystickAxis = define_c_func(sdl,"+SDL_GetJoystickAxis",{C_POINTER,C_INT},C_INT16)

public function SDL_GetJoystickAxis(atom joystick,atom axis)
	return c_func(xSDL_GetJoystickAxis,{joystick,axis})
end function

public constant xSDL_GetJoystickAxisInitialState = define_c_func(sdl,"+SDL_GetJoystickAxisInitialState",{C_POINTER,C_INT,C_POINTER},C_BOOL)

public function SDL_GetJoystickAxisInitialState(atom joystick,atom axis,atom state)
	return c_func(xSDL_GetJoystickAxisInitialState,{joystick,axis,state})
end function

public constant xSDL_GetJoystickBall = define_c_func(sdl,"+SDL_GetJoystickBall",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetJoystickBall(atom joystick,atom ball,atom x,atom y)
	return c_func(xSDL_GetJoystickBall,{joystick,ball,x,y})
end function

public constant xSDL_GetJoystickHat = define_c_func(sdl,"+SDL_GetJoystickHat",{C_POINTER,C_INT},C_UINT8)

public function SDL_GetJoystickHat(atom joystick,atom hat)
	return c_func(xSDL_GetJoystickHat,{joystick,hat})
end function

public constant SDL_HAT_CENTERED = 0x00
public constant SDL_HAT_UP = 0x01
public constant SDL_HAT_RIGHT = 0x02
public constant SDL_HAT_DOWN = 0x04
public constant SDL_HAT_LEFT = 0x08
public constant SDL_HAT_RIGHTUP = or_all({SDL_HAT_RIGHT,SDL_HAT_UP})
public constant SDL_HAT_RIGHTDOWN = or_all({SDL_HAT_RIGHT,SDL_HAT_DOWN})
public constant SDL_HAT_LEFTUP = or_all({SDL_HAT_LEFT,SDL_HAT_UP})
public constant SDL_HAT_LEFTDOWN = or_all({SDL_HAT_LEFT,SDL_HAT_DOWN})

public constant xSDL_GetJoystickButton = define_c_func(sdl,"+SDL_GetJoystickButton",{C_POINTER,C_INT},C_BOOL)

public function SDL_GetJoystickButton(atom joystick,atom button)
	return c_func(xSDL_GetJoystickButton,{joystick,button})
end function

public constant xSDL_RumbleJoystick = define_c_func(sdl,"+SDL_RumbleJoystick",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_BOOL)

public function SDL_RumbleJoystick(atom joystick,atom low_frequency_rumble,atom high_frequency_rumble,atom duration_ms)
	return c_func(xSDL_RumbleJoystick,{joystick,low_frequency_rumble,high_frequency_rumble,duration_ms})
end function

public constant xSDL_RumbleJoystickTriggers = define_c_func(sdl,"+SDL_RumbleJoystickTriggers",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_BOOL)

public function SDL_RumbleJoystickTriggers(atom joystick,atom left_rumble,atom right_rumble,atom duration_ms)
	return c_func(xSDL_RumbleJoystickTriggers,{joystick,left_rumble,right_rumble,duration_ms})
end function

public constant xSDL_SetJoystickLED = define_c_func(sdl,"+SDL_SetJoystickLED",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_BOOL)

public function SDL_SetJoystickLED(atom joystick,atom red,atom green,atom blue)
	return c_func(xSDL_SetJoystickLED,{joystick,red,green,blue})
end function

public constant xSDL_SendJoystickEffect = define_c_func(sdl,"+SDL_SendJoystickEffect",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_SendJoystickEffect(atom joystick,atom data,atom size)
	return c_func(xSDL_SendJoystickEffect,{joystick,data,size})
end function

public constant xSDL_CloseJoystick = define_c_proc(sdl,"+SDL_CloseJoystick",{C_POINTER})

public procedure SDL_CloseJoystick(atom joystick)
	c_proc(xSDL_CloseJoystick,{joystick})
end procedure

public constant xSDL_GetJoystickConnectionState = define_c_func(sdl,"+SDL_GetJoystickConnectionState",{C_POINTER},C_INT)

public function SDL_GetJoystickConnectionState(atom joystick)
	return c_func(xSDL_GetJoystickConnectionState,{joystick})
end function

public constant xSDL_GetJoystickPowerInfo = define_c_func(sdl,"+SDL_GetJoystickPowerInfo",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetJoystickPowerInfo(atom joystick,atom percent)
	return c_func(xSDL_GetJoystickPowerInfo,{joystick,percent})
end function
­16.33