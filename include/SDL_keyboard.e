include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_keycode.e
include SDL_properties.e
include SDL_rect.e
include SDL_scancode.e
include SDL_video.e

public constant SDL_KeyboardID = C_UINT32

public constant xSDL_HasKeyboard = define_c_func(sdl,"+SDL_HasKeyboard",{},C_BOOL)

public function SDL_HasKeyboard()
	return c_func(xSDL_HasKeyboard,{})
end function

public constant xSDL_GetKeyboards = define_c_func(sdl,"+SDL_GetKeyboards",{C_POINTER},C_POINTER)

public function SDL_GetKeyboards(atom count)
	return c_func(xSDL_GetKeyboards,{count})
end function

public constant xSDL_GetKeyboardNameForID = define_c_func(sdl,"+SDL_GetKeyboardNameForID",{C_UINT32},C_STRING)

public function SDL_GetKeyboardNameForID(atom id)
	return c_func(xSDL_GetKeyboardNameForID,{id})
end function

public constant xSDL_GetKeyboardFocus = define_c_func(sdl,"+SDL_GetKeyboardFocus",{},C_POINTER)

public function SDL_GetKeyboardFocus()
	return c_func(xSDL_GetKeyboardFocus,{})
end function

public constant xSDL_GetKeyboardState = define_c_func(sdl,"+SDL_GetKeyboardState",{C_POINTER},C_POINTER)

public function SDL_GetKeyboardState(atom numkeys)
	return c_func(xSDL_GetKeyboardState,{numkeys})
end function

public constant xSDL_ResetKeyboard = define_c_proc(sdl,"+SDL_ResetKeyboard",{})

public procedure SDL_ResetKeyboard()
	c_proc(xSDL_ResetKeyboard,{})
end procedure

public constant xSDL_GetModState = define_c_func(sdl,"+SDL_GetModState",{},C_INT)

public function SDL_GetModState()
	return c_func(xSDL_GetModState,{})
end function

public constant xSDL_SetModState = define_c_proc(sdl,"+SDL_SetModState",{C_INT})

public procedure SDL_SetModState(atom modstate)
	c_proc(xSDL_SetModState,{modstate})
end procedure

public constant xSDL_GetKeyFromScancode = define_c_func(sdl,"+SDL_GetKeyFromScancode",{C_INT,C_INT,C_BOOL},C_INT)

public function SDL_GetKeyFromScancode(SDL_Scancode scancode,atom modstate,atom key_event)
	return c_func(xSDL_GetKeyFromScancode,{scancode,modstate,key_event})
end function

public constant xSDL_GetScancodeFromKey = define_c_func(sdl,"+SDL_GetScancodeFromKey",{C_INT,C_POINTER},C_INT)

public function SDL_GetScancodeFromKey(atom  key,atom modstate)
	return c_func(xSDL_GetScancodeFromKey,{key,modstate})
end function

public constant xSDL_SetScancodeName = define_c_func(sdl,"+SDL_SetScancodeName",{C_INT,C_STRING},C_BOOL)

public function SDL_SetScancodeName(SDL_Scancode code,sequence name)
	return c_func(xSDL_SetScancodeName,{code,name})
end function

public constant xSDL_GetScancodeName = define_c_func(sdl,"+SDL_GetScancodeName",{C_INT},C_STRING)

public function SDL_GetScancodeName(SDL_Scancode code)
	return c_func(xSDL_GetScancodeName,{code})
end function

public constant xSDL_GetScancodeFromName = define_c_func(sdl,"+SDL_GetScancodeFromName",{C_STRING},C_INT)

public function SDL_GetScancodeFromName(sequence name)
	return c_func(xSDL_GetScancodeFromName,{name})
end function

public constant xSDL_GetKeyName = define_c_func(sdl,"+SDL_GetKeyName",{C_INT},C_STRING)

public function SDL_GetKeyName(atom key)
	return c_func(xSDL_GetKeyName,{key})
end function

public constant xSDL_GetKeyFromName = define_c_func(sdl,"+SDL_GetKeyFromName",{C_STRING},C_INT)

public function SDL_GetKeyFromName(sequence name)
	return c_func(xSDL_GetKeyFromName,{name})
end function

public constant xSDL_StartTextInput = define_c_func(sdl,"+SDL_StartTextInput",{C_POINTER},C_BOOL)

