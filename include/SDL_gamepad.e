include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_guid.e
include SDL_iostream.e
include SDL_joystick.e
include SDL_power.e
include SDL_properties.e
include SDL_sensor.e

public enum type SDL_GamepadType
	SDL_GAMEPAD_TYPE_UNKNOWN = 0,
    SDL_GAMEPAD_TYPE_STANDARD,
    SDL_GAMEPAD_TYPE_XBOX360,
    SDL_GAMEPAD_TYPE_XBOXONE,
    SDL_GAMEPAD_TYPE_PS3,
    SDL_GAMEPAD_TYPE_PS4,
    SDL_GAMEPAD_TYPE_PS5,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_PRO,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_LEFT,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
    SDL_GAMEPAD_TYPE_NINTENDO_SWITCH_JOYCON_PAIR,
    SDL_GAMEPAD_TYPE_GAMECUBE,
    SDL_GAMEPAD_TYPE_COUNT
end type

public enum type SDL_GamepadButton
	SDL_GAMEPAD_BUTTON_INVALID = -1,
    SDL_GAMEPAD_BUTTON_SOUTH = 0,           /**< Bottom face button (e.g. Xbox A button) */
    SDL_GAMEPAD_BUTTON_EAST,            /**< Right face button (e.g. Xbox B button) */
    SDL_GAMEPAD_BUTTON_WEST,            /**< Left face button (e.g. Xbox X button) */
    SDL_GAMEPAD_BUTTON_NORTH,           /**< Top face button (e.g. Xbox Y button) */
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
    SDL_GAMEPAD_BUTTON_MISC1,           /**< Additional button (e.g. Xbox Series X share button, PS5 microphone button, Nintendo Switch Pro capture button, Amazon Luna microphone button, Google Stadia capture button) */
    SDL_GAMEPAD_BUTTON_RIGHT_PADDLE1,   /**< Upper or primary paddle, under your right hand (e.g. Xbox Elite paddle P1) */
    SDL_GAMEPAD_BUTTON_LEFT_PADDLE1,    /**< Upper or primary paddle, under your left hand (e.g. Xbox Elite paddle P3) */
    SDL_GAMEPAD_BUTTON_RIGHT_PADDLE2,   /**< Lower or secondary paddle, under your right hand (e.g. Xbox Elite paddle P2) */
    SDL_GAMEPAD_BUTTON_LEFT_PADDLE2,    /**< Lower or secondary paddle, under your left hand (e.g. Xbox Elite paddle P4) */
    SDL_GAMEPAD_BUTTON_TOUCHPAD,        /**< PS4/PS5 touchpad button */
    SDL_GAMEPAD_BUTTON_MISC2,           /**< Additional button */
    SDL_GAMEPAD_BUTTON_MISC3,           /**< Additional button */
    SDL_GAMEPAD_BUTTON_MISC4,           /**< Additional button */
    SDL_GAMEPAD_BUTTON_MISC5,           /**< Additional button */
    SDL_GAMEPAD_BUTTON_MISC6,           /**< Additional button */
    SDL_GAMEPAD_BUTTON_COUNT
end type

public enum type SDL_GamepadButtonLabel
	SDL_GAMEPAD_BUTTON_LABEL_UNKNOWN = 0,
    SDL_GAMEPAD_BUTTON_LABEL_A,
    SDL_GAMEPAD_BUTTON_LABEL_B,
    SDL_GAMEPAD_BUTTON_LABEL_X,
    SDL_GAMEPAD_BUTTON_LABEL_Y,
    SDL_GAMEPAD_BUTTON_LABEL_CROSS,
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
    SDL_GAMEPAD_AXIS_COUNT
end type

public enum type SDL_GamepadBindingType
	 SDL_GAMEPAD_BINDTYPE_NONE = 0,
    SDL_GAMEPAD_BINDTYPE_BUTTON,
    SDL_GAMEPAD_BINDTYPE_AXIS,
    SDL_GAMEPAD_BINDTYPE_HAT
