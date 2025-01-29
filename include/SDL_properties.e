include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public constant SDL_PropertiesID = C_UINT32

public enum type SDL_PropertyType
	SDL_PROPERTY_TYPE_INVALID = 0,
	SDL_PROPERTY_TYPE_POINTER,
	SDL_PROPERTY_TYPE_STRING,
	SDL_PROPERTY_TYPE_NUMBER,
	SDL_PROPERTY_TYPE_FLOAT,
	SDL_PROPERTY_TYPE_BOOLEAN
end type

public constant xSDL_GetGlobalProperties = define_c_func(sdl,"+SDL_GetGlobalProperties",{},C_UINT32)

public function SDL_GetGlobalProperties()
	return c_func(xSDL_GetGlobalProperties,{})
end function

public constant xSDL_CreateProperties = define_c_func(sdl,"+SDL_CreateProperties",{},C_UINT32)

public function SDL_CreateProperties()
	return c_func(xSDL_CreateProperties,{})
end function

public constant xSDL_CopyProperties = define_c_func(sdl,"+SDL_CopyProperties",{C_UINT32,C_UINT32},C_BOOL)

public function SDL_CopyProperties(atom src,atom dst)
	return c_func(xSDL_CopyProperties,{src,dst})
end function

public constant xSDL_LockProperties = define_c_func(sdl,"+SDL_LockProperties",{C_UINT32},C_BOOL)

public function SDL_LockProperties(atom props)
	return c_func(xSDL_LockProperties,{props})
end function

public constant xSDL_UnlockProperties = define_c_proc(sdl,"+SDL_UnlockProperties",{C_UINT32})

public procedure SDL_UnlockProperties(atom props)
	c_proc(xSDL_UnlockProperties,{props})
end procedure

public constant xSDL_SetPointerPropertyWithCleanup = define_c_func(sdl,"+SDL_SetPointerPropertyWithCleanup",{C_UINT32,C_STRING,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetPointerPropertyWithCleanup(atom props,sequence name,atom val,object cleanup,atom userdata)
	return c_func(xSDL_SetPointerPropertyWithCleanup,{props,name,val,cleanup,userdata})
end function

public constant xSDL_SetPointerProperty = define_c_func(sdl,"+SDL_SetPointerProperty",{C_UINT32,C_STRING,C_POINTER},C_BOOL)

public function SDL_SetPointerProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetPointerProperty,{props,name,val})
end function

public constant xSDL_SetStringProperty = define_c_func(sdl,"+SDL_SetStringProperty",{C_UINT32,C_STRING,C_STRING},C_BOOL)

public function SDL_SetStringProperty(atom props,sequence name,sequence val)
	return c_func(xSDL_SetStringProperty,{props,name,val})
end function

public constant xSDL_SetNumberProperty = define_c_func(sdl,"+SDL_SetNumberProperty",{C_UINT32,C_STRING,C_INT64},C_BOOL)

public function SDL_SetNumberProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetNumberProperty,{props,name,val})
end function

public constant xSDL_SetFloatProperty = define_c_func(sdl,"+SDL_SetFloatProperty",{C_UINT32,C_STRING,C_FLOAT},C_BOOL)

public function SDL_SetFloatProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetFloatProperty,{props,name,val})
end function

public constant xSDL_SetBooleanProperty = define_c_func(sdl,"+SDL_SetBooleanProperty",{C_UINT32,C_STRING,C_BOOL},C_BOOL)

public function SDL_SetBooleanProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetBooleanProperty,{props,name,val})
end function

public constant xSDL_HasProperty = define_c_func(sdl,"+SDL_HasProperty",{C_UINT32,C_STRING},C_BOOL)

public function SDL_HasProperty(atom props,sequence name)
	return c_func(xSDL_HasProperty,{props,name})
end function

public constant xSDL_GetPropertyType = define_c_func(sdl,"+SDL_GetPropertyType",{C_UINT32,C_STRING},C_INT)

public function SDL_GetPropertyType(atom props,sequence name)
	return c_func(xSDL_GetPropertyType,{props,name})
end function

public constant xSDL_GetPointerProperty = define_c_func(sdl,"+SDL_GetPointerProperty",{C_UINT32,C_STRING,C_POINTER},C_POINTER)

public function SDL_GetPointerProperty(atom props,sequence name,atom def_val)
	return c_func(xSDL_GetPointerProperty,{props,name,def_val})
end function

public constant xSDL_GetStringProperty = define_c_func(sdl,"+SDL_GetStringProperty",{C_UINT32,C_STRING,C_STRING},C_STRING)

public function SDL_GetStringProperty(atom props,sequence name,sequence def_val)
	return c_func(xSDL_GetStringProperty,{props,name,def_val})
end function

public constant xSDL_GetNumberProperty = define_c_func(sdl,"+SDL_GetNumberProperty",{C_UINT32,C_STRING,C_INT64},C_INT64)

public function SDL_GetNumberProperty(atom props,sequence name,atom def_val)
	return c_func(xSDL_GetNumberProperty,{props,name,def_val})
end function

public constant xSDL_GetFloatProperty = define_c_func(sdl,"+SDL_GetFloatProperty",{C_UINT32,C_STRING,C_FLOAT},C_FLOAT)

public function SDL_GetFloatProperty(atom props,sequence name,atom def_val)
	return c_func(xSDL_GetFloatProperty,{props,name,def_val})
end function

public constant xSDL_GetBooleanProperty = define_c_func(sdl,"+SDL_GetBooleanProperty",{C_UINT32,C_STRING,C_BOOL},C_BOOL)

public function SDL_GetBooleanProperty(atom props,sequence name,atom def_val)
	return c_func(xSDL_GetBooleanProperty,{props,name,def_val})
end function

public constant xSDL_ClearProperty = define_c_func(sdl,"+SDL_ClearProperty",{C_UINT32,C_STRING},C_BOOL)

public function SDL_ClearProperty(atom props,sequence name)
	return c_func(xSDL_ClearProperty,{props,name})
end function

public constant xSDL_EnumerateProperties = define_c_func(sdl,"+SDL_EnumerateProperties",{C_UINT32,C_POINTER,C_POINTER},C_BOOL)

public function SDL_EnumerateProperties(atom props,object cb,atom userdata)
	return c_func(xSDL_EnumerateProperties,{props,cb,userdata})
end function

public constant xSDL_DestroyProperties = define_c_proc(sdl,"+SDL_DestroyProperties",{C_UINT32})

public procedure SDL_DestroyProperties(atom props)
	c_proc(xSDL_DestroyProperties,{props})
end procedure
­4.13