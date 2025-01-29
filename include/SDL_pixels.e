include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public constant SDL_ALPHA_OPAQUE = 255

public constant SDL_ALPHA_OPAQUE_FLOAT = 1.0

public constant SDL_ALPHA_TRANSPARENT = 0

public constant SDL_ALPHA_TRANSPARENT_FLOAT = 0.0

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
	SDL_PIXELTYPE_ARRAYF32,
	SDL_PIXELTYPE_INDEX2
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

public enum type SDL_PixelFormat
	SDL_PIXELFORMAT_UNKNOWN = 0,
    SDL_PIXELFORMAT_INDEX1LSB = 0x11100100,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_4321, 0, 1, 0), */
    SDL_PIXELFORMAT_INDEX1MSB = 0x11200100,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_1234, 0, 1, 0), */
    SDL_PIXELFORMAT_INDEX2LSB = 0x1c100200,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_4321, 0, 2, 0), */
    SDL_PIXELFORMAT_INDEX2MSB = 0x1c200200,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_1234, 0, 2, 0), */
    SDL_PIXELFORMAT_INDEX4LSB = 0x12100400,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_4321, 0, 4, 0), */
    SDL_PIXELFORMAT_INDEX4MSB = 0x12200400,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_1234, 0, 4, 0), */
    SDL_PIXELFORMAT_INDEX8 = 0x13000801,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX8, 0, 0, 8, 1), */
    SDL_PIXELFORMAT_RGB332 = 0x14110801,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED8, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_332, 8, 1), */
    SDL_PIXELFORMAT_XRGB4444 = 0x15120c02,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_4444, 12, 2), */
    SDL_PIXELFORMAT_XBGR4444 = 0x15520c02,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_4444, 12, 2), */
    SDL_PIXELFORMAT_XRGB1555 = 0x15130f02,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_1555, 15, 2), */
    SDL_PIXELFORMAT_XBGR1555 = 0x15530f02,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_1555, 15, 2), */
    SDL_PIXELFORMAT_ARGB4444 = 0x15321002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_RGBA4444 = 0x15421002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_ABGR4444 = 0x15721002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_BGRA4444 = 0x15821002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_4444, 16, 2), */
    SDL_PIXELFORMAT_ARGB1555 = 0x15331002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_1555, 16, 2), */
    SDL_PIXELFORMAT_RGBA5551 = 0x15441002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_5551, 16, 2), */
    SDL_PIXELFORMAT_ABGR1555 = 0x15731002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_1555, 16, 2), */
    SDL_PIXELFORMAT_BGRA5551 = 0x15841002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_5551, 16, 2), */
    SDL_PIXELFORMAT_RGB565 = 0x15151002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_565, 16, 2), */
    SDL_PIXELFORMAT_BGR565 = 0x15551002,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_565, 16, 2), */
    SDL_PIXELFORMAT_RGB24 = 0x17101803,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_RGB, 0, 24, 3), */
    SDL_PIXELFORMAT_BGR24 = 0x17401803,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_BGR, 0, 24, 3), */
    SDL_PIXELFORMAT_XRGB8888 = 0x16161804,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_RGBX8888 = 0x16261804,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBX, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_XBGR8888 = 0x16561804,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_BGRX8888 = 0x16661804,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRX, SDL_PACKEDLAYOUT_8888, 24, 4), */
    SDL_PIXELFORMAT_ARGB8888 = 0x16362004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_RGBA8888 = 0x16462004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_ABGR8888 = 0x16762004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_BGRA8888 = 0x16862004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_8888, 32, 4), */
    SDL_PIXELFORMAT_XRGB2101010 = 0x16172004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_XBGR2101010 = 0x16572004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_ARGB2101010 = 0x16372004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_ABGR2101010 = 0x16772004,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_2101010, 32, 4), */
    SDL_PIXELFORMAT_RGB48 = 0x18103006,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGB, 0, 48, 6), */
    SDL_PIXELFORMAT_BGR48 = 0x18403006,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGR, 0, 48, 6), */
    SDL_PIXELFORMAT_RGBA64 = 0x18204008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGBA, 0, 64, 8), */
    SDL_PIXELFORMAT_ARGB64 = 0x18304008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ARGB, 0, 64, 8), */
    SDL_PIXELFORMAT_BGRA64 = 0x18504008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGRA, 0, 64, 8), */
    SDL_PIXELFORMAT_ABGR64 = 0x18604008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ABGR, 0, 64, 8), */
    SDL_PIXELFORMAT_RGB48_FLOAT = 0x1a103006,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGB, 0, 48, 6), */
    SDL_PIXELFORMAT_BGR48_FLOAT = 0x1a403006,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGR, 0, 48, 6), */
    SDL_PIXELFORMAT_RGBA64_FLOAT = 0x1a204008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGBA, 0, 64, 8), */
    SDL_PIXELFORMAT_ARGB64_FLOAT = 0x1a304008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ARGB, 0, 64, 8), */
    SDL_PIXELFORMAT_BGRA64_FLOAT = 0x1a504008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGRA, 0, 64, 8), */
    SDL_PIXELFORMAT_ABGR64_FLOAT = 0x1a604008,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ABGR, 0, 64, 8), */
    SDL_PIXELFORMAT_RGB96_FLOAT = 0x1b10600c,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGB, 0, 96, 12), */
    SDL_PIXELFORMAT_BGR96_FLOAT = 0x1b40600c,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGR, 0, 96, 12), */
    SDL_PIXELFORMAT_RGBA128_FLOAT = 0x1b208010,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGBA, 0, 128, 16), */
    SDL_PIXELFORMAT_ARGB128_FLOAT = 0x1b308010,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ARGB, 0, 128, 16), */
    SDL_PIXELFORMAT_BGRA128_FLOAT = 0x1b508010,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGRA, 0, 128, 16), */
    SDL_PIXELFORMAT_ABGR128_FLOAT = 0x1b608010,
        /* SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ABGR, 0, 128, 16), */

    SDL_PIXELFORMAT_YV12 = 0x32315659,      /**< Planar mode: Y + V + U  (3 planes) */
        /* SDL_DEFINE_PIXELFOURCC('Y', 'V', '1', '2'), */
    SDL_PIXELFORMAT_IYUV = 0x56555949,      /**< Planar mode: Y + U + V  (3 planes) */
        /* SDL_DEFINE_PIXELFOURCC('I', 'Y', 'U', 'V'), */
    SDL_PIXELFORMAT_YUY2 = 0x32595559,      /**< Packed mode: Y0+U0+Y1+V0 (1 plane) */
        /* SDL_DEFINE_PIXELFOURCC('Y', 'U', 'Y', '2'), */
    SDL_PIXELFORMAT_UYVY = 0x59565955,      /**< Packed mode: U0+Y0+V0+Y1 (1 plane) */
        /* SDL_DEFINE_PIXELFOURCC('U', 'Y', 'V', 'Y'), */
    SDL_PIXELFORMAT_YVYU = 0x55595659,      /**< Packed mode: Y0+V0+Y1+U0 (1 plane) */
        /* SDL_DEFINE_PIXELFOURCC('Y', 'V', 'Y', 'U'), */
    SDL_PIXELFORMAT_NV12 = 0x3231564e,      /**< Planar mode: Y + U/V interleaved  (2 planes) */
        /* SDL_DEFINE_PIXELFOURCC('N', 'V', '1', '2'), */
    SDL_PIXELFORMAT_NV21 = 0x3132564e,      /**< Planar mode: Y + V/U interleaved  (2 planes) */
        /* SDL_DEFINE_PIXELFOURCC('N', 'V', '2', '1'), */
    SDL_PIXELFORMAT_P010 = 0x30313050,      /**< Planar mode: Y + U/V interleaved  (2 planes) */
        /* SDL_DEFINE_PIXELFOURCC('P', '0', '1', '0'), */
    SDL_PIXELFORMAT_EXTERNAL_OES = 0x2053454f
