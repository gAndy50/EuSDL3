include std/ffi.e
include std/machine.e
include std/math.e

include SDL.e
include SDL_stdinc.e
include SDL_pixels.e
include SDL_properties.e
include SDL_rect.e
include SDL_surface.e
include SDL_video.e

public enum type SDL_GPUPrimitiveType
	SDL_GPU_PRIMITIVETYPE_TRIANGLELIST = 0,  /**< A series of separate triangles. */
    SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP, /**< A series of connected triangles. */
    SDL_GPU_PRIMITIVETYPE_LINELIST,      /**< A series of separate lines. */
    SDL_GPU_PRIMITIVETYPE_LINESTRIP,     /**< A series of connected lines. */
    SDL_GPU_PRIMITIVETYPE_POINTLIST      /**< A series of separate points. */
end type

public enum type SDL_GPULoadOp
	SDL_GPU_LOADOP_LOAD = 0,      /**< The previous contents of the texture will be preserved. */
    SDL_GPU_LOADOP_CLEAR,     /**< The contents of the texture will be cleared to a color. */
    SDL_GPU_LOADOP_DONT_CARE  /**< The previous contents of the texture need not be preserved. The contents will be undefined. */
end type

public enum type SDL_GPUStoreOp
	 SDL_GPU_STOREOP_STORE = 0,             /**< The contents generated during the render pass will be written to memory. */
    SDL_GPU_STOREOP_DONT_CARE,         /**< The contents generated during the render pass are not needed and may be discarded. The contents will be undefined. */
    SDL_GPU_STOREOP_RESOLVE,           /**< The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture may then be discarded and will be undefined. */
    SDL_GPU_STOREOP_RESOLVE_AND_STORE  /**< The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture will be written to memory. */
end type

public enum type SDL_GPUIndexElementSize
	SDL_GPU_INDEXELEMENTSIZE_16BIT = 0, /**< The index elements are 16-bit. */
    SDL_GPU_INDEXELEMENTSIZE_32BIT  /**< The index elements are 32-bit. */
end type

public enum type SDL_GPUTextureFormat
	SDL_GPU_TEXTUREFORMAT_INVALID = 0,

    /* Unsigned Normalized Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_A8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
    SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
    SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
    SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
    SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
    SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
    /* Compressed Unsigned Normalized Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM,
    SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM,
    /* Compressed Signed Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT,
    /* Compressed Unsigned Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT,
    /* Signed Normalized Float Color Formats  */
    SDL_GPU_TEXTUREFORMAT_R8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16_SNORM,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM,
    /* Signed Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
    /* Unsigned Float Color Formats */
    SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT,
    /* Unsigned Integer Color Formats */
    SDL_GPU_TEXTUREFORMAT_R8_UINT,
    SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
    SDL_GPU_TEXTUREFORMAT_R16_UINT,
    SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
    SDL_GPU_TEXTUREFORMAT_R32_UINT,
    SDL_GPU_TEXTUREFORMAT_R32G32_UINT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT,
    /* Signed Integer Color Formats */
    SDL_GPU_TEXTUREFORMAT_R8_INT,
    SDL_GPU_TEXTUREFORMAT_R8G8_INT,
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT,
    SDL_GPU_TEXTUREFORMAT_R16_INT,
    SDL_GPU_TEXTUREFORMAT_R16G16_INT,
    SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT,
    SDL_GPU_TEXTUREFORMAT_R32_INT,
    SDL_GPU_TEXTUREFORMAT_R32G32_INT,
    SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT,
    /* SRGB Unsigned Normalized Color Formats */
    SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB,
    /* Compressed SRGB Unsigned Normalized Color Formats */
    SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB,
    /* Depth Formats */
    SDL_GPU_TEXTUREFORMAT_D16_UNORM,
    SDL_GPU_TEXTUREFORMAT_D24_UNORM,
    SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
    SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
    SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT,
    /* Compressed ASTC Normalized Float Color Formats*/
    SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM,
    /* Compressed SRGB ASTC Normalized Float Color Formats*/
    SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB,
    /* Compressed ASTC Signed Float Color Formats*/
    SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT,
    SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT
end type

public constant SDL_GPUTextureUsageFlags = C_UINT32

public constant SDL_GPU_TEXTUREUSAGE_SAMPLER = shift_bits(1,0)
public constant SDL_GPU_TEXTUREUSAGE_COLOR_TARGET = shift_bits(1,-1)
public constant SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET = shift_bits(1,-2)
public constant SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ = shift_bits(1,-3)
public constant SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ = shift_bits(1,-4)
public constant SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE = shift_bits(1,-5)
public constant SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE = shift_bits(1,-6)

public enum type SDL_GPUTextureType
	SDL_GPU_TEXTURETYPE_2D = 0,         /**< The texture is a 2-dimensional image. */
    SDL_GPU_TEXTURETYPE_2D_ARRAY,   /**< The texture is a 2-dimensional array image. */
    SDL_GPU_TEXTURETYPE_3D,         /**< The texture is a 3-dimensional image. */
    SDL_GPU_TEXTURETYPE_CUBE,       /**< The texture is a cube image. */
    SDL_GPU_TEXTURETYPE_CUBE_ARRAY  /**< The texture is a cube array image. */
end type

public enum type SDL_GPUSampleCount
	SDL_GPU_SAMPLECOUNT_1 = 0,  /**< No multisampling. */
    SDL_GPU_SAMPLECOUNT_2,  /**< MSAA 2x */
    SDL_GPU_SAMPLECOUNT_4,  /**< MSAA 4x */
    SDL_GPU_SAMPLECOUNT_8   /**< MSAA 8x */
end type

public enum type SDL_GPUCubeMapFace
	 SDL_GPU_CUBEMAPFACE_POSITIVEX = 0,
    SDL_GPU_CUBEMAPFACE_NEGATIVEX,
    SDL_GPU_CUBEMAPFACE_POSITIVEY,
    SDL_GPU_CUBEMAPFACE_NEGATIVEY,
    SDL_GPU_CUBEMAPFACE_POSITIVEZ,
    SDL_GPU_CUBEMAPFACE_NEGATIVEZ
end type

public constant SDL_GPUBufferUsageFlags = C_UINT32

public constant SDL_GPU_BUFFERUSAGE_VERTEX = shift_bits(1,0)
public constant SDL_GPU_BUFFERUSAGE_INDEX = shift_bits(1,-1)
public constant SDL_GPU_BUFFERUSAGE_INDIRECT = shift_bits(1,-2)
public constant SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ = shift_bits(1,-3)
public constant SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ = shift_bits(1,-4)
public constant SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE = shift_bits(1,-5)

public enum type SDL_GPUTransferBufferUsage
	SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD = 0,
    SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD
end type

public enum type SDL_GPUShaderStage
	SDL_GPU_SHADERSTAGE_VERTEX = 0,
    SDL_GPU_SHADERSTAGE_FRAGMENT
end type

public constant SDL_GPUShaderFormat = C_UINT32

public constant SDL_GPU_SHADERFORMAT_INVALID = 0
public constant SDL_GPU_SHADERFORMAT_PRIVATE = shift_bits(1,0)
public constant SDL_GPU_SHADERFORMAT_SPIRV = shift_bits(1,-1)
public constant SDL_GPU_SHADERFORMAT_DXBC = shift_bits(1,-2)
public constant SDL_GPU_SHADERFORMAT_DXIL = shift_bits(1,-3)
public constant SDL_GPU_SHADERFORMAT_MSL = shift_bits(1,-4)
public constant SDL_GPU_SHADERFORMAT_METALLIB = shift_bits(1,-5)

