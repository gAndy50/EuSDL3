include std/ffi.e
include std/machine.e

include SDL3.e

public enum type SDL_GPUPrimitiveType
	SDL_GPU_PRIMITIVETYPE_POINTLIST = 0,
	SDL_GPU_PRIMITIVETYPE_LINELIST,
	SDL_GPU_PRIMITIVETYPE_LINESTRIP,
	SDL_GPU_PRIMITIVETYPE_TRIANGLELIST,
	SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP
end type

public enum type SDL_GPULoadOp
	SDL_GPU_LOADOP_LOAD = 0,
	SDL_GPU_LOADOP_CLEAR,
	SDL_GPU_LOADOP_DONT_CARE
end type

public enum type SDL_GPUStoreOp
	SDL_GPU_STOREOP_STORE = 0,
	SDL_GPU_STOREOP_DONT_CARE
end type

public enum type SDL_GPIIndexElementSize
	SDL_GPU_INDEXELEMENTSIZE_16BIT = 0,
	SDL_GPU_INDEXELEMENTSIZE_32BIT
end type

public enum type SDL_GPUTextureFormat
	SDL_GPU_TEXTUREFORMAT_INVALID = -1,

--/* Unsigned Normalized Float Color Formats */
SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
SDL_GPU_TEXTUREFORMAT_R8_UNORM,
SDL_GPU_TEXTUREFORMAT_A8_UNORM,
--/* Compressed Unsigned Normalized Float Color Formats */
SDL_GPU_TEXTUREFORMAT_BC1_UNORM,
SDL_GPU_TEXTUREFORMAT_BC2_UNORM,
SDL_GPU_TEXTUREFORMAT_BC3_UNORM,
SDL_GPU_TEXTUREFORMAT_BC7_UNORM,
--/* Signed Normalized Float Color Formats  */
SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
--/* Signed Float Color Formats */
SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
--/* Unsigned Integer Color Formats */
SDL_GPU_TEXTUREFORMAT_R8_UINT,
SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
SDL_GPU_TEXTUREFORMAT_R16_UINT,
SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
--/* SRGB Unsigned Normalized Color Formats */
SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB,
SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB,
--/* Compressed SRGB Unsigned Normalized Color Formats */
SDL_GPU_TEXTUREFORMAT_BC3_UNORM_SRGB,
SDL_GPU_TEXTUREFORMAT_BC7_UNORM_SRGB,
--/* Depth Formats */
SDL_GPU_TEXTUREFORMAT_D16_UNORM,
SDL_GPU_TEXTUREFORMAT_D24_UNORM,
SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT
end type

public enum type SDL_GPUTextureUsageFlagBits
	SDL_GPU_TEXTUREUSAGE_SAMPLER_BIT = 0x00000001,
SDL_GPU_TEXTUREUSAGE_COLOR_TARGET_BIT = 0x00000002,
SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET_BIT = 0x00000004,
SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ_BIT = 0x00000008,
SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ_BIT = 0x00000020,
SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE_BIT = 0x00000040
end type

public constant SDL_GPUTextureUsageFlags = C_UINT32

public enum type SDL_GPUSampleCount
	SDL_GPU_SAMPLECOUNT_1 = 0,
SDL_GPU_SAMPLECOUNT_2,
SDL_GPU_SAMPLECOUNT_4,
SDL_GPU_SAMPLECOUNT_8
end type

public enum type SDL_GPUCubeMapFace
	SDL_GPU_CUBEMAPFACE_POSITIVEX = 0,
SDL_GPU_CUBEMAPFACE_NEGATIVEX,
SDL_GPU_CUBEMAPFACE_POSITIVEY,
SDL_GPU_CUBEMAPFACE_NEGATIVEY,
SDL_GPU_CUBEMAPFACE_POSITIVEZ,
SDL_GPU_CUBEMAPFACE_NEGATIVEZ
end type

public enum type SDL_GPUBufferUsageFlagBits
	SDL_GPU_BUFFERUSAGE_VERTEX_BIT = 0x00000001,
SDL_GPU_BUFFERUSAGE_INDEX_BIT = 0x00000002,
SDL_GPU_BUFFERUSAGE_INDIRECT_BIT = 0x00000004,
SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ_BIT = 0x00000008,
SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ_BIT = 0x00000020,
SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE_BIT = 0x00000040
end type

public constant SDL_GPUBufferUsageFlags = C_UINT32

public enum type SDL_GPUTransferBufferUsage
	SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD = 0,
SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD
end type

public enum type SDL_GPUShaderStage
	SDL_GPU_SHADERSTAGE_VERTEX = 0,
	SDL_GPU_SHADERSTAGE_FRAGMENT
end type

public enum type SDL_GPUShaderFormatFlagBits
	SDL_GPU_SHADERFORMAT_INVALID = 0x00000000,
SDL_GPU_SHADERFORMAT_SECRET = 0x00000001,  -- /* NDA'd platforms */
SDL_GPU_SHADERFORMAT_SPIRV = 0x00000002,    --/* Vulkan */
SDL_GPU_SHADERFORMAT_DXBC = 0x00000004,     --/* D3D11 (Shader Model 5_0) */
SDL_GPU_SHADERFORMAT_DXIL = 0x00000008,     --/* D3D12 */
SDL_GPU_SHADERFORMAT_MSL = 0x00000010,      --/* Metal */
SDL_GPU_SHADERFORMAT_METALLIB = 0x00000020
end type

public constant SDL_GPUShaderFormat = C_UINT32

public enum type SDL_GPUVertexElementFormat
	 -- /* 32-bit Signed Integers */
  SDL_GPU_VERTEXELEMENTFORMAT_INT = 0,
  SDL_GPU_VERTEXELEMENTFORMAT_INT2,
  SDL_GPU_VERTEXELEMENTFORMAT_INT3,
  SDL_GPU_VERTEXELEMENTFORMAT_INT4,

 -- /* 32-bit Unsigned Integers */
  SDL_GPU_VERTEXELEMENTFORMAT_UINT,
  SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
  SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
  SDL_GPU_VERTEXELEMENTFORMAT_UINT4,

 -- /* 32-bit Floats */
  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
  SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,

 -- /* 8-bit Signed Integers */
  SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
  SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,

  --/* 8-bit Unsigned Integers */
  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,

  --/* 8-bit Signed Normalized */
  SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM,
  SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM,

 -- /* 8-bit Unsigned Normalized */
  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM,
  SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM,

  --/* 16-bit Signed Integers */
  SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
  SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,

  --/* 16-bit Unsigned Integers */
  SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
  SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,

 -- /* 16-bit Signed Normalized */
  SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM,
  SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM,

  --/* 16-bit Unsigned Normalized */
  SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM,
  SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM,

  --/* 16-bit Floats */
  SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
  SDL_GPU_VERTEXELEMENTFORMAT_HALF4	
