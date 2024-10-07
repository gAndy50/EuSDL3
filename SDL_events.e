include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_audio.e
include SDL_error.e
include SDL_gamepad.e
include SDL_joystick.e
include SDL_keyboard.e
include SDL_mouse.e
include SDL_touch.e
include SDL_video.e
include SDL_pen.e
include SDL_camera.e

--General keyboard/mouse state definitions
public constant SDL_RELEASED = 0
public constant SDL_PRESSED = 1

public enum type SDL_EventType
	SDL_EVENT_FIRST = 0, --unused (don't remove)
	SDL_EVENT_QUIT = 0x100, --user-requested quit
	SDL_EVENT_TERMINATING,
	SDL_EVENT_LOW_MEMORY,
	SDL_EVENT_WILL_ENTER_BACKGROUND,
	SDL_EVENT_DID_ENTER_BACKGROUND,
	SDL_EVENT_WILL_ENTER_FOREGROUND,
	SDL_EVENT_DID_ENTER_FOREGROUND,
	SDL_EVENT_LOCALE_CHANGED,
	SDL_EVENT_SYSTEM_THEME_CHANGED,
	
	SDL_EVENT_DISPLAY_ORIENTATION = 0x151,
	SDL_EVENT_DISPLAY_CONNECTED,
	SDL_EVENT_DISPLAY_DISCONNECTED,
	SDL_EVENT_DISPLAY_MOVED,
	SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED,
	SDL_EVENT_DISPLAY_FIRST = SDL_EVENT_DISPLAY_ORIENTATION,
	SDL_EVENT_DISPLAY_LAST = SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED,
	
	--SDL_EVENT_SYSWM = 0x201, --reserved for SDL2 compat
	SDL_EVENT_WINDOW_SHOWN = 0x202,
	SDL_EVENT_WINDOW_HIDDEN,
	SDL_EVENT_WINDOW_EXPOSED,
	SDL_EVENT_WINDOW_MOVED,
	SDL_EVENT_WINDOW_RESIZED,
	SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED,
	SDL_EVENT_WINDOW_MINIMIZED,
	SDL_EVENT_WINDOW_MAXIMIZED,
	SDL_EVENT_WINDOW_RESTORED,
	SDL_EVENT_WINDOW_MOUSE_ENTER,
	SDL_EVENT_WINDOW_MOUSE_LEAVE,
	SDL_EVENT_WINDOW_FOCUS_GAINED,
	SDL_EVENT_WINDOW_FOCUS_LOST,
	SDL_EVENT_WINDOW_CLOSE_REQUESTED,
	SDL_EVENT_WINDOW_TAKE_FOCUS,
	SDL_EVENT_WINDOW_HIT_TEST,
	SDL_EVENT_WINDOW_DISPLAY_CHANGED,
	SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED,
	SDL_EVENT_WINDOW_OCCLUDED,
	SDL_EVENT_WINDOW_ENTER_FULLSCREEN,
	SDL_EVENT_WINDOW_LEAVE_FULLSCREEN,
	SDL_EVENT_WINDOW_DESTROYED,
	
	SDL_EVENT_WINDOW_PEN_ENTER,
	SDL_EVENT_WINDOW_PEN_LEAVE,
	SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN,
	SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_PEN_LEAVE,
	
	--SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN,
	--SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_DESTROYED,
	
	SDL_EVENT_KEY_DOWN = 0x300,
	SDL_EVENT_KEY_UP,
	SDL_EVENT_TEXT_EDITING,
	SDL_EVENT_TEXT_INPUT,
	SDL_EVENT_KEYMAP_CHANGED,
	SDL_EVENT_KEYBOARD_ADDED,
	SDL_EVENT_KEYBOARD_REMOVED,
	--SDL_EVENT_TEXT_EDITING_EXT,
	
	SDL_EVENT_MOUSE_MOTION = 0x400,
	SDL_EVENT_MOUSE_BUTTON_DOWN,
	SDL_EVENT_MOUSE_BUTTON_UP,
	SDL_EVENT_MOUSE_WHEEL,
	SDL_EVENT_MOUSE_ADDED,
	SDL_EVENT_MOUSE_REMOVED,
	
	SDL_EVENT_JOYSTICK_AXIS_MOTION = 0x600,
	SDL_EVENT_JOYSTICK_BALL_MOTION,
	SDL_EVENT_JOYSTICK_HAT_MOTION,
	SDL_EVENT_JOYSTICK_BUTTON_DOWN,
	SDL_EVENT_JOYSTICK_BUTTON_UP,
	SDL_EVENT_JOYSTICK_ADDED,
	SDL_EVENT_JOYSTICK_REMOVED,
	SDL_EVENT_JOYSTICK_BATTERY_UPDATED,
	SDL_EVENT_JOYSTICK_UPDATE_COMPLETE,
	
	SDL_EVENT_GAMEPAD_AXIS_MOTION = 0x650,
	SDL_EVENT_GAMEPAD_BUTTON_DOWN,
	SDL_EVENT_GAMEPAD_BUTTON_UP,
	SDL_EVENT_GAMEPAD_ADDED,
	SDL_EVENT_GAMEPAD_REMOVED,
	SDL_EVENT_GAMEPAD_REMAPPED,
	SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,
	SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,
	SDL_EVENT_GAMEPAD_TOUCHPAD_UP,
	SDL_EVENT_GAMEPAD_SENSOR_UPDATE,
	SDL_EVENT_GAMEPAD_UPDATE_COMPLETE,
	SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED,
	
	SDL_EVENT_FINGER_DOWN = 0x700,
	SDL_EVENT_FINGER_UP,
	SDL_EVENT_FINGER_MOTION,
	
	SDL_EVENT_CLIPBOARD_UPDATE = 0x900,
	--SDL_EVENT_CLIPBOARD_CANCELLED,
	
	SDL_EVENT_DROP_FILE = 0x1000,
	SDL_EVENT_DROP_TEXT,
	SDL_EVENT_DROP_BEGIN,
	SDL_EVENT_DROP_COMPLETE,
	SDL_EVENT_DROP_POSITION,
	
	SDL_EVENT_AUDIO_DEVICE_ADDED = 0x1100,
	SDL_EVENT_AUDIO_DEVICE_REMOVED,
	
	SDL_EVENT_SENSOR_UPDATE = 0x1200,
	
	SDL_EVENT_PEN_DOWN = 0x1300,
	SDL_EVENT_PEN_UP,
	SDL_EVENT_PEN_MOTION,
	SDL_EVENT_PEN_BUTTON_DOWN,
	SDL_EVENT_PEN_BUTTON_UP,
	
	SDL_EVENT_CAMERA_DEVICE_ADDED = 0x1400,
	SDL_EVENT_CAMERA_DEVICE_REMOVED,
	SDL_EVENT_CAMERA_DEVICE_APPROVED,
	SDL_EVENT_CMAERA_DEVICE_DENIED,
	
	SDL_EVENT_RENDER_TARGETS_RESET = 0x2000,
	SDL_EVENT_RENDER_DEVICE_RESET,
	
	SDL_EVENT_POLL_SENTINEL = 0x7F00,
	
	SDL_EVENT_USER = 0x8000,
	
	SDL_EVENT_LAST = 0xFFFF,
	
	SDL_EVENT_ENUM_PADDING =  0x7FFFFFFF
end type

public constant SDL_CommonEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64 --timestamp
})

