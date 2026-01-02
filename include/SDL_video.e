include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_pixels.e
include SDL_properties.e
include SDL_rect.e
include SDL_surface.e

public constant SDL_DisplayID = C_UINT32

public constant SDL_WindowID = C_UINT32

public constant SDL_PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER = "SDL.video.wayland.wl_display"

public enum type SDL_SystemTheme
	SDL_SYSTEM_THEME_UNKNOWN = 0,
	SDL_SYSTEM_THEME_LIGHT,
	SDL_SYSTEM_THEME_DARK
end type

public enum type SDL_ProgressState
	SDL_PROGRESS_STATE_INVALID = -1,
	SDL_PROGRESS_STATE_NONE = 0,
	SDL_PROGRESS_STATE_INDETERMINATE,
	SDL_PROGRESS_STATE_NORMAL,
	SDL_PROGRESS_STATE_PAUSED,
	SDL_PROGRESS_STATE_ERROR
end type

public constant SDL_DisplayMode = define_c_struct({
	C_UINT32, --displayID
	C_INT, --format SDL_PixelFormat
	C_INT, --w
	C_INT, --h
	C_FLOAT, --pixel_density
	C_FLOAT, --refresh_rate
	C_INT, --refresh_rate_numerator
	C_INT, --refresh_rate_denominator
	C_POINTER --internal
})

public enum type SDL_DisplayOrientation
	SDL_ORIENTATION_UNKNOWN = 0,
	SDL_ORIENTATION_LANDSCAPE,
	SDL_ORIENTATION_LANDSCAPE_FLIPPED,
	SDL_ORIENTATION_PORTRAIT,
	SDL_ORIENTATION_PORTRAIT_FLIPPED
end type

public constant SDL_WindowFlags = C_UINT64

public constant SDL_WINDOW_FULLSCREEN = 0x0000000000000001
public constant SDL_WINDOW_OPENGL = 0x0000000000000002
public constant SDL_WINDOW_OCCLUDED = 0x0000000000000004
public constant SDL_WINDOW_HIDDEN = 0x0000000000000008
public constant SDL_WINDOW_BORDERLESS = 0x0000000000000010
public constant SDL_WINDOW_RESIZABLE = 0x0000000000000020
public constant SDL_WINDOW_MINIMIZED = 0x0000000000000040
public constant SDL_WINDOW_MAXIMIZED = 0x0000000000000080
public constant SDL_WINDOW_MOUSE_GRABBED = 0x0000000000000100
public constant SDL_WINDOW_INPUT_FOCUS = 0x0000000000000200
public constant SDL_WINDOW_MOUSE_FOCUS = 0x0000000000000400
public constant SDL_WINDOW_EXTERNAL = 0x0000000000000800
public constant SDL_WINDOW_MODAL = 0x0000000000001000
public constant SDL_WINDOW_HIGH_PIXEL_DENSITY = 0x0000000000002000
public constant SDL_WINDOW_MOUSE_CAPTURE = 0x0000000000004000
public constant SDL_WINDOW_MOUSE_RELATIVE_MODE = 0x0000000000008000
public constant SDL_WINDOW_ALWAYS_ON_TOP = 0x0000000000010000
public constant SDL_WINDOW_UTILITY = 0x0000000000020000
public constant SDL_WINDOW_TOOLTIP = 0x0000000000040000
public constant SDL_WINDOW_POPUP_MENU = 0x0000000000080000
public constant SDL_WINDOW_KEYBOARD_GRABBED = 0x0000000000100000
public constant SDL_WINDOW_VULAKN = 0x0000000010000000
public constant SDL_WINDOW_METAL = 0x0000000020000000
public constant SDL_WINDOW_TRANSPARENT = 0x0000000040000000
public constant SDL_WINDOW_NOT_FOCUSABLE = 0x0000000080000000

public constant SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000

public constant SDL_WINDOWPOS_UNDEFINED_DISPLAY = SDL_WINDOWPOS_UNDEFINED_MASK

public constant SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_DISPLAY

public constant SDL_WINDOWPOS_ISUNDEFINED = 0xFFFF0000

public constant SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000

public constant SDL_WINDOWPOS_CENTERED_DISPLAY = SDL_WINDOWPOS_CENTERED_MASK

public constant SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_DISPLAY

public constant SDL_WINDOWPOS_ISCENTERED = SDL_WINDOWPOS_CENTERED_MASK

public enum type SDL_FlashOperation
	SDL_FLASH_CANCEL = 0,
	SDL_FLASH_BRIEFLY,
	SDL_FLASH_UNTIL_FOCUSED
end type

