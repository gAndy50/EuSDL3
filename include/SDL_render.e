include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_blendmode.e
include SDL_error.e
include SDL_event.e
include SDL_pixels.e
include SDL_properties.e
include SDL_rect.e
include SDL_surface.e
include SDL_video.e

public constant SDL_SOFTWARE_RENDERER = "software"

public constant SDL_Vertex = define_c_struct({
	SDL_FPoint, --position
	SDL_FColor, --color
	SDL_FPoint --tex_coord
})

public enum type SDL_TextureAccess
	 SDL_TEXTUREACCESS_STATIC = 0,    --/**< Changes rarely, not lockable */
    SDL_TEXTUREACCESS_STREAMING, --/**< Changes frequently, lockable */
    SDL_TEXTUREACCESS_TARGET     --/**< Texture can be used as a render target */
end type

public enum type SDL_RendererLogicalPresentation
	SDL_LOGICAL_PRESENTATION_DISABLED = 0,  --/**< There is no logical size in effect */
    SDL_LOGICAL_PRESENTATION_STRETCH,   --/**< The rendered content is stretched to the output resolution */
    SDL_LOGICAL_PRESENTATION_LETTERBOX, --/**< The rendered content is fit to the largest dimension and the other dimension is letterboxed with black bars */
    SDL_LOGICAL_PRESENTATION_OVERSCAN,  --/**< The rendered content is fit to the smallest dimension and the other dimension extends beyond the output bounds */
    SDL_LOGICAL_PRESENTATION_INTEGER_SCALE   --/**< The rendered content is scaled up by integer multiples to fit the output resolution */
end type

public constant SDL_Texture = define_c_struct({
	C_INT, --format
	C_INT, --w
	C_INT, --h
	C_INT --refcount
})

public constant xSDL_GetNumRenderDrivers = define_c_func(sdl,"+SDL_GetNumRenderDrivers",{},C_INT)

public function SDL_GetNumRenderDrivers()
	return c_func(xSDL_GetNumRenderDrivers,{})
end function

public constant xSDL_GetRenderDriver = define_c_func(sdl,"+SDL_GetRenderDriver",{C_INT},C_STRING)

public function SDL_GetRenderDriver(atom index)
	return c_func(xSDL_GetRenderDriver,{index})
end function