end type

public enum type SDL_GPUVertexInputRate
	SDL_GPU_VERTEXINPUTRATE_VERTEX = 0,
	SDL_GPU_VERTEXINPUTRATE_INSTANCE = 1
end type

public enum type SDL_GPUFillMode
	SDL_GPU_FILLMODE_FILL = 0,
	SDL_GPU_FILLMODE_LINE
end type

public enum type SDL_GPUCullMode
	SDL_GPU_CULLMODE_NONE = 0,
	SDL_GPU_CULLMODE_FRONT,
	SDL_GPU_CULLMODE_BACK
end type

public enum type SDL_GPUFrontFace
	SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE = 0,
SDL_GPU_FRONTFACE_CLOCKWISE
end type

public enum type SDL_GPUCompareOp
	SDL_GPU_COMPAREOP_NEVER = 0,
SDL_GPU_COMPAREOP_LESS,
SDL_GPU_COMPAREOP_EQUAL,
SDL_GPU_COMPAREOP_LESS_OR_EQUAL,
SDL_GPU_COMPAREOP_GREATER,
SDL_GPU_COMPAREOP_NOT_EQUAL,
SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,
SDL_GPU_COMPAREOP_ALWAYS
end type

public enum type SDL_GPUStencilOp
	SDL_GPU_STENCILOP_KEEP = 0,
SDL_GPU_STENCILOP_ZERO,
SDL_GPU_STENCILOP_REPLACE,
SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,
SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,
SDL_GPU_STENCILOP_INVERT,
SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,
SDL_GPU_STENCILOP_DECREMENT_AND_WRAP
end type

public enum type SDL_GPUBlendOp
	 SDL_GPU_BLENDOP_ADD = 0,
 SDL_GPU_BLENDOP_SUBTRACT,
 SDL_GPU_BLENDOP_REVERSE_SUBTRACT,
 SDL_GPU_BLENDOP_MIN,
 SDL_GPU_BLENDOP_MAX
end type

public enum type SDL_GPUBlendFactor
	 SDL_GPU_BLENDFACTOR_ZERO = 0,
 SDL_GPU_BLENDFACTOR_ONE,
 SDL_GPU_BLENDFACTOR_SRC_COLOR,
 SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
 SDL_GPU_BLENDFACTOR_DST_COLOR,
 SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,
 SDL_GPU_BLENDFACTOR_SRC_ALPHA,
 SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
 SDL_GPU_BLENDFACTOR_DST_ALPHA,
 SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
 SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,
 SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,
 SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE
end type

public enum type SDL_GPUColorComponentFlagBits
	SDL_GPU_COLORCOMPONENT_R_BIT = 0x00000001,
SDL_GPU_COLORCOMPONENT_G_BIT = 0x00000002,
SDL_GPU_COLORCOMPONENT_B_BIT = 0x00000004,
SDL_GPU_COLORCOMPONENT_A_BIT = 0x00000008
end type

public constant SDL_GPUColorComponentFlags = C_UINT8

public enum type SDL_GPUFilter
	SDL_GPU_FILTER_NEAREST = 0,
	SDL_GPU_FILTER_LINEAR
end type

public enum type SDL_GPUSamplerMipampMode
	SDL_GPU_SAMPLERMIPMAPMODE_NEAREST = 0,
SDL_GPU_SAMPLERMIPMAPMODE_LINEAR
end type

public enum type SDL_GPUSamplerAddressMode
	SDL_GPU_SAMPLERADDRESSMODE_REPEAT = 0,
SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT,
SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE
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
SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2048
end type

public enum type SDL_GPUDriver
	 SDL_GPU_DRIVER_INVALID = -1,
 SDL_GPU_DRIVER_SECRET, --/* NDA'd platforms */
 SDL_GPU_DRIVER_VULKAN,
 SDL_GPU_DRIVER_D3D11,
 SDL_GPU_DRIVER_D3D12,
 SDL_GPU_DRIVER_METAL
end type

public constant SDL_GPUDepthStencilValue = define_c_struct({
	C_FLOAT, --depth
	C_UINT8 --stencil
})

public constant SDL_GPUViewport = define_c_struct({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --w
	C_FLOAT, --h
	C_FLOAT, --minDepth
	C_FLOAT  --maxDepth
})

public constant SDL_GPUTextureTransferInfo = define_c_struct({
	C_POINTER, --transferBuffer
	C_UINT32, --offset
	C_UINT32, --imagePitch
	C_UINT32  --imageHeight
})

public constant SDL_GPUTransferBufferLocation = define_c_struct({
	C_POINTER, --transferBuffer
	C_UINT32 --offset
})

public constant SDL_GPUTextureLocation = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mipLevel
	C_UINT32, --layer
	C_UINT32, --x
	C_UINT32, --y
	C_UINT32  --z
})

public constant SDL_GPUTextureRegion = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mipLevel
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
	C_UINT32, --mipLevel
	C_UINT32, --layerOrDepthPlane
	C_UINT32, --x
	C_UINT32, --y
	C_UINT32, --w
	C_UINT32  --h
})

public constant SDL_GPUBufferLocation = define_c_struct({
	C_POINTER, --buffer
	C_UINT32 --offset
})

public constant SDL_GPUBufferRegion = define_c_struct({
	C_POINTER, --buffer
	C_UINT32, --offset
	C_UINT32  --size
})

public constant SDL_GPUIndirectDrawCommand = define_c_struct({
	C_UINT32, --vertexCount
	C_UINT32, --instanceCount
	C_UINT32, --firstVertex
	C_UINT32  --firstInstance
})

