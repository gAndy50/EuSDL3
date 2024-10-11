include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_CameraDeviceID = C_UINT32

public constant SDL_CameraSpec = define_c_struct({
 C_INT, --format
 C_INT, --colorspace
 C_INT, --width
 C_INT, --height
 C_INT, --framerate_numerator
 C_INT  --framerate_denominator
})

public enum type SDL_CameraPosition 
	SDL_CAMERA_POSITION_UNKNOWN = 0,
	SDL_CAMERA_POSITION_FRONT_FACING,
	SDL_CAMERA_POSITION_BACK_FACING
end type

public constant xSDL_GetNumCameraDrivers = define_c_func(sdl,"+SDL_GetNumCameraDrivers",{},C_INT)

public function SDL_GetNumCameraDrivers()
	return c_func(xSDL_GetNumCameraDrivers,{})
end function

public constant xSDL_GetCameraDriver = define_c_func(sdl,"+SDL_GetCameraDriver",{C_INT},C_STRING)

public function SDL_GetCameraDriver(atom index)
	return c_func(xSDL_GetCameraDriver,{index})
end function

public constant xSDL_GetCurrentCameraDriver = define_c_func(sdl,"+SDL_GetCurrentCameraDriver",{},C_STRING)

public function SDL_GetCurrentCameraDriver()
	return c_func(xSDL_GetCurrentCameraDriver,{})
end function

public constant xSDL_GetCameraDevices = define_c_func(sdl,"+SDL_GetCameraDevices",{C_POINTER},C_POINTER)

public function SDL_GetCameraDevices(atom count)
	return c_func(xSDL_GetCameraDevices,{count})
end function

public constant xSDL_GetCameraDeviceSupportedFormats = define_c_func(sdl,"+SDL_GetCameraSupportedFormats",{SDL_CameraDeviceID,C_POINTER},C_POINTER)

public function SDL_GetCameraDeviceSupportedFormats(atom id,atom count)
	return c_func(xSDL_GetCameraDeviceSupportedFormats,{id,count})
end function

public constant xSDL_GetCameraDeviceName = define_c_func(sdl,"+SDL_GetCameraDeviceName",{SDL_CameraDeviceID},C_STRING)

public function SDL_GetCameraDeviceName(atom id)
	return c_func(xSDL_GetCameraDeviceName,{id})
end function

public constant xSDL_GetCameraDevicePosition = define_c_func(sdl,"+SDL_GetCameraDevicePosition",{SDL_CameraDeviceID},C_INT)

public function SDL_GetCameraDevicePosition(atom id)
	return c_func(xSDL_GetCameraDevicePosition,{id})
end function

public constant xSDL_OpenCameraDevice = define_c_func(sdl,"+SDL_OpenCameraDevice",{SDL_CameraDeviceID,C_POINTER},C_POINTER)

public function SDL_OpenCameraDevice(atom id,atom spec)
	return c_func(xSDL_OpenCameraDevice,{id,spec})
end function

public constant xSDL_GetCameraPermissionState = define_c_func(sdl,"+SDL_GetCameraPermissionState",{C_POINTER},C_INT)

public function SDL_GetCameraPermissionState(atom cam)
	return c_func(xSDL_GetCameraPermissionState,{cam})
end function

public constant xSDL_GetCameraInstanceID = define_c_func(sdl,"+SDL_GetCameraInstanceID",{C_POINTER},SDL_CameraDeviceID)

public function SDL_GetCameraInstanceID(atom cam)
	return c_func(xSDL_GetCameraInstanceID,{cam})
end function

public constant xSDL_GetCameraProperties = define_c_func(sdl,"+SDL_GetCameraProperties",{C_POINTER},C_INT)

public function SDL_GetCameraProperties(atom cam)
	return c_func(xSDL_GetCameraProperties,{cam})
end function

public constant xSDL_GetCameraFormat = define_c_func(sdl,"+SDL_GetCameraFormat",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetCameraFormat(atom cam,atom spec)
	return c_func(xSDL_GetCameraFormat,{cam,spec})
end function

public constant xSDL_AcquireCameraFrame = define_c_func(sdl,"+SDL_AcquireCameraFrame",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_AcquireCameraFrame(atom cam,atom ts)
	return c_func(xSDL_AcquireCameraFrame,{cam,ts})
end function

public constant xSDL_ReleaseCameraFrame = define_c_func(sdl,"+SDL_ReleaseCameraFrame",{C_POINTER,C_POINTER},C_INT)

public function SDL_ReleaseCameraFrame(atom cam,atom frame)
	return c_func(xSDL_ReleaseCameraFrame,{cam,frame})
end function

public constant xSDL_CloseCamera = define_c_proc(sdl,"+SDL_CloseCamera",{C_POINTER})

public procedure SDL_CloseCamera(atom cam)
	c_proc(xSDL_CloseCamera,{cam})
end procedure
­14.19