public constant SDL_DisplayEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --displayID
	C_INT32 --data1
})

public constant SDL_WindowEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	C_INT32, --data1
	C_INT32 --data2
})

public constant SDL_KeyboardEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	C_UINT8, --state
	C_UINT8, --repeat
	C_UINT8, --padding2
	C_UINT8, --padding3
	C_INT --keysym
})

public constant SDL_TEXTEDITINGEVENT_TEXT_SIZE = 64

public constant SDL_TextEditingEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	{C_CHAR,SDL_TEXTEDITINGEVENT_TEXT_SIZE}, --editing text
	C_INT32, --start
	C_INT32 --length
})

public constant SDL_TEXTINPUTEVENT_TEXT_SIZE = 64

public constant SDL_TextEditingExtEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --window
	C_POINTER, --text
	C_INT32, --start
	C_INT32 --length
})

--public constant SDL_TEXTINPUTEVENT_TEXT_SIZE = 64

public constant SDL_TextInputEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	{C_CHAR,SDL_TEXTINPUTEVENT_TEXT_SIZE} --text
})

public constant SDL_MouseMotionEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	C_INT, --which mouseID
	C_UINT32, --state
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --xrel
	C_FLOAT --yrel
})

public constant SDL_MouseButtonEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	C_INT, --which MouseID
	C_UINT8, --button
	C_UINT8, --state
	C_UINT8, --clicks
	C_UINT8, --padding
	C_FLOAT, --x
	C_FLOAT --y
})

public constant SDL_MouseWheelEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	C_INT, --which mouseID
	C_FLOAT, --x
	C_FLOAT, --y
	C_UINT32, --direction
	C_FLOAT, --mouseX
	C_FLOAT --mouseY
})

public constant SDL_JoyAxisEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --whhich joystickID
	C_UINT8, --axis
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8, --padding3
	C_INT16, --value
	C_UINT16 --padding4
})

public constant SDL_JoyHatEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which joystickID
	C_UINT8, --hat
	C_UINT8, --value
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_JoyBallEvent = define_c_struct({
	C_UINT32, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_POINTER, --which
	C_UINT8, --ball
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8, --padding3
	C_INT16, --xrel
	C_INT16  --yel
})