end type

public constant SDL_GamepadBinding = define_c_union({
	C_INT, --input_type
	C_INT, --button
	
	C_INT, --axis
	C_INT, --axis_min
	C_INT, --axis_max
	
	C_INT, --hat
	C_INT, --hat_mask
	
	C_INT, --output_type
	C_INT, --button
	
	C_INT, --axis
	C_INT, --axis_min
	C_INT --axis_max
})

public constant xSDL_AddGamepadMapping = define_c_func(sdl,"+SDL_AddGamepadMapping",{C_STRING},C_INT)

public function SDL_AddGamepadMapping(sequence mapping)
	return c_func(xSDL_AddGamepadMapping,{mapping})
end function

public constant xSDL_AddGamepadMappingsFromIO = define_c_func(sdl,"+SDL_AddGamepadMappingsFromIO",{C_POINTER,C_BOOL},C_INT)

public function SDL_AddGamepadMappingsFromIO(atom src,atom closeio)
	return c_func(xSDL_AddGamepadMappingsFromIO,{src,closeio})
end function

public constant xSDL_AddGamepadMappingsFromFile = define_c_func(sdl,"+SDL_AddGamepadMappingsFromFile",{C_STRING},C_INT)

public function SDL_AddGamepadMappingsFromFile(sequence file)
	return c_func(xSDL_AddGamepadMappingsFromFile,{file})
end function

public constant xSDL_ReloadGamepadMappings = define_c_func(sdl,"+SDL_ReloadGamepadMappings",{},C_BOOL)

public function SDL_ReloadGamepadMappings()
	return c_func(xSDL_ReloadGamepadMappings,{})
end function

public constant xSDL_GetGamepadMappings = define_c_func(sdl,"+SDL_GetGamepadMappings",{C_POINTER},C_STRING)

public function SDL_GetGamepadMappings(atom count)
	return c_func(xSDL_GetGamepadMappings,{count})
end function

public constant xSDL_GetGamepadMappingForGUID = define_c_func(sdl,"+SDL_GetGamepadMappingForGUID",{C_UINT32},C_STRING)

public function SDL_GetGamepadMappingForGUID(atom guid)
	return c_func(xSDL_GetGamepadMappingForGUID,{guid})
end function

public constant xSDL_GetGamepadMapping = define_c_func(sdl,"+SDL_GetGamepadMapping",{C_POINTER},C_STRING)

public function SDL_GetGamepadMapping(atom gamepad)
	return c_func(xSDL_GetGamepadMapping,{gamepad})
end function

public constant xSDL_SetGamepadMapping = define_c_func(sdl,"+SDL_SetGamepadMapping",{C_UINT32,C_STRING},C_BOOL)

public function SDL_SetGamepadMapping(atom id,sequence mapping)
	return c_func(xSDL_SetGamepadMapping,{id,mapping})
end function

public constant xSDL_HasGamepad = define_c_func(sdl,"+SDL_HasGamepad",{},C_BOOL)

public function SDL_HasGamepad()
	return c_func(xSDL_HasGamepad,{})
end function

public constant xSDL_GetGamepads = define_c_func(sdl,"+SDL_GetGamepads",{C_POINTER},C_POINTER)

public function SDL_GetGamepads(atom count)
	return c_func(xSDL_GetGamepads,{count})
end function

public constant xSDL_IsGamepad = define_c_func(sdl,"+SDL_IsGamepad",{C_UINT32},C_BOOL)

public function SDL_IsGamepad(atom id)
	return c_func(xSDL_IsGamepad,{id})
end function

public constant xSDL_GetGamepadNameForID = define_c_func(sdl,"+SDL_GetGamepadNameForID",{C_UINT32},C_STRING)

public function SDL_GetGamepadNameForID(atom id)
	return c_func(xSDL_GetGamepadNameForID,{id})
end function

public constant xSDL_GetGamepadPathForID = define_c_func(sdl,"+SDL_GetGamepadPathForID",{C_UINT32},C_STRING)