end type

public enum type SDL_ColorType
	 SDL_COLOR_TYPE_UNKNOWN = 0,
    SDL_COLOR_TYPE_RGB = 1,
    SDL_COLOR_TYPE_YCBCR = 2
end type

public enum type SDL_ColorRange
	    SDL_COLOR_RANGE_UNKNOWN = 0,
    SDL_COLOR_RANGE_LIMITED = 1, /**< Narrow range, e.g. 16-235 for 8-bit RGB and luma, and 16-240 for 8-bit chroma */
    SDL_COLOR_RANGE_FULL = 2    /**< Full range, e.g. 0-255 for 8-bit RGB and luma, and 1-255 for 8-bit chroma */
end type

public enum type SDL_ColorPrimaries
	SDL_COLOR_PRIMARIES_UNKNOWN = 0,
    SDL_COLOR_PRIMARIES_BT709 = 1,                  /**< ITU-R BT.709-6 */
    SDL_COLOR_PRIMARIES_UNSPECIFIED = 2,
    SDL_COLOR_PRIMARIES_BT470M = 4,                 /**< ITU-R BT.470-6 System M */
    SDL_COLOR_PRIMARIES_BT470BG = 5,                /**< ITU-R BT.470-6 System B, G / ITU-R BT.601-7 625 */
    SDL_COLOR_PRIMARIES_BT601 = 6,                  /**< ITU-R BT.601-7 525, SMPTE 170M */
    SDL_COLOR_PRIMARIES_SMPTE240 = 7,               /**< SMPTE 240M, functionally the same as SDL_COLOR_PRIMARIES_BT601 */
    SDL_COLOR_PRIMARIES_GENERIC_FILM = 8,           /**< Generic film (color filters using Illuminant C) */
    SDL_COLOR_PRIMARIES_BT2020 = 9,                 /**< ITU-R BT.2020-2 / ITU-R BT.2100-0 */
    SDL_COLOR_PRIMARIES_XYZ = 10,                   /**< SMPTE ST 428-1 */
    SDL_COLOR_PRIMARIES_SMPTE431 = 11,              /**< SMPTE RP 431-2 */
    SDL_COLOR_PRIMARIES_SMPTE432 = 12,              /**< SMPTE EG 432-1 / DCI P3 */
    SDL_COLOR_PRIMARIES_EBU3213 = 22,               /**< EBU Tech. 3213-E */
    SDL_COLOR_PRIMARIES_CUSTOM = 31