public constant SDL_GPUIndexedIndirectDrawCommand = define_c_struct({
	C_UINT32, --indexCount
	C_UINT32, --instanceCount
	C_UINT32, --firstIndex
	C_INT32, --vertexOffset
	C_UINT32 --firstInstance
})

public constant SDL_GPUIndirectDispatchCommand = define_c_struct({
	C_UINT32, --groupCountX
	C_UINT32, --groupCountY
	C_UINT32  --groupCountZ
})

public constant SDL_GPUSamplerCreateInfo = define_c_struct({
	C_INT, --minFilter
	C_INT, --magFilter
	C_INT, --mipmapMode
	C_INT, --addressModeU
	C_INT, --addressModeV
	C_INT, --addressModeW
	C_FLOAT, --mipLoadBias
	C_BOOL, --anisotropyEnable
	C_FLOAT, --maxAnisotropy
	C_BOOL, --compareEnable
	C_INT, --compareOp
	C_FLOAT, --minLod
	C_FLOAT, --maxLod
	C_INT --props
})

public constant SDL_GPUVertexBinding = define_c_struct({
	C_UINT32, --binding
	C_UINT32, --stride
	C_INT, --inputRate
	C_UINT32 --instanceStepRate
})

public constant SDL_GPUVertexAttribute = define_c_struct({
	C_UINT32, --location
	C_UINT32, --binding
	C_INT, --format
	C_UINT32 --offset
})

public constant SDL_GPUVertexInputState = define_c_struct({
	C_POINTER, --vertexBindings
	C_UINT32, --vertexBindingCount
	C_POINTER, --vertexAttributes
	C_UINT32 --vertexAttributeCount
})

public constant SDL_GPUStencilOpState = define_c_struct({
	C_INT, --failOp
	C_INT, --passOp
	C_INT, --depthFailOp
	C_INT  --compareOp
})

public constant SDL_GPUColorAttachmentBlendState = define_c_struct({
	C_BOOL, --blendEnable
	C_INT, --srcColorBlendFactor
	C_INT, --dstColorBlendFactor
	C_INT, --colorBlendOp
	C_INT, --srcAlphaBlendFactor
	C_INT, --dstAlphaBlendFactor
	C_INT, --alphaBlendOp
	C_INT --colorWriteMask
})

public constant SDL_GPUShaderCreateInfo = define_c_struct({
	C_SIZE_T, --codeSize
	C_POINTER, --code
	C_STRING, --entryPointName
	C_INT, --format
	C_INT, --stage
	C_UINT32, --samplerCount
	C_UINT32, --storageTextureCount
	C_UINT32, --storageBufferCount
	C_UINT32, --uniformBufferCount
	C_INT --props
})

public constant SDL_GPUTextureCreateInfo = define_c_struct({
	C_INT, --type
	C_INT, --format
	C_INT, --usageFlags
	C_UINT32, --width
	C_UINT32, --height
	C_UINT32, --layerCountorDepth
	C_UINT32, --levelCount
	C_INT, --sampleCount
	C_INT --prop
})

public constant SDL_PROP_GPU_CREATETEXTURE_D3D12_CLEAR_R_FLOAT   =    "SDL.gpu.createtexture.d3d12.clear.r"
public constant SDL_PROP_GPU_CREATETEXTURE_D3D12_CLEAR_G_FLOAT   =    "SDL.gpu.createtexture.d3d12.clear.g"
public constant SDL_PROP_GPU_CREATETEXTURE_D3D12_CLEAR_B_FLOAT   =    "SDL.gpu.createtexture.d3d12.clear.b"
public constant SDL_PROP_GPU_CREATETEXTURE_D3D12_CLEAR_A_FLOAT  =     "SDL.gpu.createtexture.d3d12.clear.a"
public constant SDL_PROP_GPU_CREATETEXTURE_D3D12_CLEAR_DEPTH_FLOAT =  "SDL.gpu.createtexture.d3d12.clear.depth"
public constant SDL_PROP_GPU_CREATETEXTURE_D3D12_CLEAR_STENCIL_UINT8 = "SDL.gpu.createtexture.d3d12.clear.stencil"

public constant SDL_GPUBufferCreateInfo = define_c_struct({
	C_INT, --usageFlags
	C_UINT32, --sizeInBytes
	C_INT --props
})

public constant SDL_GPUTransferBufferCreateInfo = define_c_struct({
	C_INT, --usage
	C_UINT32, --sizeInBytes
	C_INT --props
})

public constant SDL_GPURasterizerState = define_c_struct({
	C_INT, --fillMode
	C_INT, --cullMode
	C_INT, --frontFace
	C_BOOL, --depthBiasEnable
	C_FLOAT, --depthBiasConstantFactor
	C_FLOAT, --depthBiasClamp
	C_FLOAT  --depthBiasSlopeFactor
})

public constant SDL_GPUMultisampleState = define_c_struct({
	C_INT, --sampleCount
	C_UINT32 --sampleMask
})

public constant SDL_GPUDepthStencilState = define_c_struct({
	C_BOOL, --depthTestEnable
	C_BOOL, --depthWirteEnable
	C_INT, --compareOp
	C_INT, --backStencilState
	C_INT, --frontStencilState
	C_UINT8, --compareMask
	C_UINT8, --writeMask
	C_UINT8  --reference
})

public constant SDL_GPUColorAttachmentDescription = define_c_struct({
	C_INT, --format
	C_INT  --blendState
})

public constant SDL_GPUGraphicsPipelineAttachmentInfo = define_c_struct({
	C_POINTER, --colorAttachmentDescriptions
	C_UINT32, --colorAttachmentCount
	C_BOOL, --hasDepthStencilAttachment
	C_INT --depthStencilFormat
})

public constant SDL_GPUGraphicsPipelineCreateInfo = define_c_struct({
	C_POINTER, --vertexShader
	C_POINTER, --fragmentShader
	C_INT, --vertexInputState
	C_INT, --primitiveType
	C_INT, --rasterizeState
	C_INT, --depthStencilState
	SDL_GPUGraphicsPipelineAttachmentInfo, --attachmentInfo
	{C_FLOAT,4}, --blendConstants[4]
	C_INT --props
})