public enum type SDL_GPUVertexElementFormat
	SDL_GPU_VERTEXELEMENTFORMAT_INVALID = 0,

    /* 32-bit Signed Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_INT,
    SDL_GPU_VERTEXELEMENTFORMAT_INT2,
    SDL_GPU_VERTEXELEMENTFORMAT_INT3,
    SDL_GPU_VERTEXELEMENTFORMAT_INT4,

    /* 32-bit Unsigned Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_UINT,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
    SDL_GPU_VERTEXELEMENTFORMAT_UINT4,

    /* 32-bit Floats */
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
    SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,

    /* 8-bit Signed Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,

    /* 8-bit Unsigned Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,

    /* 8-bit Signed Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM,

    /* 8-bit Unsigned Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM,

    /* 16-bit Signed Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,

    /* 16-bit Unsigned Integers */
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,

    /* 16-bit Signed Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM,

    /* 16-bit Unsigned Normalized */
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM,
    SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM,

    /* 16-bit Floats */
    SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
    SDL_GPU_VERTEXELEMENTFORMAT_HALF4
end type

public enum type SDL_GPUVertexInputRate
	SDL_GPU_VERTEXINPUTRATE_VERTEX = 0,   /**< Attribute addressing is a function of the vertex index. */
    SDL_GPU_VERTEXINPUTRATE_INSTANCE  /**< Attribute addressing is a function of the instance index. */
end type

public enum type SDL_GPUFillMode
	SDL_GPU_FILLMODE_FILL = 0,  /**< Polygons will be rendered via rasterization. */
    SDL_GPU_FILLMODE_LINE   /**< Polygon edges will be drawn as line segments. */
end type

public enum type SDL_GPUCullMode
	SDL_GPU_CULLMODE_NONE = 0,   /**< No triangles are culled. */
    SDL_GPU_CULLMODE_FRONT,  /**< Front-facing triangles are culled. */
    SDL_GPU_CULLMODE_BACK    /**< Back-facing triangles are culled. */
end type

public enum type SDL_GPUFrontFace
	SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE = 0,  /**< A triangle with counter-clockwise vertex winding will be considered front-facing. */
    SDL_GPU_FRONTFACE_CLOCKWISE           /**< A triangle with clockwise vertex winding will be considered front-facing. */
end type

public enum type SDL_GPUCompareOp
	SDL_GPU_COMPAREOP_INVALID = 0,
    SDL_GPU_COMPAREOP_NEVER,             /**< The comparison always evaluates false. */
    SDL_GPU_COMPAREOP_LESS,              /**< The comparison evaluates reference < test. */
    SDL_GPU_COMPAREOP_EQUAL,             /**< The comparison evaluates reference == test. */
    SDL_GPU_COMPAREOP_LESS_OR_EQUAL,     /**< The comparison evaluates reference <= test. */
    SDL_GPU_COMPAREOP_GREATER,           /**< The comparison evaluates reference > test. */
    SDL_GPU_COMPAREOP_NOT_EQUAL,         /**< The comparison evaluates reference != test. */
    SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,  /**< The comparison evalutes reference >= test. */
    SDL_GPU_COMPAREOP_ALWAYS             /**< The comparison always evaluates true. */
end type

public enum type SDL_GPUStencilOp
	   SDL_GPU_STENCILOP_INVALID = 0,
    SDL_GPU_STENCILOP_KEEP,                 /**< Keeps the current value. */
    SDL_GPU_STENCILOP_ZERO,                 /**< Sets the value to 0. */
    SDL_GPU_STENCILOP_REPLACE,              /**< Sets the value to reference. */
    SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,  /**< Increments the current value and clamps to the maximum value. */
    SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,  /**< Decrements the current value and clamps to 0. */
    SDL_GPU_STENCILOP_INVERT,               /**< Bitwise-inverts the current value. */
    SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,   /**< Increments the current value and wraps back to 0. */
    SDL_GPU_STENCILOP_DECREMENT_AND_WRAP    /**< Decrements the current value and wraps to the maximum value. */
end type

public enum type SDL_GPUBlendOp
	 SDL_GPU_BLENDOP_INVALID = 0,
    SDL_GPU_BLENDOP_ADD,               /**< (source * source_factor) + (destination * destination_factor) */
    SDL_GPU_BLENDOP_SUBTRACT,          /**< (source * source_factor) - (destination * destination_factor) */
    SDL_GPU_BLENDOP_REVERSE_SUBTRACT,  /**< (destination * destination_factor) - (source * source_factor) */
    SDL_GPU_BLENDOP_MIN,               /**< min(source, destination) */
    SDL_GPU_BLENDOP_MAX                /**< max(source, destination) */
end type

public enum type SDL_GPUBlendFactor
	SDL_GPU_BLENDFACTOR_INVALID = 0,
    SDL_GPU_BLENDFACTOR_ZERO,                      /**< 0 */
    SDL_GPU_BLENDFACTOR_ONE,                       /**< 1 */
    SDL_GPU_BLENDFACTOR_SRC_COLOR,                 /**< source color */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,       /**< 1 - source color */
    SDL_GPU_BLENDFACTOR_DST_COLOR,                 /**< destination color */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,       /**< 1 - destination color */
    SDL_GPU_BLENDFACTOR_SRC_ALPHA,                 /**< source alpha */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,       /**< 1 - source alpha */
    SDL_GPU_BLENDFACTOR_DST_ALPHA,                 /**< destination alpha */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,       /**< 1 - destination alpha */
    SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,            /**< blend constant */
    SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,  /**< 1 - blend constant */
    SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE         /**< min(source alpha, 1 - destination alpha) */
end type

public constant SDL_GPUColorComponentFlags = C_UINT8

public constant SDL_GPU_COLORCOMPONENT_R = shift_bits(1,0)
public constant SDL_GPU_COLORCOMPONENT_G = shift_bits(1,-1)
public constant SDL_GPU_COLORCOMPONENT_B = shift_bits(1,-2)
public constant SDL_GPU_COLORCOMPONENT_A = shift_bits(1,-3)

public enum type SDL_GPUFilter
	SDL_GPU_FILTER_NEAREST = 0,  /**< Point filtering. */
    SDL_GPU_FILTER_LINEAR    /**< Linear filtering. */
end type

public enum type SDL_GPUSamplerMipmapMode
	SDL_GPU_SAMPLERMIPMAPMODE_NEAREST = 0,  /**< Point filtering. */
    SDL_GPU_SAMPLERMIPMAPMODE_LINEAR    /**< Linear filtering. */
end type

public enum type SDL_GPUSamplerAddressMode
	 SDL_GPU_SAMPLERADDRESSMODE_REPEAT = 0,           /**< Specifies that the coordinates will wrap around. */
    SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT,  /**< Specifies that the coordinates will wrap around mirrored. */
    SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE     /**< Specifies that the coordinates will clamp to the 0-1 range. */
end type

public enum type SDL_GPUPresentMode
	SDL_GPU_PRESENTMODE_VSYNC = 0,
    SDL_GPU_PRESENTMODE_IMMEDIATE,
    SDL_GPU_PRESENTMODE_MAILBOX
end type

public enum type SDL_GPUSwapchainComposition
	SDL_GPU_SWAPCHAINCOMPOSITION_SDR = 0,
    SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR,
    SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR,
    SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084
end type

public constant SDL_GPUViewport = define_c_struct({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --w
	C_FLOAT, --h
	C_FLOAT, --min_depth
	C_FLOAT  --max_depth
})

