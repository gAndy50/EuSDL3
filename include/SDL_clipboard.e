include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public constant xSDL_SetClipboardText = define_c_func(sdl,"+SDL_SetClipboardText",{C_STRING},C_BOOL)

public function SDL_SetClipboardText(sequence text)
	return c_func(xSDL_SetClipboardText,{text})
end function

public constant xSDL_GetClipboardText = define_c_func(sdl,"+SDL_GetClipboardText",{},C_STRING)

public function SDL_GetClipboardText()
	return c_func(xSDL_GetClipboardText,{})
end function

public constant xSDL_HasClipboardText = define_c_func(sdl,"+SDL_HasClipboardText",{},C_BOOL)

public function SDL_HasClipboardText()
	return c_func(xSDL_HasClipboardText,{})
end function

public constant xSDL_SetPrimarySelectionText = define_c_func(sdl,"+SDL_SetPrimarySelectionText",{C_STRING},C_BOOL)

public function SDL_SetPrimarySelectionText(sequence text)
	return c_func(xSDL_SetPrimarySelectionText,{text})
end function

public constant xSDL_GetPrimarySelectionText = define_c_func(sdl,"+SDL_GetPrimarySelectionText",{},C_STRING)

public function SDL_GetPrimarySelectionText()
	return c_func(xSDL_GetPrimarySelectionText,{})
end function

public constant xSDL_HasPrimarySelectionText = define_c_func(sdl,"+SDL_HasPrimarySelectionText",{},C_BOOL)

public function SDL_HasPrimarySelectionText()
	return c_func(xSDL_HasPrimarySelectionText,{})
end function

public constant xSDL_SetClipboardData = define_c_func(sdl,"+SDL_SetClipboardData",{C_POINTER,C_POINTER,C_POINTER,C_STRING,C_SIZE_T},C_BOOL)

public function SDL_SetClipboardData(object cb,object cb2,atom userdata,sequence mime_types,atom num_mime)
	return c_func(xSDL_SetClipboardData,{cb,cb2,userdata,mime_types,num_mime})
end function

public constant xSDL_ClearClipboardData = define_c_func(sdl,"+SDL_ClearClipboardData",{},C_BOOL)

public function SDL_ClearClipboardData()
	return c_func(xSDL_ClearClipboardData,{})
end function

public constant xSDL_GetClipboardData = define_c_func(sdl,"+SDL_GetClipboardData",{C_STRING,C_POINTER},C_POINTER)

public function SDL_GetClipboardData(sequence mime_type,atom size)
	return c_func(xSDL_GetClipboardData,{mime_type,size})
end function

public constant xSDL_HasClipboardData = define_c_func(sdl,"+SDL_HasClipboardData",{C_STRING},C_BOOL)

public function SDL_HasClipboardData(sequence mime_type)
	return c_func(xSDL_HasClipboardData,{mime_type})
end function

public constant xSDL_GetClipboardMimeTypes = define_c_func(sdl,"+SDL_GetClipboardMimeTypes",{C_POINTER},C_STRING)

public function SDL_GetClipboardMimeTypes(atom num_mime)
	return c_func(xSDL_GetClipboardMimeTypes,{num_mime})
end function
­71.53