public enum type SDL_GLAttr
	SDL_GL_RED_SIZE = 0,                    /**< the minimum number of bits for the red channel of the color buffer; defaults to 3. */
    SDL_GL_GREEN_SIZE,                  /**< the minimum number of bits for the green channel of the color buffer; defaults to 3. */
    SDL_GL_BLUE_SIZE,                   /**< the minimum number of bits for the blue channel of the color buffer; defaults to 2. */
    SDL_GL_ALPHA_SIZE,                  /**< the minimum number of bits for the alpha channel of the color buffer; defaults to 0. */
    SDL_GL_BUFFER_SIZE,                 /**< the minimum number of bits for frame buffer size; defaults to 0. */
    SDL_GL_DOUBLEBUFFER,                /**< whether the output is single or double buffered; defaults to double buffering on. */
    SDL_GL_DEPTH_SIZE,                  /**< the minimum number of bits in the depth buffer; defaults to 16. */
    SDL_GL_STENCIL_SIZE,                /**< the minimum number of bits in the stencil buffer; defaults to 0. */
    SDL_GL_ACCUM_RED_SIZE,              /**< the minimum number of bits for the red channel of the accumulation buffer; defaults to 0. */
    SDL_GL_ACCUM_GREEN_SIZE,            /**< the minimum number of bits for the green channel of the accumulation buffer; defaults to 0. */
    SDL_GL_ACCUM_BLUE_SIZE,             /**< the minimum number of bits for the blue channel of the accumulation buffer; defaults to 0. */
    SDL_GL_ACCUM_ALPHA_SIZE,            /**< the minimum number of bits for the alpha channel of the accumulation buffer; defaults to 0. */
    SDL_GL_STEREO,                      /**< whether the output is stereo 3D; defaults to off. */
    SDL_GL_MULTISAMPLEBUFFERS,          /**< the number of buffers used for multisample anti-aliasing; defaults to 0. */
    SDL_GL_MULTISAMPLESAMPLES,          /**< the number of samples used around the current pixel used for multisample anti-aliasing. */
    SDL_GL_ACCELERATED_VISUAL,          /**< set to 1 to require hardware acceleration, set to 0 to force software rendering; defaults to allow either. */
    SDL_GL_RETAINED_BACKING,            /**< not used (deprecated). */
    SDL_GL_CONTEXT_MAJOR_VERSION,       /**< OpenGL context major version. */
    SDL_GL_CONTEXT_MINOR_VERSION,       /**< OpenGL context minor version. */
    SDL_GL_CONTEXT_FLAGS,               /**< some combination of 0 or more of elements of the SDL_GLContextFlag enumeration; defaults to 0. */
    SDL_GL_CONTEXT_PROFILE_MASK,        /**< type of GL context (Core, Compatibility, ES). See SDL_GLProfile; default value depends on platform. */
    SDL_GL_SHARE_WITH_CURRENT_CONTEXT,  /**< OpenGL context sharing; defaults to 0. */
    SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,    /**< requests sRGB capable visual; defaults to 0. */
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR,    /**< sets context the release behavior. See SDL_GLContextReleaseFlag; defaults to FLUSH. */
    SDL_GL_CONTEXT_RESET_NOTIFICATION,  /**< set context reset notification. See SDL_GLContextResetNotification; defaults to NO_NOTIFICATION. */
    SDL_GL_CONTEXT_NO_ERROR,
    SDL_GL_FLOATBUFFERS,
    SDL_GL_EGL_PLATFORM
end type

public constant SDL_GLProfile = C_UINT32

public constant SDL_GL_CONTEXT_PROFILE_CORE = 0x0001
public constant SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002
public constant SDL_GL_CONTEXT_PROFILE_ES = 0x0004

public constant SDL_GLContextFlag = C_UINT32

public constant SDL_GL_CONTEXT_DEBUG_FLAG = 0x0001
public constant SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002
public constant SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = 0x0004
public constant SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = 0x008

public constant SDL_GLContextReleasrFlag = C_UINT32

public constant SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0x0000
public constant SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001

public constant SDL_GLContextResetNotification = C_UINT32

public constant SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = 0x0000
public constant SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = 0x0001

public constant xSDL_GetNumVideoDrivers = define_c_func(sdl,"+SDL_GetNumVideoDrivers",{},C_INT)

public function SDL_GetNumVideoDrivers()
	return c_func(xSDL_GetNumVideoDrivers,{})
end function

public constant xSDL_GetVideoDriver = define_c_func(sdl,"+SDL_GetVideoDriver",{C_INT},C_STRING)

public function SDL_GetVideoDriver(atom index)
	return c_func(xSDL_GetVideoDriver,{index})
end function

public constant xSDL_GetCurrentVideoDriver = define_c_func(sdl,"+SDL_GetCurrentVideoDriver",{},C_STRING)

public function SDL_GetCurrentVideoDriver()
	return c_func(xSDL_GetCurrentVideoDriver,{})
end function

public constant xSDL_GetSystemTheme = define_c_func(sdl,"+SDL_GetSystemTheme",{},C_INT)

public function SDL_GetSystemTheme()
	return c_func(xSDL_GetSystemTheme,{})
end function

public constant xSDL_GetDisplays = define_c_func(sdl,"+SDL_GetDisplays",{C_POINTER},C_POINTER)

public function SDL_GetDisplays(atom count)
	return c_func(xSDL_GetDisplays,{count})
end function

public constant xSDL_GetPrimaryDisplay = define_c_func(sdl,"+SDL_GetPrimaryDisplay",{},C_UINT32)

public function SDL_GetPrimaryDisplay()
	return c_func(xSDL_GetPrimaryDisplay,{})
end function

public constant xSDL_GetDisplayProperties = define_c_func(sdl,"+SDL_GetDisplayProperties",{C_UINT32},C_UINT32)

public function SDL_GetDisplayProperties(atom displayID)
	return c_func(xSDL_GetDisplayProperties,{displayID})
end function

public constant SDL_PROP_DISPLAY_HDR_ENABLED_BOOLEAN = "SDL.display.HDR_enabled"
public constant SDL_PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER = "SDL.display.KMSDRM.panel_orientation"

public constant xSDL_GetDisplayName = define_c_func(sdl,"+SDL_GetDisplayName",{C_UINT32},C_STRING)

public function SDL_GetDisplayName(atom displayID)
	return c_func(xSDL_GetDisplayName,{displayID})
end function

public constant xSDL_GetDisplayBounds = define_c_func(sdl,"+SDL_GetDisplayBounds",{C_UINT32,C_POINTER},C_BOOL)

public function SDL_GetDisplayBounds(atom displayID)

	atom x = 0, y = 0, w = 0, h = 0
	atom px = allocate_data(sizeof(C_FLOAT))
	atom py = allocate_data(sizeof(C_FLOAT))
	atom pw = allocate_data(sizeof(C_FLOAT))
	atom ph = allocate_data(sizeof(C_FLOAT))
	
	if c_func(xSDL_GetDisplayBounds,{displayID,px,py,pw,ph}) then
		x = peek_type(px,C_FLOAT)
		y = peek_type(py,C_FLOAT)
		w = peek_type(pw,C_FLOAT)
		h = peek_type(ph,C_FLOAT)
	end if
	
	free(px)
	free(py)
	free(pw)
	free(ph)
	
	return {x,y,w,h}
end function

public constant xSDL_GetDisplayUsableBound = define_c_func(sdl,"+SDL_GetDisplayUsableBound",{C_UINT32,C_POINTER},C_BOOL)

