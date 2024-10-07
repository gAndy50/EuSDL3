include std/ffi.e
include std/machine.e

include SDL_events.e
include SDL_properties.e
include SDL_rect.e
include SDL_video.e

include SDL3.e

public constant SDL_SOFTWARE_RENDERER = "software"

public enum type SDL_RendererFlags
	--SDL_RENDERER_SOFTWARE = 0x00000001,
	--SDL_RENDERER_ACCELERATED = 0x00000002,
	SDL_RENDERER_PRESENTVSYNC = 0x00000004
end type

public constant SDL_RendererInfo = define_c_struct({
	C_STRING, --name
	C_UINT32, --flags
	C_UINT32, --num_texture_formats
	{C_UINT32,16}, --texture_formats [16]
	C_INT, --max_texture_width
	C_INT --max_texture_height
})

public constant SDL_Vertex = define_c_struct({
	SDL_FPoint, --position
	SDL_Color, --color
	SDL_FPoint --tex_coord
})

public enum type SDL_ScaleMode
	SDL_SCALEMODE_NEAREST = 0,
	SDL_SCALEMODE_LINEAR,
	SDL_SCALEMODE_BEST
end type

public enum type SDL_TextureAccess
	SDL_TEXTUREACCESS_STATIC = 0,
	SDL_TEXTUREACCESS_STREAMING,
	SDL_TEXTUREACCESS_TARGET
end type

public enum type SDL_TextureModulate
	SDL_TEXTUREMODULATE_NONE = 0x00000000,
	SDL_TEXTUREMODULATE_COLOR = 0x00000001,
	SDL_TEXTUREMODULATE_ALPHA = 0x00000002
end type

public enum type SDL_RendererFlip
	SDL_FLIP_NONE = 0x00000000,
	SDL_FLIP_HORIZONTAL = 0x00000001,
	SDL_FLIP_VERTICAL = 0x00000002
end type

public enum type SDL_RendererLogicalPresentation
	SDL_LOGICAL_PRESENTATION_DISABLED = 0,
	SDL_LOGICAL_PRESENTATION_STRETCH,
	SDL_LOGICAL_PRESENTATION_LETTERBOX,
	SDL_LOGICAL_PRESENTATION_OVERSCAN,
	SDL_LOGICAL_PRESENTATION_INTEGER_SCALE
end type

--typedefstruct SDL_Renderer
--typedefstruct SDL_Texture

export constant xSDL_GetNumRenderDrivers = define_c_func(sdl,"+SDL_GetNumRenderDrivers",{},C_INT)

public function SDL_GetNumRenderDrivers()
	return c_func(xSDL_GetNumRenderDrivers,{})
end function

export constant xSDL_GetRenderDriver = define_c_func(sdl,"+SDL_GetRenderDriver",{C_INT},C_STRING)

public function SDL_GetRenderDriver(atom index)
	return c_func(xSDL_GetRenderDriver,{index})
end function

export constant xSDL_CreateWindowAndRenderer = define_c_func(sdl,"+SDL_CreateWindowAndRenderer",{C_STRING,C_INT,C_INT,C_UINT32,C_POINTER,C_POINTER},C_INT)

public function SDL_CreateWindowAndRenderer(sequence title,atom w,atom h,atom flags,atom win,atom rend)
	return c_func(xSDL_CreateWindowAndRenderer,{title,w,h,flags,win,rend})
end function

export constant xSDL_CreateRenderer = define_c_func(sdl,"+SDL_CreateRenderer",{C_POINTER,C_STRING},C_POINTER)

public function SDL_CreateRenderer(atom win,sequence name)
	return c_func(xSDL_CreateRenderer,{win,name})
end function

public constant xSDL_CreateRendererWithProperties = define_c_func(sdl,"+SDL_CreateRendererWithProperties",{C_INT},C_POINTER)

public function SDL_CreateRendererWithProperties(atom props)
	return c_func(xSDL_CreateRendererWithProperties,{props})
end function

public constant  SDL_PROP_RENDERER_CREATE_NAME_STRING =                               "name"
public constant  SDL_PROP_RENDERER_CREATE_WINDOW_POINTER =                             "window"
public constant SDL_PROP_RENDERER_CREATE_SURFACE_POINTER  =                          "surface"
public constant  SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER =                   "output_colorspace"
public constant  SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_BOOLEAN    =                  "present_vsync"
public constant  SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER  =                  "vulkan.instance"
public constant  SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER     =                 "vulkan.surface"
public constant  SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER =            "vulkan.physical_device"
public constant  SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER       =           "vulkan.device"
public constant  SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "vulkan.graphics_queue_family_index"
public constant  SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER =  "vulkan.present_queue_family_index"

