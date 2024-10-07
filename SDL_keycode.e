include std/ffi.e
include std/machine.e
include std/math.e

--SDL_Keycode C_INT32

include SDL3.e

include SDL_scancode.e

public constant SDLK_SCANCODE_MASK = shift_bits(1,-30)
public constant SDL_SCANCODE_TO_KEYCODE = SDLK_SCANCODE_MASK

public enum type SDL_KeyCode
	SDLK_UNKNOWN = 0,

    SDLK_RETURN = '\r',
    SDLK_ESCAPE = '\x1B',
    --SDLK_BACKSPACE = '\b',
    SDLK_TAB = '\t',
    SDLK_SPACE = ' ',
    SDLK_EXCLAIM = '!',
    SDLK_QUOTEDBL = '"',
    SDLK_HASH = '#',
    SDLK_PERCENT = '%',
    SDLK_DOLLAR = '$',
    SDLK_AMPERSAND = '&',
    SDLK_QUOTE = '\'',
    SDLK_LEFTPAREN = '(',
    SDLK_RIGHTPAREN = ')',
    SDLK_ASTERISK = '*',
    SDLK_PLUS = '+',
    SDLK_COMMA = ',',
    SDLK_MINUS = '-',
    SDLK_PERIOD = '.',
    SDLK_SLASH = '/',
    SDLK_0 = '0',
    SDLK_1 = '1',
    SDLK_2 = '2',
    SDLK_3 = '3',
    SDLK_4 = '4',
    SDLK_5 = '5',
    SDLK_6 = '6',
    SDLK_7 = '7',
    SDLK_8 = '8',
    SDLK_9 = '9',
    SDLK_COLON = ':',
    SDLK_SEMICOLON = ';',
    SDLK_LESS = '<',
    SDLK_EQUALS = '=',
    SDLK_GREATER = '>',
    SDLK_QUESTION = '?',
    SDLK_AT = '@',
    
	SDLK_LEFTBRACKET = '[',
    SDLK_BACKSLASH = '\\',
    SDLK_RIGHTBRACKET = ']',
    SDLK_CARET = '^',
    SDLK_UNDERSCORE = '_',
    SDLK_BACKQUOTE = '`',
    SDLK_a = 'a',
    SDLK_b = 'b',
    SDLK_c = 'c',
    SDLK_d = 'd',
    SDLK_e = 'e',
    SDLK_f = 'f',
    SDLK_g = 'g',
    SDLK_h = 'h',
    SDLK_i = 'i',
    SDLK_j = 'j',
    SDLK_k = 'k',
    SDLK_l = 'l',
    SDLK_m = 'm',
    SDLK_n = 'n',
    SDLK_o = 'o',
    SDLK_p = 'p',
    SDLK_q = 'q',
    SDLK_r = 'r',
    SDLK_s = 's',
    SDLK_t = 't',
    SDLK_u = 'u',
    SDLK_v = 'v',
    SDLK_w = 'w',
    SDLK_x = 'x',
    SDLK_y = 'y',
    SDLK_z = 'z'
    
	--SDLK_CAPSLOCK = SDL_SCANCODE_CAPSLOCK
end type

public enum type SDL_Keymod
	SDL_KMOD_NONE = 0x0000,
	SDL_KMOD_LSHIFT = 0x0001,
	SDL_KMOD_RSHIFT = 0x0002,
	SDL_KMOD_LCTRL = 0x0040,
	SDL_KMOD_RCTRL = 0x0080,
	SDL_KMOD_LALT = 0x0100,
	SDL_KMOD_RALT = 0x0200,
	SDL_KMOD_LGUI = 0x0400,
	SDL_KMOD_RGUI = 0x0800,
	SDL_KMOD_NUM= 0x1000,
	SDL_KMOD_CAPS = 0x2000,
	SDL_KMOD_MODE = 0x4000,
	SDL_KMOD_SCROLL = 0x8000,
	
	SDL_KMOD_RESERVED = SDL_KMOD_SCROLL
end type

public constant SDL_KMOD_CTRL = or_all({SDL_KMOD_LCTRL,SDL_KMOD_RCTRL})
public constant SDL_KMOD_SHIFT = or_all({SDL_KMOD_LSHIFT,SDL_KMOD_RSHIFT})
public constant SDL_KMOD_ALT = or_all({SDL_KMOD_LALT,SDL_KMOD_RALT})
public constant SDL_KMOD_GUI = or_all({SDL_KMOD_LGUI,SDL_KMOD_RGUI})
­110.54