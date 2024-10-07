include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_GUID = define_c_struct({
	{C_UINT8,16} --data[16]
})

export constant xSDL_GUIDToString = define_c_func(sdl,"+SDL_GUIDToString",{SDL_GUID,C_STRING,C_INT},C_INT)

public function SDL_GUIDToString(sequence guid,sequence pszGUID,atom cbGUID)
	return c_func(xSDL_GUIDToString,{guid,pszGUID,cbGUID})
end function

export constant xSDL_GUIDFromString = define_c_func(sdl,"+SDL_GUIDFromString",{C_STRING},SDL_GUID)

public function SDL_GUIDFromString(sequence pchGUID)
	return c_func(xSDL_GUIDFromString,{pchGUID})
end function
­19.45