public constant xSDL_GetRendererProperties = define_c_func(sdl,"+SDL_GetRendererProperties",{C_POINTER},C_INT)

public constant  SDL_PROP_RENDERER_NAME_STRING =                              "SDL.renderer.name"
public constant  SDL_PROP_RENDERER_WINDOW_POINTER=                            "SDL.renderer.window"
public constant  SDL_PROP_RENDERER_SURFACE_POINTER=                           "SDL.renderer.surface"
public constant  SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER=                  "SDL.renderer.output_colorspace"
public constant  SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN   =                    "SDL.renderer.HDR_enabled"
public constant  SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT =                    "SDL.renderer.SDR_white_point"
public constant  SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT    =                    "SDL.renderer.HDR_headroom"
public constant  SDL_PROP_RENDERER_D3D9_DEVICE_POINTER   =                    "SDL.renderer.d3d9.device"
public constant  SDL_PROP_RENDERER_D3D11_DEVICE_POINTER  =                    "SDL.renderer.d3d11.device"
public constant  SDL_PROP_RENDERER_D3D12_DEVICE_POINTER  =                    "SDL.renderer.d3d12.device"
public constant  SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER =              "SDL.renderer.d3d12.command_queue"
public constant  SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER   =                "SDL.renderer.vulkan.instance"
public constant  SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER     =                "SDL.renderer.vulkan.surface"
public constant  SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER =           "SDL.renderer.vulkan.physical_device"
public constant  SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER       =              "SDL.renderer.vulkan.device"
public constant  SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.vulkan.graphics_queue_family_index"
public constant  SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER = "SDL.renderer.vulkan.present_queue_family_index"
public constant  SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER   =    "SDL.renderer.vulkan.swapchain_image_count"

public function SDL_GetRendererProperties(atom ren)
	return c_func(xSDL_GetRendererProperties,{ren})
end function

export constant xSDL_CreateSoftwareRenderer = define_c_func(sdl,"+SDL_CreateSoftwareRenderer",{C_POINTER},C_POINTER)

public function SDL_CreateSoftwareRenderer(atom surf)
	return c_func(xSDL_CreateSoftwareRenderer,{surf})
end function

export constant xSDL_GetRenderer = define_c_func(sdl,"+SDL_GetRenderer",{C_POINTER},C_POINTER)

public function SDL_GetRenderer(atom win)
	return c_func(xSDL_GetRenderer,{win})
end function

export constant xSDL_GetRenderWindow = define_c_func(sdl,"+SDL_GetRenderWindow",{C_POINTER},C_POINTER)

public function SDL_GetRenderWindow(atom rend)
	return c_func(xSDL_GetRenderWindow,{rend})
end function

