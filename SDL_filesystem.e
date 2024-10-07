include std/ffi.e
include std/machine.e

include SDL3.e

public constant xSDL_GetBasePath = define_c_func(sdl,"+SDL_GetBasePath",{},C_STRING)

public function SDL_GetBasePath()
	return c_func(xSDL_GetBasePath,{})
end function

public constant xSDL_GetPrefPath = define_c_func(sdl,"+SDL_GetPrefPath",{C_STRING,C_STRING},C_STRING)

public function SDL_GetPrefPath(sequence org,sequence app)
	return c_func(xSDL_GetPrefPath,{org,app})
end function

public enum type SDL_Folder
	SDL_FOLDER_HOME = 0,
	SDL_FOLDER_DESKTOP,
	SDL_FOLDER_DOCUMENTS,
	SDL_FOLDER_DOWNLOADS,
	SDL_FOLDER_MUSIC,
	SDL_FOLDER_PICTURES,
	SDL_FOLDER_PUBLICSHARE,
	SDL_FOLDER_SAVEDGAMES,
	SDL_FOLDER_SCREENSHOTS,
	SDL_FOLDER_TEMPLATES,
	SDL_FOLDER_VIDEOS
end type

public constant xSDL_GetUserFolder = define_c_func(sdl,"+SDL_GetUserFolder",{C_INT},C_STRING)

public function SDL_GetUserFolder(SDL_Folder folder)
	return c_func(xSDL_GetUserFolder,{folder})
end function

public enum type SDL_PathType
	SDL_PATHTYPE_NONE = 0,
	SDL_PATHTYPE_FILE,
	SDL_PATHTYPE_DIRECTORY,
	SDL_PATHTYPE_OTHER
end type

public constant SDL_PathInfo = define_c_struct({
	C_INT, --type SDL_PathType enum
	C_UINT64, --size
	C_INT64, --create_time (SDL_Time)
	C_INT64, --modify_time (SDL_Time)
	C_INT64  --access_time (SDL_Time)
})

public constant SDL_GlobFlags = C_UINT32
public constant SDL_GLOB_CASEINSENSITIVE = 1

public constant xSDL_CreateDirectory = define_c_func(sdl,"+SDL_CreateDirectory",{C_STRING},C_INT)

public function SDL_CreateDirectory(sequence path)
	return c_func(xSDL_CreateDirectory,{path})
end function

public enum type SDL_EnumerationResult
	SDL_ENUM_CONTINUE = 0,
	SDL_ENUM_SUCCESS,
	SDL_ENUM_FAILURE
end type

public constant xSDL_EnumerateDirectory = define_c_func(sdl,"+SDL_EnumerateDirectory",{C_STRING,C_POINTER,C_POINTER},C_INT)

public function SDL_EnumerateDirectory(sequence path,atom cb,atom userdata)
	return c_func(xSDL_EnumerateDirectory,{path,cb,userdata})
end function

public constant xSDL_RemovePath = define_c_func(sdl,"+SDL_RemovePath",{C_STRING},C_INT)

public function SDL_RemovePath(sequence path)
	return c_func(xSDL_RemovePath,{path})
end function

public constant xSDL_RenamePath = define_c_func(sdl,"+SDL_RenamePath",{C_STRING,C_STRING},C_INT)

public function SDL_RenamePath(sequence old,sequence new)
	return c_func(xSDL_RenamePath,{old,new})
end function

public constant xSDL_CopyFile = define_c_func(sdl,"+SDL_CopyFile",{C_STRING,C_STRING},C_BOOL)

public function SDL_CopyFile(sequence oldpath,sequence newpath)
	return c_func(xSDL_CopyFile,{oldpath,newpath})
end function

public constant xSDL_GetPathInfo = define_c_func(sdl,"+SDL_GetPathInfo",{C_STRING,C_POINTER},C_INT)

public function SDL_GetPathInfo(sequence path,atom info)
	return c_func(xSDL_GetPathInfo,{path,info})
end function

public constant xSDL_GlobDirectory = define_c_func(sdl,"+SDL_GlobDirectory",{C_STRING,C_STRING,C_UINT32,C_POINTER},C_POINTER)

public function SDL_GlobDirectory(sequence path,sequence pattern,atom flags,atom count)
	return c_func(xSDL_GlobDirectory,{path,pattern,flags,count})
end function

--public constant xSDL_GetPath = define_c_func(sdl,"+SDL_GetPath",{C_INT},C_STRING)

--public function SDL_GetPath(atom folder)
--	return c_func(xSDL_GetPath,{folder})
--end function
­101.61