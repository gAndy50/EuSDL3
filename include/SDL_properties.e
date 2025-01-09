include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_PropertiesID = C_UINT32

public enum type SDL_PropertyType
	SDL_PROPERTY_TYPE_INVALID = 0,
	SDL_PROPERTY_TYPE_POINTER,
	SDL_PROPERTY_TYPE_STRING,
	SDL_PROPERTY_TYPE_NUMBER,
	SDL_PROPERTY_TYPE_FLOAT,
	SDL_PROPERTY_TYPE_BOOLEAN
end type

public constant xSDL_GetGlobalProperties = define_c_func(sdl,"+SDL_GetGlobalProperties",{},C_INT)

public function SDL_GetGlobalProperties()
	return c_func(xSDL_GetGlobalProperties,{})
end function

public constant xSDL_CreateProperties = define_c_func(sdl,"+SDL_CreateProperties",{},C_INT)

public function SDL_CreateProperties()
	return c_func(xSDL_CreateProperties,{})
end function

public constant xSDL_CopyProperties = define_c_func(sdl,"+SDL_CopyProperties",{SDL_PropertiesID,SDL_PropertiesID},C_INT)

public function SDL_CopyProperties(atom src,atom dst)
	return c_func(xSDL_CopyProperties,{src,dst})
end function

public constant xSDL_LockProperties = define_c_func(sdl,"+SDL_LockProperties",{SDL_PropertiesID},C_INT)

public function SDL_LockProperties(atom props)
	return c_func(xSDL_LockProperties,{props})
end function

public constant xSDL_UnlockProperties = define_c_proc(sdl,"+SDL_UnlockProperties",{SDL_PropertiesID})

public procedure SDL_UnlockProperties(atom props)
	c_proc(xSDL_UnlockProperties,{props})
end procedure

public constant xSDL_SetPropertyWithCleanup = define_c_func(sdl,"+SDL_SetPropertyWithCleanup",{SDL_PropertiesID,C_STRING,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SetPropertyWithCleanup(atom props,sequence name,atom val,atom clean,atom userdata)
	return c_func(xSDL_SetPropertyWithCleanup,{props,name,val,clean,userdata})
end function

public constant xSDL_SetProperty = define_c_func(sdl,"+SDL_SetProperty",{SDL_PropertiesID,C_STRING,C_POINTER},C_INT)

public function SDL_SetProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetProperty,{props,name,val})
end function

public constant xSDL_SetStringProperty = define_c_func(sdl,"+SDL_SetStringProperty",{SDL_PropertiesID,C_STRING,C_STRING},C_INT)

public function SDL_SetStringProperty(atom props,sequence name,sequence val)
	return c_func(xSDL_SetStringProperty,{props,name,val})
end function

public constant xSDL_SetNumberProperty = define_c_func(sdl,"+SDL_SetNumberProperty",{SDL_PropertiesID,C_STRING,C_INT64},C_INT)

public function SDL_SetNumberProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetNumberProperty,{props,name,val})
end function

public constant xSDL_SetFloatProperty = define_c_func(sdl,"+SDL_SetFloatProperty",{SDL_PropertiesID,C_STRING,C_FLOAT},C_INT)

public function SDL_SetFloatProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetFloatProperty,{props,name,val})
end function

public constant xSDL_SetBooleanProperty = define_c_func(sdl,"+SDL_SetBooleanProperty",{SDL_PropertiesID,C_STRING,C_BOOL},C_INT)

public function SDL_SetBooleanProperty(atom props,sequence name,atom val)
	return c_func(xSDL_SetBooleanProperty,{props,name,val})
end function

public constant xSDL_HasProperty = define_c_func(sdl,"+SDL_HasProperty",{SDL_PropertiesID,C_STRING},C_BOOL)

public function SDL_HasProperty(atom props,sequence name)
	return c_func(xSDL_HasProperty,{props,name})
end function

public constant xSDL_GetPropertyType = define_c_func(sdl,"+SDL_GetPropertyType",{SDL_PropertiesID,C_STRING},C_INT)

public function SDL_GetPropertyType(atom props,sequence name)
	return c_func(xSDL_GetPropertyType,{props,name})
end function

public constant xSDL_GetProperty = define_c_func(sdl,"+SDL_GetProperty",{SDL_PropertiesID,C_STRING,C_POINTER},C_POINTER)

public function SDL_GetProperty(atom props,sequence name,atom val)
	return c_func(xSDL_GetProperty,{props,name,val})
end function

public constant xSDL_GetStringProperty = define_c_func(sdl,"+SDL_GetStringProperty",{SDL_PropertiesID,C_STRING,C_STRING},C_STRING)

public function SDL_GetStringProperty(atom props,sequence name,sequence val)
	return c_func(xSDL_GetStringProperty,{props,name,val})
end function

public constant xSDL_GetNumberProperty = define_c_func(sdl,"+SDL_GetNumberProperty",{SDL_PropertiesID,C_STRING,C_INT64},C_INT64)

public function SDL_GetNumberProperty(atom props,sequence name,atom val)
	return c_func(xSDL_GetNumberProperty,{props,name,val})
end function

public constant xSDL_GetFloatProperty = define_c_func(sdl,"+SDL_GetFloatProperty",{SDL_PropertiesID,C_STRING,C_FLOAT},C_FLOAT)

public function SDL_GetFloatProperty(atom props,sequence name,atom val)
	return c_func(xSDL_GetFloatProperty,{props,name,val})
end function

public constant xSDL_GetBooleanProperty = define_c_func(sdl,"+SDL_GetBooleanProperty",{SDL_PropertiesID,C_STRING,C_BOOL},C_BOOL)

public function SDL_GetBooleanProperty(atom props,sequence name,atom val)
	return c_func(xSDL_GetBooleanProperty,{props,name,val})
end function

public constant xSDL_ClearProperty = define_c_func(sdl,"+SDL_ClearProperty",{SDL_PropertiesID,C_STRING},C_INT)

public function SDL_ClearProperty(atom props,sequence name)
	return c_func(xSDL_ClearProperty,{props,name})
end function

public constant xSDL_EnumerateProperties = define_c_func(sdl,"+SDL_EnumerateProperties",{SDL_PropertiesID,C_POINTER,C_POINTER},C_INT)

public function SDL_EnumerateProperties(atom props,atom cb,atom userdata)
	return c_func(xSDL_EnumerateProperties,{props,cb,userdata})
end function

public constant xSDL_DestroyProperties = define_c_proc(sdl,"+SDL_DestroyProperties",{SDL_PropertiesID})

public procedure SDL_DestroyProperties(atom props)
	c_proc(xSDL_DestroyProperties,{props})
end procedure
­140.39