public constant SDL_GPUTextureTransferInfo = define_c_struct({
	C_POINTER, --transfer_buffer
	C_UINT32, --offset
	C_UINT32, --pixels_per_row
	C_UINT32  --rows_per_layer
})

public constant SDL_GPUTransferBufferLocation = define_c_struct({
	C_POINTER, --transfuer_buffer
	C_UINT32 --offset
})

public constant SDL_GPUTextureLocation = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mip_level
	C_UINT32, --layer
	C_UINT32, --x
	C_UINT32, --y
	C_UINT32 --z
})

public constant SDL_GPUTextureRegion = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mip_level
	C_UINT32, --layer
	C_UINT32, --x
	C_UINT32, --y
	C_UINT32, --z
	C_UINT32, --w
	C_UINT32, --h
	C_UINT32  --d
})

public constant SDL_GPUBlitRegion = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mip_evel
	C_UINT32, --layer_or_depth_plane
	C_UINT32, --x
	C_UINT32, --y
	C_UINT32, --w
	C_UINT32 --h
})

public constant SDL_GPUBufferLocation = define_c_struct({
	C_POINTER, --buffer
	C_UINT32 --offset
})

public constant SDL_GPUBufferRegion = define_c_struct({
	C_POINTER, --buffer
	C_UINT32, --ofset
	C_UINT32 --size
})

public constant SDL_GPUIndirectDrawCommand = define_c_struct({
	C_UINT32, --num_vertices
	C_UINT32, --num_instances
	C_UINT32, --first_index
	C_UINT32 --first_instance
})

public constant SDL_GPUIndexedIndirectDrawCommand = define_c_struct({
	C_UINT32, --num_indices
	C_UINT32, --num_instances
	C_UINT32, --first_index
	C_INT32, --vertex_offset
	C_UINT32 --first_instance
})

public constant SDL_GPUIndirectDispatchCommand = define_c_struct({
	C_UINT32, --groupcount_x
	C_UINT32, --groupcount_y
	C_UINT32  --groupcount_z
})

public constant SDL_GPUSamplerCreateInfo = define_c_struct({
	C_INT, --min_filter
	C_INT, --mag_filter
	C_INT, --mipmap_mode
	C_INT, --address_mode_u
	C_INT, --address_mode_v
	C_INT, --address_mode_w
	C_FLOAT, --mip_load_bias
	C_FLOAT, --max_anisotrophy
	C_INT, --compare_op
	C_FLOAT, --min_lod
	C_FLOAT, --max_lod
	C_BOOL, --enable_anisotrophy
	C_BOOL, --enable_compare
	C_UINT8, --padding1
	C_UINT8,  --padding2
	C_UINT32 --props
})

public constant SDL_GPUVertexBufferDescription = define_c_struct({
	C_UINT32, --slot
	C_UINT32, --pitch
	C_INT, --input_rate
	C_UINT32 --instance_step_rate
})

public constant SDL_GPUVertexAttribute = define_c_struct({
	C_UINT32, --location
	C_UINT32, --buffer_slot
	C_INT, --format
	C_UINT32 --offset
})

public constant SDL_GPUVertexInputState = define_c_struct({
	C_POINTER, --vertex_buffer_descriptions
	C_UINT32, --num_vertex_buffers
	C_POINTER, --vertex_attributes
	C_UINT32 --num_vertex_attributes
})

public constant SDL_GPUStencilOpState = define_c_struct({
	C_INT, --fail_op
	C_INT, --pass_op
	C_INT, --depth_fail_op
	C_INT --compare_op
})

public constant SDL_GPUColorTargetBlendState = define_c_struct({
	C_INT, --src_color_blendfactor
	C_INT, --dst_color_blendfactor
	C_INT, --color_blend_op
	C_INT, --src_alpha_blendfactor
	C_INT, --dst_alpha_blendfactor
	C_INT, --alpha_blend_op
	C_INT, --color_write_mask
	C_BOOL, --enabled_blend
	C_BOOL, --enable_color_write_mask
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_GPUShaderCreateInfo = define_c_struct({
	C_SIZE_T, --code_size
	C_POINTER, --code
	C_STRING, --entrypoint
	C_INT, --format
	C_INT, --stage
	C_UINT32, --num_samplers
	C_UINT32, --num_storage_textures
	C_UINT32, --num_storage_buffers
	C_UINT32, --num_uniform_buffers
	C_UINT32 --props
})

public constant SDL_GPUTextureCreateInfo = define_c_struct({
	C_INT, --type
	C_INT, --format
	C_INT, --usage
	C_UINT32, --width
	C_UINT32, --height
	C_UINT32, --layer_count_or_depth
	C_UINT32, --num_levels
	C_INT, --sample_count
	C_UINT32 --props
})

public constant SDL_GPUBufferCreateInfo = define_c_struct({
	C_INT, --usage
	C_UINT32, --size
	C_UINT32 --props
})

public constant SDL_GPUTransferBufferCreateInfo = define_c_struct({
	C_INT, --usage
	C_UINT32, --size
	C_UINT32 --props
})

public constant SDL_GPURasterizerState = define_c_struct({
	C_INT, --fill_mode
	C_INT, --cull_mode
	C_INT, --front_face
	C_FLOAT, --depth_bias_constant_factor
	C_FLOAT, --depth_bias_clamp
	C_FLOAT, --depth_bias_slope_factor
	C_FLOAT, --enable_depth_bias
	C_FLOAT, --enable_depth_clip
	C_UINT8, --padding
	C_UINT8 --padding2
})

public constant SDL_GPUMultiSampleState = define_c_struct({
	C_INT, --sample_count
	C_UINT32, --sample_mask
	C_BOOL, --enable_mask
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8  --padding3
})

public constant SDL_GPUDepthStencilState = define_c_struct({
	C_INT, --compare_op
	C_INT, --back_stencil_state
	C_INT, --front_stencil_state
	C_UINT8, --compare_mask
	C_UINT8, --write_mask
	C_BOOL, --enable_depth_test
	C_BOOL, --enable_depth_write
	C_BOOL, --enable_stencil_test
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8  --padding3
})

public constant SDL_GPUColorTargetDescription = define_c_struct({
	C_INT, --format
	C_INT --blend_state
})

public constant SDL_GPUGraphicsPipelineTargetInfo = define_c_struct({
	C_POINTER, --color_target_descriptions
	C_UINT32, --num_color_targets
	C_INT, --depth_stencil_format
	C_BOOL, --hasp_depth_stencil_target
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8  --padding3
})

public constant SDL_GPUGraphicsPipelineCreateInfo = define_c_struct({
	C_POINTER, --vertex_shader
	C_POINTER, --fragment_shader
	C_INT, --vertex_input_state
	C_INT, --primitive_type
	C_INT, --rasterizer_state
	C_INT, --multisample_state
	C_INT, --depth_stencil_state
	C_INT, --target_info
	C_UINT32 --props
})

public constant SDL_GPUComputePipelineCreateInfo = define_c_struct({
	C_SIZE_T, --code_size
	C_POINTER, --code
	C_STRING, --entrypoint
	C_INT, --format
	C_UINT32, --num_samplers
	C_UINT32, --num_readonly_storage_textures
	C_UINT32, --num_readonly_storage_buffers
	C_UINT32, --num_readwrite_storage_textures
	C_UINT32, --num_readwrite_storage_buffers
	C_UINT32, --num_uniform_buffers
	C_UINT32, --threadocunt_x
	C_UINT32, --threadcount_y
	C_UINT32, --threadcount_z
	C_UINT32 --props
})

public constant SDL_GPUColorTargetInfo = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mip_level
	C_UINT32, --layer_or_depth_plane
	SDL_FColor, --clear_color
	C_INT, --load_op
	C_INT, --store_op
	C_POINTER, --resolve_texture
	C_UINT32, --resolve_mip_level
	C_UINT32, --resolve_layer
	C_BOOL, --cycle
	C_BOOL, --cycle_resolve_texture
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_GPUDepthStencilTargetInfo = define_c_struct({
	C_POINTER, --texture
	C_FLOAT, --clear_depth
	C_INT, --load_op
	C_INT, --store_op
	C_INT, --stencil_load_op
	C_INT, --stencil_store_op
	C_BOOL, --cycle
	C_UINT8, --clear_stencil
	C_UINT8, --padding1
	C_UINT8 --padding2
})

public constant SDL_GPUBlitInfo = define_c_struct({
	C_INT, --source
	C_INT, --destination
	C_INT, --load_op
	SDL_FColor, --clear_color
	C_INT, --flip_mode
	C_INT, --filter
	C_BOOL, --cycle
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8  --padding3
})

public constant SDL_GPUBufferBinding = define_c_struct({
	C_POINTER, --buffer
	C_UINT32 --offset
})

public constant SDL_GPUTextureSamplerBinding = define_c_struct({
	C_POINTER, --texture
	C_POINTER --sampler
})

public constant SDL_GPUStorageBufferReadWriteBinding = define_c_struct({
	C_POINTER, --buffer
	C_BOOL, --cycle
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8  --padding3
})

public constant SDL_GPUStorageTextureReadWriteBinding = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mip_level
	C_UINT32, --layer
	C_BOOL, --cycle
	C_UINT8, --padding1
	C_UINT8, --padding2
	C_UINT8 --padding3
})

