include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_error.e
include SDL_rwops.e
include SDL_sensor.e
include SDL_joystick.e

--typedefstruct SDL_Gamepad

public enum type SDL_GamepadType
	SDL_GAMEPAD_TYPE_UNKNOWN = 0,
	SDL_GAMEPAD_TYPE_STANDARD,
	SDL_GAMEPAD_TYPE_XBOX360,
	SDL_GAMEPAD_TYPE_XBOXONE,
	SDL_GAMEPAD_TYPE_PS3,
	SDL_GAMEPAD_TYPE_PS4,
	SDL_GAMEPAD_TYPE_PS5,
	SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO,
	SDL_GAMEPAD_TYPE_NINTENDO_SWTICH_JOYCON_LEFT,
	SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
	SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR,
	SDL_GAMEPAD_TYPE_MAX
end type

public enum type SDL_GamepadButton
	SDL_GAMEPAD_BUTTON_INVALID = -1,
	SDL_GAMEPAD_BUTTON_SOUTH = 0, --BUTTON A, CROSS OR X
	SDL_GAMEPAD_BUTTON_EAST, --BUTTON B, CIRCLE
	SDL_GAMEPAD_BUTTON_WEST, --BUTTON X, SQUARE
	SDL_GAMEPAD_BUTTON_NORTH, --BUTTON Y, TRIANGLE
	SDL_GAMEPAD_BUTTON_BACK,
	SDL_GAMEPAD_BUTTON_GUIDE,
	SDL_GAMEPAD_BUTTON_START,
	SDL_GAMEPAD_BUTTON_LEFT_STICK,
	SDL_GAMEPAD_BUTTON_RIGHT_STICK,
	SDL_GAMEPAD_BUTTON_LEFT_SHOULDER,
	SDL_GAMEPAD_BUTTON_RIGHT_SHOULDER,
	SDL_GAMEPAD_BUTTON_DPAD_UP,
	SDL_GAMEPAD_BUTTON_DPAD_DOWN,
	SDL_GAMEPAD_BUTTON_DPAD_LEFT,
	SDL_GAMEPAD_BUTTON_DPAD_RIGHT,
	SDL_GAMEPAD_BUTTON_MISC1,
	SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1,
	SDL_GAMEPAD_BUTTON_LEFT_PADDLE1,
	SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2,
	SDL_GAMEPAD_BUTTON_LEFT_PADDLE2,
	SDL_GAMEPAD_BUTTON_TOUCHPAD,
	SDL_GAMEPAD_BUTTON_MISC2,
	SDL_GAMEPAD_BUTTON_MISC3,
	SDL_GAMEPAD_BUTTON_MISC4,
	SDL_GAMEPAD_BUTTON_MISC5,
	SDL_GAMEPAD_BUTTON_MISC6,
	SDL_GAMEPAD_BUTTON_MAX
end type

public enum type SDL_GamepadButtonLabel
	SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN = 0,
	SDL_GAMEPAD_BUTTON_LABEL_A,
	SDL_GAMEPAD_BUTTON_LABEL_B,
	SDL_GAMEPAD_BUTTON_LABEL_X,
	SDL_GAMEPAD_BUTTON_LABEL_Y,
	SDL_GAMEPAD_BUTTON_LABEL_CROSS, --or X :P
	SDL_GAMEPAD_BUTTON_LABEL_CIRCLE, 
	SDL_GAMEPAD_BUTTON_LABEL_SQUARE,
	SDL_GAMEPAD_BUTTON_LABEL_TRIANGLE
end type

public enum type SDL_GamepadAxis
	SDL_GAMEPAD_AXIS_INVALID = -1,
	SDL_GAMEPAD_AXIS_LEFTX = 0,
	SDL_GAMEPAD_AXIS_LEFTY,
	SDL_GAMEPAD_AXIS_RIGHTX,
	SDL_GAMEPAD_AXIS_RIGHTY,
	SDL_GAMEPAD_AXIS_LEFT_TRIGGER,
	SDL_GAMEPAD_AXIS_RIGHT_TRIGGER,
	SDL_GAMEPAD_AXIS_MAX
end type