end type

public enum type SDL_TransferCharacteristics
	    SDL_TRANSFER_CHARACTERISTICS_UNKNOWN = 0,
    SDL_TRANSFER_CHARACTERISTICS_BT709 = 1,         /**< Rec. ITU-R BT.709-6 / ITU-R BT1361 */
    SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED = 2,
    SDL_TRANSFER_CHARACTERISTICS_GAMMA22 = 4,       /**< ITU-R BT.470-6 System M / ITU-R BT1700 625 PAL & SECAM */
    SDL_TRANSFER_CHARACTERISTICS_GAMMA28 = 5,       /**< ITU-R BT.470-6 System B, G */
    SDL_TRANSFER_CHARACTERISTICS_BT601 = 6,         /**< SMPTE ST 170M / ITU-R BT.601-7 525 or 625 */
    SDL_TRANSFER_CHARACTERISTICS_SMPTE240 = 7,      /**< SMPTE ST 240M */
    SDL_TRANSFER_CHARACTERISTICS_LINEAR = 8,
    SDL_TRANSFER_CHARACTERISTICS_LOG100 = 9,
    SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10 = 10,
    SDL_TRANSFER_CHARACTERISTICS_IEC61966 = 11,     /**< IEC 61966-2-4 */
    SDL_TRANSFER_CHARACTERISTICS_BT1361 = 12,       /**< ITU-R BT1361 Extended Colour Gamut */
    SDL_TRANSFER_CHARACTERISTICS_SRGB = 13,         /**< IEC 61966-2-1 (sRGB or sYCC) */
    SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT = 14, /**< ITU-R BT2020 for 10-bit system */
    SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT = 15, /**< ITU-R BT2020 for 12-bit system */
    SDL_TRANSFER_CHARACTERISTICS_PQ = 16,           /**< SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems */
    SDL_TRANSFER_CHARACTERISTICS_SMPTE428 = 17,     /**< SMPTE ST 428-1 */
    SDL_TRANSFER_CHARACTERISTICS_HLG = 18,          /**< ARIB STD-B67, known as "hybrid log-gamma" (HLG) */
    SDL_TRANSFER_CHARACTERISTICS_CUSTOM = 31