public function SDL_GetDisplayUsableBound(atom displayID)

	atom x = 0, y = 0, w = 0, h = 0
	atom px = allocate_data(sizeof(C_FLOAT))
	atom py = allocate_data(sizeof(C_FLOAT))
	atom pw = allocate_data(sizeof(C_FLOAT))
	atom ph = allocate_data(sizeof(C_FLOAT))
	
	if c_func(xSDL_GetDisplayUsableBound,{displayID,px,py,pw,ph}) then
		x = peek_type(px,C_FLOAT)
		y = peek_type(py,C_FLOAT)
		w = peek_type(pw,C_FLOAT)
		h = peek_type(ph,C_FLOAT)
	end if
	
	free(px)
	free(py)
	free(pw)
	free(ph)
	
	return {x,y,w,h}
end function

public constant xSDL_GetNaturalDisplayOrientation = define_c_func(sdl,"+SDL_GetNaturalDisplayOrientation",{C_UINT32},C_INT)

public function SDL_GetNaturalDisplayOrientation(atom displayID)
	return c_func(xSDL_GetNaturalDisplayOrientation,{displayID})
end function

public constant xSDL_GetCurrentDisplayOrientation = define_c_func(sdl,"+SDL_GetCurrentDisplayOrientation",{C_UINT32},C_INT)

public function SDL_GetCurrentDisplayOrientation(atom displayID)
	return c_func(xSDL_GetCurrentDisplayOrientation,{displayID})
end function

public constant xSDL_GetDisplayContentScale = define_c_func(sdl,"+SDL_GetDisplayContentScale",{C_UINT32},C_FLOAT)

public function SDL_GetDisplayContentScale(atom displayID)
	return c_func(xSDL_GetDisplayContentScale,{displayID})
end function

public constant xSDL_GetFullscreenDisplayModes = define_c_func(sdl,"+SDL_GetFullscreenDisplayModes",{C_UINT32,C_POINTER},C_POINTER)

public function SDL_GetFullscreenDisplayModes(atom displayID,atom count)
	return c_func(xSDL_GetFullscreenDisplayModes,{displayID,count})
end function

public constant xSDL_GetClosestFullscreenDisplayMode = define_c_func(sdl,"+SDL_GetClosestFullscreenDisplayMode",{C_UINT32,C_INT,C_INT,C_FLOAT,C_BOOL,C_POINTER},C_BOOL)

public function SDL_GetClosestFullscreenDisplayMode(atom displayID,atom w,atom h,atom refresh_rate,atom include_high_density_modes,atom closest)
	return c_func(xSDL_GetClosestFullscreenDisplayMode,{displayID,w,h,refresh_rate,include_high_density_modes,closest})
end function

public constant xSDL_GetDesktopDisplayMode = define_c_func(sdl,"+SDL_GetDesktopDisplayMode",{C_UINT32},C_POINTER)

public function SDL_GetDesktopDisplayMode(atom displayID)
	return c_func(xSDL_GetDesktopDisplayMode,{displayID})
end function

public constant xSDL_GetCurrentDisplayMode = define_c_func(sdl,"+SDL_GetCurrentDisplayMode",{C_UINT32},C_POINTER)

public function SDL_GetCurrentDisplayMode(atom displayID)
	return c_func(xSDL_GetCurrentDisplayMode,{displayID})
end function

public constant xSDL_GetDisplayForPoint = define_c_func(sdl,"+SDL_GetDisplayForPoint",{C_POINTER},C_UINT32)

public function SDL_GetDisplayForPoint(atom point)
	return c_func(xSDL_GetDisplayForPoint,{point})
end function

public constant xSDL_GetDisplayForRect = define_c_func(sdl,"+SDL_GetDisplayForRect",{C_POINTER},C_UINT32)

public function SDL_GetDisplayForRect(atom rect)
	return c_func(xSDL_GetDisplayForRect,{rect})
end function

public constant xSDL_GetDisplayForWindow = define_c_func(sdl,"+SDL_GetDisplayForWindow",{C_POINTER},C_UINT32)

public function SDL_GetDisplayForWindow(atom window)
	return c_func(xSDL_GetDisplayForWindow,{window})
end function

public constant xSDL_GetWindowPixelDensity = define_c_func(sdl,"+SDL_GetWindowPixelDensity",{C_POINTER},C_FLOAT)

public function SDL_GetWindowPixelDensity(atom window)
	return c_func(xSDL_GetWindowPixelDensity,{window})
end function

public constant xSDL_GetWindowDisplayScale = define_c_func(sdl,"+SDL_GetWindowDisplayScale",{C_POINTER},C_FLOAT)

public function SDL_GetWindowDisplayScale(atom window)
	return c_func(xSDL_GetWindowDisplayScale,{window})
end function

