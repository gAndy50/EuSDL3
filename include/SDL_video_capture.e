include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_video.e

public constant SDL_VIDEO_CAPTURE_ALLOW_ANY_CHANGE = 1

public constant SDL_VideoCaptureSpec = define_c_struct({
	C_UINT32, --format
	C_INT, --width
	C_INT  --height
})

public enum type SDL_VideoCaptureStatus
	SDL_VIDEO_CAPTURE_FAIL = -1,
	SDL_VIDEO_CAPTURE_INIT = 0,
	SDL_VIDEO_CAPTURE_STOPPED,
	SDL_VIDEO_CAPTURE_PLAYING
end type

public constant SDL_VideoCaptureFrame = define_c_struct({
	C_UINT64, --timestampNS
	C_INT, --num_planes
	{C_POINTER,3}, --data[3]
	{C_INT,3}, --pitch[3]
	C_POINTER --internal
})

public constant xSDL_GetVideoCaptureDevices = define_c_func(sdl,"+SDL_GetVideoCaptureDevices",{C_POINTER},C_POINTER)

public function SDL_GetVideoCaptureDevices(atom count)
	return c_func(xSDL_GetVideoCaptureDevices,{count})
end function

public constant xSDL_OpenVideoCapture = define_c_func(sdl,"+SDL_OpenVideoCapture",{C_UINT32},C_POINTER)

public function SDL_OpenVideoCapture(atom id)
	return c_func(xSDL_OpenVideoCapture,{id})
end function

public constant xSDL_SetVideoCaptureSpec = define_c_func(sdl,"+SDL_SetVideoCaptureSpec",{C_POINTER,C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_SetVideoCaptureSpec(atom device,atom desired,atom obtained,atom allow)
	return c_func(xSDL_SetVideoCaptureSpec,{device,desired,obtained,allow})
end function

public constant xSDL_OpenVideoCaptureWithSpec = define_c_func(sdl,"+SDL_OpenVideoCaptureWithSpec",{C_UINT32,C_POINTER,C_POINTER,C_INT},C_POINTER)

public function SDL_OpenVideoCaptureWithSpec(atom id,atom desired,atom obtained,atom allow)
	return c_func(xSDL_OpenVideoCaptureWithSpec,{id,desired,obtained,allow})
end function

public constant xSDL_GetVideoCaptureDeviceName = define_c_func(sdl,"+SDL_GetVideoCaptureDeviceName",{C_UINT32},C_STRING)

public function SDL_GetVideoCaptureDeviceName(atom id)
	return c_func(xSDL_GetVideoCaptureDeviceName,{id})
end function

public constant xSDL_GetVideoCaptureSpec = define_c_func(sdl,"+SDL_GetVideoCaptureSpec",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetVideoCaptureSpec(atom device,atom spec)
	return c_func(xSDL_GetVideoCaptureSpec,{device,spec})
end function

public constant xSDL_GetVideoCaptureFormat = define_c_func(sdl,"+SDL_GetVideoCaptureFormat",{C_POINTER,C_INT,C_POINTER},C_INT)

public function SDL_GetVideoCaptureFormat(atom device,atom idx,atom format)
	return c_func(xSDL_GetVideoCaptureFormat,{device,idx,format})
end function

public constant xSDL_GetNumVideoCaptureFormats = define_c_func(sdl,"+SDL_GetNumVideoCaptureFormats",{C_POINTER},C_INT)

public function SDL_GetNumVideoCaptureFormats(atom device)
	return c_func(xSDL_GetNumVideoCaptureFormats,{device})
end function

public constant xSDL_GetVideoCaptureFrameSize = define_c_func(sdl,"+SDL_GetVideoCaptureFrameSize",{C_POINTER,C_UINT32,C_INT,C_POINTER,C_POINTER},C_INT)

public function SDL_GetVideoCaptureFrameSize(atom dev,atom format,atom idx,atom w,atom h)
	return c_func(xSDL_GetVideoCaptureFrameSize,{dev,format,idx,w,h})
end function

public constant xSDL_GetNumVideoCaptureFrameSizes = define_c_func(sdl,"+SDL_GetNumVideoCaptureFrameSizes",{C_POINTER,C_UINT32},C_INT)

public function SDL_GetNumVideoCaptureFrameSizes(atom dev,atom format)
	return c_func(xSDL_GetNumVideoCaptureFrameSizes,{dev,format})
end function

public constant xSDL_GetVideoCaptureStatus = define_c_func(sdl,"+SDL_GetVideoCaptureStatus",{C_POINTER},C_INT)

public function SDL_GetVideoCaptureStatus(atom dev)
	return c_func(xSDL_GetVideoCaptureStatus,{dev})
end function

public constant xSDL_StartVideoCapture = define_c_func(sdl,"+SDL_StartVideoCapture",{C_POINTER},C_INT)

public function SDL_StartVideoCapture(atom dev)
	return c_func(xSDL_StartVideoCapture,{dev})
end function

public constant xSDL_AcquireVideoCaptureFrame = define_c_func(sdl,"+SDL_AcquireVideoCaptureFrame",{C_POINTER,C_POINTER},C_INT)

public function SDL_AcquireVideoCaptureFrame(atom dev,atom frame)
	return c_func(xSDL_AcquireVideoCaptureFrame,{dev,frame})
end function

public constant xSDL_ReleaseVideoCaptureFrame = define_c_func(sdl,"+SDL_ReleaseVideoCaptureFrame",{C_POINTER,C_POINTER},C_INT)

public function SDL_ReleaseVideoCaptureFrame(atom dev,atom frame)
	return c_func(xSDL_ReleaseVideoCaptureFrame,{dev,frame})
end function

public constant xSDL_StopVideoCapture = define_c_func(sdl,"+SDL_StopVideoCapture",{C_POINTER},C_INT)

public function SDL_StopVideoCapture(atom dev)
	return c_func(xSDL_StopVideoCapture,{dev})
end function

public constant xSDL_CloseVideoCapture = define_c_proc(sdl,"+SDL_CloseVideoCapture",{C_POINTER})

public procedure SDL_CloseVideoCapture(atom dev)
	c_proc(xSDL_CloseVideoCapture,{dev})
end procedure
­125.37