end type

public enum type SDL_MatrixCoefficients
	 SDL_MATRIX_COEFFICIENTS_IDENTITY = 0,
    SDL_MATRIX_COEFFICIENTS_BT709 = 1,              /**< ITU-R BT.709-6 */
    SDL_MATRIX_COEFFICIENTS_UNSPECIFIED = 2,
    SDL_MATRIX_COEFFICIENTS_FCC = 4,                /**< US FCC Title 47 */
    SDL_MATRIX_COEFFICIENTS_BT470BG = 5,            /**< ITU-R BT.470-6 System B, G / ITU-R BT.601-7 625, functionally the same as SDL_MATRIX_COEFFICIENTS_BT601 */
    SDL_MATRIX_COEFFICIENTS_BT601 = 6,              /**< ITU-R BT.601-7 525 */
    SDL_MATRIX_COEFFICIENTS_SMPTE240 = 7,           /**< SMPTE 240M */
    SDL_MATRIX_COEFFICIENTS_YCGCO = 8,
    SDL_MATRIX_COEFFICIENTS_BT2020_NCL = 9,         /**< ITU-R BT.2020-2 non-constant luminance */
    SDL_MATRIX_COEFFICIENTS_BT2020_CL = 10,         /**< ITU-R BT.2020-2 constant luminance */
    SDL_MATRIX_COEFFICIENTS_SMPTE2085 = 11,         /**< SMPTE ST 2085 */
    SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL = 12,
    SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL = 13,
    SDL_MATRIX_COEFFICIENTS_ICTCP = 14,             /**< ITU-R BT.2100-0 ICTCP */
    SDL_MATRIX_COEFFICIENTS_CUSTOM = 31
end type

public enum type SDL_ChromaLocation
	 SDL_CHROMA_LOCATION_NONE = 0,   /**< RGB, no chroma sampling */
    SDL_CHROMA_LOCATION_LEFT = 1,   /**< In MPEG-2, MPEG-4, and AVC, Cb and Cr are taken on midpoint of the left-edge of the 2x2 square. In other words, they have the same horizontal location as the top-left pixel, but is shifted one-half pixel down vertically. */
    SDL_CHROMA_LOCATION_CENTER = 2, /**< In JPEG/JFIF, H.261, and MPEG-1, Cb and Cr are taken at the center of the 2x2 square. In other words, they are offset one-half pixel to the right and one-half pixel down compared to the top-left pixel. */
    SDL_CHROMA_LOCATION_TOPLEFT = 3 /**< In HEVC for BT.2020 and BT.2100 content (in particular on Blu-rays), Cb and Cr are sampled at the same location as the group's top-left Y pixel ("co-sited", "co-located"). */
end type