public constant xSDL_SetWindowFullscreenMode = define_c_func(sdl,"+SDL_SetWindowFullscreenMode",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetWindowFullscreenMode(atom window,atom mode)
	return c_func(xSDL_SetWindowFullscreenMode,{window,mode})
end function

public constant xSDL_GetWindowFullscreenMode = define_c_func(sdl,"+SDL_GetWindowFullscreenMode",{C_POINTER},C_POINTER)

public function SDL_GetWindowFullscreenMode(atom window)
	return c_func(xSDL_GetWindowFullscreenMode,{window})
end function

public constant xSDL_GetWindowICCProfile = define_c_func(sdl,"+SDL_GetWindowICCProfile",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetWindowICCProfile(atom window,atom size)
	return c_func(xSDL_GetWindowICCProfile,{window,size})
end function

public constant xSDL_GetWindowPixelFormat = define_c_func(sdl,"+SDL_GetWindowPixelFormat",{C_POINTER},C_INT)

public function SDL_GetWindowPixelFormat(atom window)
	return c_func(xSDL_GetWindowPixelFormat,{window})
end function

public constant xSDL_GetWindows = define_c_func(sdl,"+SDL_GetWindows",{C_POINTER},C_POINTER)

public function SDL_GetWindows(atom count)
	return c_func(xSDL_GetWindows,{count})
end function

public constant xSDL_CreateWindow = define_c_func(sdl,"+SDL_CreateWindow",{C_STRING,C_INT,C_INT,C_UINT64},C_POINTER)

public function SDL_CreateWindow(sequence title,atom w,atom h,atom flags)
	return c_func(xSDL_CreateWindow,{title,w,h,flags})
end function

public constant xSDL_CreatePopupWindow = define_c_func(sdl,"+SDL_CreatePopupWindow",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT64},C_POINTER)

public function SDL_CreatePopupWindow(atom parent,atom offset_x,atom offset_y,atom w,atom h,atom flags)
	return c_func(xSDL_CreatePopupWindow,{parent,offset_x,offset_y,w,h,flags})
end function

public constant xSDL_CreateWindowWithProperties = define_c_func(sdl,"+SDL_CreateWindowWithProperties",{C_UINT32},C_POINTER)

public function SDL_CreateWindowWithProperties(atom props)
	return c_func(xSDL_CreateWindowWithProperties,{props})
end function

public constant SDL_PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN   =            "SDL.window.create.always_on_top"
public constant SDL_PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN              =    "SDL.window.create.borderless"
public constant SDL_PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN               =    "SDL.window.create.focusable"
public constant SDL_PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN =  "SDL.window.create.external_graphics_context"
public constant SDL_PROP_WINDOW_CREATE_FLAGS_NUMBER                      =  "SDL.window.create.flags"
public constant SDL_PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN                =  "SDL.window.create.fullscreen"
public constant SDL_PROP_WINDOW_CREATE_HEIGHT_NUMBER                     =  "SDL.window.create.height"
public constant SDL_PROP_WINDOW_CREATE_HIDDEN_BOOLEAN                    =  "SDL.window.create.hidden"
public constant SDL_PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN        =  "SDL.window.create.high_pixel_density"
public constant SDL_PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN                 =  "SDL.window.create.maximized"
public constant SDL_PROP_WINDOW_CREATE_MENU_BOOLEAN                      =  "SDL.window.create.menu"
public constant SDL_PROP_WINDOW_CREATE_METAL_BOOLEAN                     =  "SDL.window.create.metal"
public constant SDL_PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN                 =  "SDL.window.create.minimized"
public constant SDL_PROP_WINDOW_CREATE_MODAL_BOOLEAN                     =  "SDL.window.create.modal"
public constant SDL_PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN             =  "SDL.window.create.mouse_grabbed"
public constant SDL_PROP_WINDOW_CREATE_OPENGL_BOOLEAN                    =  "SDL.window.create.opengl"
public constant SDL_PROP_WINDOW_CREATE_PARENT_POINTER                    =  "SDL.window.create.parent"
public constant SDL_PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN                 =  "SDL.window.create.resizable"
public constant SDL_PROP_WINDOW_CREATE_TITLE_STRING                      =  "SDL.window.create.title"
public constant SDL_PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN               =  "SDL.window.create.transparent"
public constant SDL_PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN                   =  "SDL.window.create.tooltip"
public constant SDL_PROP_WINDOW_CREATE_UTILITY_BOOLEAN                   =  "SDL.window.create.utility"
public constant SDL_PROP_WINDOW_CREATE_VULKAN_BOOLEAN                    =  "SDL.window.create.vulkan"
public constant SDL_PROP_WINDOW_CREATE_WIDTH_NUMBER                      =  "SDL.window.create.width"
public constant SDL_PROP_WINDOW_CREATE_X_NUMBER                          =  "SDL.window.create.x"
public constant SDL_PROP_WINDOW_CREATE_Y_NUMBER                          =  "SDL.window.create.y"
public constant SDL_PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER              =  "SDL.window.create.cocoa.window"
public constant SDL_PROP_WINDOW_CREATE_COCOA_VIEW_POINTER                =  "SDL.window.create.cocoa.view"
public constant SDL_PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN = "SDL.window.create.wayland.surface_role_custom"
public constant SDL_PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN   = "SDL.window.create.wayland.create_egl_window"
public constant SDL_PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER         = "SDL.window.create.wayland.wl_surface"
public constant SDL_PROP_WINDOW_CREATE_WIN32_HWND_POINTER                 = "SDL.window.create.win32.hwnd"
public constant SDL_PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER    = "SDL.window.create.win32.pixel_format_hwnd"
public constant SDL_PROP_WINDOW_CREATE_X11_WINDOW_NUMBER                  = "SDL.window.create.x11.window"

public constant xSDL_GetWindowID = define_c_func(sdl,"+SDL_GetWindowID",{C_POINTER},C_UINT32)

public function SDL_GetWindowID(atom window)
	return c_func(xSDL_GetWindowID,{window})
end function

public constant xSDL_GetWindowFromID = define_c_func(sdl,"+SDL_GetWindowFromID",{C_UINT32},C_POINTER)

public function SDL_GetWindowFromID(atom id)
	return c_func(xSDL_GetWindowFromID,{id})
end function

public constant xSDL_GetWindowParent = define_c_func(sdl,"+SDL_GetWindowParent",{C_POINTER},C_POINTER)

public function SDL_GetWindowParent(atom window)
	return c_func(xSDL_GetWindowParent,{window})
end function

public constant xSDL_GetWindowProperties = define_c_func(sdl,"+SDL_GetWindowProperties",{C_POINTER},C_UINT32)

public function SDL_GetWindowProperties(atom window)
	return c_func(xSDL_GetWindowProperties,{window})
end function

public constant SDL_PROP_WINDOW_SHAPE_POINTER     =                          "SDL.window.shape"
public constant SDL_PROP_WINDOW_HDR_ENABLED_BOOLEAN       =                  "SDL.window.HDR_enabled"
public constant SDL_PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT     =                  "SDL.window.SDR_white_level"
public constant SDL_PROP_WINDOW_HDR_HEADROOM_FLOAT        =                  "SDL.window.HDR_headroom"
public constant SDL_PROP_WINDOW_ANDROID_WINDOW_POINTER     =                 "SDL.window.android.window"
public constant SDL_PROP_WINDOW_ANDROID_SURFACE_POINTER    =                 "SDL.window.android.surface"
public constant SDL_PROP_WINDOW_UIKIT_WINDOW_POINTER        =                "SDL.window.uikit.window"
public constant SDL_PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER  =               "SDL.window.uikit.metal_view_tag"
public constant SDL_PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER =            "SDL.window.uikit.opengl.framebuffer"
public constant SDL_PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER  =          "SDL.window.uikit.opengl.renderbuffer"
public constant SDL_PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER =    "SDL.window.uikit.opengl.resolve_framebuffer"
public constant SDL_PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER              =    "SDL.window.kmsdrm.dev_index"
public constant SDL_PROP_WINDOW_KMSDRM_DRM_FD_NUMBER                    =    "SDL.window.kmsdrm.drm_fd"
public constant SDL_PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER               =    "SDL.window.kmsdrm.gbm_dev"
public constant SDL_PROP_WINDOW_COCOA_WINDOW_POINTER                    =    "SDL.window.cocoa.window"
public constant SDL_PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER             =    "SDL.window.cocoa.metal_view_tag"
public constant SDL_PROP_WINDOW_OPENVR_OVERLAY_ID                       =    "SDL.window.openvr.overlay_id"
public constant SDL_PROP_WINDOW_VIVANTE_DISPLAY_POINTER                 =    "SDL.window.vivante.display"
public constant SDL_PROP_WINDOW_VIVANTE_WINDOW_POINTER                  =    "SDL.window.vivante.window"
public constant SDL_PROP_WINDOW_VIVANTE_SURFACE_POINTER                 =    "SDL.window.vivante.surface"
public constant SDL_PROP_WINDOW_WIN32_HWND_POINTER                      =    "SDL.window.win32.hwnd"
public constant SDL_PROP_WINDOW_WIN32_HDC_POINTER                       =    "SDL.window.win32.hdc"
public constant SDL_PROP_WINDOW_WIN32_INSTANCE_POINTER                  =    "SDL.window.win32.instance"
public constant SDL_PROP_WINDOW_WAYLAND_DISPLAY_POINTER                 =    "SDL.window.wayland.display"
public constant SDL_PROP_WINDOW_WAYLAND_SURFACE_POINTER                 =    "SDL.window.wayland.surface"
public constant SDL_PROP_WINDOW_WAYLAND_VIEWPORT_POINTER                =    "SDL.window.wayland.viewport"
public constant SDL_PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER              =    "SDL.window.wayland.egl_window"
public constant SDL_PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER             =    "SDL.window.wayland.xdg_surface"
public constant SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER             =   "SDL.window.wayland.xdg_toplevel"
public constant SDL_PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING =  "SDL.window.wayland.xdg_toplevel_export_handle"
public constant SDL_PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER                 =  "SDL.window.wayland.xdg_popup"
public constant SDL_PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER            =  "SDL.window.wayland.xdg_positioner"
public constant SDL_PROP_WINDOW_X11_DISPLAY_POINTER                       =  "SDL.window.x11.display"
public constant SDL_PROP_WINDOW_X11_SCREEN_NUMBER                         =  "SDL.window.x11.screen"
public constant SDL_PROP_WINDOW_X11_WINDOW_NUMBER                         =  "SDL.window.x11.window"

public constant xSDL_GetWindowFlags = define_c_func(sdl,"+SDL_GetWindowFlags",{C_POINTER},C_UINT32)

public function SDL_GetWindowFlags(atom window)
	return c_func(xSDL_GetWindowFlags,{window})
end function

public constant xSDL_SetWindowTitle = define_c_func(sdl,"+SDL_SetWindowTitle",{C_POINTER,C_STRING},C_BOOL)

public function SDL_SetWindowTitle(atom window,sequence title)
	return c_func(xSDL_SetWindowTitle,{window,title})
end function

public constant xSDL_GetWindowTitle = define_c_func(sdl,"+SDL_GetWindowTitle",{C_POINTER},C_STRING)

public function SDL_GetWindowTitle(atom window)
	return c_func(xSDL_GetWindowTitle,{window})
end function

public constant xSDL_SetWindowIcon = define_c_func(sdl,"+SDL_SetWindowIcon",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetWindowIcon(atom window,atom icon)
	return c_func(xSDL_SetWindowIcon,{window,icon})
end function

public constant xSDL_SetWindowPosition = define_c_func(sdl,"+SDL_SetWindowPosition",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_SetWindowPosition(atom window,atom x,atom y)
	return c_func(xSDL_SetWindowPosition,{window,x,y})
end function

public constant xSDL_GetWindowPosition = define_c_func(sdl,"+SDL_GetWindowPosition",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowPosition(atom window,atom x,atom y)
	return c_func(xSDL_GetWindowPosition,{window,x,y})
end function

public constant xSDL_SetWindowSize = define_c_func(sdl,"+SDL_SetWindowSize",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_SetWindowSize(atom window,atom w,atom h)
	return c_func(xSDL_SetWindowSize,{window,w,h})
end function

public constant xSDL_GetWindowSize = define_c_func(sdl,"+SDL_GetWindowSize",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowSize(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowSize,{window,w,h})
end function

public constant xSDL_GetWindowSafeArea = define_c_func(sdl,"+SDL_GetWindowSafeArea",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowSafeArea(atom window,atom rect)
	return c_func(xSDL_GetWindowSafeArea,{window,rect})
end function

public constant xSDL_SetWindowAspectRatio = define_c_func(sdl,"+SDL_SetWindowAspectRatio",{C_POINTER,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_SetWindowAspectRatio(atom window,atom min_aspect,atom max_aspect)
	return c_func(xSDL_SetWindowAspectRatio,{window,min_aspect,max_aspect})
end function

public constant xSDL_GetWindowAspectRatio = define_c_func(sdl,"+SDL_GetWindowAspectRatio",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowAspectRatio(atom window,atom min,atom max)
	return c_func(xSDL_GetWindowAspectRatio,{window,min,max})
end function

public constant xSDL_GetWindowBordersSize = define_c_func(sdl,"+SDL_GetWindowBordersSize",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowBordersSize(atom window,atom top,atom left,atom bottom,atom right)
	return c_func(xSDL_GetWindowBordersSize,{window,top,left,bottom,right})
end function

public constant xSDL_GetWindowSizeInPixels = define_c_func(sdl,"+SDL_GetWindowSizeInPixels",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowSizeInPixels(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowSizeInPixels,{window,w,h})
end function

public constant xSDL_SetWindowMinimumSize = define_c_func(sdl,"+SDL_SetWindowMinimumSize",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_SetWindowMinimumSize(atom window,atom min_w,atom min_h)
	return c_func(xSDL_SetWindowMinimumSize,{window,min_w,min_h})
end function

public constant xSDL_GetWindowMinimumSize = define_c_func(sdl,"+SDL_GetWindowMinimumSize",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowMinimumSize(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowMinimumSize,{window,w,h})
end function

public constant xSDL_SetWindowMaximumSize = define_c_func(sdl,"+SDL_SetWindowMaximumSize",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_SetWindowMaximumSize(atom window,atom max_w,atom max_h)
	return c_func(xSDL_SetWindowMaximumSize,{window,max_w,max_h})
end function

public constant xSDL_GetWindowMaximumSize = define_c_func(sdl,"+SDL_GetWindowMaximumSize",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowMaximumSize(atom window,atom w,atom h)
	return c_func(xSDL_GetWindowMaximumSize,{window,w,h})
end function

public constant xSDL_SetWindowBordered = define_c_func(sdl,"+SDL_SetWindowBordered",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowBordered(atom window,atom border)
	return c_func(xSDL_SetWindowBordered,{window,border})
end function

public constant xSDL_SetWindowResizable = define_c_func(sdl,"+SDL_SetWindowResizable",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowResizable(atom window,atom resizable)
	return c_func(xSDL_SetWindowResizable,{window,resizable})
end function

public constant xSDL_SetWindowAlwaysOnTop = define_c_func(sdl,"+SDL_SetWindowAlwaysOnTop",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowAlwaysOnTop(atom window,atom on_top)
	return c_func(xSDL_SetWindowAlwaysOnTop,{window,on_top})
end function

public constant xSDL_ShowWindow = define_c_func(sdl,"+SDL_ShowWindow",{C_POINTER},C_BOOL)

public function SDL_ShowWindow(atom window)
	return c_func(xSDL_ShowWindow,{window})
end function

public constant xSDL_HideWindow = define_c_func(sdl,"+SDL_HideWindow",{C_POINTER},C_BOOL)

public function SDL_HideWindow(atom window)
	return c_func(xSDL_HideWindow,{window})
end function

public constant xSDL_RaiseWindow = define_c_func(sdl,"+SDL_RaiseWindow",{C_POINTER},C_BOOL)

public function SDL_RaiseWindow(atom window)
	return c_func(xSDL_RaiseWindow,{window})
end function

public constant xSDL_MaximizeWindow = define_c_func(sdl,"+SDL_MaximizeWindow",{C_POINTER},C_BOOL)

public function SDL_MaximizeWindow(atom window)
	return c_func(xSDL_MaximizeWindow,{window})
end function

public constant xSDL_MinimizeWindow = define_c_func(sdl,"+SDL_MinimizeWindow",{C_POINTER},C_BOOL)

public function SDL_MinimizeWindow(atom window)
	return c_func(xSDL_MinimizeWindow,{window})
end function

public constant xSDL_RestoreWindow = define_c_func(sdl,"+SDL_RestoreWindow",{C_POINTER},C_BOOL)

public function SDL_RestoreWindow(atom window)
	return c_func(xSDL_RestoreWindow,{window})
end function

public constant xSDL_SetWindowFullscreen = define_c_func(sdl,"+SDL_SetWindowFullscreen",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowFullscreen(atom window,atom fullscreen)
	return c_func(xSDL_SetWindowFullscreen,{window,fullscreen})
end function

public constant xSDL_SyncWindow = define_c_func(sdl,"+SDL_SyncWindow",{C_POINTER},C_BOOL)

public function SDL_SyncWindow(atom window)
	return c_func(xSDL_SyncWindow,{window})
end function

public constant xSDL_WindowHasSurface = define_c_func(sdl,"+SDL_WindowHasSurface",{C_POINTER},C_BOOL)

public function SDL_WindowHasSurface(atom window)
	return c_func(xSDL_WindowHasSurface,{window})
end function

public constant xSDL_GetWindowSurface = define_c_func(sdl,"+SDL_GetWindowSurface",{C_POINTER},C_POINTER)

public function SDL_GetWindowSurface(atom window)
	return c_func(xSDL_GetWindowSurface,{window})
end function

public constant xSDL_SetWindowSurfaceVSync = define_c_func(sdl,"+SDL_SetWindowSurfaceVSync",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetWindowSurfaceVSync(atom window,atom vsync)
	return c_func(xSDL_SetWindowSurfaceVSync,{window,vsync})
end function

public constant SDL_WINDOW_SURFACE_VSYNC_DISABLED = 0
public constant SDL_WINDOW_SURFACE_VSYNC_ADAPTIVE = -1

public constant xSDL_GetWindowSurfaceVSync = define_c_func(sdl,"+SDL_GetWindowSurfaceVSync",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetWindowSurfaceVSync(atom window,atom vsync)
	return c_func(xSDL_GetWindowSurfaceVSync,{window,vsync})
end function

public constant xSDL_UpdateWindowSurface = define_c_func(sdl,"+SDL_UpdateWindowSurface",{C_POINTER},C_BOOL)

public function SDL_UpdateWindowSurface(atom window)
	return c_func(xSDL_UpdateWindowSurface,{window})
end function

public constant xSDL_UpdateWindowSurfaceRects = define_c_func(sdl,"+SDL_UpdateWindowSurfaceRects",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_UpdateWindowSurfaceRects(atom window,atom rects,atom numrects)
	return c_func(xSDL_UpdateWindowSurfaceRects,{window,rects,numrects})
end function

public constant xSDL_DestroyWindowSurface = define_c_func(sdl,"+SDL_DestroyWindowSurface",{C_POINTER},C_BOOL)

public function SDL_DestroyWindowSurface(atom window)
	return c_func(xSDL_DestroyWindowSurface,{window})
end function

public constant xSDL_SetWindowKeyboardGrab = define_c_func(sdl,"+SDL_SetWindowKeyboardGrab",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowKeyboardGrab(atom window,atom grabbed)
	return c_func(xSDL_SetWindowKeyboardGrab,{window,grabbed})
end function

public constant xSDL_SetWindowMouseGrab = define_c_func(sdl,"+SDL_SetWindowMouseGrab",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowMouseGrab(atom window,atom grabbed)
	return c_func(xSDL_SetWindowMouseGrab,{window,grabbed})
end function

public constant xSDL_GetWindowKeyboardGrab = define_c_func(sdl,"+SDL_GetWindowKeyboardGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowKeyboardGrab(atom window)
	return c_func(xSDL_GetWindowKeyboardGrab,{window})
end function

public constant xSDL_GetWindowMouseGrab = define_c_func(sdl,"+SDL_GetWindowMouseGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowMouseGrab(atom window)
	return c_func(xSDL_GetWindowMouseGrab,{window})
end function

public constant xSDL_GetGrabbedWindow = define_c_func(sdl,"+SDL_GetGrabbedWindow",{},C_POINTER)

public function SDL_GetGrabbedWindow()
	return c_func(xSDL_GetGrabbedWindow,{})
end function

public constant xSDL_SetWindowMouseRect = define_c_func(sdl,"+SDL_SetWindowMouseRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetWindowMouseRect(atom window,atom rect)
	return c_func(xSDL_SetWindowMouseRect,{window,rect})
end function

public constant xSDL_GetWindowMouseRect = define_c_func(sdl,"+SDL_GetWindowMouseRect",{C_POINTER},C_POINTER)

public function SDL_GetWindowMouseRect(atom window)
	return c_func(xSDL_GetWindowMouseRect,{window})
end function

public constant xSDL_SetWindowOpacity = define_c_func(sdl,"+SDL_SetWindowOpacity",{C_POINTER,C_FLOAT},C_BOOL)

public function SDL_SetWindowOpacity(atom window,atom opacity)
	return c_func(xSDL_SetWindowOpacity,{window,opacity})
end function

public constant xSDL_GetWindowOpacity = define_c_func(sdl,"+SDL_GetWindowOpacity",{C_POINTER},C_FLOAT)

public function SDL_GetWindowOpacity(atom window)
	return c_func(xSDL_GetWindowOpacity,{window})
end function

public constant xSDL_SetWindowParent = define_c_func(sdl,"+SDL_SetWindowParent",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetWindowParent(atom window,atom parent)
	return c_func(xSDL_SetWindowParent,{window,parent})
end function

public constant xSDL_SetWindowModal = define_c_func(sdl,"+SDL_SetWindowModal",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowModal(atom window,atom modal)
	return c_func(xSDL_SetWindowModal,{window,modal})
end function

public constant xSDL_SetWindowFocusable = define_c_func(sdl,"+SDL_SetWindowFocusable",{C_POINTER,C_BOOL},C_BOOL)

public function SDL_SetWindowFocusable(atom window,atom focus)
	return c_func(xSDL_SetWindowFocusable,{window,focus})
end function

public constant xSDL_ShowWindowSystemMenu = define_c_func(sdl,"+SDL_ShowWindowSystemMenu",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_ShowWindowSystemMenu(atom window,atom x,atom y)
	return c_func(xSDL_ShowWindowSystemMenu,{window,x,y})
end function

public enum type SDL_HitTestResult
	SDL_HITTEST_NORMAL = 0,             /**< Region is normal. No special properties. */
    SDL_HITTEST_DRAGGABLE,          /**< Region can drag entire window. */
    SDL_HITTEST_RESIZE_TOPLEFT,     /**< Region is the resizable top-left corner border. */
    SDL_HITTEST_RESIZE_TOP,         /**< Region is the resizable top border. */
    SDL_HITTEST_RESIZE_TOPRIGHT,    /**< Region is the resizable top-right corner border. */
    SDL_HITTEST_RESIZE_RIGHT,       /**< Region is the resizable right border. */
    SDL_HITTEST_RESIZE_BOTTOMRIGHT, /**< Region is the resizable bottom-right corner border. */
    SDL_HITTEST_RESIZE_BOTTOM,      /**< Region is the resizable bottom border. */
    SDL_HITTEST_RESIZE_BOTTOMLEFT,  /**< Region is the resizable bottom-left corner border. */
    SDL_HITTEST_RESIZE_LEFT         /**< Region is the resizable left border. */
end type

public constant xSDL_SetWindowHitTest = define_c_func(sdl,"+SDL_SetWindowHitTest",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetWindowHitTest(atom window,object cb,object cb_data)
	return c_func(xSDL_SetWindowHitTest,{window,cb,cb_data})
end function

public constant xSDL_SetWindowShape = define_c_func(sdl,"+SDL_SetWindowShape",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetWindowShape(atom window,atom shape)
	return c_func(xSDL_SetWindowShape,{window,shape})
end function

public constant xSDL_FlashWindow = define_c_func(sdl,"+SDL_FlashWindow",{C_POINTER,C_INT},C_BOOL)

public function SDL_FlashWindow(atom window,SDL_FlashOperation operation)
	return c_func(xSDL_FlashWindow,{window,operation})
end function

public constant xSDL_DestroyWindow = define_c_proc(sdl,"+SDL_DestroyWindow",{C_POINTER})

public procedure SDL_DestroyWindow(atom window)
	c_proc(xSDL_DestroyWindow,{window})
end procedure

public constant xSDL_ScreenSaverEnabled = define_c_func(sdl,"+SDL_ScreenSaverEnabled",{},C_BOOL)

public function SDL_ScreenSaverEnabled()
	return c_func(xSDL_ScreenSaverEnabled,{})
end function

public constant xSDL_EnableScreenSaver = define_c_func(sdl,"+SDL_EnableScreenSaver",{},C_BOOL)

public function SDL_EnableScreenSaver()
	return c_func(xSDL_EnableScreenSaver,{})
end function

public constant xSDL_DisableScreenSaver = define_c_func(sdl,"+SDL_DisableScreenSaver",{},C_BOOL)

public function SDL_DisableScreenSaver()
	return c_func(xSDL_DisableScreenSaver,{})
end function

public constant xSDL_GL_LoadLibrary = define_c_func(sdl,"+SDL_GL_LoadLibrary",{C_STRING},C_BOOL)

public function SDL_GL_LoadLibrary(sequence path)
	return c_func(xSDL_GL_LoadLibrary,{path})
end function

public constant xSDL_GL_GetProcAddress = define_c_func(sdl,"+SDL_GL_GetProcAddress",{C_STRING},C_POINTER)

public function SDL_GL_GetProcAddress(sequence proc)
	return c_func(xSDL_GL_GetProcAddress,{proc})
end function

public constant xSDL_EGL_GetProcAddress = define_c_func(sdl,"+SDL_EGL_GetProcAddress",{C_STRING},C_POINTER)

public function SDL_EGL_GetProcAddress(sequence proc)
	return c_func(xSDL_EGL_GetProcAddress,{proc})
end function

public constant xSDL_GL_UnloadLibrary = define_c_proc(sdl,"+SDL_GL_UnloadLibrary",{})

public procedure SDL_GL_UnloadLibrary()
	c_proc(xSDL_GL_UnloadLibrary,{})
end procedure

public constant xSDL_GL_ExtensionSupported = define_c_func(sdl,"+SDL_GL_ExtensionSupported",{C_STRING},C_BOOL)

public function SDL_GL_ExtensionSupported(sequence extension)
	return c_func(xSDL_GL_ExtensionSupported,{extension})
end function

public constant xSDL_GL_ResetAttributes = define_c_proc(sdl,"+SDL_GL_ResetAttributes",{})

public procedure SDL_GL_ResetAttributes()
	c_proc(xSDL_GL_ResetAttributes,{})
end procedure

public constant xSDL_GL_SetAttribute = define_c_func(sdl,"+SDL_GL_SetAttribute",{C_INT,C_INT},C_BOOL)

public function SDL_GL_SetAttribute(SDL_GLAttr attr,atom val)
	return c_func(xSDL_GL_SetAttribute,{attr,val})
end function

public constant xSDL_GL_GetAttribute = define_c_func(sdl,"+SDL_GL_GetAttribute",{C_INT,C_POINTER},C_BOOL)

public function SDL_GL_GetAttribute(SDL_GLAttr attr,atom val)
	return c_func(xSDL_GL_GetAttribute,{attr,val})
end function

public constant xSDL_GL_CreateContext = define_c_func(sdl,"+SDL_GL_CreateContext",{C_POINTER},C_UINT32)

public function SDL_GL_CreateContext(atom window)
	return c_func(xSDL_GL_CreateContext,{window})
end function

public constant xSDL_GL_MakeCurrent = define_c_func(sdl,"+SDL_GL_MakeCurrent",{C_POINTER,C_UINT32},C_BOOL)

public function SDL_GL_MakeCurrent(atom window,atom context)
	return c_func(xSDL_GL_MakeCurrent,{window,context})
end function

public constant xSDL_GL_GetCurrentWindow = define_c_func(sdl,"+SDL_GL_GetCurrentWindow",{},C_POINTER)

public function SDL_GL_GetCurrentWindow()
	return c_func(xSDL_GL_GetCurrentWindow,{})
end function

public constant xSDL_GL_GetCurrentContext = define_c_func(sdl,"+SDL_GL_GetCurrentContext",{},C_UINT32)

public function SDL_GL_GetCurrentContext()
	return c_func(xSDL_GL_GetCurrentContext,{})
end function

public constant xSDL_EGL_GetCurrentDisplay = define_c_func(sdl,"+SDL_EGL_GetCurrentDisplay",{},C_POINTER)

public function SDL_EGL_GetCurrentDisplay()
	return c_func(xSDL_EGL_GetCurrentDisplay,{})
end function

public constant xSDL_EGL_GetCurrentConfig = define_c_func(sdl,"+SDL_EGL_GetCurrentConfig",{},C_POINTER)

public function SDL_EGL_GetCurrentConfig()
	return c_func(xSDL_EGL_GetCurrentConfig,{})
end function

public constant xSDL_EGL_GetWindowSurface = define_c_func(sdl,"+SDL_EGL_GetWindowSurface",{C_POINTER},C_POINTER)

public function SDL_EGL_GetWindowSurface(atom window)
	return c_func(xSDL_EGL_GetWindowSurface,{window})
end function

public constant xSDL_EGL_SetAttributeCallbacks = define_c_proc(sdl,"+SDL_EGL_SetAttributeCallbacks",{C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_EGL_SetAttributeCallbacks(object platformAttribCB,object surfaceAttriCB,object contextAttriCB,atom userdata)
	c_proc(xSDL_EGL_SetAttributeCallbacks,{platformAttribCB,surfaceAttriCB,contextAttriCB,userdata})
end procedure

public constant xSDL_GL_SetSwapInterval = define_c_func(sdl,"+SDL_GL_SetSwapInterval",{C_INT},C_BOOL)

public function SDL_GL_SetSwapInterval(atom interval)
	return c_func(xSDL_GL_SetSwapInterval,{interval})
end function

public constant xSDL_GL_GetSwapInterval = define_c_func(sdl,"+SDL_GL_GetSwapInterval",{C_POINTER},C_BOOL)

public function SDL_GL_GetSwapInterval(atom interval)
	return c_func(xSDL_GL_GetSwapInterval,{interval})
end function

public constant xSDL_GL_SwapWindow = define_c_func(sdl,"+SDL_GL_SwapWindow",{C_POINTER},C_BOOL)

public function SDL_GL_SwapWindow(atom window)
	return c_func(xSDL_GL_SwapWindow,{window})
end function

public constant xSDL_GL_DestroyContext = define_c_func(sdl,"+SDL_GL_DestroyContext",{C_UINT32},C_BOOL)

public function SDL_GL_DestroyContext(atom context)
	return c_func(xSDL_GL_DestroyContext,{context})
end function

public constant xSDL_SetWindowProgressState = define_c_func(sdl,"+SDL_SetWindowProgressState",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetWindowProgressState(atom window,SDL_ProgressState state)
	return c_func(xSDL_SetWindowProgressState,{window,state})
end function

public constant xSDL_SetWindowProgressValue = define_c_func(sdl,"+SDL_SetWindowProgressValue",{C_POINTER,C_FLOAT},C_BOOL)

public function SDL_SetWindowProgressValue(atom window,atom val)
	return c_func(xSDL_SetWindowProgressValue,{window,val})
end function

public constant xSDL_GetWindowProgressState = define_c_func(sdl,"+SDL_GetWindowProgressState",{C_POINTER},C_INT)

public function SDL_GetWindowProgressState(atom window)
	return c_func(xSDL_GetWindowProgressState,{window})
end function

public constant xSDL_GetWindowProgressValue = define_c_func(sdl,"+SDL_GetWindowProgressValue",{C_POINTER},C_FLOAT)

public function SDL_GetWindowProgressValue(atom window)
	return c_func(xSDL_GetWindowProgressValue,{window})
end function
­960.52