include std/ffi.e
include std/machine.e

include SDL3.e

public enum type SDL_BlendMode
	SDL_BLENDMODE_NONE = 0x00000000,
	SDL_BLENDMODE_BLEND = 0x00000001,
	SDL_BLENDMODE_ADD = 0x00000002,
	SDL_BLENDMODE_MOD = 0x00000004,
	SDL_BLENDMODE_MUL = 0x00000008,
	SDL_BLENDMODE_INVALID = 0x7FFFFFFF
end type

public enum type SDL_BlendOperation
	SDL_BLENDOPERATION_ADD = 0x1,
	SDL_BLENDOPERATION_SUBTRACT = 0x2,
	SDL_BLENDOPERATION_REV_SUBTRACT = 0x3,
	SDL_BLENDOPERATION_MINIMUM = 0x4,
	SDL_BLENDOPERATION_MAXIMUM = 0x5
end type

public enum type SDL_BlendFactor
	SDL_BLENDFACTOR_ZERO = 0x1,
	SDL_BLENDFACTOR_ONE = 0x2,
	SDL_BLENDFACTOR_SRC_COLOR = 0x3,
	SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4,
	SDL_BLENDFACTOR_SRC_ALPHA = 0x5,
	SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6,
	SDL_BLENDFACTOR_DST_COLOR = 0X7,
	SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8,
	SDL_BLENDFACTOR_DST_ALPHA = 0x9,
	SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA
end type

export constant xSDL_ComposeCustomBlendMode = define_c_func(sdl,"+SDL_ComposeCustomBlendMode",{C_INT,C_INT,C_INT,C_INT,C_INT,C_INT},C_INT)

public function SDL_ComposeCustomBlendMode(SDL_BlendFactor srcColorFactor,SDL_BlendFactor dstColorFactor, SDL_BlendFactor colorOperation,SDL_BlendFactor srcAlphaFactor,SDL_BlendFactor dstAlphaFactor,SDL_BlendFactor alphaOperation)
	return c_func(xSDL_ComposeCustomBlendMode,{srcColorFactor,dstColorFactor,colorOperation,srcAlphaFactor,dstAlphaFactor,alphaOperation})
end function
­39.133