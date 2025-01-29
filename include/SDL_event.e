include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_audio.e
include SDL_camera.e
include SDL_error.e
include SDL_gamepad.e
include SDL_joystick.e
include SDL_keyboard.e
include SDL_keycode.e
include SDL_mouse.e
include SDL_pen.e
include SDL_power.e
include SDL_sensor.e
include SDL_scancode.e
include SDL_touch.e
include SDL_video.e

public enum type SDL_EventType
	SDL_EVENT_FIRST     = 0,     /**< Unused (do not remove) */

    /* Application events */
    SDL_EVENT_QUIT           = 0x100, /**< User-requested quit */

    /* These application events have special meaning on iOS and Android, see README-ios.md and README-android.md for details */
    SDL_EVENT_TERMINATING,      /**< The application is being terminated by the OS. This event must be handled in a callback set with SDL_AddEventWatch().
                                     Called on iOS in applicationWillTerminate()
                                     Called on Android in onDestroy()
                                */
    SDL_EVENT_LOW_MEMORY,       /**< The application is low on memory, free memory if possible. This event must be handled in a callback set with SDL_AddEventWatch().
                                     Called on iOS in applicationDidReceiveMemoryWarning()
                                     Called on Android in onTrimMemory()
                                */
    SDL_EVENT_WILL_ENTER_BACKGROUND, /**< The application is about to enter the background. This event must be handled in a callback set with SDL_AddEventWatch().
                                     Called on iOS in applicationWillResignActive()
                                     Called on Android in onPause()
                                */
    SDL_EVENT_DID_ENTER_BACKGROUND, /**< The application did enter the background and may not get CPU for some time. This event must be handled in a callback set with SDL_AddEventWatch().
                                     Called on iOS in applicationDidEnterBackground()
                                     Called on Android in onPause()
                                */
    SDL_EVENT_WILL_ENTER_FOREGROUND, /**< The application is about to enter the foreground. This event must be handled in a callback set with SDL_AddEventWatch().
                                     Called on iOS in applicationWillEnterForeground()
                                     Called on Android in onResume()
                                */
    SDL_EVENT_DID_ENTER_FOREGROUND, /**< The application is now interactive. This event must be handled in a callback set with SDL_AddEventWatch().
                                     Called on iOS in applicationDidBecomeActive()
                                     Called on Android in onResume()
                                */

    SDL_EVENT_LOCALE_CHANGED,  /**< The user's locale preferences have changed. */

    SDL_EVENT_SYSTEM_THEME_CHANGED, /**< The system theme changed */

    /* Display events */
    /* 0x150 was SDL_DISPLAYEVENT, reserve the number for sdl2-compat */
    SDL_EVENT_DISPLAY_ORIENTATION = 0x151,   /**< Display orientation has changed to data1 */
    SDL_EVENT_DISPLAY_ADDED,                 /**< Display has been added to the system */
    SDL_EVENT_DISPLAY_REMOVED,               /**< Display has been removed from the system */
    SDL_EVENT_DISPLAY_MOVED,                 /**< Display has changed position */
    SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED,  /**< Display has changed desktop mode */
    SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED,  /**< Display has changed current mode */
    SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED, /**< Display has changed content scale */
    SDL_EVENT_DISPLAY_FIRST = SDL_EVENT_DISPLAY_ORIENTATION,
    SDL_EVENT_DISPLAY_LAST = SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED,

    /* Window events */
    /* 0x200 was SDL_WINDOWEVENT, reserve the number for sdl2-compat */
    /* 0x201 was SDL_EVENT_SYSWM, reserve the number for sdl2-compat */
    SDL_EVENT_WINDOW_SHOWN = 0x202,     /**< Window has been shown */
    SDL_EVENT_WINDOW_HIDDEN,            /**< Window has been hidden */
    SDL_EVENT_WINDOW_EXPOSED,           /**< Window has been exposed and should be redrawn, and can be redrawn directly from event watchers for this event */
    SDL_EVENT_WINDOW_MOVED,             /**< Window has been moved to data1, data2 */
    SDL_EVENT_WINDOW_RESIZED,           /**< Window has been resized to data1xdata2 */
    SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED,/**< The pixel size of the window has changed to data1xdata2 */
    SDL_EVENT_WINDOW_METAL_VIEW_RESIZED,/**< The pixel size of a Metal view associated with the window has changed */
    SDL_EVENT_WINDOW_MINIMIZED,         /**< Window has been minimized */
    SDL_EVENT_WINDOW_MAXIMIZED,         /**< Window has been maximized */
    SDL_EVENT_WINDOW_RESTORED,          /**< Window has been restored to normal size and position */
    SDL_EVENT_WINDOW_MOUSE_ENTER,       /**< Window has gained mouse focus */
    SDL_EVENT_WINDOW_MOUSE_LEAVE,       /**< Window has lost mouse focus */
    SDL_EVENT_WINDOW_FOCUS_GAINED,      /**< Window has gained keyboard focus */
    SDL_EVENT_WINDOW_FOCUS_LOST,        /**< Window has lost keyboard focus */
    SDL_EVENT_WINDOW_CLOSE_REQUESTED,   /**< The window manager requests that the window be closed */
    SDL_EVENT_WINDOW_HIT_TEST,          /**< Window had a hit test that wasn't SDL_HITTEST_NORMAL */
    SDL_EVENT_WINDOW_ICCPROF_CHANGED,   /**< The ICC profile of the window's display has changed */
    SDL_EVENT_WINDOW_DISPLAY_CHANGED,   /**< Window has been moved to display data1 */
    SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED, /**< Window display scale has been changed */
    SDL_EVENT_WINDOW_SAFE_AREA_CHANGED, /**< The window safe area has been changed */
    SDL_EVENT_WINDOW_OCCLUDED,          /**< The window has been occluded */
    SDL_EVENT_WINDOW_ENTER_FULLSCREEN,  /**< The window has entered fullscreen mode */
    SDL_EVENT_WINDOW_LEAVE_FULLSCREEN,  /**< The window has left fullscreen mode */
    SDL_EVENT_WINDOW_DESTROYED,         /**< The window with the associated ID is being or has been destroyed. If this message is being handled
                                             in an event watcher, the window handle is still valid and can still be used to retrieve any properties
                                             associated with the window. Otherwise, the handle has already been destroyed and all resources
                                             associated with it are invalid */
    SDL_EVENT_WINDOW_HDR_STATE_CHANGED, /**< Window HDR properties have changed */
    SDL_EVENT_WINDOW_FIRST = SDL_EVENT_WINDOW_SHOWN,
    SDL_EVENT_WINDOW_LAST = SDL_EVENT_WINDOW_HDR_STATE_CHANGED,

    /* Keyboard events */
    SDL_EVENT_KEY_DOWN        = 0x300, /**< Key pressed */
    SDL_EVENT_KEY_UP,                  /**< Key released */
    SDL_EVENT_TEXT_EDITING,            /**< Keyboard text editing (composition) */
    SDL_EVENT_TEXT_INPUT,              /**< Keyboard text input */
    SDL_EVENT_KEYMAP_CHANGED,          /**< Keymap changed due to a system event such as an
                                            input language or keyboard layout change. */
    SDL_EVENT_KEYBOARD_ADDED,          /**< A new keyboard has been inserted into the system */
    SDL_EVENT_KEYBOARD_REMOVED,        /**< A keyboard has been removed */
    SDL_EVENT_TEXT_EDITING_CANDIDATES, /**< Keyboard text editing candidates */

    /* Mouse events */
    SDL_EVENT_MOUSE_MOTION    = 0x400, /**< Mouse moved */
    SDL_EVENT_MOUSE_BUTTON_DOWN,       /**< Mouse button pressed */
    SDL_EVENT_MOUSE_BUTTON_UP,         /**< Mouse button released */
    SDL_EVENT_MOUSE_WHEEL,             /**< Mouse wheel motion */
    SDL_EVENT_MOUSE_ADDED,             /**< A new mouse has been inserted into the system */
    SDL_EVENT_MOUSE_REMOVED,           /**< A mouse has been removed */

    /* Joystick events */
    SDL_EVENT_JOYSTICK_AXIS_MOTION  = 0x600, /**< Joystick axis motion */
    SDL_EVENT_JOYSTICK_BALL_MOTION,          /**< Joystick trackball motion */
    SDL_EVENT_JOYSTICK_HAT_MOTION,           /**< Joystick hat position change */
    SDL_EVENT_JOYSTICK_BUTTON_DOWN,          /**< Joystick button pressed */
    SDL_EVENT_JOYSTICK_BUTTON_UP,            /**< Joystick button released */
    SDL_EVENT_JOYSTICK_ADDED,                /**< A new joystick has been inserted into the system */
    SDL_EVENT_JOYSTICK_REMOVED,              /**< An opened joystick has been removed */
    SDL_EVENT_JOYSTICK_BATTERY_UPDATED,      /**< Joystick battery level change */
    SDL_EVENT_JOYSTICK_UPDATE_COMPLETE,      /**< Joystick update is complete */

    /* Gamepad events */
    SDL_EVENT_GAMEPAD_AXIS_MOTION  = 0x650, /**< Gamepad axis motion */
    SDL_EVENT_GAMEPAD_BUTTON_DOWN,          /**< Gamepad button pressed */
    SDL_EVENT_GAMEPAD_BUTTON_UP,            /**< Gamepad button released */
    SDL_EVENT_GAMEPAD_ADDED,                /**< A new gamepad has been inserted into the system */
    SDL_EVENT_GAMEPAD_REMOVED,              /**< A gamepad has been removed */
    SDL_EVENT_GAMEPAD_REMAPPED,             /**< The gamepad mapping was updated */
    SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN,        /**< Gamepad touchpad was touched */
    SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION,      /**< Gamepad touchpad finger was moved */
    SDL_EVENT_GAMEPAD_TOUCHPAD_UP,          /**< Gamepad touchpad finger was lifted */
    SDL_EVENT_GAMEPAD_SENSOR_UPDATE,        /**< Gamepad sensor was updated */
    SDL_EVENT_GAMEPAD_UPDATE_COMPLETE,      /**< Gamepad update is complete */
    SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED,  /**< Gamepad Steam handle has changed */

    /* Touch events */
    SDL_EVENT_FINGER_DOWN      = 0x700,
    SDL_EVENT_FINGER_UP,
    SDL_EVENT_FINGER_MOTION,
    SDL_EVENT_FINGER_CANCELED,

    /* 0x800, 0x801, and 0x802 were the Gesture events from SDL2. Do not reuse these values! sdl2-compat needs them! */

    /* Clipboard events */
    SDL_EVENT_CLIPBOARD_UPDATE = 0x900, /**< The clipboard or primary selection changed */

    /* Drag and drop events */
    SDL_EVENT_DROP_FILE        = 0x1000, /**< The system requests a file open */
    SDL_EVENT_DROP_TEXT,                 /**< text/plain drag-and-drop event */
    SDL_EVENT_DROP_BEGIN,                /**< A new set of drops is beginning (NULL filename) */
    SDL_EVENT_DROP_COMPLETE,             /**< Current set of drops is now complete (NULL filename) */
    SDL_EVENT_DROP_POSITION,             /**< Position while moving over the window */

    /* Audio hotplug events */
    SDL_EVENT_AUDIO_DEVICE_ADDED = 0x1100,  /**< A new audio device is available */
    SDL_EVENT_AUDIO_DEVICE_REMOVED,         /**< An audio device has been removed. */
    SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED,  /**< An audio device's format has been changed by the system. */

    /* Sensor events */
    SDL_EVENT_SENSOR_UPDATE = 0x1200,     /**< A sensor was updated */

    /* Pressure-sensitive pen events */
    SDL_EVENT_PEN_PROXIMITY_IN = 0x1300,  /**< Pressure-sensitive pen has become available */
    SDL_EVENT_PEN_PROXIMITY_OUT,          /**< Pressure-sensitive pen has become unavailable */
    SDL_EVENT_PEN_DOWN,                   /**< Pressure-sensitive pen touched drawing surface */
    SDL_EVENT_PEN_UP,                     /**< Pressure-sensitive pen stopped touching drawing surface */
    SDL_EVENT_PEN_BUTTON_DOWN,            /**< Pressure-sensitive pen button pressed */
    SDL_EVENT_PEN_BUTTON_UP,              /**< Pressure-sensitive pen button released */
    SDL_EVENT_PEN_MOTION,                 /**< Pressure-sensitive pen is moving on the tablet */
    SDL_EVENT_PEN_AXIS,                   /**< Pressure-sensitive pen angle/pressure/etc changed */

    /* Camera hotplug events */
    SDL_EVENT_CAMERA_DEVICE_ADDED = 0x1400,  /**< A new camera device is available */
    SDL_EVENT_CAMERA_DEVICE_REMOVED,         /**< A camera device has been removed. */
    SDL_EVENT_CAMERA_DEVICE_APPROVED,        /**< A camera device has been approved for use by the user. */
    SDL_EVENT_CAMERA_DEVICE_DENIED,          /**< A camera device has been denied for use by the user. */

    /* Render events */
    SDL_EVENT_RENDER_TARGETS_RESET = 0x2000, /**< The render targets have been reset and their contents need to be updated */
    SDL_EVENT_RENDER_DEVICE_RESET, /**< The device has been reset and all textures need to be recreated */
    SDL_EVENT_RENDER_DEVICE_LOST, /**< The device has been lost and can't be recovered. */

    /* Reserved events for private platforms */
    SDL_EVENT_PRIVATE0 = 0x4000,
    SDL_EVENT_PRIVATE1,
    SDL_EVENT_PRIVATE2,
    SDL_EVENT_PRIVATE3,

    /* Internal events */
    SDL_EVENT_POLL_SENTINEL = 0x7F00, /**< Signals the end of an event poll cycle */

    /** Events SDL_EVENT_USER through SDL_EVENT_LAST are for your use,
     *  and should be allocated with SDL_RegisterEvents()
     */
    SDL_EVENT_USER    = 0x8000,

    /**
     *  This last event is only for bounding internal arrays
     */
    SDL_EVENT_LAST    = 0xFFFF,

    /* This just makes sure the enum is the size of Uint32 */
    SDL_EVENT_ENUM_PADDING = 0x7FFFFFFF
