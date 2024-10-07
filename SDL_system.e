include std/ffi.e

--include SDL_stdinc.e
include SDL_keyboard.e
include SDL_render.e
include SDL_video.e

include SDL3.e

public constant xSDL_SetWindowsMessageHook = define_c_proc(sdl,"+SDL_SetWindowsMessageHook",{C_POINTER,C_POINTER})

public procedure SDL_SetWindowsMessageHook(atom cb,atom userdata)
	c_proc(xSDL_SetWindowsMessageHook,{cb,userdata})
end procedure

public constant xSDL_Direct3D9GetAdapterIndex = define_c_func(sdl,"+SDL_Direct3D9GetAdapterIndex",{C_POINTER},C_INT)

public function SDL_Direct3D9GetAdapterIndex(atom id)
	return c_func(xSDL_Direct3D9GetAdapterIndex,{id})
end function

public constant xSDL_GetRenderD3D9Device = define_c_func(sdl,"+SDL_GetRenderD3D9Device",{C_POINTER},C_POINTER)

public function SDL_GetRenderD3D9Device(atom ren)
	return c_func(xSDL_GetRenderD3D9Device,{ren})
end function

public constant xSDL_GetRenderD3D11Device = define_c_func(sdl,"+SDL_GetRenderD3D11Device",{C_POINTER},C_POINTER)

public function SDL_GetRenderD3D11Device(atom ren)
	return c_func(xSDL_GetRenderD3D11Device,{ren})
end function

public constant xSDL_RenderGetD3D12Device = define_c_func(sdl,"+SDL_RenderGetD3D12Device",{C_POINTER},C_POINTER)

public function SDL_RenderGetD3D12Device(atom ren)
	return c_func(xSDL_RenderGetD3D12Device,{ren})
end function