public constant SDL_GPUComputePipelineCreateInfo = define_c_struct({
	C_SIZE_T, --codeSize
	C_POINTER, --code
	C_STRING, --entryPointName
	C_INT, --format
	C_UINT32, --readOnlyStorageTextureCount
	C_UINT32, --readOnlyStorageBufferCount
	C_UINT32, --writeOnlyStorageTexturecount
	C_UINT32, --writeOnlyStorageBufferCount
	C_UINT32, --threadCountX
	C_UINT32, --threadCountY
	C_UINT32, --threadCountZ
	C_INT --props
})

public constant SDL_GPUColorAttachmentInfo = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mipLevel
	C_UINT32, --layerOrDepthPlane
	SDL_FColor, --clearColor
	C_INT, --loadop
	C_INT, --storeOp
	C_BOOL --cycle
})

public constant SDL_GPUDepthStencilAttachmentInfo = define_c_struct({
	C_POINTER, --texture
	C_INT, --depthStencilClearValue
	C_INT, --loadOp
	C_INT, --storeOp
	C_INT, --stencilLoadOp
	C_INT, --stencilStoreOp
	C_BOOL --cycle
})

public constant SDL_GPUBufferBinding = define_c_struct({
	C_POINTER, --buffer
	C_UINT32 --offfset
})

public constant SDL_GPUTextureSamplerBinding = define_c_struct({
	C_POINTER, --texture
	C_POINTER --sampler
})

public constant SDL_GPUStorageBufferWriteOnlyBinding = define_c_struct({
	C_POINTER, --buffer
	C_BOOL --cycle
})

public constant SDL_GPUStorageTextureWriteOnlyBinding = define_c_struct({
	C_POINTER, --texture
	C_UINT32, --mipLevel
	C_UINT32, --layer
	C_BOOL --cycle
})

--Functions

public constant xSDL_CreateGPUDevice = define_c_func(sdl,"+SDL_CreateGPUDevice",{C_INT,C_BOOL,C_STRING},C_POINTER)

public function SDL_CreateGPUDevice(atom formatFlags,atom debugMode,sequence name)
	return c_func(xSDL_CreateGPUDevice,{formatFlags,debugMode,name})
end function

public constant xSDL_CreateGPUDeviceWithProperties = define_c_func(sdl,"+SDL_CreateGPUDeviceWithProperties",{C_UINT32},C_POINTER)

public function SDL_CreateGPUDeviceWithProperties(atom props)
	return c_func(xSDL_CreateGPUDeviceWithProperties,{props})
end function

public constant SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOL    =         "SDL.gpu.device.create.debugmode"
public constant SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOL =       "SDL.gpu.device.create.preferlowpower"
public constant SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING         =       "SDL.gpu.device.create.name"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SECRET_BOOL =       "SDL.gpu.device.create.shaders.secret"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOL  =       "SDL.gpu.device.create.shaders.spirv"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOL    =      "SDL.gpu.device.create.shaders.dxbc"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOL    =      "SDL.gpu.device.create.shaders.dxil"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOL      =     "SDL.gpu.device.create.shaders.msl"
public constant SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOL  =    "SDL.gpu.device.create.shaders.metallib"
public constant SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING = "SDL.gpu.device.create.d3d12.semantic"

public constant xSDL_DestroyGPUDevice = define_c_proc(sdl,"+SDL_DestroyGPUDevice",{C_POINTER})

public procedure SDL_DestroyGPUDevice(atom device)
	c_proc(xSDL_DestroyGPUDevice,{device})
end procedure

public constant xSDL_GetGPUDriver = define_c_func(sdl,"+SDL_GetGPUDriver",{C_POINTER},C_POINTER)

public function SDL_GetGPUDriver(atom device)
	return c_func(xSDL_GetGPUDriver,{device})
end function

