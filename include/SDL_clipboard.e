include std/ffi.e
include std/machine.e

include SDL3.e

public constant xSDL_SetClipboardText = define_c_func(sdl,"+SDL_SetClipboardText",{C_STRING},C_INT)

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

export constant xSDL_SetPrimarySelectionText = define_c_func(sdl,"+SDL_SetPrimarySelectionText",{C_STRING},C_INT)

public function SDL_SetPrimarySelectionText(sequence text)
	return c_func(xSDL_SetPrimarySelectionText,{text})
end function

export constant xSDL_GetPrimarySelectionText = define_c_func(sdl,"+SDL_GetPrimarySelectionText",{},C_STRING)

public function SDL_GetPrimarySelectionText()
	return c_func(xSDL_GetPrimarySelectionText,{})
end function

public constant xSDL_HasPrimarySelectionText = define_c_func(sdl,"+SDL_HasPrimarySelectionText",{},C_BOOL)

public function SDL_HasPrimarySelectionText()
	return c_func(xSDL_HasPrimarySelectionText,{})
end function

export constant xSDL_SetClipboardData = define_c_func(sdl,"+SDL_SetClipboardData",{C_POINTER,C_SIZE_T,C_STRING,C_POINTER},C_INT)

public function SDL_SetClipboardData(atom cb,atom mime_count,sequence mime_types,object userdata)
	return c_func(xSDL_SetClipboardData,{cb,mime_count,mime_types,userdata})
end function

export constant xSDL_GetClipboardUserdata = define_c_func(sdl,"+SDL_GetClipboardUserdata",{},C_POINTER)

public function SDL_GetClipboardUserdata()
	return c_func(xSDL_GetClipboardUserdata,{})
end function

export constant xSDL_GetClipboardData = define_c_func(sdl,"+SDL_GetClipboardData",{C_POINTER,C_STRING},C_POINTER)

public function SDL_GetClipboardData(atom len,sequence mime_type)
	return c_func(xSDL_GetClipboardData,{len,mime_type})
end function

export constant xSDL_HasClipboardData = define_c_func(sdl,"+SDL_HasClipboardData",{C_STRING},C_BOOL)

public function SDL_HasClipboardData(sequence mime_type)
	return c_func(xSDL_HasClipboardData,{mime_type})
end function
­63.49