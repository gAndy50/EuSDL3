include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_pixels.e
include SDL_rect.e
include SDL_surface.e

--SDL_DisplayID C_UINT32
--SDL_WindowID C_UINT32

public enum type SDL_SystemTheme
	SDL_SYSTEM_THEME_UNKNOWN = 0,
	SDL_SYSTEM_THEME_LIGHT,
	SDL_SYSTEM_THEME_DARK
end type

public constant SDL_DisplayMode = define_c_struct({
	C_UINT32, --displayID
	C_UINT32, --format
	C_INT, --w
	C_INT, --h
	C_FLOAT, --pixel_density
	C_FLOAT, --refresh_rate
	C_POINTER --driverdata
})

public enum type SDL_DisplayOrientation
	SDL_ORIENTATION_UNKNOWN = 0,
	SDL_ORIENTATION_LANDSCAPE,
	SDL_ORIENTATION_LANDSCAPE_FLIPPED,
	SDL_ORIENTATION_PORTRAIT,
	SDL_ORIENTATION_PORTRAIT_FLIPPED
end type

--typedef struct SDL_Window

public enum type SDL_WindowFlags
	SDL_WINDOW_FULLSCREEN = 0x00000001,
	SDL_WINDOW_OPENGL = 0x00000002,
	SDL_WINDOW_SHOWN = 0x00000004, --SDL2 Compat
	SDL_WINDOW_HIDDEN = 0x00000008,
	SDL_WINDOW_BORDERLESS = 0x00000010,
	SDL_WINDOW_RESIZABLE = 0x00000020,
	SDL_WINDOW_MINIMIZED = 0x00000040,
	SDL_WINDOW_MAXIMIZED = 0x00000080,
	SDL_WINDOW_MOUSE_GRABBED = 0x00000100,
	SDL_WINDOW_INPUT_FOCUS = 0x00000200,
	SDL_WINDOW_MOUSE_FOCUS = 0x00000400,
	SDL_WINDOW_FULLSCREEN_DESKTOP = 0x00001000, --SDL2 Compat
	SDL_WINDOW_FOREIGN = 0x00000800,
	SDL_WINDOW_HIGH_PIXEL_DENSITY = 0x00002000,
	SDL_WINDOW_MOUSE_CAPTURE = 0x00004000,
	SDL_WINDOW_ALWAYS_ON_TOP = 0x00008000,
	SDL_WINDOW_SKIP_TASKBAR = 0x00010000,
	SDL_WINDOW_UTILITY = 0x00020000,
	SDL_WINDOW_TOOLTIP = 0x00040000,
	SDL_WINDOW_POPUP_MENU = 0x00080000,
	SDL_WINDOW_KEYBOARD_GRABBED = 0x00100000,
	SDL_WINDOW_VULKAN = 0x10000000,
	SDL_WINDOW_METAL = 0x20000000,
	SDL_WINDOW_TRANSAPRENT = 0x40000000,
	SDL_WINDOW_NOTFOCUSABLE = 0x80000000
end type

public constant SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000
public constant SDL_WINDOWPOS_UNDEFINED_DISPLAY = SDL_WINDOWPOS_UNDEFINED_MASK
public constant SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_DISPLAY
public constant SDL_WINDOWPOS_ISUNDEFINED = or_all({0xFFFF0000,SDL_WINDOWPOS_UNDEFINED_MASK})

public constant SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000
public constant SDL_WINDOWPOS_CENTERED_DISPLAY = SDL_WINDOWPOS_CENTERED_MASK
public constant SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_DISPLAY
public constant SDL_WINDOWPOS_ISCENTERED = or_all({0xFFFF0000,SDL_WINDOWPOS_CENTERED_MASK})

public enum type SDL_FlashOperation
	SDL_FLASH_CANCEL = 0,
	SDL_FLASH_BRIEFLY,
	SDL_FLASH_UNTIL_FOCUSED
end type

--typedef void SDL_GLContext

--Opaque EGL types
--SDL_EGLDisplay C_POINTER
--SDL_EGLConfig C_POINTER
--SDL_EGL_Surface C_POINTER
--SDL_EGLAttrib C_POINTER
--SDL_EGLint C_INT