public function SDL_GetGamepadPathForID(atom id)
	return c_func(xSDL_GetGamepadPathForID,{id})
end function

public constant xSDL_GetGamepadPlayerIndexForID = define_c_func(sdl,"+SDL_GetGamepadPlayerIndexForID",{C_UINT32},C_INT)

public function SDL_GetGamepadPlayerIndexForID(atom id)
	return c_func(xSDL_GetGamepadPlayerIndexForID,{id})
end function

public constant xSDL_GetGamepadGUIDForID = define_c_func(sdl,"+SDL_GetGamepadGUIDForID",{C_UINT32},C_UINT32)

public function SDL_GetGamepadGUIDForID(atom id)
	return c_func(xSDL_GetGamepadGUIDForID,{id})
end function

public constant xSDL_GetGamepadVendorForID = define_c_func(sdl,"+SDL_GetGamepadVendorForID",{C_UINT32},C_UINT16)

public function SDL_GetGamepadVendorForID(atom id)
	return c_func(xSDL_GetGamepadVendorForID,{id})
end function

public constant xSDL_GetGamepadProductForID = define_c_func(sdl,"+SDL_GetGamepadProductForID",{C_UINT32},C_UINT16)

public function SDL_GetGamepadProductForID(atom id)
	return c_func(xSDL_GetGamepadProductForID,{id})
end function

public constant xSDL_GetGamepadProductVersionForID = define_c_func(sdl,"+SDL_GetGamepadProductVersionForID",{C_UINT32},C_UINT16)

public function SDL_GetGamepadProductVersionForID(atom id)
	return c_func(xSDL_GetGamepadProductVersionForID,{id})
end function

public constant xSDL_GetGamepadTypeForID = define_c_func(sdl,"+SDL_GetGamepadTypeForID",{C_UINT32},C_INT)

public function SDL_GetGamepadTypeForID(atom id)
	return c_func(xSDL_GetGamepadTypeForID,{id})
end function

public constant xSDL_GetRealGamepadTypeForID = define_c_func(sdl,"+SDL_GetRealGamepadTypeForID",{C_UINT32},C_INT)

public function SDL_GetRealGamepadTypeForID(atom id)
	return c_func(xSDL_GetRealGamepadTypeForID,{id})
end function

public constant xSDL_GetGamepadMappingForID = define_c_func(sdl,"+SDL_GetGamepadMappingForID",{C_UINT32},C_STRING)

public function SDL_GetGamepadMappingForID(atom id)
	return c_func(xSDL_GetGamepadMappingForID,{id})
end function

public constant xSDL_OpenGamepad = define_c_func(sdl,"+SDL_OpenGamepad",{C_UINT32},C_POINTER)

public function SDL_OpenGamepad(atom id)
	return c_func(xSDL_OpenGamepad,{id})
end function

public constant xSDL_GetGamepadFromID = define_c_func(sdl,"+SDL_GetGamepadFromID",{C_UINT32},C_POINTER)

public function SDL_GetGamepadFromID(atom id)
	return c_func(xSDL_GetGamepadFromID,{id})
end function

public constant xSDL_GetGamepadFromPlayerIndex = define_c_func(sdl,"+SDL_GetGamepadFromPlayerIndex",{C_INT},C_POINTER)

public function SDL_GetGamepadFromPlayerIndex(atom player_index)
	return c_func(xSDL_GetGamepadFromPlayerIndex,{player_index})
end function

public constant xSDL_GetGamepadProperties = define_c_func(sdl,"+SDL_GetGamepadProperties",{C_POINTER},C_UINT32)

public function SDL_GetGamepadProperties(atom gamepad)
	return c_func(xSDL_GetGamepadProperties,{gamepad})
end function

