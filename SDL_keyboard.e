include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_error.e
include SDL_keycode.e
include SDL_video.e

public constant SDL_Keysym = define_c_struct({
	C_INT, --scancode SDL_Scancode
	C_INT, --sym SDL_Keycode
	C_UINT16, --mod
	C_UINT32 --unused
})

export constant xSDL_GetKeyboardFocus = define_c_func(sdl,"+SDL_GetKeyboardFocus",{},C_POINTER)

public function SDL_GetKeyboardFocus()
	return c_func(xSDL_GetKeyboardFocus,{})
end function

export constant xSDL_GetKeyboardState = define_c_func(sdl,"+SDL_GetKeyboardState",{C_POINTER},C_POINTER)

public function SDL_GetKeyboardState(atom num)
	return c_func(xSDL_GetKeyboardState,{num})
end function

export constant xSDL_ResetKeyboard = define_c_proc(sdl,"+SDL_ResetKeyboard",{})

public procedure SDL_ResetKeyboard()
	c_proc(xSDL_ResetKeyboard,{})
end procedure

export constant xSDL_GetModState = define_c_func(sdl,"+SDL_GetModState",{},C_INT)

public function SDL_GetModState()
	return c_func(xSDL_GetModState,{})
end function

export constant xSDL_SetModState = define_c_proc(sdl,"+SDL_SetModState",{C_INT})

public procedure SDL_SetModState(atom modstate)
	c_proc(xSDL_SetModState,{modstate})
end procedure

export constant xSDL_GetKeyFromScancode = define_c_func(sdl,"+SDL_GetKeyFromScancode",{C_INT},C_INT)

public function SDL_GetKeyFromScancode(atom scancode)
	return c_func(xSDL_GetKeyFromScancode,{scancode})
end function

export constant xSDL_GetScancodeFromKey = define_c_func(sdl,"+SDL_GetScancodeFromKey",{C_INT},C_INT)

public function SDL_GetScancodeFromKey(atom key)
	return c_func(xSDL_GetScancodeFromKey,{key})
end function

export constant xSDL_GetScancodeName = define_c_func(sdl,"+SDL_GetScancodeName",{C_INT},C_STRING)

public function SDL_GetScancodeName(atom scan)
	return c_func(xSDL_GetScancodeName,{scan})
end function

export constant xSDL_GetScancodeFromName = define_c_func(sdl,"+SDL_GetScancodeFromName",{C_STRING},C_INT)

public function SDL_GetScancodeFromName(sequence name)
	return c_func(xSDL_GetScancodeFromName,{name})
end function

export constant xSDL_GetKeyName = define_c_func(sdl,"+SDL_GetKeyName",{C_INT},C_STRING)

public function SDL_GetKeyName(atom key)
	return c_func(xSDL_GetKeyName,{key})
end function

export constant xSDL_GetKeyFromName = define_c_func(sdl,"+SDL_GetKeyFromName",{C_STRING},C_INT)

public function SDL_GetKeyFromName(sequence name)
	return c_func(xSDL_GetKeyFromName,{name})
end function

export constant xSDL_StartTextInput = define_c_proc(sdl,"+SDL_StartTextInput",{})

public procedure SDL_StartTextInput()
	c_proc(xSDL_StartTextInput,{})
end procedure

export constant xSDL_TextInputActive = define_c_func(sdl,"+SDL_TextInputActive",{},C_BOOL)

public function SDL_TextInputActive()
	return c_func(xSDL_TextInputActive,{})
end function

export constant xSDL_StopTextInput = define_c_proc(sdl,"+SDL_StopTextInput",{})

public procedure SDL_StopTextInput()
	c_proc(xSDL_StopTextInput,{})
end procedure

export constant xSDL_ClearComposition = define_c_proc(sdl,"+SDL_ClearComposition",{})

public procedure SDL_ClearComposition()
	c_proc(xSDL_ClearComposition,{})
end procedure

export constant xSDL_TextInputShown = define_c_func(sdl,"+SDL_TextInputShown",{},C_BOOL)

public function SDL_TextInputShown()
	return c_func(xSDL_TextInputShown,{})
end function

export constant xSDL_SetTextInputRect = define_c_func(sdl,"+SDL_SetTextInputRect",{C_POINTER},C_INT)

public function SDL_SetTextInputRect(atom rect)
	return c_func(xSDL_SetTextInputRect,{rect})
end function

export constant xSDL_HasScreenKeyboardSupport = define_c_func(sdl,"+SDL_HasScreenKeyboardSupport",{},C_BOOL)

public function SDL_HasScreenKeyboardSupport()
	return c_func(xSDL_HasScreenKeyboardSupport,{})
end function

export constant xSDL_ScreenKeyboardShown = define_c_func(sdl,"+SDL_ScreenKeyboardShown",{C_POINTER},C_BOOL)

public function SDL_ScreenKeyboardShown(atom window)
	return c_func(xSDL_ScreenKeyboardShown,{window})
end function
­111.34