public enum type SDL_GLattr
	SDL_GL_RED_SIZE = 0,
	SDL_GL_GREEN_SIZE,
	SDL_GL_BLUE_SIZE,
	SDL_GL_ALPHA_SIZE,
	SDL_GL_BUFFER_SIZE,
	SDL_GL_DOUBLEBUFFER,
	SDL_GL_DEPTH_SIZE,
	SDL_GL_STENCIL_SIZE,
	SDL_GL_ACCUM_RED_SIZE,
	SDL_GL_ACCUM_GREEN_SIZE,
	SDL_GL_ACCUM_BLUE_SIZE,
	SDL_GL_ACCUM_ALPHA_SIZE,
	SDL_GL_STEREO,
	SDL_GL_MULTISAMPLEBUFFERS,
	SDL_GL_MULTISAMPLESAMPLES,
	SDL_GL_ACCELERATED_VISUAL,
	SDL_GL_RETAINED_BACKING,
	SDL_GL_CONTEXT_MAJOR_VERSION,
	SDL_GL_CONTEXT_MINOR_VERSION,
	SDL_GL_CONTEXT_FLAGS,
	SDL_GL_CONTEXT_PROFILE_MASK,
	SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
	SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR,
	SDL_GL_CONTEXT_RESET_NOTIFICATION,
	SDL_GL_CONTEXT_NO_ERROR,
	SDL_GL_FLOATBUFFERS,
	SDL_GL_EGL_PLATFORM
end type

public enum type SDL_GLprofile
	SDL_GL_CONTEXT_PROFILE_CORE = 0x0001,
	SDL_GL_CONTEXT_PROFILE_COMPATBILITY = 0x0002,
	SDL_GL_CONTEXT_PROFILE_ES = 0x0004
end type

public enum type SDL_GlcontextFlag
	SDL_GL_CONTEXT_DEBUG_FLAG = 0x0001,
	SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002,
	SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = 0x0004,
	SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = 0x0008
end type

public enum type SDL_GLcontextReleaseFlag
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0x0000,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001
end type

public enum type SDL_GLContextResetNotification
	SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = 0x0000,
	SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = 0x0001
end type

export constant xSDL_GetNumVideoDrivers = define_c_func(sdl,"+SDL_GetNumVideoDrivers",{},C_INT)

public function SDL_GetNumVideoDrivers()
	return c_func(xSDL_GetNumVideoDrivers,{})
end function

export constant xSDL_GetVideoDriver = define_c_func(sdl,"+SDL_GetVideoDriver",{C_INT},C_STRING)

public function SDL_GetVideoDriver(atom index)
	return c_func(xSDL_GetVideoDriver,{index})
end function

export constant xSDL_GetCurrentVideoDriver = define_c_func(sdl,"+SDL_GetCurrentVideoDriver",{},C_STRING)

public function SDL_GetCurrentVideoDriver()
	return c_func(xSDL_GetCurrentVideoDriver,{})
end function

export constant xSDL_GetSystemTheme = define_c_func(sdl,"+SDL_GetSystemTheme",{},C_INT)

public function SDL_GetSystemTheme()
	return c_func(xSDL_GetSystemTheme,{})
end function

export constant xSDL_GetDisplays = define_c_func(sdl,"+SDL_GetDisplays",{C_POINTER},C_POINTER)

public function SDL_GetDisplays(atom count)
	return c_func(xSDL_GetDisplays,{count})
end function

export constant xSDL_GetPrimaryDisplay = define_c_func(sdl,"+SDL_GetPrimaryDisplay",{},C_UINT32)

public function SDL_GetPrimaryDisplay()
	return c_func(xSDL_GetPrimaryDisplay,{})
end function

export constant xSDL_GetDisplayName = define_c_func(sdl,"+SDL_GetDisplayName",{C_UINT32},C_STRING)

public function SDL_GetDisplayName(atom id)
	return c_func(xSDL_GetDisplayName,{id})
end function

export constant xSDL_GetDisplayBounds = define_c_func(sdl,"+SDL_GetDisplayBounds",{C_UINT32,C_POINTER},C_INT)

public function SDL_GetDisplayBounds(atom id,atom rect)
	return c_func(xSDL_GetDisplayBounds,{id,rect})
end function

export constant xSDL_GetDisplayUsableBounds = define_c_func(sdl,"+SDL_GetDisplayUsableBounds",{C_UINT32,C_POINTER},C_INT)

