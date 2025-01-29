include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_video.e

public constant SDL_MessageBoxFlags = C_UINT32

public constant SDL_MESSAGEBOX_ERROR = 0x00000010
public constant SDL_MESSAGEBOX_WARNING = 0x00000020
public constant SDL_MESSAGEBOX_INFORMATION = 0x00000040
public constant SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 0x00000080
public constant SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 0x00000100

public constant SDL_MessageBoxButtonFlags = C_UINT32

public constant SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 0x00000001
public constant SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 0x00000002

public constant SDL_MessageBoxButtonData = define_c_struct({
	C_UINT32, --flags
	C_INT, --buttonID
	C_STRING --text
})

public constant SDL_MessageBoxColor = define_c_struct({
	C_UINT8,C_UINT8,C_UINT8 --r,g,b
})

public enum type SDL_MessageBoxColorTypr
	SDL_MESSAGEBOX_COLOR_BACKGROUND = 0,
    SDL_MESSAGEBOX_COLOR_TEXT,
    SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
    SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
    SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
    SDL_MESSAGEBOX_COLOR_COUNT                    /**< Size of the colors array of SDL_MessageBoxColorScheme. */
end type

public constant SDL_MessageBoxColorScheme = define_c_struct({
	{SDL_MessageBoxColor,SDL_MESSAGEBOX_COLOR_COUNT}
})

public constant SDL_MessageBoxData = define_c_struct({
	C_UINT32, --flags
	C_POINTER, --window
	C_STRING, --title
	C_STRING, --message
	C_INT, --numbuttons
	C_POINTER, --buttons SDLMessageBoxButtonData
	C_POINTER --colorScheme SDL_MessageBoxColorScheme
})

public constant xSDL_ShowMessageBox = define_c_func(sdl,"+SDL_ShowMessageBox",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ShowMessageBox(atom messageboxdata,atom buttonid)
	return c_func(xSDL_ShowMessageBox,{messageboxdata,buttonid})
end function

public constant xSDL_ShowSimpleMessageBox = define_c_func(sdl,"+SDL_ShowSimpleMessageBox",{C_UINT32,C_STRING,C_STRING,C_POINTER},C_BOOL)

public function SDL_ShowSimpleMessageBox(atom flags,sequence title,sequence message,atom window)
	return c_func(xSDL_ShowSimpleMessageBox,{flags,title,message,window})
end function
­4.13