end type

public constant SDL_CommonEvent = define_c_struct({
	C_UINT32, --type
	C_UINT32, --reserved
	C_UINT64 --timestamp
})

public constant SDL_DisplayEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --displayID
	C_INT32, --data1
	C_INT32  --data2
})

public constant SDL_WindowEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_INT32, --data1
	C_INT32  --data2
})

public constant SDL_KeyboardDeviceEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32 --which
})

public constant SDL_KeyboardEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_INT, --scancode
	C_INT, --key
	C_INT, --mod
	C_UINT16, --raw
	C_BOOL, --down
	C_BOOL  --repeat
})

public constant SDL_TextEditingEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_STRING, --text
	C_INT32, --start
	C_INT32 --length
})

public constant SDL_TextEditingCandidatesEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_STRING, --candidates
	C_INT32, --num_canidates
	C_INT32, --selected_candidate
	C_BOOL, --horizontal
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8  --padding3
})

public constant SDL_TextInputEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_STRING --text
})

public constant SDL_MouseDeviceEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32 --which
})

public constant SDL_MouseMotionEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_INT, --state
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --xrel
	C_FLOAT  --yrel
})

public constant SDL_MouseButtonEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reseved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_UINT8, --button
	C_BOOL, --down
	C_UINT8, --clicks
	C_UINT8, --padding
	C_FLOAT, --x
	C_FLOAT --y
})