export constant xSDL_GetRendererInfo = define_c_func(sdl,"+SDL_GetRendererInfo",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetRendererInfo(atom rend,atom info)
	return c_func(xSDL_GetRendererInfo,{rend,info})
end function

export constant xSDL_GetRenderOutputSize = define_c_func(sdl,"+SDL_GetRenderOutputSize",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderOutputSize(atom rend,atom w,atom h)
	return c_func(xSDL_GetRenderOutputSize,{rend,w,h})
end function

export constant xSDL_GetCurrentRenderOutputSize = define_c_func(sdl,"+SDL_GetCurrentRenderOutputSize",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetCurrentRenderOutputSize(atom rend,atom w,atom h)
	return c_func(xSDL_GetCurrentRenderOutputSize,{rend,w,h})
end function

export constant xSDL_CreateTexture = define_c_func(sdl,"+SDL_CreateTexture",{C_POINTER,C_UINT32,C_INT,C_INT,C_INT},C_POINTER)

public function SDL_CreateTexture(atom rend,atom format,atom access,atom w,atom h)
	return c_func(xSDL_CreateTexture,{rend,format,access,w,h})
end function

export constant xSDL_CreateTextureFromSurface = define_c_func(sdl,"+SDL_CreateTextureFromSurface",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateTextureFromSurface(atom rend,atom surf)
	return c_func(xSDL_CreateTextureFromSurface,{rend,surf})
end function

public constant xSDL_CreateTextureWithProperties = define_c_func(sdl,"+SDL_CreateTextureWithProperties",{C_POINTER,C_INT},C_POINTER)

public function SDL_CreateTextureWithProperties(atom ren,atom props)
	return c_func(xSDL_CreateTextureWithProperties,{ren,props})
end function

public constant  SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER=           "colorspace"
public constant  SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER    =           "format"
public constant  SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER    =           "access"
public constant  SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER     =           "width"
public constant  SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER     =          "height"
public constant  SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT=       "SDR_white_point"
public constant  SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT   =       "HDR_headroom"
public constant  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER =      "d3d11.texture"
public constant  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER=     "d3d11.texture_u"
public constant  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER=     "d3d11.texture_v"
public constant  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER  =     "d3d12.texture"
public constant  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER=     "d3d12.texture_u"
public constant  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER=     "d3d12.texture_v"
public constant  SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER=   "metal.pixelbuffer"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER  =     "opengl.texture"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER=    "opengl.texture_uv"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER =    "opengl.texture_u"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER =    "opengl.texture_v"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER =   "opengles2.texture"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER = "opengles2.texture_uv"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER =  "opengles2.texture_u"
public constant  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER =  "opengles2.texture_v"
public constant  SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER =      "vulkan.texture"

public constant xSDL_GetTextureProperties = define_c_func(sdl,"+SDL_GetTextureProperties",{C_POINTER},C_INT)

public function SDL_GetTextureProperties(atom tex)
	return c_func(xSDL_GetTextureProperties,{tex})
end function


public constant  SDL_PROP_TEXTURE_COLORSPACE_NUMBER    =              "SDL.texture.colorspace"
public constant  SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT =             "SDL.texture.SDR_white_point"
public constant  SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT    =             "SDL.texture.HDR_headroom"
public constant  SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER  =            "SDL.texture.d3d11.texture"
public constant  SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER =           "SDL.texture.d3d11.texture_u"
public constant  SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER  =          "SDL.texture.d3d11.texture_v"
public constant  SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER   =           "SDL.texture.d3d12.texture"
public constant  SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER =           "SDL.texture.d3d12.texture_u"
public constant  SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER =           "SDL.texture.d3d12.texture_v"
public constant  SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER   =           "SDL.texture.opengl.texture"
public constant  SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER =          "SDL.texture.opengl.texture_uv"
public constant  SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER   =         "SDL.texture.opengl.texture_u"
public constant  SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER   =         "SDL.texture.opengl.texture_v"
public constant  SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER =      "SDL.texture.opengl.target"
public constant  SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT     =            "SDL.texture.opengl.tex_w"
public constant  SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT     =            "SDL.texture.opengl.tex_h"
public constant  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER =          "SDL.texture.opengles2.texture"
public constant  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER =       "SDL.texture.opengles2.texture_uv"
public constant  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER  =       "SDL.texture.opengles2.texture_u"
public constant  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER  =       "SDL.texture.opengles2.texture_v"
public constant  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER =   "SDL.texture.opengles2.target"
public constant  SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER  =            "SDL.texture.vulkan.texture"

public constant xSDL_GetTextureSize = define_c_func(sdl,"+SDL_GetTextureSize",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureSize(atom tex,atom w,atom h)
	return c_func(xSDL_GetTextureSize,{tex,w,h})
end function

--Replaced by SDL_GetTextureSize()
--export constant xSDL_QueryTexture = define_c_func(sdl,"+SDL_QueryTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

--public function SDL_QueryTexture(atom tex,atom format,atom access,atom w,atom h)
--	return c_func(xSDL_QueryTexture,{tex,format,access,w,h})
--end function

export constant xSDL_SetTextureColorMod = define_c_func(sdl,"+SDL_SetTextureColorMod",{C_POINTER,C_UINT8,C_UINT8,C_UINT8},C_INT)

public function SDL_SetTextureColorMod(atom tex,atom r,atom g,atom b)
	return c_func(xSDL_SetTextureColorMod,{tex,r,g,b})
end function

export constant xSDL_GetTextureColorMod = define_c_func(sdl,"+SDL_GetTextureColorMod",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureColorMod(atom tex,atom r,atom g,atom b)
	return c_func(xSDL_GetTextureColorMod,{tex,r,g,b})
end function

export constant xSDL_SetTextureAlphaMod = define_c_func(sdl,"+SDL_SetTextureAlphaMod",{C_POINTER,C_UINT8},C_INT)

public function SDL_SetTextureAlphaMod(atom tex,atom al)
	return c_func(xSDL_SetTextureAlphaMod,{tex,al})
end function

export constant xSDL_GetTextureAlphaMod = define_c_func(sdl,"+SDL_GetTextureAlphaMod",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureAlphaMod(atom tex,atom al)
	return c_func(xSDL_GetTextureAlphaMod,{tex,al})
end function

export constant xSDL_SetTextureBlendMode = define_c_func(sdl,"+SDL_SetTextureBlendMode",{C_POINTER,C_INT},C_INT)

public function SDL_SetTextureBlendMode(atom tex,atom mode)
	return c_func(xSDL_SetTextureBlendMode,{tex,mode})
end function

export constant xSDL_GetTextureBlendMode = define_c_func(sdl,"+SDL_GetTextureBlendMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureBlendMode(atom tex,atom mode)
	return c_func(xSDL_GetTextureBlendMode,{tex,mode})
end function

export constant xSDL_SetTextureScaleMode = define_c_func(sdl,"+SDL_SetTextureScaleMode",{C_POINTER,C_INT},C_INT)

public function SDL_SetTextureScaleMode(atom tex,atom mode)
	return c_func(xSDL_SetTextureScaleMode,{tex,mode})
end function

export constant xSDL_GetTextureScaleMode = define_c_func(sdl,"+SDL_GetTextureScaleMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureScaleMode(atom tex,atom mode)
	return c_func(xSDL_GetTextureScaleMode,{tex,mode})
end function

export constant xSDL_SetTextureUserData = define_c_func(sdl,"+SDL_SetTextureUserData",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetTextureUserData(atom tex,object ud)
	return c_func(xSDL_SetTextureUserData,{tex,ud})
end function

export constant xSDL_GetTextureUserData = define_c_func(sdl,"+SDL_GetTextureUserData",{C_POINTER},C_POINTER)

public function SDL_GetTextureUserData(atom tex)
	return c_func(xSDL_GetTextureUserData,{tex})
end function

export constant xSDL_UpdateTexture = define_c_func(sdl,"+SDL_UpdateTexture",{C_POINTER,C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_UpdateTexture(atom tex,atom rect,object pix,atom pitch)
	return c_func(xSDL_UpdateTexture,{tex,rect,pix,pitch})
end function

export constant xSDL_UpdateYUVTexture = define_c_func(sdl,"+SDL_UpdateYUVTexture",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_UpdateYUVTexture(atom tex,atom rect,atom yplane,atom ypitch,atom uplane,atom upitch,atom vplane,atom vpitch)
	return c_func(xSDL_UpdateYUVTexture,{tex,rect,yplane,ypitch,uplane,upitch,vplane,vpitch})
end function

export constant xSDL_UpdateNVTexture = define_c_func(sdl,"+SDL_UpdateNVTexture",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_UpdateNVTexture(atom tex,atom rect,atom yplane,atom ypitch,atom uvplane,atom uvpitch)
	return c_func(xSDL_UpdateNVTexture,{tex,rect,yplane,ypitch,uvplane,uvpitch})
end function

export constant xSDL_LockTexture = define_c_func(sdl,"+SDL_LockTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_LockTexture(atom tex,atom rect,atom pix,atom pitch)
	return c_func(xSDL_LockTexture,{tex,rect,pix,pitch})
end function

export constant xSDL_LockTextureToSurface = define_c_func(sdl,"+SDL_LockTextureToSurface",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_LockTextureToSurface(atom tex,atom rect,atom surf)
	return c_func(xSDL_LockTextureToSurface,{tex,rect,surf})
end function

export constant xSDL_UnlockTexture = define_c_proc(sdl,"+SDL_UnlockTexture",{C_POINTER})

public procedure SDL_UnlockTexture(atom tex)
	c_proc(xSDL_UnlockTexture,{tex})
end procedure

export constant xSDL_SetRenderTarget = define_c_func(sdl,"+SDL_SetRenderTarget",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetRenderTarget(atom rend,atom tex)
	return c_func(xSDL_SetRenderTarget,{rend,tex})
end function

export constant xSDL_GetRenderTarget = define_c_func(sdl,"+SDL_GetRenderTarget",{C_POINTER},C_POINTER)

public function SDL_GetRenderTarget(atom rend)
	return c_func(xSDL_GetRenderTarget,{rend})
end function

export constant xSDL_SetRenderLogicalPresentation = define_c_func(sdl,"+SDL_SetRenderLogicalPresentation",{C_POINTER,C_INT,C_INT,C_INT,C_INT},C_INT)

public function SDL_SetRenderLogicalPresentation(atom rend,atom w,atom h,atom mode,atom scale_mode)
	return c_func(xSDL_SetRenderLogicalPresentation,{rend,w,h,mode,scale_mode})
end function

export constant xSDL_GetRenderLogicalPresentation = define_c_func(sdl,"+SDL_GetRenderLogicalPresentation",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderLogicalPresentation(atom rend,atom w,atom h,atom mode,atom scale_mode)
	return c_func(xSDL_GetRenderLogicalPresentation,{rend,w,h,mode,scale_mode})
end function

export constant xSDL_RenderCoordinatesFromWindow = define_c_func(sdl,"+SDL_RenderCoordinatesFromWindow",{C_POINTER,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER},C_INT)

public function SDL_RenderCoordinatesFromWindow(atom rend,atom win_x,atom win_y,atom x,atom y)
	return c_func(xSDL_RenderCoordinatesFromWindow,{rend,win_x,win_y,x,y})
end function

export constant xSDL_RenderCoordinatesToWindow = define_c_func(sdl,"+SDL_RenderCoordinatesToWindow",{C_POINTER,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER},C_INT)

public function SDL_RenderCoordinatesToWindow(atom rend,atom x,atom y,atom win_x,atom win_y)
	return c_func(xSDL_RenderCoordinatesToWindow,{rend,x,y,win_x,win_y})
end function

export constant xSDL_ConvertEventToRenderCoordinates = define_c_func(sdl,"+SDL_ConvertEventToRenderCoordinates",{C_POINTER,C_POINTER},C_INT)

public function SDL_ConvertEventToRenderCoordinates(atom rend,atom evt)
	return c_func(xSDL_ConvertEventToRenderCoordinates,{rend,evt})
end function

export constant xSDL_SetRenderViewport = define_c_func(sdl,"+SDL_SetRenderViewport",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetRenderViewport(atom rend,atom rect)
	return c_func(xSDL_SetRenderViewport,{rend,rect})
end function

export constant xSDL_GetRenderViewport = define_c_func(sdl,"+SDL_GetRenderViewport",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderViewport(atom rend,atom rect)
	return c_func(xSDL_GetRenderViewport,{rend,rect})
end function

export constant xSDL_SetRenderClipRect = define_c_func(sdl,"+SDL_SetRenderClipRect",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetRenderClipRect(atom rend,atom rect)
	return c_func(xSDL_SetRenderClipRect,{rend,rect})
end function

export constant xSDL_GetRenderClipRect = define_c_func(sdl,"+SDL_GetRenderClipRect",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderClipRect(atom rend,atom rect)
	return c_func(xSDL_GetRenderClipRect,{rend,rect})
end function

export constant xSDL_RenderClipEnabled = define_c_func(sdl,"+SDL_RenderClipEnabled",{C_POINTER},C_BOOL)

public function SDL_RenderClipEnabled(atom rend)
	return c_func(xSDL_RenderClipEnabled,{rend})
end function

export constant xSDL_SetRenderScale = define_c_func(sdl,"+SDL_SetRenderScale",{C_POINTER,C_FLOAT,C_FLOAT},C_INT)

public function SDL_SetRenderScale(atom rend,atom x,atom y)
	return c_func(xSDL_SetRenderScale,{rend,x,y})
end function

export constant xSDL_GetRenderScale = define_c_func(sdl,"+SDL_GetRenderScale",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderScale(atom rend,atom x,atom y)
	return c_func(xSDL_GetRenderScale,{rend,x,y})
end function

export constant xSDL_SetRenderDrawColor = define_c_func(sdl,"+SDL_SetRenderDrawColor",{C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)

public function SDL_SetRenderDrawColor(atom rend,atom r,atom g,atom b,atom a)
	return c_func(xSDL_SetRenderDrawColor,{rend,r,g,b,a})
end function

export constant xSDL_GetRenderDrawColor = define_c_func(sdl,"+SDL_GetRenderDrawColor",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderDrawColor(atom rend,atom r,atom g,atom b,atom a)
	return c_func(xSDL_GetRenderDrawColor,{rend,r,g,b,a})
end function

export constant xSDL_SetRenderDrawBlendMode = define_c_func(sdl,"+SDL_SetRenderDrawBlendMode",{C_POINTER,C_INT},C_INT)

public function SDL_SetRenderDrawBlendMode(atom rend,SDL_BlendMode mode)
	return c_func(xSDL_SetRenderDrawBlendMode,{rend,mode})
end function

export constant xSDL_GetRenderDrawBlendMode = define_c_func(sdl,"+SDL_GetRenderDrawBlendMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderDrawBlendMode(atom rend,atom mode)
	return c_func(xSDL_GetRenderDrawBlendMode,{rend,mode})
end function

export constant xSDL_RenderClear = define_c_func(sdl,"+SDL_RenderClear",{C_POINTER},C_INT)

public function SDL_RenderClear(atom rend)
	return c_func(xSDL_RenderClear,{rend})
end function

export constant xSDL_RenderPoint = define_c_func(sdl,"+SDL_RenderPoint",{C_POINTER,C_FLOAT,C_FLOAT},C_INT)

public function SDL_RenderPoint(atom rend,atom x,atom y)
	return c_func(xSDL_RenderPoint,{rend,x,y})
end function

export constant xSDL_RenderPoints = define_c_func(sdl,"+SDL_RenderPoints",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_RenderPoints(atom rend,atom pts,atom count)
	return c_func(xSDL_RenderPoints,{rend,pts,count})
end function

export constant xSDL_RenderLine = define_c_func(sdl,"+SDL_RenderLine",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_INT)

public function SDL_RenderLine(atom rend,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_RenderLine,{rend,x,y,x2,y2})
end function

export constant xSDL_RenderLines = define_c_func(sdl,"+SDL_RenderLines",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_RenderLines(atom rend,atom pts,atom count)
	return c_func(xSDL_RenderLines,{rend,pts,count})
end function

export constant xSDL_RenderRect = define_c_func(sdl,"+SDL_RenderRect",{C_POINTER,C_POINTER},C_INT)

public function SDL_RenderRect(atom rend,atom rect)
	return c_func(xSDL_RenderRect,{rend,rect})
end function

export constant xSDL_RenderRects = define_c_func(sdl,"+SDL_RenderRects",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_RenderRects(atom rend,atom rects,atom count)
	return c_func(xSDL_RenderRects,{rend,rects,count})
end function

export constant xSDL_RenderFillRect = define_c_func(sdl,"+SDL_RenderFillRect",{C_POINTER,C_POINTER},C_INT)

public function SDL_RenderFillRect(atom rend,atom rect)
	return c_func(xSDL_RenderFillRect,{rend,rect})
end function

export constant xSDL_RenderFillRects = define_c_func(sdl,"+SDL_RenderFillRects",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_RenderFillRects(atom rend,atom rect,atom count)
	return c_func(xSDL_RenderFillRects,{rend,rect,count})
end function

export constant xSDL_RenderTexture = define_c_func(sdl,"+SDL_RenderTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_RenderTexture(atom rend,atom tex,atom srcrect,atom dstrect)
	return c_func(xSDL_RenderTexture,{rend,tex,srcrect,dstrect})
end function

export constant xSDL_RenderTextureRotated = define_c_func(sdl,"+SDL_RenderTextureRotated",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_DOUBLE,C_POINTER,C_INT},C_INT)

public function SDL_RenderTextureRotated(atom rend,atom tex,atom srcrect,atom dstrect,atom angle,atom center,SDL_RendererFlip flip)
	return c_func(xSDL_RenderTextureRotated,{rend,tex,srcrect,dstrect,angle,center,flip})
end function

export constant xSDL_RenderGeometry = define_c_func(sdl,"+SDL_RenderGeometry",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_RenderGeometry(atom rend,atom tex,atom vertices,atom num,atom indices,atom num_ind)
	return c_func(xSDL_RenderGeometry,{rend,tex,vertices,num,indices,num_ind})
end function

export constant xSDL_RenderGeometryRaw = define_c_func(sdl,"+SDL_RenderGeometryRaw",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT,C_POINTER,C_INT,C_INT,C_POINTER,C_INT,C_INT},C_INT)

public function SDL_RenderGeometryRaw(atom rend,atom tex,atom xy,atom xy_stride,atom col,atom col_stride,atom uv,atom uv_stride,atom num,atom indices,atom num_ind,atom size)
	return c_func(xSDL_RenderGeometryRaw,{rend,tex,xy,xy_stride,col,col_stride,uv,uv_stride,num,indices,num_ind,size})
end function

export constant xSDL_RenderReadPixels = define_c_func(sdl,"+SDL_RenderReadPixels",{C_POINTER,C_POINTER,C_UINT32,C_POINTER,C_INT},C_INT)

public function SDL_RenderReadPixels(atom rend,atom rect,atom format,atom pixels,atom pitch)
	return c_func(xSDL_RenderReadPixels,{rend,rect,format,pixels,pitch})
end function

export constant xSDL_RenderPresent = define_c_func(sdl,"+SDL_RenderPresent",{C_POINTER},C_INT)

public function SDL_RenderPresent(atom rend)
	return c_func(xSDL_RenderPresent,{rend})
end function

export constant xSDL_DestroyTexture = define_c_proc(sdl,"+SDL_DestroyTexture",{C_POINTER})

public procedure SDL_DestroyTexture(atom tex)
	c_proc(xSDL_DestroyTexture,{tex})
end procedure

export constant xSDL_DestroyRenderer = define_c_proc(sdl,"+SDL_DestroyRenderer",{C_POINTER})

public procedure SDL_DestroyRenderer(atom rend)
	c_proc(xSDL_DestroyRenderer,{rend})
end procedure

export constant xSDL_RenderFlush = define_c_func(sdl,"+SDL_RenderFlush",{C_POINTER},C_INT)

public function SDL_RenderFlush(atom rend)
	return c_func(xSDL_RenderFlush,{rend})
end function

export constant xSDL_GL_BindTexture = define_c_func(sdl,"+SDL_GL_BindTexture",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GL_BindTexture(atom tex,atom w,atom h)
	return c_func(xSDL_GL_BindTexture,{tex,w,h})
end function

export constant xSDL_GL_UnbindTexture = define_c_func(sdl,"+SDL_GL_UnbindTexture",{C_POINTER},C_INT)

public function SDL_GL_UnbindTexture(atom tex)
	return c_func(xSDL_GL_UnbindTexture,{tex})
end function

public constant xSDL_FlushRenderer = define_c_func(sdl,"+SDL_FlushRenderer",{C_POINTER},C_INT)

public function SDL_FlushRenderer(atom ren)
	return c_func(xSDL_FlushRenderer,{ren})
end function

public constant xSDL_AddVulkanRenderSemaphores = define_c_func(sdl,"+SDL_AddVulkanRenderSemaphores",{C_POINTER,C_UINT32,C_INT64,C_INT64},C_INT)

public function SDL_AddVulkanRenderSemaphores(atom ren,atom wait_stage,atom wait_sem,atom signal)
	return c_func(xSDL_AddVulkanRenderSemaphores,{ren,wait_stage,wait_sem,signal})
end function

export constant xSDL_GetRenderMetalLayer = define_c_func(sdl,"+SDL_GetRenderMetalLayer",{C_POINTER},C_POINTER)

public function SDL_GetRenderMetalLayer(atom rend)
	return c_func(xSDL_GetRenderMetalLayer,{rend})
end function

export constant xSDL_GetRenderMetalCommandEncoder = define_c_func(sdl,"+SDL_GetRenderMetalCommandEncoder",{C_POINTER},C_POINTER)

public function SDL_GetRenderMetalCommandEncoder(atom rend)
	return c_func(xSDL_GetRenderMetalCommandEncoder,{rend})
end function

export constant xSDL_SetRenderVSync = define_c_func(sdl,"+SDL_SetRenderVSync",{C_POINTER,C_INT},C_INT)

public function SDL_SetRenderVSync(atom rend,atom v)
	return c_func(xSDL_SetRenderVSync,{rend,v})
end function

export constant xSDL_GetRenderVSync = define_c_func(sdl,"+SDL_GetRenderVSync",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderVSync(atom rend,atom v)
	return c_func(xSDL_GetRenderVSync,{rend,v})
end function
­85.12
