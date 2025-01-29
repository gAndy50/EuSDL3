include std/ffi.e
include std/machine.e

include SDL.e

public constant SDL_InitFlags = C_UINT32

public constant SDL_INIT_AUDIO = 0x00000010
public constant SDL_INIT_VIDEO = 0x00000020
public constant SDL_INIT_JOYSTICK = 0x00000200
public constant SDL_INIT_HAPTIC = 0x00001000
public constant SDL_INIT_GAMEPAD = 0x00002000
public constant SDL_INIT_EVENTS = 0x00004000
public constant SDL_INIT_SENSOR = 0x00008000
public constant SDL_INIT_CAMERA = 0x00010000

public enum type SDL_AppResult
	SDL_APP_CONTINUE = 0,
	SDL_APP_SUCCESS,
	SDL_APP_FAILURE
end type

public constant xSDL_Init = define_c_func(sdl,"+SDL_Init",{C_UINT32},C_BOOL)

public function SDL_Init(atom flags)
	return c_func(xSDL_Init,{flags})
end function

public constant xSDL_InitSubSystem = define_c_func(sdl,"+SDL_InitSubSystem",{C_UINT32},C_BOOL)

public function SDL_InitSubSystem(atom flags)
	return c_func(xSDL_InitSubSystem,{flags})
end function

public constant xSDL_QuitSubSystem = define_c_proc(sdl,"+SDL_QuitSubSystem",{C_UINT32})

public procedure SDL_QuitSubSystem(atom flags)
	c_proc(xSDL_QuitSubSystem,{flags})
end procedure

public constant xSDL_WasInit = define_c_func(sdl,"+SDL_WasInit",{C_UINT32},C_UINT32)

public function SDL_WasInit(atom flags)
	return c_func(xSDL_WasInit,{flags})
end function

public constant xSDL_Quit = define_c_proc(sdl,"+SDL_Quit",{})

public procedure SDL_Quit()
	c_proc(xSDL_Quit,{})
end procedure

public constant xSDL_IsMainThread = define_c_func(sdl,"+SDL_IsMainThread",{},C_BOOL)

public function SDL_IsMainThread()
	return c_func(xSDL_IsMainThread,{})
end function

public constant xSDL_RunOnMainThread = define_c_func(sdl,"+SDL_RunOnMainThread",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function SDL_RunOnMainThread(object cb,atom userdata,atom wait_complete)
	return c_func(xSDL_RunOnMainThread,{cb,userdata,wait_complete})
end function

public constant xSDL_SetAppMetadata = define_c_func(sdl,"+SDL_SetAppMetadata",{C_STRING,C_STRING,C_STRING},C_BOOL)

public function SDL_SetAppMetadata(sequence appname,sequence appversion,sequence appidentifier)
	return c_func(xSDL_SetAppMetadata,{appname,appversion,appidentifier})
end function

public constant xSDL_SetAppMetadataProperty = define_c_func(sdl,"+SDL_SetAppMetadataProperty",{C_STRING,C_STRING},C_BOOL)

public function SDL_SetAppMetadataProperty(sequence name,sequence val)
	return c_func(xSDL_SetAppMetadataProperty,{name,val})
end function

public constant SDL_PROP_APP_METADATA_NAME_STRING = "SDL.app.metadata.name",
 SDL_PROP_APP_METADATA_VERSION_STRING   =   "SDL.app.metadata.version",
 SDL_PROP_APP_METADATA_IDENTIFIER_STRING =  "SDL.app.metadata.identifier",
 SDL_PROP_APP_METADATA_CREATOR_STRING    =  "SDL.app.metadata.creator",
 SDL_PROP_APP_METADATA_COPYRIGHT_STRING  =  "SDL.app.metadata.copyright",
 SDL_PROP_APP_METADATA_URL_STRING       =   "SDL.app.metadata.url",
 SDL_PROP_APP_METADATA_TYPE_STRING     =    "SDL.app.metadata.type"
 
public constant xSDL_GetAppMetadataProperty = define_c_func(sdl,"+SDL_GetAppMetadataProperty",{C_STRING},C_STRING)

public function SDL_GetAppMetadataProperty(sequence name)
	return c_func(xSDL_GetAppMetadataProperty,{name})
end function
­82.67