public enum type SDL_GamepadBindingType
	SDL_GAMEPAD_BINDTYPE_NONE = 0,
	SDL_GAMEPAD_BINDTYPE_BUTTON,
	SDL_GAMEPAD_BINDTYPE_AXIS,
	SDL_GAMEPAD_BINDTYPE_HAT
end type

public constant SDL_GamepadBinding = define_c_union({
	C_INT, --button
	C_INT, --axis
	C_INT, --axis_min
	C_INT, --axis_max
	C_INT, --hat
	C_INT, --hat_mask
	C_INT, --SDL_GamepadBindingType
	C_INT, --SDL_Gamepad Axis
	C_INT, --axis_min
	C_INT --axis
})

public constant INPUT = define_c_union({
	C_INT, --SDL_GamepadBindingType
	C_INT, --button
	C_INT, --axis
	C_INT, --axis_min
	C_INT, --axis_max
	C_INT, --hat
	C_INT --hat_mask
})

public constant OUTPUT_TYPE = define_c_union({
	C_INT, --SDL_GamepadButton
	C_INT, --SDL_GamepadAxis
	C_INT, --axis_min
	C_INT --axis_max
})

export constant xSDL_AddGamepadMapping = define_c_func(sdl,"+SDL_AddGamepadMapping",{C_STRING},C_INT)

public function SDL_AddGamepadMapping(sequence mappingString)
	return c_func(xSDL_AddGamepadMapping,{mappingString})
end function

export constant xSDL_AddGamepadMappingsFromRW = define_c_func(sdl,"+SDL_AddGamepadMappingsFromRW",{C_POINTER,C_INT},C_INT)

public function SDL_AddGamepadMappingsFromRW(atom rw,atom freerw)
	return c_func(xSDL_AddGamepadMappingsFromRW,{rw,freerw})
end function

--Defined as a macro in SDL3
public function SDL_AddGamepadMappingsFromFile(sequence file)
	return SDL_AddGamepadMappingsFromRW(SDL_IOFromFile(file,"rb"),1)
end function

public constant xSDL_ReloadGamepadMappings = define_c_func(sdl,"+SDL_ReloadGamepadMappings",{},C_INT)

public function SDL_ReloadGamepadMappings()
	return c_func(xSDL_ReloadGamepadMappings,{})
end function

export constant xSDL_GetNumGamepadMappings = define_c_func(sdl,"+SDL_GetNumGamepadMappings",{},C_INT)

public function SDL_GetNumGamepadMappings()
	return c_func(xSDL_GetNumGamepadMappings,{})
end function

export constant xSDL_GetGamepadMappingForIndex = define_c_func(sdl,"+SDL_GetGamepadMappingForIndex",{C_INT},C_STRING)

public function SDL_GetGamepadMappingForIndex(atom mapping_index)
	return c_func(xSDL_GetGamepadMappingForIndex,{mapping_index})
end function

export constant xSDL_GetGamepadMappingForGUID = define_c_func(sdl,"+SDL_GetGamepadMappingForGUID",{C_INT},C_STRING)

public function SDL_GetGamepadMappingForGUID(atom guid)
	return c_func(xSDL_GetGamepadMappingForGUID,{guid})
end function

export constant xSDL_GetGamepadMapping = define_c_func(sdl,"+SDL_GetGamepadMapping",{C_POINTER},C_STRING)

public function SDL_GetGamepadMapping(atom gp)
	return c_func(xSDL_GetGamepadMapping,{gp})
end function

export constant xSDL_GetGamepads = define_c_func(sdl,"+SDL_GetGamepads",{C_POINTER},C_POINTER)

public function SDL_GetGamepads(atom count)
	return c_func(xSDL_GetGamepads,{count})
end function

export constant xSDL_IsGamepad = define_c_func(sdl,"+SDL_IsGamepad",{C_INT},C_BOOL)

public function SDL_IsGamepad(atom id)
	return c_func(xSDL_IsGamepad,{id})
end function

export constant xSDL_GetGamepadInstanceName = define_c_func(sdl,"+SDL_GetGamepadInstanceName",{C_INT},C_STRING)

public function SDL_GetGamepadInstanceName(atom id)
	return c_func(xSDL_GetGamepadInstanceName,{id})
end function

