include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e

public constant SDL_GUID = define_c_struct({
	{C_UINT,16} --data[16]
})

public constant xSDL_GUIDToString = define_c_proc(sdl,"+SDL_GUIDToString",{SDL_GUID,C_STRING,C_INT})

public procedure SDL_GUIDToString(sequence guid,sequence pszGUID,atom cbGUID)
	c_proc(xSDL_GUIDToString,{guid,pszGUID,cbGUID})
end procedure

public constant xSDL_StringToGUID = define_c_func(sdl,"+SDL_StringToGUID",{C_STRING},SDL_GUID)

public function SDL_StringToGUID(sequence pchGUID)
	return c_func(xSDL_StringToGUID,{pchGUID})
end function
­20.43