public function SDL_StartTextInput(atom window)
	return c_func(xSDL_StartTextInput,{window})
end function

public enum type SDL_TextInputType
	SDL_TEXTINPUT_TYPE_TEXT = 0,                        /**< The input is text */
    SDL_TEXTINPUT_TYPE_TEXT_NAME,                   /**< The input is a person's name */
    SDL_TEXTINPUT_TYPE_TEXT_EMAIL,                  /**< The input is an e-mail address */
    SDL_TEXTINPUT_TYPE_TEXT_USERNAME,               /**< The input is a username */
    SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_HIDDEN,        /**< The input is a secure password that is hidden */
    SDL_TEXTINPUT_TYPE_TEXT_PASSWORD_VISIBLE,       /**< The input is a secure password that is visible */
    SDL_TEXTINPUT_TYPE_NUMBER,                      /**< The input is a number */
    SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_HIDDEN,      /**< The input is a secure PIN that is hidden */
    SDL_TEXTINPUT_TYPE_NUMBER_PASSWORD_VISIBLE      /**< The input is a secure PIN that is visible */
end type

public enum type SDL_Capitalization
	SDL_CAPITALIZE_NONE = 0,        /**< No auto-capitalization will be done */
    SDL_CAPITALIZE_SENTENCES,   /**< The first letter of sentences will be capitalized */
    SDL_CAPITALIZE_WORDS,       /**< The first letter of words will be capitalized */
    SDL_CAPITALIZE_LETTERS      /**< All letters will be capitalized */
end type

public constant xSDL_StartTextInputWithProperties = define_c_func(sdl,"+SDL_StartTextInputWithProperties",{C_POINTER,C_UINT32},C_BOOL)

public function SDL_StartTextInputWithProperties(atom window,atom props)
	return c_func(xSDL_StartTextInputWithProperties,{window,props})
end function

public constant SDL_PROP_TEXTINPUT_TYPE_NUMBER    =              "SDL.textinput.type"
public constant SDL_PROP_TEXTINPUT_CAPITALIZATION_NUMBER  =      "SDL.textinput.capitalization"
public constant SDL_PROP_TEXTINPUT_AUTOCORRECT_BOOLEAN    =      "SDL.textinput.autocorrect"
public constant SDL_PROP_TEXTINPUT_MULTILINE_BOOLEAN       =     "SDL.textinput.multiline"
public constant SDL_PROP_TEXTINPUT_ANDROID_INPUTTYPE_NUMBER =    "SDL.textinput.android.inputtype"

public constant xSDL_TextInputActive = define_c_func(sdl,"+SDL_TextInputActive",{C_POINTER},C_BOOL)

public function SDL_TextInputActive(atom window)
	return c_func(xSDL_TextInputActive,{window})
end function

public constant xSDL_StopTextInput = define_c_func(sdl,"+SDL_StopTextInput",{C_POINTER},C_BOOL)

public function SDL_StopTextInput(atom window)
	return c_func(xSDL_StopTextInput,{window})
end function

public constant xSDL_ClearComposition = define_c_func(sdl,"+SDL_ClearComposition",{C_POINTER},C_BOOL)

public function SDL_ClearComposition(atom window)
	return c_func(xSDL_ClearComposition,{window})
end function

public constant xSDL_SetTextInputArea = define_c_func(sdl,"+SDL_SetTextInputArea",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_SetTextInputArea(atom window,atom rect,atom cursor)
	return c_func(xSDL_SetTextInputArea,{window,rect,cursor})
end function

public constant xSDL_GetTextInputArea = define_c_func(sdl,"+SDL_GetTextInputArea",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextInputArea(atom window,atom rect,atom cursor)
	return c_func(xSDL_GetTextInputArea,{window,rect,cursor})
end function

public constant xSDL_HasScreenKeyboardSupport = define_c_func(sdl,"+SDL_HasScreenKeyboardSupport",{},C_BOOL)

public function SDL_HasScreenKeyboardSupport()
	return c_func(xSDL_HasScreenKeyboardSupport,{})
end function

public constant xSDL_ScreenKeyboardShown = define_c_func(sdl,"+SDL_ScreenKeyboardShown",{C_POINTER},C_BOOL)

public function SDL_ScreenKeyboardShown(atom window)
	return c_func(xSDL_ScreenKeyboardShown,{window})
end function
­71.44