export constant xSDL_GetGamepadInstancePath = define_c_func(sdl,"+SDL_GetGamepadInstancePath",{C_INT},C_STRING)

public function SDL_GetGamepadInstancePath(atom id)
	return c_func(xSDL_GetGamepadInstancePath,{id})
end function

export constant xSDL_GetGamepadInstancePlayerIndex = define_c_func(sdl,"+SDL_GetGamepadInstancePlayerIndex",{C_INT},C_INT)

public function SDL_GetGamepadInstancePlayerIndex(atom id)
	return c_func(xSDL_GetGamepadInstancePlayerIndex,{id})
end function

export constant xSDL_GetGamepadInstanceGUID = define_c_func(sdl,"+SDL_GetGamepadInstanceGUID",{C_INT},C_INT)

public function SDL_GetGamepadInstanceGUID(atom id)
	return c_func(xSDL_GetGamepadInstanceGUID,{id})
end function

export constant xSDL_GetGamepadInstanceVendor = define_c_func(sdl,"+SDL_GetGamepadInstanceVendor",{C_INT},C_UINT16)

public function SDL_GetGamepadInstanceVendor(atom id)
	return c_func(xSDL_GetGamepadInstanceVendor,{id})
end function

export constant xSDL_GetGamepadInstanceProduct = define_c_func(sdl,"+SDL_GetGamepadInstanceProduct",{C_INT},C_UINT16)

public function SDL_GetGamepadInstanceProduct(atom id)
	return c_func(xSDL_GetGamepadInstanceProduct,{id})
end function

export constant xSDL_GetGamepadInstanceProductVersion = define_c_func(sdl,"+SDL_GetGamepadInstanceProductVersion",{C_INT},C_UINT16)

public function SDL_GetGamepadInstanceProductVersion(atom id)
	return c_func(xSDL_GetGamepadInstanceProductVersion,{id})
end function

export constant xSDL_GetGamepadInstanceType = define_c_func(sdl,"+SDL_GetGamepadInstanceType",{C_INT},C_INT)

public function SDL_GetGamepadInstanceType(atom id)
	return c_func(xSDL_GetGamepadInstanceType,{id})
end function

export constant xSDL_GetGamepadInstanceMapping = define_c_func(sdl,"+SDL_GetGamepadInstanceMapping",{C_INT},C_STRING)

public function SDL_GetGamepadInstanceMapping(atom id)
	return c_func(xSDL_GetGamepadInstanceMapping,{id})
end function

export constant xSDL_OpenGamepad = define_c_func(sdl,"+SDL_OpenGamepad",{C_INT},C_POINTER)

public function SDL_OpenGamepad(atom id)
	return c_func(xSDL_OpenGamepad,{id})
end function

export constant xSDL_GetGamepadFromInstance = define_c_func(sdl,"+SDL_GetGamepadFromInstance",{C_INT},C_POINTER)

public function SDL_GetGamepadFromInstance(atom id)
	return c_func(xSDL_GetGamepadFromInstance,{id})
end function

export constant xSDL_GetGamepadFromPlayerIndex = define_c_func(sdl,"+SDL_GetGamepadFromPlayerIndex",{C_INT},C_POINTER)

public function SDL_GetGamepadFromPlayerIndex(atom player_index)
	return c_func(xSDL_GetGamepadFromPlayerIndex,{player_index})
end function

export constant xSDL_GetGamepadName = define_c_func(sdl,"+SDL_GetGamepadName",{C_POINTER},C_STRING)

public function SDL_GetGamepadName(atom gp)
	return c_func(xSDL_GetGamepadName,{gp})
end function

export constant xSDL_GetGamepadPath = define_c_func(sdl,"+SDL_GetGamepadPath",{C_POINTER},C_STRING)

public function SDL_GetGamepadPath(atom gp)
	return c_func(xSDL_GetGamepadPath,{gp})
end function

export constant xSDL_GetGamepadType = define_c_func(sdl,"+SDL_GetGamepadType",{C_POINTER},C_INT)

public function SDL_GetGamepadType(atom gp)
	return c_func(xSDL_GetGamepadType,{gp})
end function

export constant xSDL_GetGamepadPlayerIndex = define_c_func(sdl,"+SDL_GetGamepadPlayerIndex",{C_POINTER},C_INT)