public constant SDL_MouseWheelEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_FLOAT, --x
	C_FLOAT, --y
	C_INT, --direction
	C_FLOAT, --mouse_x
	C_FLOAT  --mouse_y
})

public constant SDL_JoyAxisEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_UINT8, --axis
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8, --padding3
	C_INT16, --value
	C_UINT16 --padding4
})

public constant SDL_JoyBallEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_UINT8, --ball
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8, --padding3
	C_INT16, --xrel
	C_INT16 --yrel
})

public constant SDL_JoyHatEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_UINT8, --hat
	C_UINT8, --value
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_JoyButtonEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_UINT8, --button
	C_BOOL, --down
	C_UINT8, --padding1
	C_UINT8  --padding2
})

public constant SDL_JoyDeviceEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32 --which
})

public constant SDL_JoyBatteryEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_INT, --state
	C_INT --percent
})

public constant SDL_GamepadAxisEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_UINT8, --axis
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8, --padding3
	C_INT16, --value
	C_UINT16 --padding4
})

public constant SDL_GamepadButtonEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_UINT8, --button
	C_BOOL, --down
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_GamepadDeviceEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32 --which
})

public constant SDL_GamepadTouchpadEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_INT32, --touchpad
	C_INT32, --finger
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT --pressure
})

public constant SDL_GamepadSensorEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_INT32, --sensor
	{C_FLOAT,3}, --data[3]
	C_UINT64 --sensor_timestamp
})

