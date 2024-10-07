include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_ALPHA_OPAQUE = 255
public constant SDL_ALPHA_TRANSPARENT = 0

public enum type SDL_PixelType
	SDL_PIXELTYPE_UNKNOWN = 0,
	SDL_PIXELTYPE_INDEX1,
	SDL_PIXELTYPE_INDEX4,
	SDL_PIXELTYPE_INDEX8,
	SDL_PIXELTYPE_PACKED8,
	SDL_PIXELTYPE_PACKED16,
	SDL_PIXELTYPE_PACKED32,
	SDL_PIXELTYPE_ARRAYU8,
	SDL_PIXELTYPE_ARRAYU16,
	SDL_PIXELTYPE_ARRAYU32,
	SDL_PIXELTYPE_ARRAYF16,
	SDL_PIXELTYPE_ARRAYF32
end type

public enum type SDL_BitmapOrder
	SDL_BITMAPORDER_NONE = 0,
	SDL_BITMAPORDER_4321,
	SDL_BITMAPORDER_1234
end type

public enum type SDL_PackedOrder
	SDL_PACKEDORDER_NONE = 0,
	SDL_PACKEDORDER_XRGB,
	SDL_PACKEDORDER_RGBX,
	SDL_PACKEDORDER_ARGB,
	SDL_PACKEDORDER_RGBA,
	SDL_PACKEDORDER_XBGR,
	SDL_PACKEDORDER_BGRX,
	SDL_PACKEDORDER_ABGR,
	SDL_PACKEDORDER_BGRA
end type

public enum type SDL_ArrayOrder
	SDL_ARRAYORDER_NONE = 0,
	SDL_ARRAYORDER_RGB,
	SDL_ARRAYORDER_RGBA,
	SDL_ARRAYORDER_ARGB,
	SDL_ARRAYORDER_BGR,
	SDL_ARRAYORDER_BGRA,
	SDL_ARRAYORDER_ABGR
end type

public enum type SDL_PackedLayout
	SDL_PACKEDLAYOUT_NONE = 0,
	SDL_PACKEDLAYOUT_332,
	SDL_PACKEDLAYOUT_4444,
	SDL_PACKEDLAYOUT_1555,
	SDL_PACKEDLAYOUT_5551,
	SDL_PACKEDLAYOUT_565,
	SDL_PACKEDLAYOUT_8888,
	SDL_PACKEDLAYOUT_2101010,
	SDL_PACKEDLAYOUT_1010102
end type

public enum type SDL_ColorType
	SDL_COLOR_TYPE_UNKNOWN = 0,
	SDL_COLOR_TYPE_RGB = 1,
	SDL_COLOR_TYPE_YCBCR = 2
end type

public enum type SDL_ColorRange
	SDL_COLOR_RANGE_UNKNOWN = 0,
	SDL_COLOR_RANGE_LIMITED = 1,
	SDL_COLOR_RANGE_FULL = 2
end type

public enum type SDL_ColorPrimaries
	SDL_COLOR_PRIMARIES_UNKNOWN = 0,
    SDL_COLOR_PRIMARIES_BT709 = 1,                  --/**< ITU-R BT.709-6 */
    SDL_COLOR_PRIMARIES_UNSPECIFIED = 2,
    SDL_COLOR_PRIMARIES_BT470M = 4,                 --/**< ITU-R BT.470-6 System M */
    SDL_COLOR_PRIMARIES_BT470BG = 5,                --/**< ITU-R BT.470-6 System B, G / ITU-R BT.601-7 625 */
    SDL_COLOR_PRIMARIES_BT601 = 6,                  --/**< ITU-R BT.601-7 525 */
    SDL_COLOR_PRIMARIES_SMPTE240 = 7,               --/**< SMPTE 240M, functionally the same as SDL_COLOR_PRIMARIES_BT601 */
    SDL_COLOR_PRIMARIES_GENERIC_FILM = 8,           --/**< Generic film (color filters using Illuminant C) */
    SDL_COLOR_PRIMARIES_BT2020 = 9,                 --/**< ITU-R BT.2020-2 / ITU-R BT.2100-0 */
    SDL_COLOR_PRIMARIES_XYZ = 10,                   --/**< SMPTE ST 428-1 */
    SDL_COLOR_PRIMARIES_SMPTE431 = 11,              --/**< SMPTE RP 431-2 */
    SDL_COLOR_PRIMARIES_SMPTE432 = 12,              --/**< SMPTE EG 432-1 / DCI P3 */
    SDL_COLOR_PRIMARIES_EBU3213 = 22,               --/**< EBU Tech. 3213-E */
    SDL_COLOR_PRIMARIES_CUSTOM = 31