public function SDL_GetDisplayUsableBounds(atom id,atom rect)
	return c_func(xSDL_GetDisplayUsableBounds,{id,rect})
end function

export constant xSDL_GetDisplayOrientation = define_c_func(sdl,"+SDL_GetDisplayOrientation",{C_UINT32},C_INT)

public function SDL_GetDisplayOrientation(atom id)
	return c_func(xSDL_GetDisplayOrientation,{id})
end function

export constant xSDL_GetDisplayContentScale = define_c_func(sdl,"+SDL_GetDisplayContentScale",{C_UINT32},C_FLOAT)

public function SDL_GetDisplayContentScale(atom id)
	return c_func(xSDL_GetDisplayContentScale,{id})
end function

export constant xSDL_GetFullscreenDisplayModes = define_c_func(sdl,"+SDL_GetFullscreenDisplayModes",{C_UINT32,C_POINTER},C_POINTER)

public function SDL_GetFullscreenDisplayModes(atom id,atom count)
	return c_func(xSDL_GetFullscreenDisplayModes,{id,count})
end function

export constant xSDL_GetClosestFullscreenDisplayMode = define_c_func(sdl,"+SDL_GetClosestFullscreenDisplayMode",{C_UINT32,C_INT,C_INT,C_FLOAT,C_BOOL},C_POINTER)

public function SDL_GetClosestFullscreenDisplayMode(atom id,atom w,atom h,atom refresh_rate,atom high_density)
	return c_func(xSDL_GetClosestFullscreenDisplayMode,{id,w,h,refresh_rate,high_density})
end function

export constant xSDL_GetDesktopDisplayMode = define_c_func(sdl,"+SDL_GetDesktopDisplayMode",{C_UINT32},C_POINTER)

public function SDL_GetDesktopDisplayMode(atom id)
	return c_func(xSDL_GetDesktopDisplayMode,{id})
end function

export constant xSDL_GetCurrentDisplayMode = define_c_func(sdl,"+SDL_GetCurrentDisplayMode",{C_UINT32},C_POINTER)

public function SDL_GetCurrentDisplayMode(atom id)
	return c_func(xSDL_GetCurrentDisplayMode,{id})
end function

export constant xSDL_GetDisplayForPoint = define_c_func(sdl,"+SDL_GetDisplayPoint",{C_POINTER},C_UINT32)

public function SDL_GetDisplayForPoint(atom point)
	return c_func(xSDL_GetDisplayForPoint,{point})
end function

export constant xSDL_GetDisplayForRect = define_c_func(sdl,"+SDL_GetDisplayForRect",{C_POINTER},C_UINT32)

public function SDL_GetDisplayForRect(atom rect)
	return c_func(xSDL_GetDisplayForRect,{rect})
end function

export constant xSDL_GetDisplayForWindow = define_c_func(sdl,"+SDL_GetDisplayForWindow",{C_POINTER},C_UINT32)

public function SDL_GetDisplayForWindow(atom window)
	return c_func(xSDL_GetDisplayForWindow,{window})
end function

export constant xSDL_GetWindowPixelDensity = define_c_func(sdl,"+SDL_GetWindowPixelDensity",{C_POINTER},C_FLOAT)

public function SDL_GetWindowPixelDensity(atom window)
	return c_func(xSDL_GetWindowPixelDensity,{window})
end function

export constant xSDL_GetWindowDisplayScale = define_c_func(sdl,"+SDL_GetWindowDisplayScale",{C_POINTER},C_FLOAT)

public function SDL_GetWindowDisplayScale(atom window)
	return c_func(xSDL_GetWindowDisplayScale,{window})
end function