public constant SDL_JoyButtonEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which joystickID
	C_UINT8, --button
	C_UINT8, --state
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_JoyDeviceEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT --which joystickID
})

public constant SDL_JoyBatteryEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which joystickID
	C_INT --joystick power level
})

public constant SDL_GamepadAxisEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which joystickID
	C_UINT8, --axis
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8, --padding3
	C_INT16, --value
	C_UINT16 --padding4
})

public constant SDL_GamepadButtonEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which joystickID
	C_UINT8, --button
	C_UINT8, --state
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_GamepadDeviceEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT --which joystickID
})

public constant SDL_GamepadTouchpadEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which joystickID
	C_INT32, --touchpad
	C_INT32, --finger
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT --pressure
})

public constant SDL_GamepadSensorEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which joystickID
	C_INT32, --sensor
	{C_FLOAT,3}, --data[3]
	C_UINT64 --sensor_Timestamp
})

public constant SDL_AudioDeviceEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --which AudioDeviceID
	C_UINT8, --iscapture
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8 --padding3
})

public constant SDL_CameraDeviceEvent = define_c_struct({
	C_UINT32, --type
	C_INT32, --reserved
	C_UINT64, --timestamp
	C_POINTER, --which
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8  --padding3
})

public constant SDL_TouchFingerEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT32, --touchID
	C_INT32, --fingerID
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --dx
	C_FLOAT, --dy
	C_FLOAT, --pressure
	C_POINTER --windowID
})

public constant SDL_DROPEVENT_DATA_SIZE = 64

public constant SDL_PenTipEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_INT, --which SDL_PenID
	C_UINT8, --tip
	C_UINT8, --state
	C_UINT16, --pen_state
	C_FLOAT, --x
	C_FLOAT, --y
	{C_FLOAT,SDL_PEN_NUM_AXES}
})

public constant SDL_PenMotionEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_INT, --which
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT16, --pen_state
	C_FLOAT, --x
	C_FLOAT, --y
	{C_FLOAT,SDL_PEN_NUM_AXES}
})

public constant SDL_PenButtonEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_INT, --which
	C_UINT8, --button
	C_UINT8, --state
	C_UINT16, --pen_state
	C_FLOAT, --x
	C_FLOAT, --y
	{C_FLOAT,SDL_PEN_NUM_AXES}
})

public constant SDL_DropEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --file
	C_POINTER, --windowId
	C_FLOAT, --x
	C_FLOAT --y
})

public constant SDL_ClipboardEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER --userdata
})

public constant SDL_SensorEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_INT, --which SensorID
	{C_FLOAT,6}, --data[6]
	C_UINT64 --sensor_timestamp
})

public constant SDL_QuitEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64 --timestamp
})

public constant SDL_OSEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64 --timestamp
})

public constant SDL_UserEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER, --windowID
	C_INT32, --code
	C_POINTER, --data1
	C_POINTER --data2
})

public constant SDL_SysWMEvent = define_c_struct({
	C_UINT32, --type
	C_UINT64, --timestamp
	C_POINTER --msg
})

public constant SDL_Event = define_c_union({
	C_UINT32, --type
	
	SDL_CommonEvent,
	SDL_DisplayEvent,
	SDL_WindowEvent,
	SDL_KeyboardEvent,
	SDL_TextEditingEvent,
	SDL_TextEditingExtEvent,
	SDL_TextInputEvent,
	SDL_MouseMotionEvent,
	SDL_MouseButtonEvent,
	SDL_MouseWheelEvent,
	SDL_JoyAxisEvent,
	SDL_JoyBallEvent,
	SDL_JoyButtonEvent,
	SDL_JoyBatteryEvent,
	SDL_GamepadAxisEvent,
	SDL_GamepadButtonEvent,
	SDL_GamepadDeviceEvent,
	SDL_GamepadTouchpadEvent,
	SDL_GamepadSensorEvent,
	SDL_AudioDeviceEvent,
	SDL_CameraDeviceEvent,
	SDL_SensorEvent,
	SDL_QuitEvent,
	SDL_UserEvent,
	--SDL_SysWMEvent,
	SDL_TouchFingerEvent,
	SDL_PenTipEvent,
	SDL_PenMotionEvent,
	SDL_PenButtonEvent,
	SDL_DropEvent,
	SDL_ClipboardEvent,
	
	{C_UINT8,128} --padding
})

export constant xSDL_PumpEvents = define_c_proc(sdl,"+SDL_PumpEvents",{})

public procedure SDL_PumpEvents()
	c_proc(xSDL_PumpEvents,{})
end procedure

public enum type SDL_eventaction
	SDL_ADDEVENT = 0,
	SDL_PEEKEVENT,
	SDL_GETEVENT
end type

