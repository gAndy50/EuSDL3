include std/ffi.e

include SDL3.e

include SDL_video.e

public constant xSDL_Vulkan_LoadLibrary = define_c_func(sdl,"+SDL_Vulkan_LoadLibrary",{C_STRING},C_INT)

public function SDL_Vulkan_LoadLibrary(sequence path)
	return c_func(xSDL_Vulkan_LoadLibrary,{path})
end function

public constant xSDL_Vulkan_GetVkGetInstanceProcAddr = define_c_func(sdl,"+SDL_Vulkan_GetVkGetInstanceProcAddr",{},C_POINTER)

public function SDL_Vulkan_GetVkGetInstanceProcAddr()
	return c_func(xSDL_Vulkan_GetVkGetInstanceProcAddr,{})
end function

public constant xSDL_Vulkan_UnloadLibrary = define_c_proc(sdl,"+SDL_Vulkan_UnloadLibrary",{})

public procedure SDL_Vulkan_UnloadLibrary()
	c_proc(xSDL_Vulkan_UnloadLibrary,{})
end procedure

public constant xSDL_Vulkan_GetInstanceExtensions = define_c_func(sdl,"+SDL_Vulkan_GetInstanceExtensions",{C_POINTER,C_STRING},C_BOOL)

public function SDL_Vulkan_GetInstanceExtensions(atom pCount,sequence pNames)
	return c_func(xSDL_Vulkan_GetInstanceExtensions,{pCount,pNames})
end function

public constant xSDL_Vulkan_CreateSurface = define_c_func(sdl,"+SDL_Vulkan_CreateSurface",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_Vulkan_CreateSurface(atom window,atom inst,atom surface)
	return c_func(xSDL_Vulkan_CreateSurface,{window,inst,surface})
end function
­16.32