public constant xSDL_GPUSupportsShaderFormats = define_c_func(sdl,"+SDL_GPUSupportsShaderFormats",{C_INT,C_STRING},C_BOOL)

public function SDL_GPUSupportsShaderFormats(atom format_flags,sequence name)
	return c_func(xSDL_GPUSupportsShaderFormats,{format_flags,name})
end function

public constant xSDL_GPUSupportsProperties = define_c_func(sdl,"+SDL_GPUSupportsProperties",{C_UINT32},C_BOOL)

public function SDL_GPUSupportsProperties(atom props)
	return c_func(xSDL_GPUSupportsProperties,{props})
end function

public constant xSDL_CreateGPUDevice = define_c_func(sdl,"+SDL_CreateGPUDevice",{C_INT,C_BOOL,C_STRING},C_POINTER)

public function SDL_CreateGPUDevice(atom format_flags,atom debug_mode,sequence name)
	return c_func(xSDL_CreateGPUDevice,{format_flags,debug_mode,name})
end function

public constant xSDL_CreateGPUDeviceWithProperties = define_c_func(sdl,"+SDL_CreateGPUDeviceWithProperties",{C_UINT32},C_POINTER)

public function SDL_CreateGPUDeviceWithProperties(atom props)
	return c_func(xSDL_CreateGPUDeviceWithProperties,{props})
end function

public constant xSDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN   =       "SDL.gpu.device.create.debugmode"
public constant SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN   =  "SDL.gpu.device.create.preferlowpower"
public constant SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING              =  "SDL.gpu.device.create.name"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN  =  "SDL.gpu.device.create.shaders.private"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN    =  "SDL.gpu.device.create.shaders.spirv"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN     =  "SDL.gpu.device.create.shaders.dxbc"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN     =  "SDL.gpu.device.create.shaders.dxil"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN      =  "SDL.gpu.device.create.shaders.msl"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN  = "SDL.gpu.device.create.shaders.metallib"
public constant SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING = "SDL.gpu.device.create.d3d12.semantic"

public constant xSDL_DestroyGPUDevice = define_c_proc(sdl,"+SDL_DestroyGPUDevice",{C_POINTER})

public procedure SDL_DestroyGPUDevice(atom device)
	c_proc(xSDL_DestroyGPUDevice,{device})
end procedure

public constant xSDL_GetNumGPUDrivers = define_c_func(sdl,"+SDL_GetNumGPUDrivers",{},C_INT)

public function SDL_GetNumGPUDrivers()
	return c_func(xSDL_GetNumGPUDrivers,{})
end function

public constant xSDL_GetGPUDriver = define_c_func(sdl,"+SDL_GetGPUDriver",{C_INT},C_STRING)

public function SDL_GetGPUDriver(atom index)
	return c_func(xSDL_GetGPUDriver,{index})
end function

public constant xSDL_GetGPUDeviceDriver = define_c_func(sdl,"+SDL_GetGPUDeviceDriver",{C_POINTER},C_STRING)

public function SDL_GetGPUDeviceDriver(atom device)
	return c_func(xSDL_GetGPUDeviceDriver,{device})
end function

public constant xSDL_GetGPUShaderFormats = define_c_func(sdl,"+SDL_GetGPUShaderFormats",{C_POINTER},C_INT)

public function SDL_GetGPUShaderFormats(atom device)
	return c_func(xSDL_GetGPUShaderFormats,{device})
end function