export constant xSDL_PeepEvents = define_c_func(sdl,"+SDL_PeepEvents",{C_POINTER,C_INT,C_INT,C_UINT32,C_UINT32},C_INT)

public function SDL_PeepEvents(atom events,atom num,SDL_eventaction action,atom min,atom max)
	return c_func(xSDL_PeepEvents,{events,num,action,min,max})
end function

export constant xSDL_HasEvent = define_c_func(sdl,"+SDL_HasEvent",{C_UINT32},C_BOOL)

public function SDL_HasEvent(atom _type)
	return c_func(xSDL_HasEvent,{_type})
end function

export constant xSDL_HasEvents = define_c_func(sdl,"+SDL_HasEvents",{C_UINT32,C_UINT32},C_BOOL)

public function SDL_HasEvents(atom min,atom max)
	return c_func(xSDL_HasEvents,{min,max})
end function

export constant xSDL_FlushEvent = define_c_proc(sdl,"+SDL_FlushEvent",{C_UINT32})

public procedure SDL_FlushEvent(atom _type)
	c_proc(xSDL_FlushEvent,{_type})
end procedure

export constant xSDL_FlushEvents = define_c_proc(sdl,"+SDL_FlushEvents",{C_UINT32,C_UINT32})

public procedure SDL_FlushEvents(atom min,atom max)
	c_proc(xSDL_FlushEvents,{min,max})
end procedure

export constant xSDL_PollEvent = define_c_func(sdl,"+SDL_PollEvent",{C_POINTER},C_INT)

public function SDL_PollEvent(atom evt)
	return c_func(xSDL_PollEvent,{evt})
end function

export constant xSDL_WaitEvent = define_c_func(sdl,"+SDL_WaitEvent",{C_POINTER},C_INT)

public function SDL_WaitEvent(atom evt)
	return c_func(xSDL_WaitEvent,{evt})
end function

export constant xSDL_WaitEventTimeout = define_c_func(sdl,"+SDL_WaitEventTimeout",{C_POINTER,C_INT32},C_INT)

public function SDL_WaitEventTimeout(atom evt,atom ms)
	return c_func(xSDL_WaitEventTimeout,{evt,ms})
end function

export constant xSDL_PushEvent = define_c_func(sdl,"+SDL_PushEvent",{C_POINTER},C_INT)

public function SDL_PushEvent(atom evt)
	return c_func(xSDL_PushEvent,{evt})
end function

export constant xSDL_SetEventFilter = define_c_proc(sdl,"+SDL_SetEventFilter",{C_POINTER,C_POINTER})

public procedure SDL_SetEventFilter(atom filter,atom ud)
	c_proc(xSDL_SetEventFilter,{filter,ud})
end procedure

export constant xSDL_GetEventFilter = define_c_func(sdl,"+SDL_GetEventFilter",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetEventFilter(atom filter,atom ud)
	return c_func(xSDL_GetEventFilter,{filter,ud})
end function

export constant xSDL_AddEventWatch = define_c_proc(sdl,"+SDL_AddEventWatch",{C_POINTER,C_POINTER})

public procedure SDL_AddEventWatch(atom filter,atom ud)
	c_proc(xSDL_AddEventWatch,{filter,ud})
end procedure

export constant xSDL_DelEventWatch = define_c_proc(sdl,"+SDL_DelEventWatch",{C_POINTER,C_POINTER})

public procedure SDL_DelEventWatch(atom filter,atom ud)
	c_proc(xSDL_DelEventWatch,{filter,ud})
end procedure

export constant xSDL_FilterEvents = define_c_proc(sdl,"+SDL_FilterEvents",{C_POINTER,C_POINTER})

public procedure SDL_FilterEvents(atom filter,atom ud)
	c_proc(xSDL_FilterEvents,{filter,ud})
end procedure

export constant xSDL_SetEventEnabled = define_c_proc(sdl,"+SDL_SetEventEnabled",{C_UINT32,C_BOOL})

public procedure SDL_SetEventEnabled(atom _type,atom en)
	c_proc(xSDL_SetEventEnabled,{_type,en})
end procedure

export constant xSDL_EventEnabled = define_c_func(sdl,"+SDL_EventEnabled",{C_UINT32},C_BOOL)

public function SDL_EventEnabled(atom _type)
	return c_func(xSDL_EventEnabled,{_type})
end function

export constant xSDL_RegisterEvents = define_c_func(sdl,"+SDL_RegisterEvents",{C_INT},C_UINT32)

public function SDL_RegisterEvents(atom num)
	return c_func(xSDL_RegisterEvents,{num})
end function

public constant xSDL_AllocateEventMemory = define_c_func(sdl,"+SDL_AllocateEventMemory",{C_SIZE_T},C_POINTER)

public function SDL_AllocateEventMemory(atom size)
	return c_func(xSDL_AllocateEventMemory,{size})
end function
­26.22