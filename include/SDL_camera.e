include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_pixels.e
include SDL_properties.e
include SDL_surface.e

public constant SDL_CameraID = C_UINT32

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

public enum type SDL_CameraPermissionState
	SDL_CAMERA_PERMISSION_STATE_DENIED = -1,
	SDL_CAMERA_PERMISSION_STATE_PENDING = 0,
	SDL_CAMERA_PERMISSION_STATE_APPROVED
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

public constant xSDL_GetCameras = define_c_func(sdl,"+SDL_GetCameras",{C_POINTER},C_POINTER)

public function SDL_GetCameras(atom count)
	return c_func(xSDL_GetCameras,{count})
end function

public constant xSDL_GetCameraSupportedFormats = define_c_func(sdl,"+SDL_GetCameraSupportedFormats",{C_UINT32,C_POINTER},C_POINTER)

public function SDL_GetCameraSupportedFormats(atom devid,atom count)
	return c_func(xSDL_GetCameraSupportedFormats,{devid,count})
end function

public constant xSDL_GetCameraName = define_c_func(sdl,"+SDL_GetCameraName",{C_UINT32},C_STRING)

public function SDL_GetCameraName(atom id)
	return c_func(xSDL_GetCameraName,{id})
end function

public constant xSDL_GetCameraPosition = define_c_func(sdl,"+SDL_GetCameraPosition",{C_UINT32},C_INT)

public function SDL_GetCameraPosition(atom id)
	return c_func(xSDL_GetCameraPosition,{id})
end function

public constant xSDL_OpenCamera = define_c_func(sdl,"+SDL_OpenCamera",{C_UINT32,C_POINTER},C_POINTER)

public function SDL_OpenCamera(atom id,atom spec)
	return c_func(xSDL_OpenCamera,{id,spec})
end function

public constant xSDL_GetCameraPermissionState = define_c_func(sdl,"+SDL_GetCameraPermissionState",{C_POINTER},C_INT)

public function SDL_GetCameraPermissionState(atom camera)
	return c_func(xSDL_GetCameraPermissionState,{camera})
end function

public constant xSDL_GetCameraID = define_c_func(sdl,"+SDL_GetCameraID",{C_POINTER},C_UINT32)

public function SDL_GetCameraID(atom camera)
	return c_func(xSDL_GetCameraID,{camera})
end function

public constant xSDL_GetCameraProperties = define_c_func(sdl,"+SDL_GetCameraProperties",{C_POINTER},C_UINT32)

public function SDL_GetCameraProperties(atom camera)
	return c_func(xSDL_GetCameraProperties,{camera})
end function

public constant xSDL_GetCameraFormat = define_c_func(sdl,"+SDL_GetCameraFormat",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetCameraFormat(atom camera,atom spec)
	return c_func(xSDL_GetCameraFormat,{camera,spec})
end function

public constant xSDL_AcquireCameraFrame = define_c_func(sdl,"+SDL_AcquireCameraFrame",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_AcquireCameraFrame(atom camera,atom timestampNS)
	return c_func(xSDL_AcquireCameraFrame,{camera,timestampNS})
end function

public constant xSDL_ReleaseCameraFrame = define_c_proc(sdl,"+SDL_ReleaseCameraFrame",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseCameraFrame(atom camera,atom frame)
	c_proc(xSDL_ReleaseCameraFrame,{camera,frame})
end procedure

public constant xSDL_CloseCamera = define_c_proc(sdl,"+SDL_CloseCamera",{C_POINTER})

public procedure SDL_CloseCamera(atom camera)
	c_proc(xSDL_CloseCamera,{camera})
end procedure
­38.12