public constant xSDL_CreateWindowAndRenderer = define_c_func(sdl,"+SDL_CreateWindowAndRenderer",{C_STRING,C_INT,C_INT,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_CreateWindowAndRenderer(sequence title,atom width,atom height,atom window_flags,atom window,atom renderer)
	return c_func(xSDL_CreateWindowAndRenderer,{title,width,height,window_flags,window,renderer})
end function

public constant xSDL_CreateRenderer = define_c_func(sdl,"+SDL_CreateRenderer",{C_POINTER,C_STRING},C_POINTER)

public function SDL_CreateRenderer(atom window,object name)
	return c_func(xSDL_CreateRenderer,{window,name})
end function

public constant xSDL_CreateRendererWithProperties = define_c_func(sdl,"+SDL_CreateRendererWithProperties",{C_UINT32},C_POINTER)

public function SDL_CreateRendererWithProperties(atom props)
	return c_func(xSDL_CreateRendererWithProperties,{props})
end function

public constant SDL_PROP_RENDERER_CREATE_NAME_STRING        =                        "SDL.renderer.create.name"
public constant SDL_PROP_RENDERER_CREATE_WINDOW_POINTER             =                "SDL.renderer.create.window"
public constant SDL_PROP_RENDERER_CREATE_SURFACE_POINTER            =                "SDL.renderer.create.surface"
public constant SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER   =                "SDL.renderer.create.output_colorspace"
public constant SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER       =                "SDL.renderer.create.present_vsync"
public constant SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER    =                "SDL.renderer.create.vulkan.instance"
public constant SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER      =                "SDL.renderer.create.vulkan.surface"
public constant SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER  =           "SDL.renderer.create.vulkan.physical_device"
public constant SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER           =           "SDL.renderer.create.vulkan.device"
public constant SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.create.vulkan.graphics_queue_family_index"
public constant SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER  = "SDL.renderer.create.vulkan.present_queue_family_index"

public constant xSDL_CreateSoftwareRenderer = define_c_func(sdl,"+SDL_CreateSoftwareRenderer",{C_POINTER},C_POINTER)

public function SDL_CreateSoftwareRenderer(atom surface)
	return c_func(xSDL_CreateSoftwareRenderer,{surface})
end function

public constant xSDL_GetRenderer = define_c_func(sdl,"+SDL_GetRenderer",{C_POINTER},C_POINTER)

public function SDL_GetRenderer(atom window)
	return c_func(xSDL_GetRenderer,{window})
end function

public constant xSDL_GetRenderWindow = define_c_func(sdl,"+SDL_GetRenderWindow",{C_POINTER},C_POINTER)

public function SDL_GetRenderWindow(atom renderer)
	return c_func(xSDL_GetRenderWindow,{renderer})
end function

public constant xSDL_GetRendererName = define_c_func(sdl,"+SDL_GetRendererName",{C_POINTER},C_STRING)

public function SDL_GetRendererName(atom renderer)
	return c_func(xSDL_GetRendererName,{renderer})
end function

public constant xSDL_GetRendererProperties = define_c_func(sdl,"+SDL_GetRendererProperties",{C_POINTER},C_UINT32)

public function SDL_GetRendererProperties(atom renderer)
	return c_func(xSDL_GetRendererProperties,{renderer})
end function

public constant SDL_PROP_RENDERER_NAME_STRING   =                            "SDL.renderer.name"
public constant SDL_PROP_RENDERER_WINDOW_POINTER        =                    "SDL.renderer.window"
public constant SDL_PROP_RENDERER_SURFACE_POINTER       =                    "SDL.renderer.surface"
public constant SDL_PROP_RENDERER_VSYNC_NUMBER           =                   "SDL.renderer.vsync"
public constant SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER =                  "SDL.renderer.max_texture_size"
public constant SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER  =                 "SDL.renderer.texture_formats"
public constant SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER  =                "SDL.renderer.output_colorspace"
public constant SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN       =                "SDL.renderer.HDR_enabled"
public constant SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT     =                "SDL.renderer.SDR_white_point"
public constant SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT        =                "SDL.renderer.HDR_headroom"
public constant SDL_PROP_RENDERER_D3D9_DEVICE_POINTER       =                "SDL.renderer.d3d9.device"
public constant SDL_PROP_RENDERER_D3D11_DEVICE_POINTER      =                "SDL.renderer.d3d11.device"
public constant SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER   =                "SDL.renderer.d3d11.swap_chain"
public constant SDL_PROP_RENDERER_D3D12_DEVICE_POINTER      =                "SDL.renderer.d3d12.device"
public constant SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER    =               "SDL.renderer.d3d12.swap_chain"
public constant SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER =              "SDL.renderer.d3d12.command_queue"
public constant SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER     =              "SDL.renderer.vulkan.instance"
public constant SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER        =             "SDL.renderer.vulkan.surface"
public constant SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER =           "SDL.renderer.vulkan.physical_device"
public constant SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER           =          "SDL.renderer.vulkan.device"
public constant SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.vulkan.graphics_queue_family_index"
public constant SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER  = "SDL.renderer.vulkan.present_queue_family_index"
public constant SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER      = "SDL.renderer.vulkan.swapchain_image_count"
public constant SDL_PROP_RENDERER_GPU_DEVICE_POINTER                      =  "SDL.renderer.gpu.device"

public constant xSDL_GetRenderOutputSize = define_c_func(sdl,"+SDL_GetRenderOutputSize",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderOutputSize(atom renderer)
	
	atom w = 0, h = 0
	atom pw = allocate_data(sizeof(C_FLOAT))
	atom ph = allocate_data(sizeof(C_FLOAT))
	
	if c_func(xSDL_GetRenderOutputSize,{renderer,pw,ph}) then
		w = peek_type(pw,C_FLOAT)
		h = peek_type(ph,C_FLOAT)
	end if
	
	free(pw)
	free(ph)
	
	return {w,h}

end function

public constant xSDL_GetCurrentRenderOutputSize = define_c_func(sdl,"+SDL_GetCurrentRenderOutputSize",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetCurrentRenderOutputSize(atom renderer)
	
	atom w = 0, h = 0
	atom pw = allocate_data(sizeof(C_FLOAT))
	atom ph = allocate_data(sizeof(C_FLOAT))
	
	if c_func(xSDL_GetCurrentRenderOutputSize,{renderer,pw,ph}) then
		w = peek_type(pw,C_FLOAT)
		h = peek_type(ph,C_FLOAT)
	end if
	
	free(pw)
	free(ph)
	
	return {w,h}

end function

public constant xSDL_CreateTexture = define_c_func(sdl,"+SDL_CreateTexture",{C_POINTER,C_INT,C_INT,C_INT,C_INT},C_POINTER)

public function SDL_CreateTexture(atom renderer,SDL_PixelFormat format,SDL_TextureAccess access,atom w,atom h)
	return c_func(xSDL_CreateTexture,{renderer,format,access,w,h})
end function

public constant xSDL_CreateTextureFromSurface = define_c_func(sdl,"+SDL_CreateTextureFromSurface",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateTextureFromSurface(atom render,atom surface)
	return c_func(xSDL_CreateTextureFromSurface,{render,surface})
end function

public constant xSDL_CreateTextureWithProperties = define_c_func(sdl,"+SDL_CreateTextureWithProperties",{C_POINTER,C_UINT32},C_POINTER)

public function SDL_CreateTextureWithProperties(atom render,atom props)
	return c_func(xSDL_CreateTextureWithProperties,{render,props})
end function

public constant SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER  =         "SDL.texture.create.colorspace"
public constant SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER             =  "SDL.texture.create.format"
public constant SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER             =  "SDL.texture.create.access"
public constant SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER              =  "SDL.texture.create.width"
public constant SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER             =  "SDL.texture.create.height"
public constant SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT     =  "SDL.texture.create.SDR_white_point"
public constant SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT        =  "SDL.texture.create.HDR_headroom"
public constant SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER     =  "SDL.texture.create.d3d11.texture"
public constant SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER   =  "SDL.texture.create.d3d11.texture_u"
public constant SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER   =  "SDL.texture.create.d3d11.texture_v"
public constant SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER     =  "SDL.texture.create.d3d12.texture"
public constant SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER   =  "SDL.texture.create.d3d12.texture_u"
public constant SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER   =  "SDL.texture.create.d3d12.texture_v"
public constant SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER =  "SDL.texture.create.metal.pixelbuffer"
public constant SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER     =  "SDL.texture.create.opengl.texture"
public constant SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER  =  "SDL.texture.create.opengl.texture_uv"
public constant SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER   =  "SDL.texture.create.opengl.texture_u"
public constant SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER   =  "SDL.texture.create.opengl.texture_v"
public constant SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER  =  "SDL.texture.create.opengles2.texture"
public constant SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER = "SDL.texture.create.opengles2.texture_uv"
public constant SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER  = "SDL.texture.create.opengles2.texture_u"
public constant SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER = "SDL.texture.create.opengles2.texture_v"
public constant SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER    =   "SDL.texture.create.vulkan.texture"

public constant xSDL_GetTextureProperties = define_c_func(sdl,"+SDL_GetTextureProperties",{C_POINTER},C_UINT32)

public function SDL_GetTextureProperties(atom texture)
	return c_func(xSDL_GetTextureProperties,{texture})
end function

public constant SDL_PROP_TEXTURE_COLORSPACE_NUMBER   =               "SDL.texture.colorspace"
public constant SDL_PROP_TEXTURE_FORMAT_NUMBER               =       "SDL.texture.format"
public constant SDL_PROP_TEXTURE_ACCESS_NUMBER               =       "SDL.texture.access"
public constant SDL_PROP_TEXTURE_WIDTH_NUMBER                =       "SDL.texture.width"
public constant SDL_PROP_TEXTURE_HEIGHT_NUMBER               =       "SDL.texture.height"
public constant SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT       =       "SDL.texture.SDR_white_point"
public constant SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT          =       "SDL.texture.HDR_headroom"
public constant SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER       =       "SDL.texture.d3d11.texture"
public constant SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER     =       "SDL.texture.d3d11.texture_u"
public constant SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER     =       "SDL.texture.d3d11.texture_v"
public constant SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER       =       "SDL.texture.d3d12.texture"
public constant SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER     =       "SDL.texture.d3d12.texture_u"
public constant SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER     =       "SDL.texture.d3d12.texture_v"
public constant SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER       =       "SDL.texture.opengl.texture"
public constant SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER    =       "SDL.texture.opengl.texture_uv"
public constant SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER     =       "SDL.texture.opengl.texture_u"
public constant SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER     =       "SDL.texture.opengl.texture_v"
public constant SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER =      "SDL.texture.opengl.target"
public constant SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT           =      "SDL.texture.opengl.tex_w"
public constant SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT           =      "SDL.texture.opengl.tex_h"
public constant SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER     =      "SDL.texture.opengles2.texture"
public constant SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER  =      "SDL.texture.opengles2.texture_uv"
public constant SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER   =      "SDL.texture.opengles2.texture_u"
public constant SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER   =      "SDL.texture.opengles2.texture_v"
public constant SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER =   "SDL.texture.opengles2.target"
public constant SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER           =   "SDL.texture.vulkan.texture"

public constant xSDL_GetRendererFromTexture = define_c_func(sdl,"+SDL_GetRendererFromTexture",{C_POINTER},C_POINTER)

public function SDL_GetRendererFromTexture(atom texture)
	return c_func(xSDL_GetRendererFromTexture,{texture})
end function

public constant xSDL_GetTextureSize = define_c_func(sdl,"+SDL_GetTextureSize",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextureSize(atom texture)

	atom w = 0, h = 0
	atom pw = allocate_data(sizeof(C_FLOAT))
	atom ph = allocate_data(sizeof(C_FLOAT))
	
	if c_func(xSDL_GetTextureSize,{texture,pw,ph}) then
		w = peek_type(pw,C_FLOAT)
		h = peek_type(ph,C_FLOAT)
	end if
	
	free(pw)
	free(ph)
	
	return {w,h}
end function

public constant xSDL_SetTextureColorMod = define_c_func(sdl,"+SDL_SetTextureColorMod",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_BOOL)

public function SDL_SetTextureColorMod(atom texture,atom r,atom g,atom b)
	return c_func(xSDL_SetTextureColorMod,{texture,r,g,b})
end function

public constant xSDL_SetTextureColorModFloat = define_c_func(sdl,"+SDL_SetTextureColorModFloa",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_SetTextureColorModFloat(atom texture,atom r,atom g,atom b)
	return c_func(xSDL_SetTextureColorModFloat,{texture,r,g,b})
end function

public constant xSDL_GetTextureColorMod = define_c_func(sdl,"+SDL_GetTextureColorMod",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextureColorMod(atom texture,atom r,atom g,atom b)
	return c_func(xSDL_GetTextureColorMod,{texture,r,g,b})
end function

public constant xSDL_GetTextureColorModFloat = define_c_func(sdl,"+SDL_GetTextureColorModFloat",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextureColorModFloat(atom texture,atom r,atom g,atom b)
	return c_func(xSDL_GetTextureColorModFloat,{texture,r,g,b})
end function

public constant xSDL_SetTextureAlphaMod = define_c_func(sdl,"+SDL_SetTextureAlphaMod",{C_POINTER,C_UINT8},C_BOOL)

public function SDL_SetTextureAlphaMod(atom texture,atom alpha)
	return c_func(xSDL_SetTextureAlphaMod,{texture,alpha})
end function

public constant xSDL_SetTextureAlphaModFloat = define_c_func(sdl,"+SDL_SetTextureAlphaModFloat",{C_POINTER,C_FLOAT},C_BOOL)

public function SDL_SetTextureAlphaModFloat(atom texture,atom alpha)
	return c_func(xSDL_SetTextureAlphaModFloat,{texture,alpha})
end function

public constant xSDL_GetTextureAlphaMod = define_c_func(sdl,"+SDL_GetTextureAlphaMod",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextureAlphaMod(atom texture,atom alpha)
	return c_func(xSDL_GetTextureAlphaMod,{texture,alpha})
end function

public constant xSDL_GetTextureAlphaModFloat = define_c_func(sdl,"+SDL_GetTextureAlphaModFloat",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextureAlphaModFloat(atom texture,atom alpha)
	return c_func(xSDL_GetTextureAlphaModFloat,{texture,alpha})
end function

public constant xSDL_SetTextureBlendMode = define_c_func(sdl,"+SDL_SetTextureBlendMode",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetTextureBlendMode(atom texture,atom blendMode)
	return c_func(xSDL_SetTextureBlendMode,{texture,blendMode})
end function

public constant xSDL_GetTextureBlendMode = define_c_func(sdl,"+SDL_GetTextureBlendMode",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextureBlendMode(atom texture,atom blendMode)
	return c_func(xSDL_GetTextureBlendMode,{texture,blendMode})
end function

public constant xSDL_SetTextureScaleMode = define_c_func(sdl,"+SDL_SetTextureScaleMode",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetTextureScaleMode(atom texture,atom scaleMode)
	return c_func(xSDL_SetTextureScaleMode,{texture,scaleMode})
end function

public constant xSDL_GetTextureScaleMode = define_c_func(sdl,"+SDL_GetTextureScaleMode",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetTextureScaleMode(atom texture,atom scaleMode)
	return c_func(xSDL_GetTextureScaleMode,{texture,scaleMode})
end function

public constant xSDL_UpdateTexture = define_c_func(sdl,"+SDL_UpdateTexture",{C_POINTER,C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_UpdateTexture(atom texture,atom rect,atom pixels,atom pitch)
	return c_func(xSDL_UpdateTexture,{texture,rect,pixels,pitch})
end function

public constant xSDL_UpdateYUVTexture = define_c_func(sdl,"+SDL_UpdateYUVTexture",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT,C_POINTER,C_INT},C_BOOL)

public function SDL_UpdateYUVTexture(atom texture,atom rect,atom Yplane,atom Ypitch,atom Uplane,atom Upitch,atom Vplane,atom Vpitch)
	return c_func(xSDL_UpdateYUVTexture,{texture,rect,Yplane,Ypitch,Uplane,Upitch,Vplane,Vpitch})
end function

public constant xSDL_UpdateNVTexture = define_c_func(sdl,"+SDL_UpdateNVTexture",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT},C_BOOL)

public function SDL_UpdateNVTexture(atom texture,atom rect,atom Yplane,atom Ypitch,atom UVplane,atom UVpitch)
	return c_func(xSDL_UpdateNVTexture,{texture,rect,Yplane,Ypitch,UVplane,UVpitch})
end function

public constant xSDL_LockTexture = define_c_func(sdl,"+SDL_LockTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_LockTexture(atom texture,atom rect,atom pixels,atom pitch)
	return c_func(xSDL_LockTexture,{texture,rect,pixels,pitch})
end function

public constant xSDL_LockTextureToSurface = define_c_func(sdl,"+SDL_LockTextureToSurface",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_LockTextureToSurface(atom texture,atom rect,atom surface)
	return c_func(xSDL_LockTextureToSurface,{texture,rect,surface})
end function

public constant xSDL_UnlockTexture = define_c_proc(sdl,"+SDL_UnlockTexture",{C_POINTER})

public procedure SDL_UnlockTexture(atom texture)
	c_proc(xSDL_UnlockTexture,{texture})
end procedure

public constant xSDL_SetRenderTarget = define_c_func(sdl,"+SDL_SetRenderTarget",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetRenderTarget(atom render,atom texture)
	return c_func(xSDL_SetRenderTarget,{render,texture})
end function

public constant xSDL_GetRenderTarget = define_c_func(sdl,"+SDL_GetRenderTarget",{C_POINTER},C_POINTER)

public function SDL_GetRenderTarget(atom render)
	return c_func(xSDL_GetRenderTarget,{render})
end function

public constant xSDL_SetRenderLogicalPresentation = define_c_func(sdl,"+SDL_SetRenderLogicalPresentation",{C_POINTER,C_INT,C_INT,C_INT},C_BOOL)

public function SDL_SetRenderLogicalPresentation(atom render,atom w,atom h,atom mode)
	return c_func(xSDL_SetRenderLogicalPresentation,{render,w,h,mode})
end function

public constant xSDL_GetRenderLogicalPresentation = define_c_func(sdl,"+SDL_GetRenderLogicalPresentation",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderLogicalPresentation(atom render,atom w,atom h,atom mode)
	return c_func(xSDL_GetRenderLogicalPresentation,{render,w,h,mode})
end function

public constant xSDL_GetRenderLogicalPresentationRect = define_c_func(sdl,"+SDL_GetRenderLogicalPresentationRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderLogicalPresentationRect(atom render,atom frect)
	return c_func(xSDL_GetRenderLogicalPresentationRect,{render,frect})
end function

public constant xSDL_RenderCoordinatesFromWindow = define_c_func(sdl,"+SDL_RenderCoordinatesFromWindow",{C_POINTER,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_RenderCoordinatesFromWindow(atom render,atom window_x,atom window_y,atom x,atom y)
	return c_func(xSDL_RenderCoordinatesFromWindow,{render,window_x,window_y,x,y})
end function

public constant xSDL_RenderCoordinatesToWindow = define_c_func(sdl,"+SDL_RenderCoordinatesToWindow",{C_POINTER,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_RenderCoordinatesToWindow(atom render,atom x,atom y,atom window_x,atom window_y)
	return c_func(xSDL_RenderCoordinatesToWindow,{render,x,y,window_x,window_y})
end function

public constant xSDL_ConvertEventToRenderCoordinates = define_c_func(sdl,"+SDL_ConvertEventToRenderCoordinates",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_ConvertEventToRenderCoordinates(atom render,atom event)
	return c_func(xSDL_ConvertEventToRenderCoordinates,{render,event})
end function

public constant xSDL_SetRenderViewport = define_c_func(sdl,"+SDL_SetRenderViewport",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetRenderViewport(atom render,atom rect)
	return c_func(xSDL_SetRenderViewport,{render,rect})
end function

public constant xSDL_GetRenderViewport = define_c_func(sdl,"+SDL_GetRenderViewport",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderViewport(atom render,atom rect)
	return c_func(xSDL_GetRenderViewport,{render,rect})
end function

public constant xSDL_RenderViewportSet = define_c_func(sdl,"+SDL_RenderViewportSet",{C_POINTER},C_BOOL)

public function SDL_RenderViewportSet(atom render)
	return c_func(xSDL_RenderViewportSet,{render})
end function

public constant xSDL_GetRenderSafeArea = define_c_func(sdl,"+SDL_GetRenderSafeArea",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderSafeArea(atom render,atom rect)
	return c_func(xSDL_GetRenderSafeArea,{render,rect})
end function

public constant xSDL_SetRenderClipRect = define_c_func(sdl,"+SDL_SetRenderClipRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetRenderClipRect(atom render,atom rect)
	return c_func(xSDL_SetRenderClipRect,{render,rect})
end function

public constant xSDL_GetRenderClipRect = define_c_func(sdl,"+SDL_GetRenderClipRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderClipRect(atom render,atom rect)
	return c_func(xSDL_GetRenderClipRect,{render,rect})
end function

public constant xSDL_RenderClipEnabled = define_c_func(sdl,"+SDL_RenderClipEnabled",{C_POINTER},C_BOOL)

public function SDL_RenderClipEnabled(atom render)
	return c_func(xSDL_RenderClipEnabled,{render})
end function

public constant xSDL_SetRenderScale = define_c_func(sdl,"+SDL_SetRenderScale",{C_POINTER,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_SetRenderScale(atom render,atom x,atom y)
	return c_func(xSDL_SetRenderScale,{render,x,y})
end function

public constant xSDL_GetRenderScale = define_c_func(sdl,"+SDL_GetRenderScale",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderScale(atom render)
	
	atom x = 0, y = 0
	atom px = allocate_data(sizeof(C_FLOAT))
	atom py = allocate_data(sizeof(C_FLOAT))
	
	if c_func(xSDL_GetRenderScale,{render,px,py}) then
		x = peek_type(px,C_FLOAT)
		y = peek_type(py,C_FLOAT)
	end if
	
	free(px)
	free(py)
	
	return {x,y}

end function

public constant xSDL_SetRenderDrawColor = define_c_func(sdl,"+SDL_SetRenderDrawColor",{C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_BOOL)

public function SDL_SetRenderDrawColor(atom render,atom r,atom g,atom b,atom a)
	return c_func(xSDL_SetRenderDrawColor,{render,r,g,b,a})
end function

public constant xSDL_SetRenderDrawColorFloat = define_c_func(sdl,"+SDL_SetRenderDrawColorFloat",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_SetRenderDrawColorFloat(atom render,atom r,atom g,atom b,atom a)
	return c_func(xSDL_SetRenderDrawColorFloat,{render,r,g,b,a})
end function

public constant xSDL_GetRenderDrawColor = define_c_func(sdl,"+SDL_GetRenderDrawColor",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderDrawColor(atom render,atom r,atom g,atom b,atom a)
	return c_func(xSDL_GetRenderDrawColor,{render,r,g,b,a})
end function

public constant xSDL_GetRenderDrawColorFloat = define_c_func(sdl,"+SDL_GetRenderDrawColorFloat",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderDrawColorFloat(atom render,atom r,atom g,atom b,atom a)
	return c_func(xSDL_GetRenderDrawColorFloat,{render,r,g,b,a})
end function

public constant xSDL_SetRenderColorScale = define_c_func(sdl,"+SDL_SetRenderColorScale",{C_POINTER,C_FLOAT},C_BOOL)

public function SDL_SetRenderColorScale(atom render,atom scale)
	return c_func(xSDL_SetRenderColorScale,{render,scale})
end function

public constant xSDL_GetRenderColorScale = define_c_func(sdl,"+SDL_GetRenderColorScale",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderColorScale(atom render,atom scale)
	return c_func(xSDL_GetRenderColorScale,{render,scale})
end function

public constant xSDL_SetRenderDrawBlendMode = define_c_func(sdl,"+SDL_SetRenderDrawBlendMode",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetRenderDrawBlendMode(atom render,atom blendMode)
	return c_func(xSDL_SetRenderDrawBlendMode,{render,blendMode})
end function

public constant xSDL_GetRenderDrawBlendMode = define_c_func(sdl,"+SDL_GetRenderDrawBlendMode",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderDrawBlendMode(atom render,atom blendMode)
	return c_func(xSDL_GetRenderDrawBlendMode,{render,blendMode})
end function

public constant xSDL_RenderClear = define_c_func(sdl,"+SDL_RenderClear",{C_POINTER},C_BOOL)

public function SDL_RenderClear(atom render)
	return c_func(xSDL_RenderClear,{render})
end function

public constant xSDL_RenderPoint = define_c_func(sdl,"+SDL_RenderPoint",{C_POINTER,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_RenderPoint(atom render,atom x,atom y)
	return c_func(xSDL_RenderPoint,{render,x,y})
end function

public constant xSDL_RenderPoints = define_c_func(sdl,"+SDL_RenderPoints",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_RenderPoints(atom render,atom fpoints,atom count)
	return c_func(xSDL_RenderPoints,{render,fpoints,count})
end function

public constant xSDL_RenderLine = define_c_func(sdl,"+SDL_RenderLine",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_BOOL)

public function SDL_RenderLine(atom render,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_RenderLine,{render,x,y,x2,y2})
end function

public constant xSDL_RenderLines = define_c_func(sdl,"+SDL_RenderLines",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_RenderLines(atom render,atom fpoints,atom count)
	return c_func(xSDL_RenderLines,{render,fpoints,count})
end function

public constant xSDL_RenderRect = define_c_func(sdl,"+SDL_RenderRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_RenderRect(atom render,atom frect)
	return c_func(xSDL_RenderRect,{render,frect})
end function

public constant xSDL_RenderRects = define_c_func(sdl,"+SDL_RenderRects",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_RenderRects(atom render,atom frects,atom count)
	return c_func(xSDL_RenderRects,{render,frects,count})
end function

public constant xSDL_RenderFillRect = define_c_func(sdl,"+SDL_RenderFillRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_RenderFillRect(atom render,atom frect)
	return c_func(xSDL_RenderFillRect,{render,frect})
end function

--public constant xSDL_RenderFillRect = define_c_func(sdl,"+SDL_RenderFillRect",{C_POINTER,C_POINTER,C_INT},C_BOOL)

--public function SDL_RenderFillRect(atom render,atom frects,atom count)
--	return c_func(xSDL_RenderFillRect,{render,frects,count})
--end function

public constant xSDL_RenderTexture = define_c_func(sdl,"+SDL_RenderTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_RenderTexture(atom render,atom texture,atom srcrect,atom dstrect)
	return c_func(xSDL_RenderTexture,{render,texture,srcrect,dstrect})
end function

public constant xSDL_RenderTextureRotated = define_c_func(sdl,"+SDL_RenderTextureRotated",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_DOUBLE,C_POINTER,C_INT},C_BOOL)

public function SDL_RenderTextureRotated(atom render,atom texture,atom srcrect,atom dstrect,atom angle,atom center,atom flip)
	return c_func(xSDL_RenderTextureRotated,{render,texture,srcrect,dstrect,angle,center,flip})
end function

public constant xSDL_RenderTextureAffine = define_c_func(sdl,"+SDL_RenderTextureAffine",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_RenderTextureAffine(atom render,atom texture,atom srcrect,atom origin,atom right,atom down)
	return c_func(xSDL_RenderTextureAffine,{render,texture,srcrect,origin,right,down})
end function

public constant xSDL_RenderTextureTiled = define_c_func(sdl,"+SDL_RenderTextureTiled",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_POINTER},C_BOOL)

public function SDL_RenderTextureTiled(atom render,atom texture,atom srcrect,atom scale,atom dstrect)
	return c_func(xSDL_RenderTextureTiled,{render,texture,srcrect,scale,dstrect})
end function

public constant xSDL_RenderTexture9Grid = define_c_func(sdl,"+SDL_RenderTexture9Grid",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_POINTER},C_BOOL)

public function SDL_RenderTexture9Grid(atom render,atom texture,atom srcrect,atom left_width,atom right_width,atom top_height,atom bottom_height,atom scale,atom dstrect)
	return c_func(xSDL_RenderTexture9Grid,{render,texture,srcrect,left_width,right_width,top_height,bottom_height,scale,dstrect})
end function

public constant xSDL_RenderGeometry = define_c_func(sdl,"+SDL_RenderGeometry",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT},C_BOOL)

public function SDL_RenderGeometry(atom render,atom texture,atom vertices,atom num,atom indices,atom num_indices)
	return c_func(xSDL_RenderGeometry,{render,texture,vertices,num,indices,num_indices})
end function

public constant xSDL_RenderGeometryRaw = define_c_func(sdl,"+SDL_RenderGeometryRaw",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT,C_POINTER,C_INT,C_INT,C_POINTER,C_INT,C_INT},C_BOOL)

public function SDL_RenderGeometryRaw(atom render,atom texture,atom xy,atom xy_stride,atom color,atom color_stride,atom uv,atom uv_stride,atom num_vertices,atom indices,atom num_indices,atom size_indices)
	return c_func(xSDL_RenderGeometryRaw,{render,texture,xy,xy_stride,color,color_stride,uv,uv_stride,num_vertices,indices,num_indices, size_indices})
end function

public constant xSDL_RenderReadPixels = define_c_func(sdl,"+SDL_RenderReadPixels",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_RenderReadPixels(atom render,atom rect)
	return c_func(xSDL_RenderReadPixels,{render,rect})
end function

public constant xSDL_RenderPresent = define_c_func(sdl,"+SDL_RenderPresent",{C_POINTER},C_BOOL)

public function SDL_RenderPresent(atom render)
	return c_func(xSDL_RenderPresent,{render})
end function

public constant xSDL_DestroyTexture = define_c_proc(sdl,"+SDL_DestroyTexture",{C_POINTER})

public procedure SDL_DestroyTexture(atom texture)
	c_proc(xSDL_DestroyTexture,{texture})
end procedure

public constant xSDL_DestroyRenderer = define_c_proc(sdl,"+SDL_DestroyRenderer",{C_POINTER})

public procedure SDL_DestroyRenderer(atom render)
	c_proc(xSDL_DestroyRenderer,{render})
end procedure

public constant xSDL_FlushRenderer = define_c_func(sdl,"+SDL_FlushRenderer",{C_POINTER},C_BOOL)

public function SDL_FlushRenderer(atom render)
	return c_func(xSDL_FlushRenderer,{render})
end function

public constant xSDL_GetRenderMetalLayer = define_c_func(sdl,"+SDL_GetRenderMetalLayer",{C_POINTER},C_POINTER)

public function SDL_GetRenderMetalLayer(atom render)
	return c_func(xSDL_GetRenderMetalLayer,{render})
end function

public constant xSDL_GetRenderMetalCommandEncoder = define_c_func(sdl,"+SDL_GetRenderMetalCommandEncoder",{C_POINTER},C_POINTER)

public function SDL_GetRenderMetalCommandEncoder(atom render)
	return c_func(xSDL_GetRenderMetalCommandEncoder,{render})
end function

public constant xSDL_AddVulkanRenderSemaphores = define_c_func(sdl,"+SDL_AddVulkanRenderSemaphores",{C_POINTER,C_UINT32,C_INT64,C_INT64},C_BOOL)

public function SDL_AddVulkanRenderSemaphores(atom render,atom wait_stage_mask,atom wait_semaphore,atom signal_semaphore)
	return c_func(xSDL_AddVulkanRenderSemaphores,{render,wait_stage_mask,wait_semaphore,signal_semaphore})
end function

public constant xSDL_SetRenderVSync = define_c_func(sdl,"+SDL_SetRenderVSync",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetRenderVSync(atom render,atom vsync)
	return c_func(xSDL_SetRenderVSync,{render,vsync})
end function

public constant SDL_RENDERER_VSYNC_DISABLED = 0
public constant SDL_RENDERER_VSYNC_ADAPTIVE = -1

public constant xSDL_GetRenderVSync = define_c_func(sdl,"+SDL_GetRenderVSync",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRenderVSync(atom render,atom vsync)
	return c_func(xSDL_GetRenderVSync,{render,vsync})
end function

public constant SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE = 8

public constant xSDL_RenderDebugText = define_c_func(sdl,"+SDL_RenderDebugText",{C_POINTER,C_FLOAT,C_FLOAT,C_STRING},C_BOOL)

public function SDL_RenderDebugText(atom render,atom x,atom y,sequence str)
	return c_func(xSDL_RenderDebugText,{render,x,y,str})
end function

public constant xSDL_RenderDebugTextFormat = define_c_func(sdl,"+SDL_RenderDebugTextFormat",{C_POINTER,C_FLOAT,C_FLOAT,C_STRING,C_POINTER},C_BOOL)

public function SDL_RenderDebugTextFormat(atom render,atom x,atom y,sequence str,object xx)
	return c_func(xSDL_RenderDebugTextFormat,{render,x,y,str,xx})
end function
­501.13