export constant xSDL_SetWindowFullscreenMode = define_c_func(sdl,"+SDL_SetWindowFullscreenMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowFullscreenMode(atom window,atom mode)
	return c_func(xSDL_SetWindowFullscreenMode,{window,mode})
end function

export constant xSDL_GetWindowFullscreenMode = define_c_func(sdl,"+SDL_GetWindowFullscreenMode",{C_POINTER},C_POINTER)

public function SDL_GetWindowFullscreenMode(atom window)
	return c_func(xSDL_GetWindowFullscreenMode,{window})
end function

export constant xSDL_GetWindowICCProfile = define_c_func(sdl,"+SDL_GetWindowICCProfile",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetWindowICCProfile(atom window,atom size)
	return c_func(xSDL_GetWindowICCProfile,{window,size})
end function

export constant xSDL_GetWindowPixelFormat = define_c_func(sdl,"+SDL_GetWindowPixelFormat",{C_POINTER},C_UINT32)

public function SDL_GetWindowPixelFormat(atom window)
	return c_func(xSDL_GetWindowPixelFormat,{window})
end function

export constant xSDL_CreateWindow = define_c_func(sdl,"+SDL_CreateWindow",{C_STRING,C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreateWindow(sequence title,atom w,atom h,atom flags)
	return c_func(xSDL_CreateWindow,{title,w,h,flags})
end function

export constant xSDL_CreateWindowWithPosition = define_c_func(sdl,"+SDL_CreateWindowWithPosition",{C_STRING,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreateWindowWithPosition(sequence title,atom x,atom y,atom w,atom h,atom flags)
	return c_func(xSDL_CreateWindowWithPosition,{title,x,y,w,h,flags})
end function

export constant xSDL_CreatePopupWindow = define_c_func(sdl,"+SDL_CreatePopupWindow",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreatePopupWindow(atom parent,atom x,atom y,atom w,atom h,atom flags)
	return c_func(xSDL_CreatePopupWindow,{parent,x,y,w,h,flags})
end function

export constant xSDL_CreateWindowFrom = define_c_func(sdl,"+SDL_CreateWindowFrom",{C_POINTER},C_POINTER)

public function SDL_CreateWindowFrom(object data)
	return c_func(xSDL_CreateWindowFrom,{data})
end function

export constant xSDL_GetWindowID = define_c_func(sdl,"+SDL_GetWindowID",{C_POINTER},C_UINT32)

public function SDL_GetWindowID(atom window)
	return c_func(xSDL_GetWindowID,{window})
end function

export constant xSDL_GetWindowFromID = define_c_func(sdl,"+SDL_GetWindowFromID",{C_UINT32},C_POINTER)

public function SDL_GetWindowFromID(atom id)
	return c_func(xSDL_GetWindowFromID,{id})
end function

export constant xSDL_GetWindowParent = define_c_func(sdl,"+SDL_GetWindowParent",{C_POINTER},C_POINTER)

public function SDL_GetWindowParent(atom window)
	return c_func(xSDL_GetWindowParent,{window})
end function

export constant xSDL_GetWindowFlags = define_c_func(sdl,"+SDL_GetWindowFlags",{C_POINTER},C_UINT32)

public function SDL_GetWindowFlags(atom window)
	return c_func(xSDL_GetWindowFlags,{window})
end function

export constant xSDL_SetWindowTitle = define_c_func(sdl,"+SDL_SetWindowTitle",{C_POINTER,C_STRING},C_INT)

public function SDL_SetWindowTitle(atom window,sequence title)
	return c_func(xSDL_SetWindowTitle,{window,title})
end function

export constant xSDL_GetWindowTitle = define_c_func(sdl,"+SDL_GetWindowTitle",{C_POINTER},C_STRING)

public function SDL_GetWindowTitle(atom window)
	return c_func(xSDL_GetWindowTitle,{window})
end function

export constant xSDL_SetWindowIcon = define_c_func(sdl,"+SDL_SetWindowIcon",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowIcon(atom window,atom icon)
	return c_func(xSDL_SetWindowIcon,{window,icon})
end function

export constant xSDL_SetWindowData = define_c_func(sdl,"+SDL_SetWindowData",{C_POINTER,C_STRING,C_POINTER},C_POINTER)

public function SDL_SetWindowData(atom window,sequence name,object userdata)
	return c_func(xSDL_SetWindowData,{window,name,userdata})
end function

export constant xSDL_GetWindowData = define_c_func(sdl,"+SDL_GetWindowData",{C_POINTER,C_STRING},C_POINTER)

public function SDL_GetWindowData(atom window,sequence name)
	return c_func(xSDL_GetWindowData,{window,name})
end function

export constant xSDL_SetWindowPosition = define_c_func(sdl,"+SDL_SetWindowPosition",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_SetWindowPosition(atom window,atom x,atom y)
	return c_func(xSDL_SetWindowPosition,{window,x,y})
end function

export constant xSDL_GetWindowPosition = define_c_func(sdl,"+SDL_GetWindowPosition",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowPosition(atom window,atom x,atom y)
	return c_func(xSDL_GetWindowPosition,{window,x,y})
end function

export constant xSDL_SetWindowSize = define_c_func(sdl,"+SDL_SetWindowSize",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_SetWindowSize(atom window,atom w,atom h)
	return c_func(xSDL_SetWindowSize,{window,w,h})
end function

export constant xSDL_GetWindowSize = define_c_func(sdl,"+SDL_GetWindowSize",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowSize(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowSize,{window,w,h})
end function

export constant xSDL_GetWindowBordersSize = define_c_func(sdl,"+SDL_GetWindowBordersSize",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowBordersSize(atom window,atom top,atom left,atom bottom,atom right)
	return c_func(xSDL_GetWindowBordersSize,{window,top,left,bottom,right})
end function

export constant xSDL_GetWindowSizeInPixels = define_c_func(sdl,"+SDL_GetWindowSizeInPixels",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowSizeInPixels(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowSizeInPixels,{window,w,h})
end function

export constant xSDL_SetWindowMinimumSize = define_c_func(sdl,"+SDL_SetWindowMinimumSize",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_SetWindowMinimumSize(atom window,atom w,atom h)
	return c_func(xSDL_SetWindowMinimumSize,{window,w,h})
end function

export constant xSDL_GetWindowMinimumSize = define_c_func(sdl,"+SDL_GetWindowMinimumSize",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowMinimumSize(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowMinimumSize,{window,w,h})
end function

export constant xSDL_SetWindowMaximumSize = define_c_func(sdl,"+SDL_SetWindowMaximumSize",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_SetWindowMaximumSize(atom window,atom w,atom h)
	return c_func(xSDL_SetWindowMaximumSize,{window,w,h})
end function

export constant xSDL_GetWindowMaximumSize = define_c_func(sdl,"+SDL_GetWindowMaximumSize",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowMaximumSize(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowMaximumSize,{window,w,h})
end function

export constant xSDL_SetWindowBordered = define_c_func(sdl,"+SDL_SetWindowBodered",{C_POINTER,C_BOOL},C_INT)

public function SDL_SetWindowBordered(atom window,atom border)
	return c_func(xSDL_SetWindowBordered,{window,border})
end function

export constant xSDL_SetWindowResizable = define_c_func(sdl,"+SDL_SetWindowResizable",{C_POINTER,C_BOOL},C_INT)

public function SDL_SetWindowResizable(atom window,atom resize)
	return c_func(xSDL_SetWindowResizable,{window,resize})
end function

export constant xSDL_SetWindowAlwaysOnTop = define_c_func(sdl,"+SDL_SetWindowAlwaysOnTop",{C_POINTER,C_BOOL},C_INT)

public function SDL_SetWindowAwlaysOnTop(atom window,atom on_top)
	return c_func(xSDL_SetWindowAlwaysOnTop,{window,on_top})
end function

export constant xSDL_ShowWindow = define_c_func(sdl,"+SDL_ShowWindow",{C_POINTER},C_INT)

public function SDL_ShowWindow(atom window)
	return c_func(xSDL_ShowWindow,{window})
end function

export constant xSDL_HideWindow = define_c_func(sdl,"+SDL_HideWindow",{C_POINTER},C_INT)

public function SDL_HideWindow(atom window)
	return c_func(xSDL_HideWindow,{window})
end function

export constant xSDL_RaiseWindow = define_c_func(sdl,"+SDL_RaiseWindow",{C_POINTER},C_INT)

public function SDL_RaiseWindow(atom window)
	return c_func(xSDL_RaiseWindow,{window})
end function

export constant xSDL_MaximizeWindow = define_c_func(sdl,"+SDL_MaximizeWindow",{C_POINTER},C_INT)

public function SDL_MaximizeWindow(atom window)
	return c_func(xSDL_MaximizeWindow,{window})
end function

export constant xSDL_MinimizeWindow = define_c_func(sdl,"+SDL_MinimizeWindow",{C_POINTER},C_INT)

public function SDL_MinimizeWindow(atom window)
	return c_func(xSDL_MinimizeWindow,{window})
end function

export constant xSDL_RestoreWindow = define_c_func(sdl,"+SDL_RestoreWindow",{C_POINTER},C_INT)

public function SDL_RestoreWindow(atom window)
	return c_func(xSDL_RestoreWindow,{window})
end function

export constant xSDL_SetWindowFullscreen = define_c_func(sdl,"+SDL_SetWindowFullscreen",{C_POINTER,C_BOOL},C_INT)

public function SDL_SetWindowFullscreen(atom window,atom fullscrn)
	return c_func(xSDL_SetWindowFullscreen,{window,fullscrn})
end function

export constant xSDL_GetWindowSurface = define_c_func(sdl,"+SDL_GetWindowSurface",{C_POINTER},C_POINTER)

public function SDL_GetWindowSurface(atom window)
	return c_func(xSDL_GetWindowSurface,{window})
end function

export constant xSDL_UpdateWindowSurface = define_c_func(sdl,"+SDL_UpdateWindowSurface",{C_POINTER},C_INT)

public function SDL_UpdateWindowSurface(atom window)
	return c_func(xSDL_UpdateWindowSurface,{window})
end function

export constant xSDL_UpdateWindowSurfaceRects = define_c_func(sdl,"+SDL_UpdateWindowSurfaceRects",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_UpdateWindowSurfaceRects(atom window,atom rects,atom num)
	return c_func(xSDL_UpdateWindowSurfaceRects,{window,rects,num})
end function

export constant xSDL_SetWindowGrab = define_c_func(sdl,"+SDL_SetWindowGrab",{C_POINTER,C_BOOL},C_INT)

public function SDL_SetWindowGrab(atom window,atom grab)
	return c_func(xSDL_SetWindowGrab,{window,grab})
end function

export constant xSDL_SetWindowKeyboardGrab = define_c_func(sdl,"+SDL_SetWindowKeyboardGrab",{C_POINTER,C_BOOL},C_INT)

public function SDL_SetWindowKeyboardGrab(atom window,atom grab)
	return c_func(xSDL_SetWindowKeyboardGrab,{window,grab})
end function

export constant xSDL_SetWindowMouseGrab = define_c_func(sdl,"+SDL_SetWindowMouseGrab",{C_POINTER,C_BOOL},C_INT)

public function SDL_SetWindowMouseGrab(atom window,atom grab)
	return c_func(xSDL_SetWindowMouseGrab,{window,grab})
end function

export constant xSDL_GetWindowGrab = define_c_func(sdl,"+SDL_GetWindowGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowGrab(atom window)
	return c_func(xSDL_GetWindowGrab,{window})
end function

export constant xSDL_GetWindowKeyboardGrab = define_c_func(sdl,"+SDL_GetWindowKeyboardGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowKeyboardGrab(atom window)
	return c_func(xSDL_GetWindowKeyboardGrab,{window})
end function

export constant xSDL_GetWindowMouseGrab = define_c_func(sdl,"+SDL_GetWindowMouseGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowMouseGrab(atom window)
	return c_func(xSDL_GetWindowMouseGrab,{window})
end function

export constant xSDL_GetGrabbedWindow = define_c_func(sdl,"+SDL_GetGrabbedWindow",{},C_POINTER)

public function SDL_GetGrabbedWindow()
	return c_func(xSDL_GetGrabbedWindow,{})
end function

export constant xSDL_SetWindowMouseRect = define_c_func(sdl,"+SDL_SetWindowMouseRect",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowMouseRect(atom window,atom rect)
	return c_func(xSDL_SetWindowMouseRect,{window,rect})
end function

export constant xSDL_GetWindowMouseRect = define_c_func(sdl,"+SDL_GetWindowMouseRect",{C_POINTER},C_POINTER)

public function SDL_GetWindowMouseRect(atom window)
	return c_func(xSDL_GetWindowMouseRect,{window})
end function

export constant xSDL_SetWindowOpacity = define_c_func(sdl,"+SDL_SetWindowOpacity",{C_POINTER,C_FLOAT},C_INT)

public function SDL_SetWindowOpacity(atom window,atom opacity)
	return c_func(xSDL_SetWindowOpacity,{window,opacity})
end function

export constant xSDL_GetWindowOpacity = define_c_func(sdl,"+SDL_GetWindowOpacity",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowOpacity(atom window,atom opacity)
	return c_func(xSDL_GetWindowOpacity,{window,opacity})
end function

export constant xSDL_SetWindowModalFor = define_c_func(sdl,"+SDL_SetWindowModalFor",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowModalFor(atom window,atom parent)
	return c_func(xSDL_SetWindowModalFor,{window,parent})
end function

export constant xSDL_SetWindowInputFocus = define_c_func(sdl,"+SDL_SetWindowInputFocus",{C_POINTER},C_INT)

public function SDL_SetWindowInputFocus(atom window)
	return c_func(xSDL_SetWindowInputFocus,{window})
end function

public enum type SDL_HitTestResult
	SDL_HITTEST_NORMAL = 0,
	SDL_HITTEST_DRAGGABLE,
	SDL_HITTEST_RESIZE_TOPLEFT,
	SDL_HITTEST_RESIZE_TOP,
	SDL_HITTEST_RESIZE_TOPRIGHT,
	SDL_HITTEST_RESIZE_RIGHT,
	SDL_HITTEST_RESIZE_BOTTOMRIGHT,
	SDL_HITTEST_RESIZE_BOTTOM,
	SDL_HITTEST_RESIZE_BOTTOMLEFT,
	SDL_HITTEST_RESIZE_LEFT
end type

export constant xSDL_SetWindowHitTest = define_c_func(sdl,"+SDL_SetWindowHitTest",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowHitTest(atom window,atom cb,atom cb_data)
	return c_func(xSDL_SetWindowHitTest,{window,cb,cb_data})
end function

export constant xSDL_FlashWindow = define_c_func(sdl,"+SDL_FlashWindow",{C_POINTER,C_INT},C_INT)

public function SDL_FlashWindow(atom window,SDL_FlashOperation op)
	return c_func(xSDL_FlashWindow,{window,op})
end function

export constant xSDL_DestroyWindow = define_c_proc(sdl,"+SDL_DestroyWindow",{C_POINTER})

public procedure SDL_DestroyWindow(atom window)
	c_proc(xSDL_DestroyWindow,{window})
end procedure

export constant xSDL_ScreenSaverEnabled = define_c_func(sdl,"+SDL_ScreenSaverEnabled",{},C_BOOL)

public function SDL_ScreenSaverEnabled()
	return c_func(xSDL_ScreenSaverEnabled,{})
end function

export constant xSDL_EnableScreenSaver = define_c_func(sdl,"+SDL_EnableScreenSaver",{},C_INT)

public function SDL_EnableScreenSaver()
	return c_func(xSDL_EnableScreenSaver,{})
end function

export constant xSDL_DisableScreenSaver = define_c_func(sdl,"+SDL_DisableScreenSaver",{},C_INT)

public function SDL_DisableScreenSaver()
	return c_func(xSDL_DisableScreenSaver,{})
end function

export constant xSDL_GL_LoadLibrary = define_c_func(sdl,"+SDL_GL_LoadLibrary",{C_STRING},C_INT)

public function SDL_GL_LoadLibrary(sequence path)
	return c_func(xSDL_GL_LoadLibrary,{path})
end function

export constant xSDL_GL_GetProcAddress = define_c_func(sdl,"+SDL_GL_GetProcAddress",{C_STRING},C_POINTER)

public function SDL_GL_GetProcAddress(sequence proc)
	return c_func(xSDL_GL_GetProcAddress,{proc})
end function

export constant xSDL_EGL_GetProcAddress = define_c_func(sdl,"+SDL_GL_GetProcAddress",{C_STRING},C_POINTER)

public function SDL_EGL_GetProcAddress(sequence proc)
	return c_func(xSDL_EGL_GetProcAddress,{proc})
end function

export constant xSDL_GL_UnloadLibrary = define_c_proc(sdl,"+SDL_GL_UnloadLibrary",{})

public procedure SDL_GL_UnloadLibrary()
	c_proc(xSDL_GL_UnloadLibrary,{})
end procedure

export constant xSDL_GL_ExtensionSupported = define_c_func(sdl,"+SDL_GL_ExtensionSupported",{C_STRING},C_BOOL)

public function SDL_GL_ExtensionSupported(sequence ext)
	return c_func(xSDL_GL_ExtensionSupported,{ext})
end function

export constant xSDL_GL_ResetAttributes = define_c_proc(sdl,"+SDL_GL_ResetAttributes",{})

public procedure SDL_GL_ResetAttributes()
	c_proc(xSDL_GL_ResetAttributes,{})
end procedure

export constant xSDL_GL_SetAttribute = define_c_func(sdl,"+SDL_GL_SetAttribute",{C_INT,C_INT},C_INT)

public function SDL_GL_SetAttribute(SDL_GLattr attr,atom val)
	return c_func(xSDL_GL_SetAttribute,{attr,val})
end function

export constant xSDL_GL_GetAttribute = define_c_func(sdl,"+SDL_GL_GetAttribute",{C_INT,C_POINTER},C_INT)

public function SDL_GL_GetAttribute(SDL_GLattr attr,atom val)
	return c_func(xSDL_GL_GetAttribute,{attr,val})
end function

export constant xSDL_GL_CreateContext = define_c_func(sdl,"+SDL_GL_CreateContext",{C_POINTER},C_POINTER)

public function SDL_GL_CreateContext(atom window)
	return c_func(xSDL_GL_CreateContext,{window})
end function

export constant xSDL_GL_MakeCurrent = define_c_func(sdl,"+SDL_GL_MakeCurrent",{C_POINTER,C_POINTER},C_INT)

public function SDL_GL_MakeCurrent(atom window,atom ctx)
	return c_func(xSDL_GL_MakeCurrent,{window,ctx})
end function

export constant xSDL_GL_GetCurrentWindow = define_c_func(sdl,"+SDL_GL_GetCurrentWindow",{},C_POINTER)

public function SDL_GL_GetCurrentWindow()
	return c_func(xSDL_GL_GetCurrentWindow,{})
end function

export constant xSDL_GL_GetCurrentContext = define_c_func(sdl,"+SDL_GL_GetCurrentContext",{},C_POINTER)

public function SDL_GL_GetCurrentContext()
	return c_func(xSDL_GL_GetCurrentContext,{})
end function

export constant xSDL_EGL_GetCurrentEGLDisplay = define_c_func(sdl,"+SDL_EGL_GetCurrentEGLDisplay",{},C_POINTER)

public function SDL_EGL_GetCurrentEGLDisplay()
	return c_func(xSDL_EGL_GetCurrentEGLDisplay,{})
end function

export constant xSDL_EGL_GetCurrentEGLConfig = define_c_func(sdl,"+SDL_EGL_GetCurrentEGLConfig",{},C_POINTER)

public function SDL_EGL_GetCurrentEGLConfig()
	return c_func(xSDL_EGL_GetCurrentEGLConfig,{})
end function

export constant xSDL_EGL_GetWindowEGLSurface = define_c_func(sdl,"+SDL_EGL_GetWindowEGLSurface",{C_POINTER},C_POINTER)

public function SDL_EGL_GetWindowEGLSurface(atom window)
	return c_func(xSDL_EGL_GetWindowEGLSurface,{window})
end function

export constant xSDL_EGL_SetEGLAttributeCallbacks = define_c_proc(sdl,"+SDL_EGL_SetEGLAttributeCallbacks",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_EGL_SetEGLAttributeCallbacks(atom att_cb,atom surf_cb,atom ctx_cb)
	c_proc(xSDL_EGL_SetEGLAttributeCallbacks,{att_cb,surf_cb,ctx_cb})
end procedure

export constant xSDL_GL_SetSwapInterval = define_c_func(sdl,"+SDL_GL_SetSwapInterval",{C_INT},C_INT)

public function SDL_GL_SetSwapInterval(atom interval)
	return c_func(xSDL_GL_SetSwapInterval,{interval})
end function

export constant xSDL_GL_GetSwapInterval = define_c_func(sdl,"+SDL_GL_GetSwapInterval",{C_POINTER},C_INT)

public function SDL_GL_GetSwapInterval(atom interval)
	return c_func(xSDL_GL_GetSwapInterval,{interval})
end function

export constant xSDL_GL_SwapWindow = define_c_func(sdl,"+SDL_GL_SwapWindow",{C_POINTER},C_INT)

public function SDL_GL_SwapWindow(atom window)
	return c_func(xSDL_GL_SwapWindow,{window})
end function

export constant xSDL_GL_DeleteContext = define_c_func(sdl,"+SDL_GL_DeleteContext",{C_POINTER},C_INT)

public function SDL_GL_DeleteContext(atom ctx)
	return c_func(xSDL_GL_DeleteContext,{ctx})
end function
­47.6