end type

public enum type SDL_TransferCharacteristics
	SDL_TRANSFER_CHARACTERISTICS_UNKNOWN = 0,
    SDL_TRANSFER_CHARACTERISTICS_BT709 = 1,         
    SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED = 2,
    SDL_TRANSFER_CHARACTERISTICS_GAMMA22 = 4,      
    SDL_TRANSFER_CHARACTERISTICS_GAMMA28 = 5,       
    SDL_TRANSFER_CHARACTERISTICS_BT601 = 6,         
    SDL_TRANSFER_CHARACTERISTICS_SMPTE240 = 7,      
    SDL_TRANSFER_CHARACTERISTICS_LINEAR = 8,
    SDL_TRANSFER_CHARACTERISTICS_LOG100 = 9,
    SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10 = 10,
    SDL_TRANSFER_CHARACTERISTICS_IEC61966 = 11,     
    SDL_TRANSFER_CHARACTERISTICS_BT1361 = 12,       
    SDL_TRANSFER_CHARACTERISTICS_SRGB = 13,        
    SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT = 14, 
    SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT = 15, 
    SDL_TRANSFER_CHARACTERISTICS_PQ = 16,           
    SDL_TRANSFER_CHARACTERISTICS_SMPTE428 = 17,     
    SDL_TRANSFER_CHARACTERISTICS_HLG = 18,          
    SDL_TRANSFER_CHARACTERISTICS_CUSTOM = 31
end type

public enum type SDL_MatrixCoefficients
	SDL_MATRIX_COEFFICIENTS_IDENTITY = 0,
    SDL_MATRIX_COEFFICIENTS_BT709 = 1,             
    SDL_MATRIX_COEFFICIENTS_UNSPECIFIED = 2,
    SDL_MATRIX_COEFFICIENTS_FCC = 4,                
    SDL_MATRIX_COEFFICIENTS_BT470BG = 5,            
    SDL_MATRIX_COEFFICIENTS_BT601 = 6,             
    SDL_MATRIX_COEFFICIENTS_SMPTE240 = 7,           
    SDL_MATRIX_COEFFICIENTS_YCGCO = 8,
    SDL_MATRIX_COEFFICIENTS_BT2020_NCL = 9,         
    SDL_MATRIX_COEFFICIENTS_BT2020_CL = 10,         
    SDL_MATRIX_COEFFICIENTS_SMPTE2085 = 11,         
    SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL = 12,
    SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL = 13,
    SDL_MATRIX_COEFFICIENTS_ICTCP = 14,             
    SDL_MATRIX_COEFFICIENTS_CUSTOM = 31
end type

public enum type SDL_ChromaLocation
	SDL_CHROMA_LOCATION_NONE = 0,
	SDL_CHROMA_LOCATION_LEFT = 1,
	SDL_CHROMA_LOCATION_CENTER = 2,
	SDL_CHROMA_LOCATION_TOPLEFT = 3
end type

public constant SDL_Color = define_c_struct({
	C_UINT8, --r
	C_UINT8, --g
	C_UINT8, --b
	C_UINT8 --a
})

public constant SDL_FColor = define_c_struct({
	C_FLOAT, --r
	C_FLOAT, --g
	C_FLOAT, --b
	C_FLOAT  --a
})

public constant SDL_Palette = define_c_struct({
	C_INT, --ncolors
	C_POINTER, --colors* SDL_Color
	C_UINT32, --version
	C_INT --refcount
})

public constant SDL_PixelFormat = define_c_struct({
	C_UINT32, --format
	C_POINTER, --palette* SDL_Palette
	C_UINT8, --BitsPerPixel
	C_UINT8, --BytesPerPixel
	{C_UINT8,2}, --padding[2]
	C_UINT32, --Rmask
	C_UINT32, --Gmask
	C_UINT32, --Bmask
	C_UINT32, --Amask
	C_UINT8, --Rloss
	C_UINT8, --Gloss
	C_UINT8, --Bloss
	C_UINT8, --Aloss
	C_UINT8, --Rshift
	C_UINT8, --Gshift
	C_UINT8, --Bshift
	C_UINT8, --Ashift
	C_INT, --refocunt
	C_POINTER --SDL_PixelFormat *next
})