public constant SDL_AudioDeviceEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --which
	C_BOOL, --recording
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8 --padding3
})

public constant SDL_CameraDeviceEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32 --which
})

public constant SDL_RenderEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32 --windowID
})

public constant SDL_TouchFingerEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --touchID
	C_UINT32, --fingerID
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --dx
	C_FLOAT, --dy
	C_FLOAT, --pressure
	C_UINT32 --windowID
})

public constant SDL_PenProximityEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32 --which
})

public constant SDL_PenMotionEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_INT, --pen_state
	C_FLOAT, --x
	C_FLOAT  --y
})

public constant SDL_PenTouchEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_INT, --pen_state
	C_FLOAT, --x
	C_FLOAT, --y
	C_BOOL, --eraser
	C_BOOL  --down
})

public constant SDL_PenButtonEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_INT, --pen_state
	C_FLOAT, --x
	C_FLOAT, --y
	C_UINT8, --button
	C_BOOL --down
})

public constant SDL_PenAxisEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_UINT32, --which
	C_INT, --pen_state
	C_FLOAT, --x
	C_FLOAT, --y
	C_INT, --axis
	C_FLOAT --value
})

public constant SDL_DropEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_FLOAT, --x
	C_FLOAT, --y
	C_STRING, --source
	C_STRING --data
})

