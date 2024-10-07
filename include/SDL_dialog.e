include std/ffi.e
include std/machine.e

include SDL3.e

include SDL_error.e
include SDL_video.e

public constant SDL_DialogFileFilter = define_c_struct({
	C_STRING, --name
	C_STRING  --pattern
})

public constant xSDL_ShowOpenFileDialog = define_c_proc(sdl,"+SDL_ShowOpenFileDialog",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT,C_STRING,C_BOOL})

public procedure SDL_ShowOpenFileDialog(atom cb,atom userdata,atom win,atom filters,atom nfilters,sequence default_location,atom allow_many)
	c_proc(xSDL_ShowOpenFileDialog,{cb,userdata,win,filters,nfilters,default_location,allow_many})
end procedure

public constant xSDL_ShowSaveFileDialog = define_c_proc(sdl,"+SDL_ShowSaveFileDialog",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT,C_STRING})

public procedure SDL_ShowSaveFileDialog(atom cb,atom userdata,atom win,atom filters,atom nfilters,sequence default_location)
	c_proc(xSDL_ShowSaveFileDialog,{cb,userdata,win,filters,nfilters,default_location})
end procedure

public constant xSDL_ShowOpenFolderDialog = define_c_proc(sdl,"+SDL_ShowOpenFolderDialog",{C_POINTER,C_POINTER,C_POINTER,C_STRING,C_BOOL})

public procedure SDL_ShowOpenFolderDialog(atom cb,atom userdata,atom win,sequence default_location,atom allow_many)
	c_proc(xSDL_ShowOpenFolderDialog,{cb,userdata,win,default_location,allow_many})
end procedure
­29.80