public constant SDL_PROP_GAMEPAD_CAP_MONO_LED_BOOLEAN   =    SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN
public constant SDL_PROP_GAMEPAD_CAP_RGB_LED_BOOLEAN      =  SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN
public constant SDL_PROP_GAMEPAD_CAP_PLAYER_LED_BOOLEAN   =  SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN
public constant SDL_PROP_GAMEPAD_CAP_RUMBLE_BOOLEAN       =  SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN
public constant SDL_PROP_GAMEPAD_CAP_TRIGGER_RUMBLE_BOOLEAN = SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN

public constant xSDL_GetGamepad = define_c_func(sdl,"+LL SDL_GetGamepad",{C_POINTER},C_UINT32)

public function SDL_GetGamepad(atom gamepad)
	return c_func(xSDL_GetGamepad,{gamepad})
end function

public constant xSDL_GetGamepadName = define_c_func(sdl,"+SDL_GetGamepadName",{C_POINTER},C_STRING)

public function SDL_GetGamepadName(atom gamepad)
	return c_func(xSDL_GetGamepadName,{gamepad})
end function

public constant xSDL_GetGamepadPath = define_c_func(sdl,"+SDL_GetGamepadPath",{C_POINTER},C_STRING)

public function SDL_GetGamepadPath(atom gamepad)
	return c_func(xSDL_GetGamepadPath,{gamepad})
end function

public constant xSDL_GetGamepadType = define_c_func(sdl,"+SDL_GetGamepadType",{C_POINTER},C_INT)

public function SDL_GetGamepadType(atom gamepad)
	return c_func(xSDL_GetGamepadType,{gamepad})
end function

public constant xSDL_GetRealGamepadType = define_c_func(sdl,"+SDL_GetRealGamepadType",{C_POINTER},C_INT)

public function SDL_GetRealGamepadType(atom gamepad)
	return c_func(xSDL_GetRealGamepadType,{gamepad})
end function

public constant xSDL_GetGamepadPlayerIndex = define_c_func(sdl,"+SDL_GetGamepadPlayerIndex",{C_POINTER},C_INT)

public function SDL_GetGamepadPlayerIndex(atom gamepad)
	return c_func(xSDL_GetGamepadPlayerIndex,{gamepad})
end function