public constant xSDL_DXGIGetOutputInfo = define_c_func(sdl,"+SDL_DXGIGetOutputInfo",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_DXGIGetOutputInfo(atom id,atom adapter,atom idx)
	return c_func(xSDL_DXGIGetOutputInfo,{id,adapter,idx})
end function

public constant xSDL_LinuxSetThreadPriority = define_c_func(sdl,"+SDL_LinuxSetThreadPriority",{C_INT64,C_INT},C_INT)

public function SDL_LiuxSetThreadPriority(atom id,atom pri)
	return c_func(xSDL_LinuxSetThreadPriority,{id,pri})
end function

public constant xSDL_LinuxSetThreadPriorityAndPolicy = define_c_func(sdl,"+SDL_LinuxSetThreadPriorityAndPolicy",{C_INT64,C_INT,C_INT},C_INT)

public function SDL_LinuxSetThreadPriorityAndPolicy(atom id,atom sdlpri,atom poli)
	return c_func(xSDL_LinuxSetThreadPriorityAndPolicy,{id,sdlpri,poli})
end function

public constant xSDL_AndroidGetJNIEnv = define_c_func(sdl,"+SDL_AndroidGetJNIEnv",{},C_POINTER)

public function SDL_AndroidGetJNIEnv()
	return c_func(xSDL_AndroidGetJNIEnv,{})
end function

public constant xSDL_AndroidGetActivity = define_c_func(sdl,"+SDL_AndroidGetActivity",{},C_POINTER)

public function SDL_AndroidGetActivity()
	return c_func(xSDL_AndroidGetActivity,{})
end function

public constant xSDL_GetAndroidSDKVersion = define_c_func(sdl,"+SDL_GetAndroidSDKVersion",{},C_INT)

public function SDL_GetAndroidSDKVersion()
	return c_func(xSDL_GetAndroidSDKVersion,{})
end function

public constant xSDL_IsAndroidTV = define_c_func(sdl,"+SDL_IsAndroidTV",{},C_BOOL)

public function SDL_IsAndroidTV()
	return c_func(xSDL_IsAndroidTV,{})
end function

public constant xSDL_IsChromebook = define_c_func(sdl,"+SDL_IsChromebook",{},C_BOOL)

public function SDL_IsChromebook()
	return c_func(xSDL_IsChromebook,{})
end function

public constant xSDL_IsDeXMode = define_c_func(sdl,"+SDL_IsDeXMode",{},C_BOOL)

public function SDL_IsDeXMode()
	return c_func(xSDL_IsDeXMode,{})
end function

public constant xSDL_AndroidBackButton = define_c_proc(sdl,"+SDL_AndroidBackButton",{})

public procedure SDL_AndroidBackButton()
	c_proc(xSDL_AndroidBackButton,{})
end procedure

public constant SDL_ANDROID_EXTERNAL_STORAGE_READ = 0x01,
				SDL_ANDROID_EXTERNAL_STORAGE_WRITE = 0x02
				
public constant xSDL_AndroidGetInternalStoragePath = define_c_func(sdl,"+SDL_AndroidGetInternalStoragePath",{},C_STRING)

public function SDL_AndroidGetInternalStoragePath()
	return c_func(xSDL_AndroidGetInternalStoragePath,{})
end function

public constant xSDL_AndroidGetExternalStorageState = define_c_func(sdl,"+SDL_AndroidGetExternalStorageState",{C_POINTER},C_INT)

public function SDL_AndroidGetExternalStorageState(atom st)
	return c_func(xSDL_AndroidGetExternalStorageState,{st})
end function

public constant xSDL_AndroidGetExternalStoragePath = define_c_func(sdl,"+SDL_AndroidGetExternalStoragePath",{},C_STRING)

public function SDL_AndroidGetExternalStoragePath()
	return c_func(xSDL_AndroidGetExternalStoragePath,{})
end function

public constant xSDL_AndroidRequestPermission = define_c_func(sdl,"+SDL_AndroidRequestPermission",{C_STRING},C_BOOL)

public function SDL_AndroidRequestPermission(sequence per)
	return c_func(xSDL_AndroidRequestPermission,{per})
end function

public constant xSDL_AndroidShowToast = define_c_func(sdl,"+SDL_AndroidShowToast",{C_STRING,C_INT,C_INT,C_INT,C_INT},C_INT)

public function SDL_AndroidShowToast(sequence msg,atom duration,atom gravity,atom x,atom y)
	return c_func(xSDL_AndroidShowToast,{msg,duration,gravity,x,y})
end function

public constant xSDL_AndroidSendMessage = define_c_func(sdl,"+SDL_AndroidSendMessage",{C_UINT32,C_INT},C_INT)

public function SDL_AndroidSendMessage(atom cmd,atom parm)
	return c_func(xSDL_AndroidSendMessage,{cmd,parm})
end function

public enum type SDL_WinRT_Path
	SDL_WINRT_PATH_INSTALLED_LOCATION = 0,
	SDL_WINRT_PATH_LOCAL_FOLDER,
	SDL_WINRT_PATH_ROAMING_FOLDER,
	SDL_WINRT_PAH_TEMP_FOLDER
end type

public enum type SDL_WinRT_DeviceFamily
	SDL_WINRT_DEVICEFAMILY_UNKNOWN = 0,
	SDL_WINRT_DEVICEFAMILY_DESKTOP,
	SDL_WINRT_DEVICEFAMILY_MOBILE,
	SDL_WINRT_DEVICEFAMILY_XBOX
end type

public constant xSDL_WinRTGetFSPathUNICODE = define_c_func(sdl,"+SDL_WinRTGetFSPathUNICODE",{C_INT},C_WSTRING)

public function SDL_WinRTGetFSPathUNICODE(SDL_WinRT_Path path)
	return c_func(xSDL_WinRTGetFSPathUNICODE,{path})
end function

public constant xSDL_WinRTGetFSPathUTF8 = define_c_func(sdl,"+SDL_WinRTGetFSPathUTF8",{C_INT},C_STRING)

public function SDL_WinRTGetFSPathUTF8(SDL_WinRT_Path path)
	return c_func(xSDL_WinRTGetFSPathUTF8,{path})
end function

public constant xSDL_WinRTGetDeviceFamily = define_c_func(sdl,"+SDL_WinRTGetDeviceFamily",{},C_INT)

public function SDL_WinRTGetDeviceFamily()
	return c_func(xSDL_WinRTGetDeviceFamily,{})
end function

public constant xSDL_IsTablet = define_c_func(sdl,"+SDL_IsTablet",{},C_BOOL)

public function SDL_IsTablet()
	return c_func(xSDL_IsTablet,{})
end function

public constant xSDL_OnApplicationWillTerminate = define_c_proc(sdl,"+SDL_OnApplicationWillTerminate",{})

public procedure SDL_OnApplicationWillTerminate()
	c_proc(xSDL_OnApplicationWillTerminate,{})
end procedure

public constant xSDL_OnApplicationDidReceiveMemoryWarning = define_c_proc(sdl,"+SDL_OnApplicationDidReceiveMemoryWarning",{})

public procedure SDL_OnApplicationDidReceiveMemoryWarning()
	c_proc(xSDL_OnApplicationDidReceiveMemoryWarning,{})
end procedure

public constant xSDL_OnApplicationWillResignActive = define_c_proc(sdl,"+SDL_OnApplicationWillResignActive",{})

public procedure SDL_OnApplicationWillResignActive()
	c_proc(xSDL_OnApplicationWillResignActive,{})
end procedure

public constant xSDL_OnApplicationDidEnterBackground = define_c_proc(sdl,"+SDL_OnApplicationDidEnterBackground",{})

public procedure SDL_OnApplicationDidEnterBackground()
	c_proc(xSDL_OnApplicationDidEnterBackground,{})
end procedure

public constant xSDL_OnApplicationWillEnterForeground = define_c_proc(sdl,"+SDL_OnApplicationWillEnterForeground",{})

public procedure SDL_OnApplicationWillEnterForeground()
	c_proc(xSDL_OnApplicationWillEnterForeground,{})
end procedure

public constant xSDL_OnApplicationDidBecomeActive = define_c_proc(sdl,"+SDL_OnApplicationDidBecomeActive",{})

public procedure SDL_OnApplicationDidBecomeActive()
	c_proc(xSDL_OnApplicationDidBecomeActive,{})
end procedure
­177.63