public enum type SDL_Colorspace
	SDL_COLORSPACE_UNKNOWN = 0,

    /* sRGB is a gamma corrected colorspace, and the default colorspace for SDL rendering and 8-bit RGB surfaces */
    SDL_COLORSPACE_SRGB = 0x120005a0, /**< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_RGB,
                                 SDL_COLOR_RANGE_FULL,
                                 SDL_COLOR_PRIMARIES_BT709,
                                 SDL_TRANSFER_CHARACTERISTICS_SRGB,
                                 SDL_MATRIX_COEFFICIENTS_IDENTITY,
                                 SDL_CHROMA_LOCATION_NONE), */

    /* This is a linear colorspace and the default colorspace for floating point surfaces. On Windows this is the scRGB colorspace, and on Apple platforms this is kCGColorSpaceExtendedLinearSRGB for EDR content */
    SDL_COLORSPACE_SRGB_LINEAR = 0x12000500, /**< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709  */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_RGB,
                                 SDL_COLOR_RANGE_FULL,
                                 SDL_COLOR_PRIMARIES_BT709,
                                 SDL_TRANSFER_CHARACTERISTICS_LINEAR,
                                 SDL_MATRIX_COEFFICIENTS_IDENTITY,
                                 SDL_CHROMA_LOCATION_NONE), */

    /* HDR10 is a non-linear HDR colorspace and the default colorspace for 10-bit surfaces */
    SDL_COLORSPACE_HDR10 = 0x12002600, /**< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020  */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_RGB,
                                 SDL_COLOR_RANGE_FULL,
                                 SDL_COLOR_PRIMARIES_BT2020,
                                 SDL_TRANSFER_CHARACTERISTICS_PQ,
                                 SDL_MATRIX_COEFFICIENTS_IDENTITY,
                                 SDL_CHROMA_LOCATION_NONE), */

    SDL_COLORSPACE_JPEG = 0x220004c6, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
                                 SDL_COLOR_RANGE_FULL,
                                 SDL_COLOR_PRIMARIES_BT709,
                                 SDL_TRANSFER_CHARACTERISTICS_BT601,
                                 SDL_MATRIX_COEFFICIENTS_BT601,
                                 SDL_CHROMA_LOCATION_NONE), */

    SDL_COLORSPACE_BT601_LIMITED = 0x211018c6, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
                                 SDL_COLOR_RANGE_LIMITED,
                                 SDL_COLOR_PRIMARIES_BT601,
                                 SDL_TRANSFER_CHARACTERISTICS_BT601,
                                 SDL_MATRIX_COEFFICIENTS_BT601,
                                 SDL_CHROMA_LOCATION_LEFT), */

    SDL_COLORSPACE_BT601_FULL = 0x221018c6, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
                                 SDL_COLOR_RANGE_FULL,
                                 SDL_COLOR_PRIMARIES_BT601,
                                 SDL_TRANSFER_CHARACTERISTICS_BT601,
                                 SDL_MATRIX_COEFFICIENTS_BT601,
                                 SDL_CHROMA_LOCATION_LEFT), */

    SDL_COLORSPACE_BT709_LIMITED = 0x21100421, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
                                 SDL_COLOR_RANGE_LIMITED,
                                 SDL_COLOR_PRIMARIES_BT709,
                                 SDL_TRANSFER_CHARACTERISTICS_BT709,
                                 SDL_MATRIX_COEFFICIENTS_BT709,
                                 SDL_CHROMA_LOCATION_LEFT), */

    SDL_COLORSPACE_BT709_FULL = 0x22100421, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
                                 SDL_COLOR_RANGE_FULL,
                                 SDL_COLOR_PRIMARIES_BT709,
                                 SDL_TRANSFER_CHARACTERISTICS_BT709,
                                 SDL_MATRIX_COEFFICIENTS_BT709,
                                 SDL_CHROMA_LOCATION_LEFT), */

    SDL_COLORSPACE_BT2020_LIMITED = 0x21102609, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
                                 SDL_COLOR_RANGE_LIMITED,
                                 SDL_COLOR_PRIMARIES_BT2020,
                                 SDL_TRANSFER_CHARACTERISTICS_PQ,
                                 SDL_MATRIX_COEFFICIENTS_BT2020_NCL,
                                 SDL_CHROMA_LOCATION_LEFT), */

    SDL_COLORSPACE_BT2020_FULL = 0x22102609, /**< Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020 */
        /* SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
                                 SDL_COLOR_RANGE_FULL,
                                 SDL_COLOR_PRIMARIES_BT2020,
                                 SDL_TRANSFER_CHARACTERISTICS_PQ,
                                 SDL_MATRIX_COEFFICIENTS_BT2020_NCL,
                                 SDL_CHROMA_LOCATION_LEFT), */

    SDL_COLORSPACE_RGB_DEFAULT = SDL_COLORSPACE_SRGB, /**< The default colorspace for RGB surfaces if no colorspace is specified */
    SDL_COLORSPACE_YUV_DEFAULT = SDL_COLORSPACE_JPEG  /**< The default colorspace for YUV surfaces if no colorspace is specified */
end type

public constant SDL_Color = define_c_struct({
	C_UINT8, --r
	C_UINT8, --g
	C_UINT8, --g
	C_UINT8  --a
})

public constant SDL_FColor = define_c_struct({
	C_FLOAT, --r
	C_FLOAT, --g
	C_FLOAT, --b
	C_FLOAT  --a
})

public constant SDL_Palette = define_c_struct({
	C_INT, --ncolors
	C_POINTER, --colors
	C_UINT32, --version
	C_INT --refcount
})

