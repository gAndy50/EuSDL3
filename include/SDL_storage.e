include std/ffi.e
include std/machine.e

include SDL3.e

include SDL_filesystem.e
include SDL_properties.e

public constant SDL_StorageInterface = define_c_struct({
	C_INT, --close
	C_BOOL, --enumerate
	C_INT, --info
	C_INT, --read_file
	C_INT, --write_file
	C_INT, --mkdir
	C_INT, --remove
	C_INT, --rename
	C_UINT64 --space_remaining
})

public constant xSDL_OpenTitleStorage = define_c_func(sdl,"+SDL_OpenTitleStorage",{C_STRING,C_INT},C_POINTER)

public function SDL_OpenTitleStorage(sequence over,atom props)
	return c_func(xSDL_OpenTitleStorage,{over,props})
end function

public constant xSDL_OpenUserStorage = define_c_func(sdl,"+SDL_OpenUserStorage",{C_STRING,C_STRING,C_INT},C_POINTER)

public function SDL_OpenUserStorage(sequence org,sequence app,atom props)
	return c_func(xSDL_OpenUserStorage,{org,app,props})
end function

public constant xSDL_OpenFileStorage = define_c_func(sdl,"+SDL_OpenFileStorage",{C_STRING},C_POINTER)

public function SDL_OpenFileStorage(sequence path)
	return c_func(xSDL_OpenFileStorage,{path})
end function

public constant xSDL_OpenStorage = define_c_func(sdl,"+SDL_OpenStorage",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_OpenStorage(atom iface,atom udata)
	return c_func(xSDL_OpenStorage,{iface,udata})
end function

public constant xSDL_CloseStorage = define_c_func(sdl,"+SDL_CloseStorage",{C_POINTER},C_INT)

public function SDL_CloseStorage(atom storage)
	return c_func(xSDL_CloseStorage,{storage})
end function

public constant xSDL_StorageReady = define_c_func(sdl,"+SDL_StorageReady",{C_POINTER},C_BOOL)

public function SDL_StorageReady(atom storage)
	return c_func(xSDL_StorageReady,{storage})
end function

public constant xSDL_GetStorageFileSize = define_c_func(sdl,"+SDL_GetStorageFileSize",{C_POINTER,C_STRING,C_POINTER},C_INT)

public function SDL_GetStorageFileSize(atom storage,sequence path,atom len)
	return c_func(xSDL_GetStorageFileSize,{storage,path,len})
end function

public constant xSDL_ReadStorageFile = define_c_func(sdl,"+SDL_ReadStorageFile",{C_POINTER,C_STRING,C_POINTER,C_UINT64},C_INT)

public function SDL_ReadStorageFile(atom storage,sequence path,atom dest,atom len)
	return c_func(xSDL_ReadStorageFile,{storage,path,dest,len})
end function

public constant xSDL_WriteStorageFile = define_c_func(sdl,"+SDL_WriteStorageFile",{C_POINTER,C_STRING,C_POINTER,C_UINT64},C_INT)

public function SDL_WriteStorageFile(atom storage,sequence path,atom src,atom len)
	return c_func(xSDL_WriteStorageFile,{storage,path,src,len})
end function

public constant xSDL_CreateStorageDirectory = define_c_func(sdl,"+SDL_CreateStorageDirectory",{C_POINTER,C_STRING},C_INT)

public function SDL_CreateStorageDirectory(atom storage,sequence path)
	return c_func(xSDL_CreateStorageDirectory,{storage,path})
end function

public constant xSDL_EnumerateStorageDirectory = define_c_func(sdl,"+SDL_EnumerateStorageDirectory",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_INT)

public function SDL_EnumerateStorageDirectory(atom storage,sequence path,atom cb,atom src)
	return c_func(xSDL_EnumerateStorageDirectory,{storage,path,cb,src})
end function

public constant xSDL_RemoveStoragePath = define_c_func(sdl,"+SDL_RemoveStoragePath",{C_POINTER,C_STRING},C_INT)

public function SDL_RemoveStoragePath(atom storage,sequence path)
	return c_func(xSDL_RemoveStoragePath,{storage,path})
end function

public constant xSDL_RenameStoragePath = define_c_func(sdl,"+SDL_RenameStoragePath",{C_POINTER,C_STRING,C_STRING},C_INT)

public function SDL_RenameStoragePath(atom storage,sequence old,sequence new)
	return c_func(xSDL_RenameStoragePath,{storage,old,new})
end function

public constant xSDL_GetStoragePathInfo = define_c_func(sdl,"+SDL_GetStoragePathInfo",{C_POINTER,C_STRING,C_POINTER},C_INT)

public function SDL_GetStoragePathInfo(atom storage,sequence path,atom info)
	return c_func(xSDL_GetStoragePathInfo,{storage,path,info})
end function

public constant xSDL_GetStorageSpaceRemaining = define_c_func(sdl,"+SDL_GetStorageSpaceRemaining",{C_POINTER},C_UINT64)

public function SDL_GetStorageSpaceRemaining(atom storage)
	return c_func(xSDL_GetStorageSpaceRemaining,{storage})
end function
­30.22