public constant xSDL_SetGamepadPlayerIndex = define_c_func(sdl,"+SDL_SetGamepadPlayerIndex",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetGamepadPlayerIndex(atom gamepad,atom player_index)
	return c_func(xSDL_SetGamepadPlayerIndex,{gamepad,player_index})
end function

public constant xSDL_GetGamepadVendor = define_c_func(sdl,"+SDL_GetGamepadVendor",{C_POINTER},C_UINT16)

public function SDL_GetGamepadVendor(atom gamepad)
	return c_func(xSDL_GetGamepadVendor,{gamepad})
end function

public constant xSDL_GetGamepadProduct = define_c_func(sdl,"+SDL_GetGamepadProduct",{C_POINTER},C_UINT16)

public function SDL_GetGamepadProduct(atom gamepad)
	return c_func(xSDL_GetGamepadProduct,{gamepad})
end function

public constant xSDL_GetGamepadProductVersion = define_c_func(sdl,"+SDL_GetGamepadProductVersion",{C_POINTER},C_UINT16)

public function SDL_GetGamepadProductVersion(atom gamepad)
	return c_func(xSDL_GetGamepadProductVersion,{gamepad})
end function

public constant xSDL_GetGamepadFirmwareVersion = define_c_func(sdl,"+SDL_GetGamepadFirmwareVersion",{C_POINTER},C_UINT16)

public function SDL_GetGamepadFirmwareVersion(atom gamepad)
	return c_func(xSDL_GetGamepadFirmwareVersion,{gamepad})
end function

public constant xSDL_GetGamepadSerial = define_c_func(sdl,"+SDL_GetGamepadSerial",{C_POINTER},C_STRING)

public function SDL_GetGamepadSerial(atom gamepad)
	return c_func(xSDL_GetGamepadSerial,{gamepad})
end function

public constant xSDL_GetGamepadSteamHandle = define_c_func(sdl,"+SDL_GetGamepadSteamHandle",{C_POINTER},C_UINT64)

public function SDL_GetGamepadSteamHandle(atom gamepad)
	return c_func(xSDL_GetGamepadSteamHandle,{gamepad})
end function

public constant xSDL_GetGamepadConnectionState = define_c_func(sdl,"+SDL_GetGamepadConnectionState",{C_POINTER},C_INT)

public function SDL_GetGamepadConnectionState(atom gamepad)
	return c_func(xSDL_GetGamepadConnectionState,{gamepad})
end function

public constant xSDL_GetGamepadPowerInfo = define_c_func(sdl,"+SDL_GetGamepadPowerInfo",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetGamepadPowerInfo(atom gamepad,atom percent)
	return c_func(xSDL_GetGamepadPowerInfo,{gamepad,percent})
end function

public constant xSDL_GamepadConnected = define_c_func(sdl,"+SDL_GamepadConnected",{C_POINTER},C_BOOL)

public function SDL_GamepadConnected(atom gamepad)
	return c_func(xSDL_GamepadConnected,{gamepad})
end function

public constant xSDL_GetGamepadJoystick = define_c_func(sdl,"+SDL_GetGamepadJoystick",{C_POINTER},C_POINTER)

public function SDL_GetGamepadJoystick(atom gamepad)
	return c_func(xSDL_GetGamepadJoystick,{gamepad})
end function

public constant xSDL_SetGamepadEventsEnabled = define_c_proc(sdl,"+SDL_SetGamepadEventsEnabled",{C_BOOL})

public procedure SDL_SetGamepadEventsEnabled(atom enabled)
	c_proc(xSDL_SetGamepadEventsEnabled,{enabled})
end procedure

public constant xSDL_GamepadEventsEnabled = define_c_func(sdl,"+SDL_GamepadEventsEnabled",{},C_BOOL)

public function SDL_GamepadEventsEnabled()
	return c_func(xSDL_GamepadEventsEnabled,{})
end function

public constant xSDL_GetGamepadBindings = define_c_func(sdl,"+SDL_GetGamepadBindings",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetGamepadBindings(atom gamepad,atom count)
	return c_func(xSDL_GetGamepadBindings,{gamepad,count})
end function

public constant xSDL_UpdateGamepads = define_c_proc(sdl,"+SDL_UpdateGamepads",{})

public procedure SDL_UpdateGamepads()
	c_proc(xSDL_UpdateGamepads,{})
end procedure

public constant xSDL_GetGamepadTypeFromString = define_c_func(sdl,"+SDL_GetGamepadTypeFromString",{C_STRING},C_INT)

public function SDL_GetGamepadTypeFromString(sequence str)
	return c_func(xSDL_GetGamepadTypeFromString,{str})
end function

public constant xSDL_GetGamepadStringForType = define_c_func(sdl,"+SDL_GetGamepadStringForType",{C_INT},C_STRING)

public function SDL_GetGamepadStringForType(atom xtype)
	return c_func(xSDL_GetGamepadStringForType,{xtype})
end function

public constant xSDL_GetGamepadAxisFromString = define_c_func(sdl,"+SDL_GetGamepadAxisFromString",{C_STRING},C_INT)

public function SDL_GetGamepadAxisFromString(sequence str)
	return c_func(xSDL_GetGamepadAxisFromString,{str})
end function

public constant xSDL_GetGamepadStringForAxis = define_c_func(sdl,"+SDL_GetGamepadStringForAxis",{C_INT},C_STRING)

public function SDL_GetGamepadStringForAxis(SDL_GamepadAxis axis)
	return c_func(xSDL_GetGamepadStringForAxis,{axis})
end function

public constant xSDL_GamepadHasAxis = define_c_func(sdl,"+SDL_GamepadHasAxis",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadHasAxis(atom gamepad,SDL_GamepadAxis axis)
	return c_func(xSDL_GamepadHasAxis,{gamepad,axis})
end function

public constant xSDL_GetGamepadAxis = define_c_func(sdl,"+SDL_GetGamepadAxis",{C_POINTER,C_INT},C_INT16)

public function SDL_GetGamepadAxis(atom gamepad,SDL_GamepadAxis axis)
	return c_func(xSDL_GetGamepadAxis,{gamepad,axis})
end function

public constant xSDL_GetGamepadButtonFromString = define_c_func(sdl,"+SDL_GetGamepadButtonFromString",{C_STRING},C_INT)

public function SDL_GetGamepadButtonFromString(sequence str)
	return c_func(xSDL_GetGamepadButtonFromString,{str})
end function

public constant xSDL_GetGamepadStringForButton = define_c_func(sdl,"+SDL_GetGamepadStringForButton",{C_INT},C_STRING)

public function SDL_GetGamepadStringForButton(SDL_GamepadButton button)
	return c_func(xSDL_GetGamepadStringForButton,{button})
end function

public constant xSDL_GamepadHasButton = define_c_func(sdl,"+SDL_GamepadHasButton",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadHasButton(atom gamepad,SDL_GamepadButton button)
	return c_func(xSDL_GamepadHasButton,{gamepad,button})
end function

public constant xSDL_GetGamepadButton = define_c_func(sdl,"+SDL_GetGamepadButton",{C_POINTER,C_INT},C_BOOL)

public function SDL_GetGamepadButton(atom gamepad,SDL_GamepadButton button)
	return c_func(xSDL_GetGamepadButton,{gamepad,button})
end function

public constant xSDL_GetGamepadButtonLabelForType = define_c_func(sdl,"+SDL_GetGamepadButtonLabelForType",{C_INT,C_INT},C_INT)

public function SDL_GetGamepadButtonLabelForType(SDL_GamepadType gtype,SDL_GamepadButton button)
	return c_func(xSDL_GetGamepadButtonLabelForType,{gtype,button})
end function

public constant xSDL_GetGamepadButtonLabel = define_c_func(sdl,"+SDL_GetGamepadButtonLabel",{C_POINTER,C_INT},C_INT)

public function SDL_GetGamepadButtonLabel(atom gamepad,SDL_GamepadButton button)
	return c_func(xSDL_GetGamepadButtonLabel,{gamepad,button})
end function

public constant xSDL_GetNumGamepadTouchpads = define_c_func(sdl,"+SDL_GetNumGamepadTouchpads",{C_POINTER},C_INT)

public function SDL_GetNumGamepadTouchpads(atom gamepad)
	return c_func(xSDL_GetNumGamepadTouchpads,{gamepad})
end function

public constant xSDL_GetNumGamepadTouchpadFingers = define_c_func(sdl,"+SDL_GetNumGamepadTouchpadFingers",{C_POINTER,C_INT},C_INT)

public function SDL_GetNumGamepadTouchpadFingers(atom gamepad,atom touchpad)
	return c_func(xSDL_GetNumGamepadTouchpadFingers,{gamepad,touchpad})
end function

public constant xSDL_GetGamepadTouchpadFinger = define_c_func(sdl,"+SDL_GetGamepadTouchpadFinger",{C_POINTER,C_INT,C_INT,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetGamepadTouchpadFinger(atom gamepad,atom touchpad,atom finger,atom down,atom x,atom y,atom pressure)
	return c_func(xSDL_GetGamepadTouchpadFinger,{gamepad,touchpad,finger,down,x,y,pressure})
end function

public constant xSDL_GamepadHasSensor = define_c_func(sdl,"+SDL_GamepadHasSensor",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadHasSensor(atom gamepad,SDL_SensorType xtype)
	return c_func(xSDL_GamepadHasSensor,{gamepad,xtype})
end function

public constant xSDL_SetGamepadSensorEnabled = define_c_func(sdl,"+SDL_SetGamepadSensorEnabled",{C_POINTER,C_INT,C_BOOL},C_BOOL)

public function SDL_SetGamepadSensorEnabled(atom gamepad,SDL_SensorType xtype,atom enabled)
	return c_func(xSDL_SetGamepadSensorEnabled,{gamepad,xtype,enabled})
end function

public constant xSDL_GamepadSensorEnabled = define_c_func(sdl,"+SDL_GamepadSensorEnabled",{C_POINTER,C_INT},C_BOOL)

public function SDL_GamepadSensorEnabled(atom gamepad,SDL_SensorType stype)
	return c_func(xSDL_GamepadSensorEnabled,{gamepad,stype})
end function

public constant xSDL_GetGamepadSensorDataRate = define_c_func(sdl,"+SDL_GetGamepadSensorDataRate",{C_POINTER,C_INT},C_FLOAT)

public function SDL_GetGamepadSensorDataRate(atom gamepad,SDL_SensorType stype)
	return c_func(xSDL_GetGamepadSensorDataRate,{gamepad,stype})
end function

public constant xSDL_GetGamepadSensorData = define_c_func(sdl,"+SDL_GetGamepadSensorData",{C_POINTER,C_INT,C_POINTER,C_INT},C_BOOL)

public function SDL_GetGamepadSensorData(atom gamepad,SDL_SensorType stype,atom data,atom num)
	return c_func(xSDL_GetGamepadSensorData,{gamepad,stype,data,num})
end function

public constant xSDL_RumbleGamepad = define_c_func(sdl,"+SDL_RumbleGamepad",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_BOOL)

public function SDL_RumbleGamepad(atom gamepad,atom low,atom high,atom duration_ms)
	return c_func(xSDL_RumbleGamepad,{gamepad,low,high,duration_ms})
end function

public constant xSDL_RumbleGamepadTriggers = define_c_func(sdl,"+SDL_RumbleGamepadTriggers",{C_POINTER,C_UINT16,C_UINT16,C_UINT32},C_BOOL)

public function SDL_RumbleGamepadTriggers(atom gamepad,atom left,atom right,atom duration_ms)
	return c_func(xSDL_RumbleGamepadTriggers,{gamepad,left,right,duration_ms})
end function

public constant xSDL_SetGamepadLED = define_c_func(sdl,"+SDL_SetGamepadLED",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_BOOL)

public function SDL_SetGamepadLED(atom gamepad,atom r,atom g,atom b)
	return c_func(xSDL_SetGamepadLED,{gamepad,r,g,b})
end function

public constant xSDL_SendGamepadEffect = define_c_func(sdl,"+SDL_SendGamepadEffect",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_SendGamepadEffect(atom gamepad,atom data,atom size)
	return c_func(xSDL_SendGamepadEffect,{gamepad,data,size})
end function

public constant xSDL_CloseGamepad = define_c_proc(sdl,"+SDL_CloseGamepad",{C_POINTER})

public procedure SDL_CloseGamepad(atom gamepad)
	c_proc(xSDL_CloseGamepad,{gamepad})
end procedure

public constant xSDL_GetGamepadAppleSFSymbolsNameForButton = define_c_func(sdl,"+SDL_GetGamepadAppleSFSymbolsNameForButton",{C_POINTER,C_INT},C_STRING)

public function SDL_GetGamepadAppleSFSymbolsNameForButton(atom gamepad,SDL_GamepadButton button)
	return c_func(xSDL_GetGamepadAppleSFSymbolsNameForButton,{gamepad,button})
end function

public constant xSDL_GetGamepadAppleSFSymbolsNameForAxis = define_c_func(sdl,"+SDL_GetGamepadAppleSFSymbolsNameForAxis",{C_POINTER,C_INT},C_STRING)

public function SDL_GetGamepadAppleSFSymbolsNameForAxis(atom gamepad,SDL_GamepadAxis axis)
	return c_func(xSDL_GetGamepadAppleSFSymbolsNameForAxis,{gamepad,axis})
end function
­26.30