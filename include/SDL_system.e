include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_keyboard.e
include SDL_video.e

public constant xSDL_SetWindowsMessageHook = define_c_proc(sdl,"+SDL_SetWindowsMessageHook",{C_POINTER,C_POINTER})

public procedure SDL_SetWindowsMessageHook(object cb,atom userdata)
	c_proc(xSDL_SetWindowsMessageHook,{cb,userdata})
end procedure

public constant xSDL_GetDirect3D9AdapterIndex = define_c_func(sdl,"+SDL_GetDirect3D9AdapterIndex",{C_UINT32},C_INT)

public function SDL_GetDirect3D9AdapterIndex(atom displayID)
	return c_func(xSDL_GetDirect3D9AdapterIndex,{displayID})
end function

public constant xSDL_GetDXGIOutputInfo = define_c_func(sdl,"+SDL_GetDXGIOutputInfo",{C_UINT32,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetDXGIOutputInfo(atom displayID,atom adapterIndex,atom outputIndex)
	return c_func(xSDL_GetDXGIOutputInfo,{displayID,adapterIndex,outputIndex})
end function

public constant xSDL_SetX11EventHook = define_c_proc(sdl,"+SDL_SetX11EventHook",{C_POINTER,C_POINTER})

public procedure SDL_SetX11EventHook(object cb,atom userdata)
	c_proc(xSDL_SetX11EventHook,{cb,userdata})
end procedure

public constant xSDL_SetLinuxThreadPriority = define_c_func(sdl,"+SDL_SetLinuxThreadPriority",{C_INT64,C_INT},C_BOOL)

public function SDL_SetLinuxThreadPriority(atom threadID,atom priority)
	return c_func(xSDL_SetLinuxThreadPriority,{threadID,priority})
end function

public constant xSDL_SetLinuxThreadPriorityAndPolicy = define_c_func(sdl,"+SDL_SetLinuxThreadPriorityAndPolicy",{C_INT64,C_INT,C_INT},C_BOOL)

public function SDL_SetLinuxThreadPriorityAndPolicy(atom threadID,atom sdlPriority,atom schedPolicy)
	return c_func(xSDL_SetLinuxThreadPriorityAndPolicy,{threadID,sdlPriority,schedPolicy})
end function

public constant xSDL_SetiOSAnimationCallback = define_c_func(sdl,"+SDL_SetiOSAnimationCallback",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetiOSAnimationCallback(atom window,atom interval,object cb,atom cbParam)
	return c_func(xSDL_SetiOSAnimationCallback,{window,interval,cb,cbParam})
end function

public constant xSDL_SetiOSEventPump = define_c_proc(sdl,"+SDL_SetiOSEventPump",{C_BOOL})

public procedure SDL_SetiOSEventPump(atom enabled)
	c_proc(xSDL_SetiOSEventPump,{enabled})
end procedure

public constant xSDL_GetAndroidJNIEnv = define_c_func(sdl,"+SDL_GetAndroidJNIEnv",{},C_POINTER)

public function SDL_GetAndroidJNIEnv()
	return c_func(xSDL_GetAndroidJNIEnv,{})
end function

public constant xSDL_GetAndroidActivity = define_c_func(sdl,"+SDL_GetAndroidActivity",{},C_POINTER)

public function SDL_GetAndroidActivity()
	return c_func(xSDL_GetAndroidActivity,{})
end function

public constant xSDL_GetAndroidSDKVersion = define_c_func(sdl,"+SDL_GetAndroidSDKVersion",{},C_INT)

public function SDL_GetAndroidSDKVersion()
	return c_func(xSDL_GetAndroidSDKVersion,{})
end function

public constant xSDL_IsChromebook = define_c_func(sdl,"+SDL_IsChromebook",{},C_BOOL)

public function SDL_IsChromebook()
	return c_func(xSDL_IsChromebook,{})
end function

public constant xSDL_IsDeXMode = define_c_func(sdl,"+SDL_IsDeXMode",{},C_BOOL)

public function SDL_IsDeXMode()
	return c_func(xSDL_IsDeXMode,{})
end function

public constant xSDL_SendAndroidBackButton = define_c_proc(sdl,"+SDL_SendAndroidBackButton",{})

public procedure SDL_SendAndroidBackButton()
	c_proc(xSDL_SendAndroidBackButton,{})
end procedure

public constant SDL_ANDROID_EXTERNAL_STORAGE_READ = 0x01
public constant SDL_ANDROID_EXTERNAL_STORAGE_WRITE = 0x02

public constant xSDL_GetAndroidInternalStoragePath = define_c_func(sdl,"+SDL_GetAndroidInternalStoragePath",{},C_STRING)

public function SDL_GetAndroidInternalStoragePath()
	return c_func(xSDL_GetAndroidInternalStoragePath,{})
end function

public constant xSDL_GetAndroidExternalStorageState = define_c_func(sdl,"+SDL_GetAndroidExternalStorageState",{},C_UINT32)

public function SDL_GetAndroidExternalStorageState()
	return c_func(xSDL_GetAndroidExternalStorageState,{})
end function

public constant xSDL_GetAndroidExternalStoragePath = define_c_func(sdl,"+SDL_GetAndroidExternalStoragePath",{},C_STRING)

public function SDL_GetAndroidExternalStoragePath()
	return c_func(xSDL_GetAndroidExternalStoragePath,{})
end function

public constant xSDL_GetAndroidCachePath = define_c_func(sdl,"+SDL_GetAndroidCachePath",{},C_STRING)

public function SDL_GetAndroidCachePath()
	return c_func(xSDL_GetAndroidCachePath,{})
end function

public constant xSDL_RequestAndroidPermission = define_c_func(sdl,"+SDL_RequestAndroidPermission",{C_STRING,C_POINTER,C_POINTER},C_BOOL)

public function SDL_RequestAndroidPermission(sequence permission,object cb,atom userdata)
	return c_func(xSDL_RequestAndroidPermission,{permission,cb,userdata})
end function

public constant xSDL_ShowAndroidToast = define_c_func(sdl,"+SDL_ShowAndroidToast",{C_STRING,C_INT,C_INT,C_INT,C_INT},C_BOOL)

public function SDL_ShowAndroidToast(sequence message,atom duration,atom gravity,atom x,atom y)
	return c_func(xSDL_ShowAndroidToast,{message,duration,gravity,x,y})
end function

public constant xSDL_SendAndroidMessage = define_c_func(sdl,"+SDL_SendAndroidMessage",{C_UINT32,C_INT},C_BOOL)

public function SDL_SendAndroidMessage(atom cmd,atom param)
	return c_func(xSDL_SendAndroidMessage,{cmd,param})
end function

public constant xSDL_IsTablet = define_c_func(sdl,"+SDL_IsTablet",{},C_BOOL)

public function SDL_IsTablet()
	return c_func(xSDL_IsTablet,{})
end function

public constant xSDL_IsTV = define_c_func(sdl,"+SDL_IsTV",{},C_BOOL)

public function SDL_IsTV()
	return c_func(xSDL_IsTV,{})
end function

public enum type SD_Sandbox
	SDL_SANDBOX_NONE = 0,
	SDL_SANDBOX_UNKNOWN_CONTAINER,
	SDL_SANDBOX_FLATPAK,
	SDL_SANDBOX_SNAP,
	SDL_SANDBOX_MACOS
end type

public constant xSDL_GetSandbox = define_c_func(sdl,"+SDL_GetSandbox",{},C_INT)

public function SDL_GetSandbox()
	return c_func(xSDL_GetSandbox,{})
end function

public constant xSDL_OnApplicationWillTerminate = define_c_proc(sdl,"+SDL_OnApplicationWillTerminate",{})

public procedure SDL_OnApplicationWillTerminate()
	c_proc(xSDL_OnApplicationWillTerminate,{})
end procedure

public constant xSDL_OnApplicationDidReceiveMemoryWarning = define_c_proc(sdl,"+SDL_OnApplicationDidReceiveMemoryWarning",{})

public procedure SDL_OnApplicationDidReceiveMemoryWarning()
	c_proc(xSDL_OnApplicationDidReceiveMemoryWarning,{})
end procedure

public constant xSDL_OnApplicationWillEnterBackground = define_c_proc(sdl,"+SDL_OnApplicationWillEnterBackground",{})

public procedure SDL_OnApplicationWillEnterBackground()
	c_proc(xSDL_OnApplicationWillEnterBackground,{})
end procedure

public constant xSDL_OnApplicationDidEnterBackground = define_c_proc(sdl,"+SDL_OnApplicationDidEnterBackground",{})

public procedure SDL_OnApplicationDidEnterBackground()
	c_proc(xSDL_OnApplicationDidEnterBackground,{})
end procedure

public constant xSDL_OnApplicationWillEnterForeground = define_c_proc(sdl,"+SDL_OnApplicationWillEnterForeground",{})

public procedure SDL_OnApplicationWillEnterForeground()
	c_proc(xSDL_OnApplicationWillEnterForeground,{})
end procedure

public constant xSDL_OnApplicationDidEnterForeground = define_c_proc(sdl,"+SDL_OnApplicationDidEnterForeground",{})

public procedure SDL_OnApplicationDidEnterForeground()
	c_proc(xSDL_OnApplicationDidEnterForeground,{})
end procedure

public constant xSDL_OnApplicationDidChangeStatusBarOrientation = define_c_proc(sdl,"+SDL_OnApplicationDidChangeStatusBarOrientation",{})

public procedure SDL_OnApplicationDidChangeStatusBarOrientation()
	c_proc(xSDL_OnApplicationDidChangeStatusBarOrientation,{})
end procedure

public constant xSDL_GetGDKTaskQueue = define_c_func(sdl,"+SDL_GetGDKTaskQueue",{C_POINTER},C_BOOL)

public function SDL_GetGDKTaskQueue(atom outTaskQueue)
	return c_func(xSDL_GetGDKTaskQueue,{outTaskQueue})
end function

public constant xSDL_GetGDKDefaultUser = define_c_func(sdl,"+SDL_GetGDKDefaultUser",{C_POINTER},C_BOOL)

public function SDL_GetGDKDefaultUser(atom outUserHandle)
	return c_func(xSDL_GetGDKDefaultUser,{outUserHandle})
end function
­25.61