public constant xSDL_CreateGPUComputePipeline = define_c_func(sdl,"+SDL_CreateGPUComputePipeline",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUComputePipeline(atom device,atom createinfo)
	return c_func(xSDL_CreateGPUComputePipeline,{device,createinfo})
end function

public constant SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING = "SDL.gpu.computepipeline.create.name"

public constant xSDL_CreateGPUGraphicsPipeline = define_c_func(sdl,"+SDL_CreateGPUGraphicsPipeline",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUGraphicsPipeline(atom device,atom createinfo)
	return c_func(xSDL_CreateGPUGraphicsPipeline,{device,createinfo})
end function

public constant SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING = "SDL.gpu.graphicspipeline.create.name"

public constant xSDL_CreateGPUSampler = define_c_func(sdl,"+SDL_CreateGPUSampler",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUSampler(atom device,atom createinfo)
	return c_func(xSDL_CreateGPUSampler,{device,createinfo})
end function

public constant SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING = "SDL.gpu.sampler.create.name"

public constant xSDL_CreateGPUShader = define_c_func(sdl,"+SDL_CreateGPUShader",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUShader(atom device,atom createinfo)
	return c_func(xSDL_CreateGPUShader,{device,createinfo})
end function

public constant SDL_PROP_GPU_SHADER_CREATE_NAME_STRING = "SDL.gpu.shader.create.name"

public constant xSDL_CreateGPUTexture = define_c_func(sdl,"+SDL_CreateGPUTexture",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUTexture(atom device,atom createinfo)
	return c_func(xSDL_CreateGPUTexture,{device,createinfo})
end function

public constant SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT =      "SDL.gpu.texture.create.d3d12.clear.r"
public constant SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT      = "SDL.gpu.texture.create.d3d12.clear.g"
public constant SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT      = "SDL.gpu.texture.create.d3d12.clear.b"
public constant SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT      = "SDL.gpu.texture.create.d3d12.clear.a"
public constant SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT   = "SDL.gpu.texture.create.d3d12.clear.depth"
public constant SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_UINT8 = "SDL.gpu.texture.create.d3d12.clear.stencil"
public constant SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING              = "SDL.gpu.texture.create.name"

public constant xSDL_CreateGPUBuffer = define_c_func(sdl,"+SDL_CreateGPUBuffer",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUBuffer(atom device,atom createinfo)
	return c_func(xSDL_CreateGPUBuffer,{device,createinfo})
end function

public constant SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING = "SDL.gpu.buffer.create.name"

public constant xSDL_CreateGPUTransferBuffer = define_c_func(sdl,"+SDL_CreateGPUTransferBuffer",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUTransferBuffer(atom device,atom createinfo)
	return c_func(xSDL_CreateGPUTransferBuffer,{device,createinfo})
end function

public constant SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING = "SDL.gpu.transferbuffer.create.name"

public constant xSDL_SetGPUBufferName = define_c_proc(sdl,"+SDL_SetGPUBufferName",{C_POINTER,C_POINTER,C_STRING})

public procedure SDL_SetGPUBufferName(atom device,atom buffer,sequence text)
	c_proc(xSDL_SetGPUBufferName,{device,buffer,text})
end procedure

public constant xSDL_SetGPUTextureName = define_c_proc(sdl,"+SDL_SetGPUTextureName",{C_POINTER,C_POINTER,C_STRING})

public procedure SDL_SetGPUTextureName(atom device,atom texture,sequence text)
	c_proc(xSDL_SetGPUTextureName,{device,texture,text})
end procedure

public constant xSDL_InsertGPUDebugLabel = define_c_proc(sdl,"+SDL_InsertGPUDebugLabel",{C_POINTER,C_STRING})

public procedure SDL_InsertGPUDebugLabel(atom command_buffer,sequence text)
	c_proc(xSDL_InsertGPUDebugLabel,{command_buffer,text})
end procedure

public constant xSDL_PushGPUDebugGroup = define_c_proc(sdl,"+SDL_PushGPUDebugGroup",{C_POINTER,C_STRING})

public procedure SDL_PushGPUDebugGroup(atom cmd_buffer,sequence name)
	c_proc(xSDL_PushGPUDebugGroup,{cmd_buffer,name})
end procedure

public constant xSDL_PopGPUDebugGroup = define_c_proc(sdl,"+SDL_PopGPUDebugGroup",{C_POINTER})

public procedure SDL_PopGPUDebugGroup(atom cmd_buffer)
	c_proc(xSDL_PopGPUDebugGroup,{cmd_buffer})
end procedure

public constant xSDL_ReleaseGPUTexture = define_c_proc(sdl,"+SDL_ReleaseGPUTexture",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUTexture(atom device,atom texture)
	c_proc(xSDL_ReleaseGPUTexture,{device,texture})
end procedure

public constant xSDL_ReleaseGPUSampler = define_c_proc(sdl,"+SDL_ReleaseGPUSampler",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUSampler(atom device,atom sampler)
	c_proc(xSDL_ReleaseGPUSampler,{device,sampler})
end procedure

public constant xSDL_ReleaseGPUBuffer = define_c_proc(sdl,"+SDL_ReleaseGPUBuffer",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUBuffer(atom device,atom buffer)
	c_proc(xSDL_ReleaseGPUBuffer,{device,buffer})
end procedure

public constant xSDL_ReleaseGPUTransferBuffer = define_c_proc(sdl,"+SDL_ReleaseGPUTransferBuffer",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUTransferBuffer(atom device,atom transfer_buffer)
	c_proc(xSDL_ReleaseGPUTransferBuffer,{device,transfer_buffer})
end procedure

public constant xSDL_ReleaseGPUComputePipeline = define_c_proc(sdl,"+SDL_ReleaseGPUComputePipeline",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUComputePipeline(atom device,atom compute_pipeline)
	c_proc(xSDL_ReleaseGPUComputePipeline,{device,compute_pipeline})
end procedure

public constant xSDL_ReleaseGPUShader = define_c_proc(sdl,"+SDL_ReleaseGPUShader",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUShader(atom device,atom shader)
	c_proc(xSDL_ReleaseGPUShader,{device,shader})
end procedure

public constant xSDL_ReleaseGPUGraphicsPipelin = define_c_proc(sdl,"+SDL_ReleaseGPUGraphicsPipelin",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUGraphicsPipelin(atom device,atom graphics_pipeline)
	c_proc(xSDL_ReleaseGPUGraphicsPipelin,{device,graphics_pipeline})
end procedure

public constant xSDL_AcquireGPUCommandBuffer = define_c_func(sdl,"+SDL_AcquireGPUCommandBuffer",{C_POINTER},C_POINTER)

public function SDL_AcquireGPUCommandBuffer(atom device)
	return c_func(xSDL_AcquireGPUCommandBuffer,{device})
end function

public constant xSDL_PushGPUVertexUniformData = define_c_proc(sdl,"+SDL_PushGPUVertexUniformData",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_PushGPUVertexUniformData(atom cmd_buffer,atom slot_index,atom data,atom len)
	c_proc(xSDL_PushGPUVertexUniformData,{cmd_buffer,slot_index,data,len})
end procedure

public constant xSDL_PushGPUFragmentUniformData = define_c_proc(sdl,"+SDL_PushGPUFragmentUniformData",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_PushGPUFragmentUniformData(atom cmd_buffer,atom slot_index,atom data,atom len)
	c_proc(xSDL_PushGPUFragmentUniformData,{cmd_buffer,slot_index,data,len})
end procedure

public constant xSDL_PushGPUComputeUniformData = define_c_proc(sdl,"+SDL_PushGPUComputeUniformData",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_PushGPUComputeUniformData(atom cmd_buffer,atom slot_index,atom data,atom len)
	c_proc(xSDL_PushGPUComputeUniformData,{cmd_buffer,slot_index,data,len})
end procedure

public constant xSDL_BeginGPURenderPass = define_c_func(sdl,"+SDL_BeginGPURenderPass",{C_POINTER,C_POINTER,C_UINT32,C_POINTER},C_POINTER)

public function SDL_BeginGPURenderPass(atom cmd_buffer,atom color_target_infos,atom num_color_targets,atom depth_stencil_target_info)
	return c_func(xSDL_BeginGPURenderPass,{cmd_buffer,color_target_infos,num_color_targets,depth_stencil_target_info})
end function

public constant xSDL_BindGPUGraphicsPipeline = define_c_proc(sdl,"+SDL_BindGPUGraphicsPipeline",{C_POINTER,C_POINTER})

public procedure SDL_BindGPUGraphicsPipeline(atom render_pass,atom graphics_pipeline)
	c_proc(xSDL_BindGPUGraphicsPipeline,{render_pass,graphics_pipeline})
end procedure

public constant xSDL_SetGPUViewport = define_c_proc(sdl,"+SDL_SetGPUViewport",{C_POINTER,C_POINTER})

public procedure SDL_SetGPUViewport(atom render_pass,atom viewport)
	c_proc(xSDL_SetGPUViewport,{render_pass,viewport})
end procedure

public constant xSDL_SetGPUScissor = define_c_proc(sdl,"+SDL_SetGPUScissor",{C_POINTER,C_POINTER})

public procedure SDL_SetGPUScissor(atom render_pass,atom scissor)
	c_proc(xSDL_SetGPUScissor,{render_pass,scissor})
end procedure

public constant xSDL_SetGPUBlendConstants = define_c_proc(sdl,"+SDL_SetGPUBlendConstants",{C_POINTER,SDL_FColor})

public procedure SDL_SetGPUBlendConstants(atom render_pass,sequence blend_constants)
	c_proc(xSDL_SetGPUBlendConstants,{render_pass,blend_constants})
end procedure

public constant xSDL_SetGPUStencilReference = define_c_proc(sdl,"+SDL_SetGPUStencilReference",{C_POINTER,C_UINT8})

public procedure SDL_SetGPUStencilReference(atom render_pass,atom reference)
	c_proc(xSDL_SetGPUStencilReference,{render_pass,reference})
end procedure

public constant xSDL_BindGPUVertexBuffers = define_c_proc(sdl,"+SDL_BindGPUVertexBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexBuffers(atom render_pass,atom first_slot,atom bindings,atom num_bindings)
	c_proc(xSDL_BindGPUVertexBuffers,{render_pass,first_slot,bindings,num_bindings})
end procedure

public constant xSDL_BindGPUIndexBuffer = define_c_proc(sdl,"+SDL_BindGPUIndexBuffer",{C_POINTER,C_POINTER,C_INT})

public procedure SDL_BindGPUIndexBuffer(atom render_pass,atom binding,atom index_element_size)
	c_proc(xSDL_BindGPUIndexBuffer,{render_pass,binding,index_element_size})
end procedure

public constant xSDL_BindGPUVertexSamplers = define_c_proc(sdl,"+SDL_BindGPUVertexSamplers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexSamplers(atom render_pass,atom first_slot,atom texture_sampler_bindings,atom num_bindings)
	c_proc(xSDL_BindGPUVertexSamplers,{render_pass,first_slot,texture_sampler_bindings,num_bindings})
end procedure

public constant xSDL_BindGPUVertexStorageTextures = define_c_proc(sdl,"+SDL_BindGPUVertexStorageTextures",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexStorageTextures(atom render_pass,atom first_slot,atom storage_textures,atom num_bindings)
	c_proc(xSDL_BindGPUVertexStorageTextures,{render_pass,first_slot,storage_textures,num_bindings})
end procedure

public constant xSDL_BindGPUVertexStorageBuffers = define_c_proc(sdl,"+SDL_BindGPUVertexStorageBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexStorageBuffers(atom render_pass,atom first_slot,atom storage_buffers,atom num_bindings)
	c_proc(xSDL_BindGPUVertexStorageBuffers,{render_pass,first_slot,storage_buffers,num_bindings})
end procedure

public constant xSDL_BindGPUFragmentSamplers = define_c_proc(sdl,"+SDL_BindGPUFragmentSamplers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUFragmentSamplers(atom render_pass,atom first_slot,atom texture_sampler_bindings,atom num_bindings)
	c_proc(xSDL_BindGPUFragmentSamplers,{render_pass,first_slot,texture_sampler_bindings,num_bindings})	
end procedure

public constant xSDL_BindGPUFragmentStorageTextures = define_c_proc(sdl,"+SDL_BindGPUFragmentStorageTextures",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUFragmentStorageTextures(atom render_pass,atom first_slot,atom storage_textures,atom num_bindings)
	c_proc(xSDL_BindGPUFragmentStorageTextures,{render_pass,first_slot,storage_textures,num_bindings})
end procedure

public constant xSDL_BindGPUFragmentStorageBuffers = define_c_proc(sdl,"+SDL_BindGPUFragmentStorageBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUFragmentStorageBuffers(atom render_pass,atom first_slot,atom storage_buffers,atom num_bindings)
	c_proc(xSDL_BindGPUFragmentStorageBuffers,{render_pass,first_slot,storage_buffers,num_bindings})
end procedure

public constant xSDL_DrawGPUIndexedPrimitives = define_c_proc(sdl,"+SDL_DrawGPUIndexedPrimitives",{C_POINTER,C_UINT32,C_UINT32,C_UINT32,C_INT32,C_UINT32})

public procedure SDL_DrawGPUIndexedPrimitives(atom render_pass,atom num_indices,atom num_instances,atom first_index,atom vertex_offset,atom first_instance)
	c_proc(xSDL_DrawGPUIndexedPrimitives,{render_pass,num_indices,num_instances,first_index,vertex_offset,first_instance})
end procedure

public constant xSDL_DrawGPUPrimitives = define_c_proc(sdl,"+SDL_DrawGPUPrimitives",{C_POINTER,C_UINT32,C_UINT32,C_UINT32,C_UINT32})

public procedure SDL_DrawGPUPrimitives(atom render_pass,atom num_vertices,atom num_instances,atom first_vertex,atom first_instance)
	c_proc(xSDL_DrawGPUPrimitives,{render_pass,num_vertices,num_instances,first_vertex,first_instance})
end procedure

public constant xSDL_DrawGPUPrimitivesIndirec = define_c_proc(sdl,"+SDL_DrawGPUPrimitivesIndirec",{C_POINTER,C_POINTER,C_UINT32,C_UINT32})

public procedure SDL_DrawGPUPrimitivesIndirec(atom render_pass,atom buffer,atom offset,atom draw_count)
	c_proc(xSDL_DrawGPUPrimitivesIndirec,{render_pass,buffer,offset,draw_count})
end procedure

public constant xSDL_DrawGPUIndexedPrimitivesIndirect = define_c_proc(sdl,"+SDL_DrawGPUIndexedPrimitivesIndirect",{C_POINTER,C_POINTER,C_UINT32,C_UINT32})

public procedure SDL_DrawGPUIndexedPrimitivesIndirect(atom render_pass,atom buffer,atom offset,atom draw_count)
	c_proc(xSDL_DrawGPUIndexedPrimitivesIndirect,{render_pass,buffer,offset,draw_count})
end procedure

public constant xSDL_EndGPURenderPass = define_c_proc(sdl,"+SDL_EndGPURenderPass",{C_POINTER})

public procedure SDL_EndGPURenderPass(atom render_pass)
	c_proc(xSDL_EndGPURenderPass,{render_pass})
end procedure

public constant xSDL_BeginGPUComputePass = define_c_func(sdl,"+SDL_BeginGPUComputePass",{C_POINTER,C_POINTER,C_UINT32,C_POINTER,C_UINT32},C_POINTER)

public function SDL_BeginGPUComputePass(atom cmd_buffer,atom storage_texture_bindings,atom num_storage_texture_bindings,atom storage_buffer_bindings,atom num_storage_buffer_bindings)
	return c_func(xSDL_BeginGPUComputePass,{cmd_buffer,storage_texture_bindings,num_storage_texture_bindings,storage_buffer_bindings,num_storage_buffer_bindings})
end function

public constant xSDL_BindGPUComputePipeline = define_c_proc(sdl,"+SDL_BindGPUComputePipeline",{C_POINTER,C_POINTER})

public procedure SDL_BindGPUComputePipeline(atom compute_pass,atom compute_pipeline)
	c_proc(xSDL_BindGPUComputePipeline,{compute_pass,compute_pipeline})
end procedure

public constant xSDL_BindGPUComputeSampler = define_c_proc(sdl,"+SDL_BindGPUComputeSampler",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUComputeSampler(atom compute_pass,atom first_slot,atom texture_sampler_bindings,atom num_bindings)
	c_proc(xSDL_BindGPUComputeSampler,{compute_pass,first_slot,texture_sampler_bindings,num_bindings})
end procedure

public constant xSDL_BindGPUComputeStorageTextures = define_c_proc(sdl,"+SDL_BindGPUComputeStorageTextures",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUComputeStorageTextures(atom compute_pass,atom first_slot,atom storage_textures,atom num_bindings)
	c_proc(xSDL_BindGPUComputeStorageTextures,{compute_pass,first_slot,storage_textures,num_bindings})
end procedure

public constant xSDL_BindGPUComputeStorageBuffers = define_c_proc(sdl,"+SDL_BindGPUComputeStorageBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUComputeStorageBuffers(atom compute_pass,atom first_slot,atom storage_buffers,atom num_bindings)
	c_proc(xSDL_BindGPUComputeStorageBuffers,{compute_pass,first_slot,storage_buffers,num_bindings})
end procedure

public constant xSDL_DispatchGPUCompute = define_c_proc(sdl,"+SDL_DispatchGPUCompute",{C_POINTER,C_UINT32,C_UINT32,C_UINT32})

public procedure SDL_DispatchGPUCompute(atom compute_pass,atom groupcount_x,atom groupcount_y,atom groupcount_z)
	c_proc(xSDL_DispatchGPUCompute,{compute_pass,groupcount_x,groupcount_y,groupcount_z})
end procedure

public constant xSDL_DispatchGPUComputeIndirect = define_c_proc(sdl,"+SDL_DispatchGPUComputeIndirect",{C_POINTER,C_POINTER,C_UINT32})

public procedure SDL_DispatchGPUComputeIndirect(atom compute_pass,atom buffer,atom offset)
	c_proc(xSDL_DispatchGPUComputeIndirect,{compute_pass,buffer,offset})
end procedure

public constant xSDL_EndGPUComputePass = define_c_proc(sdl,"+SDL_EndGPUComputePass",{C_POINTER})

public procedure SDL_EndGPUComputePass(atom compute_pass)
	c_proc(xSDL_EndGPUComputePass,{compute_pass})
end procedure

public constant xSDL_MapGPUTransferBuffer = define_c_func(sdl,"+SDL_MapGPUTransferBuffer",{C_POINTER,C_POINTER,C_BOOL},C_POINTER)

public function SDL_MapGPUTransferBuffer(atom device,atom transfer_buffer,atom cycle)
	return c_func(xSDL_MapGPUTransferBuffer,{device,transfer_buffer,cycle})
end function

public constant xSDL_UnmapGPUTransferBuffer = define_c_proc(sdl,"+SDL_UnmapGPUTransferBuffer",{C_POINTER,C_POINTER})

public procedure SDL_UnmapGPUTransferBuffer(atom device,atom transfer_buffer)
	c_proc(xSDL_UnmapGPUTransferBuffer,{device,transfer_buffer})
end procedure

public constant xSDL_BeginGPUCopyPass = define_c_func(sdl,"+SDL_BeginGPUCopyPass",{C_POINTER},C_POINTER)

public function SDL_BeginGPUCopyPass(atom cmd_buffer)
	return c_func(xSDL_BeginGPUCopyPass,{cmd_buffer})
end function

public constant xSDL_UploadToGPUTexture = define_c_proc(sdl,"+SDL_UploadToGPUTexture",{C_POINTER,C_POINTER,C_POINTER,C_BOOL})

public procedure SDL_UploadToGPUTexture(atom copy_pass,atom source,atom destination,atom cycle)
	c_proc(xSDL_UploadToGPUTexture,{copy_pass,source,destination,cycle})
end procedure

public constant xSDL_UploadToGPUBuffer = define_c_proc(sdl,"+SDL_UploadToGPUBuffer",{C_POINTER,C_POINTER,C_POINTER,C_BOOL})

public procedure SDL_UploadToGPUBuffer(atom copy_pass,atom source,atom destination,atom cycle)
	c_proc(xSDL_UploadToGPUBuffer,{copy_pass,source,destination,cycle})
end procedure

public constant xSDL_CopyGPUTextureToTexture = define_c_proc(sdl,"+SDL_CopyGPUTextureToTexture",{C_POINTER,C_POINTER,C_POINTER,C_UINT32,C_UINT32,C_UINT32,C_BOOL})

public procedure SDL_CopyGPUTextureToTexture(atom copy_pass,atom source,atom destination,atom w,atom h,atom d,atom cycle)
	c_proc(xSDL_CopyGPUTextureToTexture,{copy_pass,source,destination,w,h,d,cycle})
end procedure

public constant xSDL_CopyGPUBufferToBuffer = define_c_proc(sdl,"+SDL_CopyGPUBufferToBuffer",{C_POINTER,C_POINTER,C_POINTER,C_UINT32,C_BOOL})

public procedure SDL_CopyGPUBufferToBuffer(atom copy_pass,atom source,atom destination,atom size,atom cycle)
	c_proc(xSDL_CopyGPUBufferToBuffer,{copy_pass,source,destination,size,cycle})
end procedure

public constant xSDL_DownloadFromGPUTexture = define_c_proc(sdl,"+SDL_DownloadFromGPUTexture",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_DownloadFromGPUTexture(atom copy_pass,atom source,atom destination)
	c_proc(xSDL_DownloadFromGPUTexture,{copy_pass,source,destination})
end procedure

public constant xSDL_DownloadFromGPUBuffer = define_c_proc(sdl,"+SDL_DownloadFromGPUBuffer",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_DownloadFromGPUBuffer(atom copy_pass,atom source,atom destination)
	c_proc(xSDL_DownloadFromGPUBuffer,{copy_pass,source,destination})
end procedure

public constant xSDL_EndGPUCopyPass = define_c_proc(sdl,"+SDL_EndGPUCopyPass",{C_POINTER})

public procedure SDL_EndGPUCopyPass(atom copy_pass)
	c_proc(xSDL_EndGPUCopyPass,{copy_pass})
end procedure

public constant xSDL_GenerateMipmapsForGPUTexture = define_c_proc(sdl,"+SDL_GenerateMipmapsForGPUTexture",{C_POINTER,C_POINTER})

public procedure SDL_GenerateMipmapsForGPUTexture(atom cmd_buffer,atom texture)
	c_proc(xSDL_GenerateMipmapsForGPUTexture,{cmd_buffer,texture})
end procedure

public constant xSDL_BlitGPUTexture = define_c_proc(sdl,"+SDL_BlitGPUTexture",{C_POINTER,C_POINTER})

public procedure SDL_BlitGPUTexture(atom cmd_buffer,atom info)
	c_proc(xSDL_BlitGPUTexture,{cmd_buffer,info})
end procedure

public constant xSDL_WindowSupportsGPUSwapchainComposition = define_c_func(sdl,"+SDL_WindowSupportsGPUSwapchainComposition",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_WindowSupportsGPUSwapchainComposition(atom device,atom window,atom swapchain)
	return c_func(xSDL_WindowSupportsGPUSwapchainComposition,{device,window,swapchain})
end function

public constant xSDL_WindowSupportsGPUPresentMode = define_c_func(sdl,"+SDL_WindowSupportsGPUPresentMode",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_WindowSupportsGPUPresentMode(atom device,atom window,atom present_mode)
	return c_func(xSDL_WindowSupportsGPUPresentMode,{device,window,present_mode})
end function

public constant xSDL_ClaimWindowForGPUDevice = define_c_func(sdl,"+SDL_ClaimWindowForGPUDevice",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ClaimWindowForGPUDevice(atom device,atom window)
	return c_func(xSDL_ClaimWindowForGPUDevice,{device,window})
end function

public constant xSDL_ReleaseWindowFromGPUDevice = define_c_proc(sdl,"+SDL_ReleaseWindowFromGPUDevice",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseWindowFromGPUDevice(atom device,atom window)
	c_proc(xSDL_ReleaseWindowFromGPUDevice,{device,window})
end procedure

public constant xSDL_SetGPUSwapchainParameters = define_c_func(sdl,"+SDL_SetGPUSwapchainParameters",{C_POINTER,C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_SetGPUSwapchainParameters(atom device,atom window,atom swapchain,atom present_mode)
	return c_func(xSDL_SetGPUSwapchainParameters,{device,window,swapchain,present_mode})
end function

public constant xSDL_SetGPUAllowedFramesInFlight = define_c_func(sdl,"+SDL_SetGPUAllowedFramesInFlight",{C_POINTER,C_UINT32},C_BOOL)

public function SDL_SetGPUAllowedFramesInFlight(atom device,atom allowed_frames)
	return c_func(xSDL_SetGPUAllowedFramesInFlight,{device,allowed_frames})
end function

public constant xSDL_GetGPUSwapchainTextureFormat = define_c_func(sdl,"+SDL_GetGPUSwapchainTextureFormat",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetGPUSwapchainTextureFormat(atom device,atom window)
	return c_func(xSDL_GetGPUSwapchainTextureFormat,{device,window})
end function

public constant xSDL_AcquireGPUSwapchainTexture = define_c_func(sdl,"+SDL_AcquireGPUSwapchainTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_AcquireGPUSwapchainTexture(atom cmd_buffer,atom window,atom swap_width,atom swap_height)
	return c_func(xSDL_AcquireGPUSwapchainTexture,{cmd_buffer,window,swap_width,swap_height})
end function

public constant xSDL_WaitForGPUSwapchain = define_c_func(sdl,"+SDL_WaitForGPUSwapchain",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_WaitForGPUSwapchain(atom device,atom window)
	return c_func(xSDL_WaitForGPUSwapchain,{device,window})
end function

public constant xSDL_WaitAndAcquireGPUSwapchainTexture = define_c_func(sdl,"+SDL_WaitAndAcquireGPUSwapchainTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_WaitAndAcquireGPUSwapchainTexture(atom cmd_buffer,atom window,atom swap_texture,atom swap_width,atom swap_height)
	return c_func(xSDL_WaitAndAcquireGPUSwapchainTexture,{cmd_buffer,window,swap_texture,swap_width,swap_height})
end function

public constant xSDL_SubmitGPUCommandBuffer = define_c_func(sdl,"+SDL_SubmitGPUCommandBuffer",{C_POINTER},C_BOOL)

public function SDL_SubmitGPUCommandBuffer(atom cmd_buffer)
	return c_func(xSDL_SubmitGPUCommandBuffer,{cmd_buffer})
end function

public constant xSDL_SubmitGPUCommandBufferAndAcquireFence = define_c_func(sdl,"+SDL_SubmitGPUCommandBufferAndAcquireFence",{C_POINTER},C_POINTER)

public function SDL_SubmitGPUCommandBufferAndAcquireFence(atom cmd_buffer)
	return c_func(xSDL_SubmitGPUCommandBufferAndAcquireFence,{cmd_buffer})
end function

public constant xSDL_CancelGPUCommandBuffer = define_c_func(sdl,"+SDL_CancelGPUCommandBuffer",{C_POINTER},C_BOOL)

public function SDL_CancelGPUCommandBuffer(atom cmd_buffer)
	return c_func(xSDL_CancelGPUCommandBuffer,{cmd_buffer})
end function

public constant xSDL_WaitForGPUIdle = define_c_func(sdl,"+SDL_WaitForGPUIdle",{C_POINTER},C_BOOL)

public function SDL_WaitForGPUIdle(atom device)
	return c_func(xSDL_WaitForGPUIdle,{device})
end function

public constant xSDL_WaitForGPUFences = define_c_func(sdl,"+SDL_WaitForGPUFences",{C_POINTER,C_BOOL,C_POINTER,C_UINT32},C_BOOL)

public function SDL_WaitForGPUFences(atom device,atom wait_all,atom fences,atom num_fences)
	return c_func(xSDL_WaitForGPUFences,{device,wait_all,fences,num_fences})
end function

public constant xSDL_QueryGPUFence = define_c_func(sdl,"+SDL_QueryGPUFence",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_QueryGPUFence(atom device,atom fence)
	return c_func(xSDL_QueryGPUFence,{device,fence})
end function

public constant xSDL_ReleaseGPUFence = define_c_proc(sdl,"+SDL_ReleaseGPUFence",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUFence(atom device,atom fence)
	c_proc(xSDL_ReleaseGPUFence,{device,fence})
end procedure

public constant xSDL_GPUTextureFormatTexelBlockSize = define_c_func(sdl,"+SDL_GPUTextureFormatTexelBlockSize",{C_INT},C_UINT32)

public function SDL_GPUTextureFormatTexelBlockSize(atom format)
	return c_func(xSDL_GPUTextureFormatTexelBlockSize,{format})
end function

public constant xSDL_GPUTextureSupportsFormat = define_c_func(sdl,"+SDL_GPUTextureSupportsFormat",{C_POINTER,C_INT,C_INT,C_INT},C_BOOL)

public function SDL_GPUTextureSupportsFormat(atom device,atom format,atom _type,atom usage)
	return c_func(xSDL_GPUTextureSupportsFormat,{device,format,_type,usage})
end function

public constant xSDL_GPUTextureSupportsSampleCount = define_c_func(sdl,"+SDL_GPUTextureSupportsSampleCount",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_GPUTextureSupportsSampleCount(atom device,atom format,atom sample_count)
	return c_func(xSDL_GPUTextureSupportsSampleCount,{device,format,sample_count})
end function

public constant xSDL_CalculateGPUTextureFormatSize = define_c_func(sdl,"+SDL_CalculateGPUTextureFormatSize",{C_INT,C_UINT32,C_UINT32,C_UINT32},C_UINT32)

public function SDL_CalculateGPUTextureFormatSize(atom format,atom width,atom height,atom depth_count)
	return c_func(xSDL_CalculateGPUTextureFormatSize,{format,width,height,depth_count})
end function

public constant xSDL_GDKSuspendGPU = define_c_proc(sdl,"+SDL_GDKSuspendGPU",{C_POINTER})

public procedure SDL_GDKSuspendGPU(atom device)
	c_proc(xSDL_GDKSuspendGPU,{device})
end procedure

public constant xSDL_GDKResumeGPU = define_c_proc(sdl,"+SDL_GDKResumeGPU",{C_POINTER})

public procedure SDL_GDKResumeGPU(atom device)
	c_proc(xSDL_GDKResumeGPU,{device})
end procedure

public constant xSDL_GetGPUDeviceProperties = define_c_func(sdl,"+SDL_GetGPUDeviceProperties",{C_POINTER},C_INT)

public function SDL_GetGPUDeviceProperties(atom device)
	return c_func(xSDL_GetGPUDeviceProperties,{device})
end function

public constant xSDL_GetPixelFormatFromGPUTextureFormat = define_c_func(sdl,"+SDL_GetPixelFormatFromGPUTextureFormat",{C_INT},C_INT)

public function SDL_GetPixelFormatFromGPUTextureFormat(atom format)
	return c_func(xSDL_GetPixelFormatFromGPUTextureFormat,{format})
end function

public constant xSDL_GetGPUTextureFormatFromPixelFormat = define_c_func(sdl,"+SDL_GetGPUTextureFormatFromPixelFormat",{C_INT},C_INT)

public function SDL_GetGPUTextureFormatFromPixelFormat(atom format)
	return c_func(xSDL_GetGPUTextureFormatFromPixelFormat,{format})
end function
­1333.64