public function SDL_GetGamepadPlayerIndex(atom gp)
	return c_func(xSDL_GetGamepadPlayerIndex,{gp})
end function

export constant xSDL_SetGamepadPlayerIndex = define_c_func(sdl,"+SDL_SetGamepadPlayerIndex",{C_POINTER,C_INT},C_INT)

public function SDL_SetGamepadPlayerIndex(atom gp,atom player_index)
	return c_func(xSDL_SetGamepadPlayerIndex,{gp,player_index})
end function

export constant xSDL_GetGamepadVendor = define_c_func(sdl,"+SDL_GetGamepadVendor",{C_POINTER},C_UINT16)

public function SDL_GetGamepadVendor(atom gp)
	return c_func(xSDL_GetGamepadVendor,{gp})
end function

export constant xSDL_GetGamepadProduct = define_c_func(sdl,"+SDL_GetGamepadProduct",{C_POINTER},C_UINT16)

public function SDL_GetGamepadProduct(atom gp)
	return c_func(xSDL_GetGamepadProduct,{gp})
end function

export constant xSDL_GetGamepadProductVersion = define_c_func(sdl,"+SDL_GetGamepadProductVersion",{C_POINTER},C_UINT16)

public function SDL_GetGamepadProductVersion(atom gp)
	return c_func(xSDL_GetGamepadProductVersion,{gp})
end function

export constant xSDL_GetGamepadFirmwareVersion = define_c_func(sdl,"+SDL_GetGamepadFirmwareVersion",{C_POINTER},C_UINT16)

public function SDL_GetGamepadFirmwareVersion(atom gp)
	return c_func(xSDL_GetGamepadFirmwareVersion,{gp})
end function

export constant xSDL_GetGamepadSerial = define_c_func(sdl,"+SDL_GetGamepadSerial",{C_POINTER},C_STRING)

public function SDL_GetGamepadSerial(atom gp)
	return c_func(xSDL_GetGamepadSerial,{gp})
end function

public constant xSDL_GetGamepadPowerLevel = define_c_func(sdl,"+SDL_GetGamepadPowerLevel",{C_POINTER},C_INT)

public function SDL_GetGamepadPowerLevel(atom gp)
	return c_func(xSDL_GetGamepadPowerLevel,{gp})
end function

export constant xSDL_GamepadConnected = define_c_func(sdl,"+SDL_GamepadConnected",{C_POINTER},C_BOOL)

public function SDL_GamepadConnected(atom gp)
	return c_func(xSDL_GamepadConnected,{gp})
end function

export constant xSDL_GetGamepadJoystick = define_c_func(sdl,"+SDL_GetGamepadJoystick",{C_POINTER},C_POINTER)

public function SDL_GetGamepadJoystick(atom gp)
	return c_func(xSDL_GetGamepadJoystick,{gp})
end function

export constant xSDL_SetGamepadEventsEnabled = define_c_proc(sdl,"+SDL_SetGamepadEventsEnabled",{C_BOOL})

public procedure SDL_SetGamepadEventsEnabled(atom en)
	c_proc(xSDL_SetGamepadEventsEnabled,{en})
end procedure

export constant xSDL_GamepadEventsEnabled = define_c_func(sdl,"+SDL_GamepadEventsEnabled",{},C_BOOL)

public function SDL_GamepadEventsEnabled()
	return c_func(xSDL_GamepadEventsEnabled,{})
end function