public constant SDL_PixelFormatDetails = define_c_struct({
	C_INT, --format SDL_PixelFormat
	C_UINT8, --bits_per_pixel
	C_UINT8, --bytes_per_pixel
	{C_UINT8,2}, --padding[2]
	C_UINT32, --Rmask
	C_UINT32, --Gmask
	C_UINT32, --Bmask
	C_UINT32, --Amask
	C_UINT8, --Rbits
	C_UINT8, --Gbits
	C_UINT8, --Bbits
	C_UINT8, --Abits
	C_UINT8, --Rshift
	C_UINT8, --Gshift
	C_UINT8, --Bshift
	C_UINT8 --Ashift
})

public constant xSDL_GetPixelFormatName = define_c_func(sdl,"+SDL_GetPixelFormatName",{C_INT},C_STRING)

public function SDL_GetPixelFormatName(SDL_PixelFormat format)
	return c_func(xSDL_GetPixelFormatName,{format})
end function

public constant xSDL_GetMasksForPixelFormat = define_c_func(sdl,"+SDL_GetMasksForPixelFormat",{C_INT,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetMasksForPixelFormat(SDL_PixelFormat format,atom bpp,atom Rmask,atom Gmask,atom Bmask,atom Amask)
	return c_func(xSDL_GetMasksForPixelFormat,{format,bpp,Rmask,Gmask,Bmask,Amask})
end function

public constant xSDL_GetPixelFormatForMasks = define_c_func(sdl,"+SDL_GetPixelFormatForMasks",{C_INT,C_UINT32,C_UINT32,C_UINT32,C_UINT32},C_INT)

public function SDL_GetPixelFormatForMasks(atom bpp,atom Rmask,atom Gmask,atom Bmask,atom Amask)
	return c_func(xSDL_GetPixelFormatForMasks,{bpp,Rmask,Gmask,Bmask,Amask})
end function

public constant xSDL_GetPixelFormatDetails = define_c_func(sdl,"+SDL_GetPixelFormatDetails",{C_INT},C_POINTER)

public function SDL_GetPixelFormatDetails(SDL_PixelFormat format)
	return c_func(xSDL_GetPixelFormatDetails,{format})
end function

public constant xSDL_CreatePalette = define_c_func(sdl,"+SDL_CreatePalette",{C_INT},C_POINTER)

public function SDL_CreatePalette(atom ncolors)
	return c_func(xSDL_CreatePalette,{ncolors})	
end function

public constant xSDL_SetPaletteColors = define_c_func(sdl,"+SDL_SetPaletteColors",{C_POINTER,C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_SetPaletteColors(atom palette,atom colors,atom first,atom ncolor)
	return c_func(xSDL_SetPaletteColors,{palette,colors,first,ncolor})
end function

public constant xSDL_DestroyPalette = define_c_proc(sdl,"+SDL_DestroyPalette",{C_POINTER})

public procedure SDL_DestroyPalette(atom palette)
	c_proc(xSDL_DestroyPalette,{palette})
end procedure

public constant xSDL_MapRGB = define_c_func(sdl,"+SDL_MapRGB",{C_POINTER,C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_UINT32)

public function SDL_MapRGB(atom format,atom palette,atom r,atom g,atom b)
	return c_func(xSDL_MapRGB,{format,palette,r,g,b})
end function

public constant xSDL_MapRGBA = define_c_func(sdl,"+SDL_MapRGBA",{C_POINTER,C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_UINT32)

public function SDL_MapRGBA(atom format,atom palette,atom r,atom g,atom b,atom a)
	return c_func(xSDL_MapRGBA,{format,palette,r,g,b,a})
end function

public constant xSDL_GetRGB = define_c_proc(sdl,"+SDL_GetRGB",{C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetRGB(atom pixel,atom format,atom palette,atom r,atom g,atom b)
	c_proc(xSDL_GetRGB,{pixel,format,palette,r,g,b})
end procedure

public constant xSDL_GetRGBA = define_c_proc(sdl,"+SDL_GetRGBA",{C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetRGBA(atom pixel,atom format,atom palette,atom r,atom g,atom b,atom a)
	c_proc(xSDL_GetRGBA,{pixel,format,palette,r,g,b,a})
end procedure
­471.52