public constant xSDL_CreateGPUComputePipeline = define_c_func(sdl,"+SDL_CreateGPUComputePipeline",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUComputePipeline(atom device,atom computePipelineCreateInfo)
	return c_func(xSDL_CreateGPUComputePipeline,{device,computePipelineCreateInfo})
end function

public constant xSDL_CreateGPUGraphicsPipeline = define_c_func(sdl,"+SDL_CreateGPUGraphicsPipeline",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUGraphicsPipeline(atom device,atom pipelineCreateInfo)
	return c_func(xSDL_CreateGPUGraphicsPipeline,{device,pipelineCreateInfo})
end function

public constant xSDL_CreateGPUSampler = define_c_func(sdl,"+SDL_CreateGPUSampler",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUSampler(atom device,atom samplerCreateInfo)
	return c_func(xSDL_CreateGPUSampler,{device,samplerCreateInfo})
end function

public constant xSDL_CreateGPUShader = define_c_func(sdl,"+SDL_CreateGPUShader",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUShader(atom device,atom shaderCreateInfo)
	return c_func(xSDL_CreateGPUShader,{device,shaderCreateInfo})
end function

public constant xSDL_CreateGPUTexture = define_c_func(sdl,"+SDL_CreateGPUTexture",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUTexture(atom device,atom textureCreateInfo)
	return c_func(xSDL_CreateGPUTexture,{device,textureCreateInfo})
end function

public constant xSDL_CreateGPUBuffer = define_c_func(sdl,"+SDL_CreateGPUBuffer",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUBuffer(atom device,atom bufferCreateInfo)
	return c_func(xSDL_CreateGPUBuffer,{device,bufferCreateInfo})
end function

public constant xSDL_CreateGPUTransferBuffer = define_c_func(sdl,"+SDL_CreateGPUTransferBuffer",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateGPUTransferBuffer(atom device,atom transferBufferCreateInfo)
	return c_func(xSDL_CreateGPUTransferBuffer,{device,transferBufferCreateInfo})
end function

public constant xSDL_SetGPUBufferName = define_c_proc(sdl,"+SDL_SetGPUBufferName",{C_POINTER,C_POINTER,C_STRING})

public procedure SDL_SetGPUBufferName(atom device,atom buffer,sequence text)
	c_proc(xSDL_SetGPUBufferName,{device,buffer,text})
end procedure

public constant xSDL_SetGPUTextureName = define_c_proc(sdl,"+SDL_SetGPUTextureName",{C_POINTER,C_POINTER,C_STRING})

public procedure SDL_SetGPUTextureName(atom device,atom texture,sequence text)
	c_proc(xSDL_SetGPUTextureName,{device,texture,text})
end procedure

public constant xSDL_InsertGPUDebugLabel = define_c_proc(sdl,"+SDL_InsertGPUDebugLabel",{C_POINTER,C_STRING})

public procedure SDL_InsertGPUDebugLabel(atom commandBuffer,sequence text)
	c_proc(xSDL_InsertGPUDebugLabel,{commandBuffer,text})
end procedure

public constant xSDL_PushGPUDebugGroup = define_c_proc(sdl,"+SDL_PushGPUDebugGroup",{C_POINTER,C_STRING})

public procedure SDL_PushGPUDebugGroup(atom commandBuffer,sequence name)
	c_proc(xSDL_PushGPUDebugGroup,{commandBuffer,name})
end procedure

public constant xSDL_PopGPUDebugGroup = define_c_proc(sdl,"+SDL_PopGPUDebugGroup",{C_POINTER})

public procedure SDL_PopGPUDebugGroup(atom commandBuffer)
	c_proc(xSDL_PopGPUDebugGroup,{commandBuffer})
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

public procedure SDL_ReleaseGPUTransferBuffer(atom device,atom transferBuffer)
	c_proc(xSDL_ReleaseGPUTransferBuffer,{device,transferBuffer})
end procedure

public constant xSDL_ReleaseGPUComputePipeline = define_c_proc(sdl,"+SDL_ReleaseGPUComputePipeline",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUComputePipeline(atom device,atom computePipeline)
	c_proc(xSDL_ReleaseGPUComputePipeline,{device,computePipeline})
end procedure

public constant xSDL_ReleaseGPUShader = define_c_proc(sdl,"+SDL_ReleaseGPUShader",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUShader(atom device,atom shader)
	c_proc(xSDL_ReleaseGPUShader,{device,shader})
end procedure

public constant xSDL_ReleaseGPUGraphicsPipeline = define_c_proc(sdl,"+SDL_ReleaseGPUGraphicsPipeline",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUGraphicsPipeline(atom device,atom graphicsPipeline)
	c_proc(xSDL_ReleaseGPUGraphicsPipeline,{device,graphicsPipeline})
end procedure

public constant xSDL_AcquireGPUCommandBuffer = define_c_func(sdl,"+SDL_AcquireGPUCommandBuffer",{C_POINTER},C_POINTER)

public function SDL_AcquireGPUCommandBuffer(atom device)
	return c_func(xSDL_AcquireGPUCommandBuffer,{device})
end function

public constant xSDL_PushGPUVertexUniformData = define_c_proc(sdl,"+SDL_PushGPUVertexUniformData",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_PushGPUVertexUniformData(atom commandBuffer,atom slotIndex,atom data,atom dataLengthInBytes)
	c_proc(xSDL_PushGPUVertexUniformData,{commandBuffer,slotIndex,data,dataLengthInBytes})
end procedure

public constant xSDL_PushGPUFragmentUniformData = define_c_proc(sdl,"+SDL_PushGPUFragmentUniformData",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_PushGPUFragmentUniformData(atom commandBuffer,atom slotIndex,atom data,atom dataLengthInBytes)
	c_proc(xSDL_PushGPUFragmentUniformData,{commandBuffer,slotIndex,data,dataLengthInBytes})
end procedure

public constant xSDL_PushGPUComputeUniformData = define_c_proc(sdl,"+SDL_PushGPUComputeUniformData",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_PushGPUComputeUniformData(atom commandBuffer,atom slotIndex,atom data,atom dataLengthInBytes)
	c_proc(xSDL_PushGPUComputeUniformData,{commandBuffer,slotIndex,data,dataLengthInBytes})
end procedure

public constant xSDL_BeginGPURenderPass = define_c_func(sdl,"+SDL_BeginGPURenderPass",{C_POINTER,C_POINTER,C_UINT32,C_POINTER},C_POINTER)

public function SDL_BeginGPURenderPass(atom commandBuffer,atom colorAttachmentInfos,atom colorAttachmentCount,atom depthStencilAttachmentInfo)
	return c_func(xSDL_BeginGPURenderPass,{commandBuffer,colorAttachmentInfos,colorAttachmentCount,depthStencilAttachmentInfo})
end function

public constant xSDL_BindGPUGraphicsPipeline = define_c_proc(sdl,"+SDL_BindGPUGraphicsPipeline",{C_POINTER,C_POINTER})

public procedure SDL_BindGPUGraphicsPipeline(atom renderPass,atom graphicsPipeline)
	c_proc(xSDL_BindGPUGraphicsPipeline,{renderPass,graphicsPipeline})
end procedure

public constant xSDL_SetGPUViewport = define_c_proc(sdl,"+SDL_SetGPUViewport",{C_POINTER,C_POINTER})

public procedure SDL_SetGPUViewport(atom renderPass,atom viewport)
	c_proc(xSDL_SetGPUViewport,{renderPass,viewport})
end procedure

public constant xSDL_SetGPUScissor = define_c_proc(sdl,"+SDL_SetGPUScissor",{C_POINTER,C_POINTER})

public procedure SDL_SetGPUScissor(atom renderPass,atom scissor)
	c_proc(xSDL_SetGPUScissor,{renderPass,scissor}) --scissor is SDL_Rect
end procedure

public constant xSDL_BindGPUVertexBuffers = define_c_proc(sdl,"+SDL_BindGPUVertexBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexBuffers(atom renderPass,atom firstBinding,atom pBindings,atom bindingCount)
	c_proc(xSDL_BindGPUVertexBuffers,{renderPass,firstBinding,pBindings,bindingCount})
end procedure

public constant xSDL_BindGPUIndexBuffer = define_c_proc(sdl,"+SDL_BindGPUIndexBuffer",{C_POINTER,C_POINTER,C_INT})

public procedure SDL_BindGPUIndexBuffer(atom renderPass,atom pBinding,atom indexElementSize)
	c_proc(xSDL_BindGPUIndexBuffer,{renderPass,pBinding,indexElementSize})
end procedure

public constant xSDL_BindGPUVertexSamplers = define_c_proc(sdl,"+SDL_BindGPUVertexSamplers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexSamplers(atom renderPass,atom firstSlot,atom textureSamplerBindings,atom bindingCount)
	c_proc(xSDL_BindGPUVertexSamplers,{renderPass,firstSlot,textureSamplerBindings,bindingCount})
end procedure

public constant xSDL_BindGPUVertexStorageTextures = define_c_proc(sdl,"+SDL_BindGPUVertexStorageTextures",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexStorageTextures(atom renderPass,atom firstSlot,atom storageTextures,atom bindingCount)
	c_proc(xSDL_BindGPUVertexStorageTextures,{renderPass,firstSlot,storageTextures,bindingCount})
end procedure

public constant xSDL_BindGPUVertexStorageBuffers = define_c_proc(sdl,"+SDL_BindGPUVertexStorageBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUVertexStorageBuffers(atom renderPass,atom firstSlot,atom storageBuffers,atom bindingCount)
	c_proc(xSDL_BindGPUVertexStorageBuffers,{renderPass,firstSlot,storageBuffers,bindingCount})
end procedure

public constant xSDL_BindGPUFragmentSamplers = define_c_proc(sdl,"+SDL_BindGPUFragmentSamplers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUFragmentSamplers(atom renderPass,atom firstSlot,atom textureSamplerBindings,atom bindingCount)
	c_proc(xSDL_BindGPUFragmentSamplers,{renderPass,firstSlot,textureSamplerBindings,bindingCount})
end procedure

public constant xSDL_BindGPUFragmentStorageTextures = define_c_proc(sdl,"+SDL_BindGPUFragmentStorageTextures",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUFragmentStorageTextures(atom renderPass,atom firstSlot,atom storageTextures,atom bindingCount)
	c_proc(xSDL_BindGPUFragmentStorageTextures,{renderPass,firstSlot,storageTextures,bindingCount})
end procedure

public constant xSDL_BindGPUFragmentStorageBuffers = define_c_proc(sdl,"+SDL_BindGPUFragmentStorageBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUFragmentStorageBuffers(atom renderPass,atom firstSlot,atom storageBuffers,atom bindingCount)
	c_proc(xSDL_BindGPUFragmentStorageBuffers,{renderPass,firstSlot,storageBuffers,bindingCount})
end procedure

public constant xSDL_DrawGPUIndexedPrimitives = define_c_proc(sdl,"+SDL_DrawGPUIndexedPrimitives",{C_POINTER,C_UINT32,C_UINT32,C_UINT32,C_UINT32,C_UINT32})

public procedure SDL_DrawGPUIndexedPrimitives(atom renderPass,atom indexCount,atom instanceCount,atom firstIndex,atom vertexOffset,atom firstInstance)
	c_proc(xSDL_DrawGPUIndexedPrimitives,{renderPass,indexCount,instanceCount,firstIndex,vertexOffset,firstInstance})
end procedure

public constant xSDL_DrawGPUPrimitives = define_c_proc(sdl,"+SDL_DrawGPUPrimitives",{C_POINTER,C_UINT32,C_UINT32,C_UINT32,C_UINT32})

public procedure SDL_DrawGPUPrimitives(atom renderPass,atom vertexCount,atom instanceCount,atom firstVertex,atom firstInstance)
	c_proc(xSDL_DrawGPUPrimitives,{renderPass,vertexCount,instanceCount,firstVertex,firstInstance})
end procedure

public constant xSDL_DrawGPUPrimitivesIndirect = define_c_proc(sdl,"+SDL_DrawGPUPrimitivesIndirect",{C_POINTER,C_POINTER,C_UINT32,C_UINT32,C_UINT32})

public procedure SDL_DrawGPUPrimitivesIndirect(atom renderPass,atom buffer,atom offsetInBytes,atom drawCount,atom stride)
	c_proc(xSDL_DrawGPUPrimitivesIndirect,{renderPass,buffer,offsetInBytes,drawCount,stride})
end procedure

public constant xSDL_DrawGPUIndexedPrimitivesIndirect = define_c_proc(sdl,"+SDL_DrawGPUIndexedPrimitivesIndirect",{C_POINTER,C_POINTER,C_POINTER,C_UINT32,C_UINT32,C_UINT32})

public procedure SDL_DrawGPUIndexedPrimitivesIndirect(atom renderPass,atom buffer,atom offsetInBytes,atom drawCount,atom stride)
	c_proc(xSDL_DrawGPUIndexedPrimitivesIndirect,{renderPass,buffer,offsetInBytes,drawCount,stride})
end procedure

public constant xSDL_EndGPURenderPass = define_c_proc(sdl,"+SDL_EndGPURenderPass",{C_POINTER})

public procedure SDL_EndGPURenderPass(atom renderPass)
	c_proc(xSDL_EndGPURenderPass,{renderPass})
end procedure

public constant xSDL_BeginGPUComputePass = define_c_func(sdl,"+SDL_BeginGPUComputePass",{C_POINTER,C_POINTER,C_UINT32,C_POINTER,C_UINT32},C_POINTER)

public function SDL_BeginGPUComputePass(atom commandBuffer,atom storageTextureBindings,atom storageTextureBindingCount,atom storageBufferBindings,atom storageBufferBindingCount)
	return c_func(xSDL_BeginGPUComputePass,{commandBuffer,storageTextureBindings,storageTextureBindings,storageBufferBindings,storageBufferBindingCount})
end function

public constant xSDL_BindGPUComputePipeline = define_c_proc(sdl,"+SDL_BindGPUComputePipeline",{C_POINTER,C_POINTER})

public procedure SDL_BindGPUComputePipeline(atom computePass,atom computePipeline)
	c_proc(xSDL_BindGPUComputePipeline,{computePass,computePipeline})
end procedure

public constant xSDL_BindGPUComputeStorageTextures = define_c_proc(sdl,"+SDL_BindGPUComputeStorageTextures",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUComputeStorageTextures(atom computePass,atom firstSlot,atom storageTextures,atom bindingCount)
	c_proc(xSDL_BindGPUComputeStorageTextures,{computePass,firstSlot,storageTextures,bindingCount})
end procedure

public constant xSDL_BindGPUComputeStorageBuffers = define_c_proc(sdl,"+SDL_BindGPUComputeStorageBuffers",{C_POINTER,C_UINT32,C_POINTER,C_UINT32})

public procedure SDL_BindGPUComputeStorageBuffers(atom computePass,atom firstSlot,atom storageBuffers,atom bindingCount)
	c_proc(xSDL_BindGPUComputeStorageBuffers,{computePass,firstSlot,storageBuffers,bindingCount})
end procedure

public constant xSDL_DispatchGPUComput = define_c_proc(sdl,"+SDL_DispatchGPUComput",{C_POINTER,C_UINT32,C_UINT32,C_UINT32})

public procedure SDL_DispatchGPUComput(atom computePass,atom X,atom Y,atom Z)
	c_proc(xSDL_DispatchGPUComput,{computePass,X,Y,Z})
end procedure

public constant xSDL_DispatchGPUComputeIndirect = define_c_proc(sdl,"+SDL_DispatchGPUComputeIndirect",{C_POINTER,C_POINTER,C_UINT32})

public procedure SDL_DispatchGPUComputeIndirect(atom computePass,atom buffer,atom offsetInBytes)
	c_proc(xSDL_DispatchGPUComputeIndirect,{computePass,buffer,offsetInBytes})
end procedure

public constant xSDL_EndGPUComputePass = define_c_proc(sdl,"+SDL_EndGPUComputePass",{C_POINTER})

public procedure SDL_EndGPUComputePass(atom computePass)
	c_proc(xSDL_EndGPUComputePass,{computePass})
end procedure

public constant xSDL_MapGPUTransferBuffer = define_c_proc(sdl,"+SDL_MapGPUTransferBuffer",{C_POINTER,C_POINTER,C_BOOL})

public procedure SDL_MapGPUTransferBuffer(atom device,atom transferBuffer,atom cycle)
	c_proc(xSDL_MapGPUTransferBuffer,{device,transferBuffer,cycle})
end procedure

public constant xSDL_UnmapGPUTransferBuffer = define_c_proc(sdl,"+SDL_UnmapGPUTransferBuffer",{C_POINTER,C_POINTER})

public procedure SDL_UnmapGPUTransferBuffer(atom device,atom transferBuffer)
	c_proc(xSDL_UnmapGPUTransferBuffer,{device,transferBuffer})
end procedure

public constant xSDL_BeginGPUCopyPass = define_c_func(sdl,"+SDL_BeginGPUCopyPass",{C_POINTER},C_POINTER)

public function SDL_BeginGPUCopyPass(atom commandBuffer)
	return c_func(xSDL_BeginGPUCopyPass,{commandBuffer})
end function

public constant xSDL_UploadToGPUTexture = define_c_proc(sdl,"+SDL_UploadToGPUTexture",{C_POINTER,C_POINTER,C_POINTER,C_BOOL})

public procedure SDL_UploadToGPUTexture(atom copyPass,atom source,atom destination,atom cycle)
	c_proc(xSDL_UploadToGPUTexture,{copyPass,source,destination,cycle})
end procedure

public constant xSDL_UploadToGPUBuffer = define_c_proc(sdl,"+SDL_UploadToGPUBuffer",{C_POINTER,C_POINTER,C_POINTER,C_BOOL})

public procedure SDL_UploadToGPUBuffer(atom copyPass,atom source,atom destination,atom cycle)
	c_proc(xSDL_UploadToGPUBuffer,{copyPass,source,destination,cycle})
end procedure

public constant xSDL_CopyGPUTextureToTexture = define_c_proc(sdl,"+SDL_CopyGPUTextureToTexture",{C_POINTER,C_POINTER,C_POINTER,C_UINT32,C_UINT32,C_UINT32,C_BOOL})

public procedure SDL_CopyGPUTextureToTexture(atom copyPass,atom source,atom destination,atom w,atom h,atom d,atom cycle)
	c_proc(xSDL_CopyGPUTextureToTexture,{copyPass,source,destination,w,h,d,cycle})
end procedure

public constant xSDL_CopyGPUBufferToBuffer = define_c_proc(sdl,"+SDL_CopyGPUBufferToBuffer",{C_POINTER,C_POINTER,C_POINTER,C_UINT32,C_BOOL})

public procedure SDL_CopyGPUBufferToBuffer(atom copyPass,atom source,atom destination,atom size,atom cycle)
	c_proc(xSDL_CopyGPUBufferToBuffer,{copyPass,source,destination,size,cycle})
end procedure

public constant xSDL_DownloadFromGPUTexture = define_c_proc(sdl,"+SDL_DownloadFromGPUTexture",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_DownloadFromGPUTexture(atom copyPass,atom source,atom destination)
	c_proc(xSDL_DownloadFromGPUTexture,{copyPass,source,destination})
end procedure

public constant xSDL_DownloadFromGPUBuffer = define_c_proc(sdl,"+SDL_DownloadFromGPUBuffer",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_DownloadFromGPUBuffer(atom copyPass,atom source,atom destination)
	c_proc(xSDL_DownloadFromGPUBuffer,{copyPass,source,destination})
end procedure

public constant xSDL_EndGPUCopyPass = define_c_proc(sdl,"+SDL_EndGPUCopyPass",{C_POINTER})

public procedure SDL_EndGPUCopyPass(atom copyPass)
	c_proc(xSDL_EndGPUCopyPass,{copyPass})
end procedure

public constant xSDL_GenerateMipmapsForGPUTexture = define_c_proc(sdl,"+SDL_GenerateMipmapsForGPUTexture",{C_POINTER,C_POINTER})

public procedure SDL_GenerateMipmapsForGPUTexture(atom commandBuffer,atom texture)
	c_proc(xSDL_GenerateMipmapsForGPUTexture,{commandBuffer,texture})
end procedure

public constant xSDL_BlitGPUTexture = define_c_proc(sdl,"+SDL_BlitGPUTexture",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_INT,C_BOOL})

public procedure SDL_BlitGPUTexture(atom commandBuffer,atom source,atom destination,atom flipMode,atom filterMode,atom cycle)
	c_proc(xSDL_BlitGPUTexture,{commandBuffer,source,destination,flipMode,filterMode,cycle})
end procedure

public constant xSDL_WindowSupportsGPUSwapchainComposition = define_c_func(sdl,"+SDL_WindowSupportsGPUSwapchainComposition",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_WindowSupportsGPUSwapchainComposition(atom device,atom win,atom swapchain)
	return c_func(xSDL_WindowSupportsGPUSwapchainComposition,{device,win,swapchain})
end function

public constant xSDL_WindowSupportsGPUPresentMode = define_c_func(sdl,"+SDL_WindowSupportsGPUPresentMode",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_WindowSupportsGPUPresentMode(atom device,atom win,atom presentMode)
	return c_func(xSDL_WindowSupportsGPUPresentMode,{device,win,presentMode})
end function

public constant xSDL_ClaimWindowForGPUDevice = define_c_func(sdl,"+SDL_ClaimWindowForGPUDevice",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ClaimWindowForGPUDevice(atom device,atom win)
	return c_func(xSDL_ClaimWindowForGPUDevice,{device,win})
end function

public constant xSDL_ReleaseWindowFromGPUDevice = define_c_proc(sdl,"+SDL_ReleaseWindowFromGPUDevice",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseWindowFromGPUDevice(atom device,atom win)
	c_proc(xSDL_ReleaseWindowFromGPUDevice,{device,win})
end procedure

public constant xSDL_SetGPUSwapchainParameters = define_c_func(sdl,"+SDL_SetGPUSwapchainParameters",{C_POINTER,C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_SetGPUSwapchainParameters(atom device,atom win,atom swapchain,atom presentMode)
	return c_func(xSDL_SetGPUSwapchainParameters,{device,win,swapchain,presentMode})
end function

public constant xSDL_GetGPUSwapchainTextureFormat = define_c_func(sdl,"+SDL_GetGPUSwapchainTextureFormat",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetGPUSwapchainTextureFormat(atom device,atom win)
	return c_func(xSDL_GetGPUSwapchainTextureFormat,{device,win})
end function

public constant xSDL_AcquireGPUSwapchainTexture = define_c_func(sdl,"+SDL_AcquireGPUSwapchainTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_AcquireGPUSwapchainTexture(atom commandBuffer,atom win,atom width,atom height)
	return c_func(xSDL_AcquireGPUSwapchainTexture,{commandBuffer,win,width,height})
end function

public constant xSDL_SubmitGPUCommandBuffer = define_c_proc(sdl,"+SDL_SubmitGPUCommandBuffer",{C_POINTER})

public procedure SDL_SubmitGPUCommandBuffer(atom commandBuffer)
	c_proc(xSDL_SubmitGPUCommandBuffer,{commandBuffer})
end procedure

public constant xSDL_SubmitGPUCommandBufferAndAcquireFence = define_c_func(sdl,"+SDL_SubmitGPUCommandBufferAndAcquireFence",{C_POINTER},C_POINTER)

public function SDL_SubmitGPUCommandBufferAndAcquireFence(atom commandBuffer)
	return c_func(xSDL_SubmitGPUCommandBufferAndAcquireFence,{commandBuffer})
end function

public constant xSDL_WaitForGPUIdle = define_c_proc(sdl,"+SDL_WaitForGPUIdle",{C_POINTER})

public procedure SDL_WaitForGPUIdle(atom device)
	c_proc(xSDL_WaitForGPUIdle,{device})
end procedure

public constant xSDL_WaitForGPUFences = define_c_proc(sdl,"+SDL_WaitForGPUFences",{C_POINTER,C_BOOL,C_POINTER,C_UINT32})

public procedure SDL_WaitForGPUFences(atom device,atom waitAll,atom pFences,atom fenceCount)
	c_proc(xSDL_WaitForGPUFences,{device,waitAll,pFences,fenceCount})
end procedure

public constant xSDL_QueryGPUFence = define_c_func(sdl,"+SDL_QueryGPUFence",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_QueryGPUFence(atom device,atom fence)
	return c_func(xSDL_QueryGPUFence,{device,fence})
end function

public constant xSDL_ReleaseGPUFence = define_c_proc(sdl,"+SDL_ReleaseGPUFence",{C_POINTER,C_POINTER})

public procedure SDL_ReleaseGPUFence(atom device,atom fence)
	c_proc(xSDL_ReleaseGPUFence,{device,fence})
end procedure

public constant xSDL_GPUTextureFormatTexelBlockSize = define_c_func(sdl,"+SDL_GPUTextureFormatTexelBlockSize",{C_INT},C_UINT32)

public function SDL_GPUTextureFormatTexelBlockSize(atom textureFormat)
	return c_func(xSDL_GPUTextureFormatTexelBlockSize,{textureFormat})
end function

public constant xSDL_GPUTextureSupportsFormat = define_c_func(sdl,"+SDL_GPUTextureSupportsFormat",{C_POINTER,C_INT,C_INT,C_INT},C_BOOL)

public function SDL_GPUTextureSupportsFormat(atom device,atom format,atom xtype,atom usage)
	return c_func(xSDL_GPUTextureSupportsFormat,{device,format,xtype,usage})
end function

public constant xSDL_GPUTextureSupportsSampleCount = define_c_func(sdl,"+SDL_GPUTextureSupportsSampleCount",{C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_GPUTextureSupportsSampleCount(atom device,atom format,atom sampleCount)
	return c_func(xSDL_GPUTextureSupportsSampleCount,{device,format,sampleCount})
end function

ifdef SDL_PLATFORM_GDK then

	public constant xSDL_GDKSuspendGPU = define_c_proc(sdl,"+SDL_GDKSuspendGPU",{C_POINTER}),
					xSDL_GDKResumeGPU = define_c_proc(sdl,"+SDL_GDKResumeGPU",{C_POINTER})
					
	public procedure SDL_GDKSuspendGPU(atom device)	
		c_proc(xSDL_GDKSuspendGPU,{device})
	end procedure
	
	public procedure SDL_GDKResumeGPU(atom device)	
		c_proc(xSDL_GDKResumeGPU,{device})
	end procedure
	
end ifdef
­1105.1