public constant xSDL_GetGamepadBindings = define_c_func(sdl,"+SDL_GetGamepadBindings",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetGamepadBindings(atom gp,atom count)
	return c_func(xSDL_GetGamepadBindings,{gp,count})
end function

export constant xSDL_UpdateGamepads = define_c_proc(sdl,"+SDL_UpdateGamepads",{})

public procedure SDL_UpdateGamepads()
	c_proc(xSDL_UpdateGamepads,{})
end procedure

export constant xSDL_GetGamepadAxisFromString = define_c_func(sdl,"+SDL_GetGamepadAxisFromString",{C_STRING},C_INT)

public function SDL_GetGamepadAxisFromString(sequence str)
	return c_func(xSDL_GetGamepadAxisFromString,{str})
end function

export constant xSDL_GetGamepadStringForAxis = define_c_func(sdl,"+SDL_GetGamepadStringForAxis",{C_INT},C_STRING)

public function SDL_GetGamepadStringForAxis(atom axis)
	return c_func(xSDL_GetGamepadStringForAxis,{axis})
end function

export constant xSDL_GetGamepadBindForAxis = define_c_func(sdl,"+SDL_GetGamepadBindForAxis",{C_POINTER,C_INT},C_INT)

public function SDL_GetGamepadBindForAxis(atom gp,atom axis)
	return c_func(xSDL_GetGamepadBindForAxis,{gp,axis})
end function

export constant xSDL_GamepadHasAxis = define_c_func(sdl,"+SDL_GamepadHasAxis",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadHasAxis(atom gp,atom axis)
	return c_func(xSDL_GamepadHasAxis,{gp,axis})
end function

export constant xSDL_GetGamepadAxis = define_c_func(sdl,"+SDL_GetGamepadAxis",{C_POINTER,C_INT},C_INT16)

public function SDL_GetGamepadAxis(atom gp,atom axis)
	return c_func(xSDL_GetGamepadAxis,{gp,axis})
end function

export constant xSDL_GetGamepadButtonFromString = define_c_func(sdl,"+SDL_GetGamepadButtonFromString",{C_STRING},C_INT)

public function SDL_GetGamepadButtonFromString(sequence str)
	return c_func(xSDL_GetGamepadButtonFromString,{str})
end function

export constant xSDL_GetGamepadStringForButton = define_c_func(sdl,"+SDL_GetGamepadStringForButton",{C_INT},C_STRING)

public function SDL_GetGamepadStringForButton(atom btn)
	return c_func(xSDL_GetGamepadStringForButton,{btn})
end function

export constant xSDL_GetGamepadBindForButton = define_c_func(sdl,"+SDL_GetGamepadBindForButton",{C_POINTER,C_INT},C_INT)

public function SDL_GetGamepadBindForButton(atom gp,atom btn)
	return c_func(xSDL_GetGamepadBindForButton,{gp,btn})
end function

export constant xSDL_GamepadHasButton = define_c_func(sdl,"+SDL_GamepadHasButton",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadHasButton(atom gp,atom btn)
	return c_func(xSDL_GamepadHasButton,{gp,btn})
end function

export constant xSDL_GetGamepadButton = define_c_func(sdl,"+SDL_GetGamepadButton",{C_POINTER,C_INT},C_UINT8)

public function SDL_GetGamepadButton(atom gp,atom btn)
	return c_func(xSDL_GetGamepadButton,{gp,btn})
end function

export constant xSDL_GetNumGamepadTouchpads = define_c_func(sdl,"+SDL_GetNumGamepadTouchpads",{C_POINTER},C_INT)

public function SDL_GetNumGamepadTouchpads(atom gp)
	return c_func(xSDL_GetNumGamepadTouchpads,{gp})
end function

export constant xSDL_GetNumGamepadTouchpadFingers = define_c_func(sdl,"+SDL_GetNumGamepadTouchpadFingers",{C_POINTER,C_INT},C_INT)

public function SDL_GetNumGamepadTouchpadFingers(atom gp,atom tp)
	return c_func(xSDL_GetNumGamepadTouchpadFingers,{gp,tp})
end function

export constant xSDL_GetGamepadTouchpadFinger = define_c_func(sdl,"+SDL_GetGamepadTouchpadFinger",{C_POINTER,C_INT,C_INT,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetGamepadTouchpadFinger(atom gp,atom tp,atom fing,atom state,atom x,atom y,atom pressure)
	return c_func(xSDL_GetGamepadTouchpadFinger,{gp,tp,fing,state,x,y,pressure})
end function

export constant xSDL_GamepadHasSensor = define_c_func(sdl,"+SDL_GamepadHasSensor",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadHasSensor(atom gp,atom stype)
	return c_func(xSDL_GamepadHasSensor,{gp,stype})
end function

export constant xSDL_SetGamepadSensorEnabled = define_c_func(sdl,"+SDL_SetGamepadSensorEnabled",{C_POINTER,C_INT,C_BOOL},C_INT)

public function SDL_SetGamepadSensorEnabled(atom gp,atom stype,atom en)
	return c_func(xSDL_SetGamepadSensorEnabled,{gp,stype,en})
end function

export constant xSDL_GamepadSensorEnabled = define_c_func(sdl,"+SDL_GamepadSensorEnabled",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadSensorEnabled(atom gp,atom stype)
	return c_func(xSDL_GamepadSensorEnabled,{gp,stype})
end function

export constant xSDL_GetGamepadSensorDataRate = define_c_func(sdl,"+SDL_GetGamepadSensorDataRate",{C_POINTER,C_INT},C_FLOAT)

public function SDL_GetGamepadSensorDataRate(atom gp,atom stype)
	return c_func(xSDL_GetGamepadSensorDataRate,{gp,stype})
end function

export constant xSDL_GetGamepadSensorData = define_c_func(sdl,"+SDL_GetGamepadSensorData",{C_POINTER,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_GetGamepadSensorData(atom gp,atom stype,atom data,atom num)
	return c_func(xSDL_GetGamepadSensorData,{gp,stype,data,num})
end function

export constant xSDL_RumbleGamepad = define_c_func(sdl,"+SDL_RumbleGamepad",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_INT)

public function SDL_RumbleGamepad(atom gp,atom low,atom high,atom duration)
	return c_func(xSDL_RumbleGamepad,{gp,low,high,duration})
end function

export constant xSDL_RumbleGamepadTriggers = define_c_func(sdl,"+SDL_RumbleGamepadTriggers",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_INT)

public function SDL_RumbleGamepadTriggers(atom gp,atom left,atom right,atom ms)
	return c_func(xSDL_RumbleGamepadTriggers,{gp,left,right,ms})
end function

export constant xSDL_GamepadHasLED = define_c_func(sdl,"+SDL_GamepadHasLED",{C_POINTER},C_BOOL)

public function SDL_GamepadHasLED(atom gp)
	return c_func(xSDL_GamepadHasLED,{gp})
end function

export constant xSDL_GamepadHasRumble = define_c_func(sdl,"+SDL_GamepadHasRumble",{C_POINTER},C_BOOL)

public function SDL_GamepadHasRumble(atom gp)
	return c_func(xSDL_GamepadHasRumble,{gp})
end function

export constant xSDL_GamepadHasRumbleTriggers = define_c_func(sdl,"+SDL_GamepadHasRumbleTriggers",{C_POINTER},C_BOOL)

public function SDL_GamepadHasRumbleTriggers(atom gp)
	return c_func(xSDL_GamepadHasRumbleTriggers,{gp})
end function

export constant xSDL_SetGamepadLED = define_c_func(sdl,"+SDL_SetGamepadLED",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_INT)

public function SDL_SetGamepadLED(atom gp,atom r,atom g,atom b)
	return c_func(xSDL_SetGamepadLED,{gp,r,g,b})
end function

export constant xSDL_SendGamepadEffect = define_c_func(sdl,"+SDL_SendGamepadEffect",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_SendGamepadEffect(atom gp,object data,atom size)
	return c_func(xSDL_SendGamepadEffect,{gp,data,size})
end function

export constant xSDL_CloseGamepad = define_c_proc(sdl,"+SDL_CloseGamepad",{C_POINTER})

public procedure SDL_CloseGamepad(atom gp)
	c_proc(xSDL_CloseGamepad,{gp})
end procedure

export constant xSDL_GetGamepadAppleSFSymbolsNameForButton = define_c_func(sdl,"+SDL_GetGamepadAppleSFSymbolsNameForButton",{C_POINTER,C_INT},C_STRING)

public function SDL_GetGamepadAppleSFSymbolsNameForButton(atom gp,atom btn)
	return c_func(xSDL_GetGamepadAppleSFSymbolsNameForButton,{gp,btn})
end function

export constant xSDL_GetGamepadAppleSFSymbolsNameForAxis = define_c_func(sdl,"+SDL_GetGamepadAppleSFSymbolsNameForAxis",{C_POINTER,C_INT},C_STRING)

public function SDL_GetGamepadAppleSFSymbolsNameForAxis(atom gp,atom axis)
	return c_func(xSDL_GetGamepadAppleSFSymbolsNameForAxis,{gp,axis})
end function
­31.53