public constant SDL_ClipboardEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_BOOL, --owner
	C_INT32, --num_mime_types
	C_STRING --mime_types
})

public constant SDL_SensorEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --whichID
	{C_FLOAT,6}, --data[6]
	C_UINT64 --sensor_timestamp
})

public constant SDL_QuitEvent = define_c_struct({
	C_INT, --type
	C_UINT32, --reserved
	C_UINT64 --timestamp
})

public constant SDL_UserEvent = define_c_struct({
	C_UINT32, --type
	C_UINT32, --reserved
	C_UINT64, --timestamp
	C_UINT32, --windowID
	C_INT32, --code
	C_POINTER, --data1
	C_POINTER --data2
})

public constant SDL_Event = define_c_union({
	C_UINT32, --type
	SDL_CommonEvent, --common
	SDL_DisplayEvent, --display
	SDL_WindowEvent, --window
	SDL_KeyboardDeviceEvent, --kdevice
	SDL_KeyboardEvent, --key
	SDL_TextEditingEvent, --edit
	SDL_TextEditingCandidatesEvent, --edit_candidate
	SDL_TextInputEvent, --text
	SDL_MouseDeviceEvent, --mdevice
	SDL_MouseMotionEvent, --motion
	SDL_MouseButtonEvent, --button
	SDL_MouseWheelEvent, --wheel
	SDL_JoyDeviceEvent, --jdevice
	SDL_JoyAxisEvent, --jaxis
	SDL_JoyBallEvent, --jball
	SDL_JoyHatEvent, --jhat
	SDL_JoyButtonEvent, --jbutton
	SDL_JoyBatteryEvent, --jbattery
	SDL_GamepadDeviceEvent, --gdevice
	SDL_GamepadAxisEvent, --gaxis
	SDL_GamepadButtonEvent, --gubtton
	SDL_GamepadTouchpadEvent, --gtouchpad
	SDL_GamepadSensorEvent, --gsensor
	SDL_AudioDeviceEvent, --adevice
	SDL_CameraDeviceEvent, --cdevice
	SDL_SensorEvent, --snesor
	SDL_QuitEvent, --quit
	SDL_UserEvent, --user
	SDL_TouchFingerEvent, --tfinger
	SDL_PenProximityEvent, --pproximity
	SDL_PenTouchEvent, --ptouch
	SDL_PenMotionEvent, --pmotion
	SDL_PenButtonEvent, --pbutton
	SDL_PenAxisEvent, --paxis
	SDL_RenderEvent, --render
	SDL_DropEvent, --drop
	SDL_ClipboardEvent, --clipboard
	{C_UINT8,128} --padding[128]
})

public constant xSDL_PumpEvents = define_c_proc(sdl,"+SDL_PumpEvents",{})

public procedure SDL_PumpEvents()
	c_proc(xSDL_PumpEvents,{})
end procedure

public enum type SDL_EventAction
	SDL_ADDEVENT = 0,
	SDL_PEEKEVENT,
	SDL_GETEVENT
end type

public constant xSDL_PeepEvents = define_c_func(sdl,"+SDL_PeepEvents",{C_POINTER,C_INT,C_INT,C_UINT32,C_UINT32},C_INT)

public function SDL_PeepEvents(atom events,atom numevents,SDL_EventAction action,atom minType,atom maxType)
	return c_func(xSDL_PeepEvents,{events,numevents,action,minType,maxType})
end function

public constant xSDL_HasEvent = define_c_func(sdl,"+SDL_HasEvent",{C_UINT32},C_BOOL)