public constant xSDL_GetPixelFormatName = define_c_func(sdl,"+SDL_GetPixelFormatName",{C_UINT32},C_STRING)

public function SDL_GetPixelFormatName(atom format)
	return c_func(xSDL_GetPixelFormatName,{format})
end function

export constant xSDL_GetMasksForPixelFormatEnum = define_c_func(sdl,"+SDL_GetMasksForPixelFormatEnum",{C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetMasksForPixelFormatEnum(atom format,atom bpp,atom Rmask,atom Gmask,atom Bmask,atom Amask)
	return c_func(xSDL_GetMasksForPixelFormatEnum,{format,bpp,Rmask,Gmask,Bmask,Amask})
end function

export constant xSDL_GetPixelFormatEnumForMasks = define_c_func(sdl,"+SDL_GetPixelFormatEnumForMasks",{C_INT,C_UINT32,C_UINT32,C_UINT32,C_UINT32},C_UINT32)

public function SDL_GetPixelFormatEnumForMasks(atom bpp,atom Rmask,atom Gmask,atom Bmask,atom Amask)
	return c_func(xSDL_GetPixelFormatEnumForMasks,{bpp,Rmask,Gmask,Bmask,Amask})
end function

export constant xSDL_CreatePixelFormat = define_c_func(sdl,"+SDL_CreatePixelFormat",{C_UINT32},C_POINTER)

public function SDL_CreatePixelFormat(atom pixel_format)
	return c_func(xSDL_CreatePixelFormat,{pixel_format})
end function

export constant xSDL_DestroyPixelFormat = define_c_proc(sdl,"+SDL_DestroyPixelFormat",{C_POINTER})

public procedure SDL_DestroyPixelFormat(atom format)
	c_proc(xSDL_DestroyPixelFormat,{format})
end procedure

export constant xSDL_CreatePalette = define_c_func(sdl,"+SDL_CreatePalette",{C_INT},C_POINTER)

public function SDL_CreatePalette(atom ncolors)
	return c_func(xSDL_CreatePalette,{ncolors})
end function

export constant xSDL_SetPixelFormatPalette = define_c_func(sdl,"+SDL_SetPixelFormatPalette",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetPixelFormatPalette(atom format,atom palette)
	return c_func(xSDL_SetPixelFormatPalette,{format,palette})
end function

export constant xSDL_SetPaletteColors = define_c_func(sdl,"+SDL_SetPaletteColors",{C_POINTER,C_POINTER,C_INT,C_INT},C_INT)

public function SDL_SetPaletteColors(atom palette,atom colors,atom firstcolor,atom ncolors)
	return c_func(xSDL_SetPaletteColors,{palette,colors,firstcolor,ncolors})
end function

export constant xSDL_DestroyPalette = define_c_proc(sdl,"+SDL_DestroyPalette",{C_POINTER})

public procedure SDL_DestroyPalette(atom palette)
	c_proc(xSDL_DestroyPalette,{palette})
end procedure

export constant xSDL_MapRGB = define_c_func(sdl,"+SDL_MapRGB",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_UINT32)

public function SDL_MapRGB(atom format,atom r,atom g,atom b)
	return c_func(xSDL_MapRGB,{format,r,g,b})
end function

export constant xSDL_MapRGBA = define_c_func(sdl,"+SDL_MapRGBA",{C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_UINT32)

public function SDL_MapRGBA(atom format,atom r,atom g,atom b,atom a)
	return c_func(xSDL_MapRGBA,{format,r,g,b,a})
end function

export constant xSDL_GetRGB = define_c_proc(sdl,"+SDL_GetRGB",{C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetRGB(atom pixel,atom format,atom r,atom g,atom b)
	c_proc(xSDL_GetRGB,{pixel,format,r,g,b})
end procedure

export constant xSDL_GetRGBA = define_c_proc(sdl,"+SDL_GetRGBA",{C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetRGBA(atom pixel,atom format,atom r,atom g,atom b,atom a)
	c_proc(xSDL_GetRGBA,{pixel,format,r,g,b,a})
end procedure
­152.2