public function SDL_HasEvent(atom _type)
	return c_func(xSDL_HasEvent,{_type})
end function

public constant xSDL_HasEvents = define_c_func(sdl,"+SDL_HasEvents",{C_UINT32,C_UINT32},C_BOOL)

public function SDL_HasEvents(atom minType,atom maxType)
	return c_func(xSDL_HasEvents,{minType,maxType})
end function

public constant xSDL_FlushEvent = define_c_proc(sdl,"+SDL_FlushEvent",{C_UINT32})

public procedure SDL_FlushEvent(atom _type)
	c_proc(xSDL_FlushEvent,{_type})
end procedure

public constant xSDL_FlushEvents = define_c_proc(sdl,"+SDL_FlushEvents",{C_UINT32,C_UINT32})

public procedure SDL_FlushEvents(atom minType,atom maxType)
	c_proc(xSDL_FlushEvents,{minType,maxType})
end procedure

public constant xSDL_PollEvent = define_c_func(sdl,"+SDL_PollEvent",{C_POINTER},C_BOOL)

public function SDL_PollEvent(atom event)
	return c_func(xSDL_PollEvent,{event})
end function

public constant xSDL_WaitEvent = define_c_func(sdl,"+SDL_WaitEvent",{C_POINTER},C_BOOL)

public function SDL_WaitEvent(atom event)
	return c_func(xSDL_WaitEvent,{event})
end function

public constant xSDL_WaitEventTimeout = define_c_func(sdl,"+SDL_WaitEventTimeout",{C_POINTER,C_INT32},C_BOOL)

public function SDL_WaitEventTimeout(atom event,atom timeoutMS)
	return c_func(xSDL_WaitEventTimeout,{event,timeoutMS})
end function

public constant xSDL_PushEvent = define_c_func(sdl,"+SDL_PushEvent",{C_POINTER},C_BOOL)

public function SDL_PushEvent(atom event)
	return c_func(xSDL_PushEvent,{event})
end function

public constant xSDL_SetEventFilter = define_c_proc(sdl,"+SDL_SetEventFilter",{C_POINTER,C_POINTER})

public procedure SDL_SetEventFilter(object filter,atom userdata)
	c_proc(xSDL_SetEventFilter,{filter,userdata})
end procedure

public constant xSDL_GetEventFilter = define_c_func(sdl,"+SDL_GetEventFilter",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetEventFilter(object filter,atom userdata)
	return c_func(xSDL_GetEventFilter,{filter,userdata})
end function

public constant xSDL_AddEventWatch = define_c_func(sdl,"+SDL_AddEventWatch",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_AddEventWatch(object filter,atom userdata)
	return c_func(xSDL_AddEventWatch,{filter,userdata})
end function

public constant xSDL_RemoveEventWatch = define_c_proc(sdl,"+SDL_RemoveEventWatch",{C_POINTER,C_POINTER})

public procedure SDL_RemoveEventWatch(object filter,atom userdata)
	c_proc(xSDL_RemoveEventWatch,{filter,userdata})
end procedure

public constant xSDL_FilterEvents = define_c_proc(sdl,"+SDL_FilterEvents",{C_POINTER,C_POINTER})

public procedure SDL_FilterEvents(object filter,atom userdata)
	c_proc(xSDL_FilterEvents,{filter,userdata})
end procedure

public constant xSDL_SetEventEnabled = define_c_proc(sdl,"+SDL_SetEventEnabled",{C_UINT32,C_BOOL})

public procedure SDL_SetEventEnabled(atom _type,atom enabled)
	c_proc(xSDL_SetEventEnabled,{_type,enabled})
end procedure

public constant xSDL_EventEnabled = define_c_func(sdl,"+SDL_EventEnabled",{C_UINT32},C_BOOL)

public function SDL_EventEnabled(atom _type)
	return c_func(xSDL_EventEnabled,{_type})
end function

public constant xSDL_RegisterEvents = define_c_func(sdl,"+SDL_RegisterEvents",{C_INT},C_UINT32)

public function SDL_RegisterEvents(atom numevents)
	return c_func(xSDL_RegisterEvents,{numevents})
end function

public constant xSDL_GetWindowFromEvent = define_c_func(sdl,"+SDL_GetWindowFromEvent",{C_POINTER},C_POINTER)

public function SDL_GetWindowFromEvent(atom event)
	return c_func(xSDL_GetWindowFromEvent,{event})
end function
­294.52