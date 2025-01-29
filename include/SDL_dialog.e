include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_properties.e
include SDL_video.e

public constant SDL_DialogFileFilter = define_c_struct({
	C_STRING, --name
	C_STRING  --pattern
})

public constant xSDL_ShowOpenFileDialog = define_c_proc(sdl,"+SDL_ShowOpenFileDialog",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT,C_STRING,C_BOOL})

public procedure SDL_ShowOpenFileDialog(object cb,atom userdata,atom window,atom filters,atom nfilters,sequence def_loc,atom allow)
	c_proc(xSDL_ShowOpenFileDialog,{cb,userdata,window,filters,nfilters,def_loc,allow})
end procedure

public constant xSDL_ShowSaveFileDialog = define_c_proc(sdl,"+SDL_ShowSaveFileDialog",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_INT,C_STRING})

public procedure SDL_ShowSaveFileDialog(object cb,atom userdata,atom window,atom filters,atom nfilters,sequence def_loc)
	c_proc(xSDL_ShowSaveFileDialog,{cb,userdata,window,filters,nfilters,def_loc})
end procedure

public constant xSDL_ShowOpenFolderDialog = define_c_proc(sdl,"+SDL_ShowOpenFolderDialog",{C_POINTER,C_POINTER,C_POINTER,C_STRING,C_BOOL})

public procedure SDL_ShowOpenFolderDialog(object cb,atom userdata,sequence def_loc,atom allow)
	c_proc(xSDL_ShowOpenFolderDialog,{cb,userdata,def_loc,allow})
end procedure

public enum type SDL_FileDialogType
	SDL_FILEDIALOG_OPENFILE = 0,
	SDL_FILEDIALOG_SAVEFILE,
	SDL_FILEDIALOG_OPENFOLDER
end type

public constant xSDL_ShowFileDialogWithProperties = define_c_proc(sdl,"+SDL_ShowFileDialogWithProperties",{C_INT,C_POINTER,C_POINTER,C_UINT32})

public procedure SDL_ShowFileDialogWithProperties(SDL_FileDialogType ftype,object cb,atom userdata,atom props)
	c_proc(xSDL_ShowFileDialogWithProperties,{ftype,cb,userdata,props})
end procedure

public constant SDL_PROP_FILE_DIALOG_FILTERS_POINTER  =   "SDL.filedialog.filters"
public constant SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER   =  "SDL.filedialog.nfilters"
public constant SDL_PROP_FILE_DIALOG_WINDOW_POINTER    =  "SDL.filedialog.window"
public constant SDL_PROP_FILE_DIALOG_LOCATION_STRING   = "SDL.filedialog.location"
public constant SDL_PROP_FILE_DIALOG_MANY_BOOLEAN      =  "SDL.filedialog.many"
public constant SDL_PROP_FILE_DIALOG_TITLE_STRING      =  "SDL.filedialog.title"
public constant SDL_PROP_FILE_DIALOG_ACCEPT_STRING     =  "SDL.filedialog.accept"
public constant SDL_PROP_FILE_DIALOG_CANCEL_STRING     =  "SDL.filedialog.cancel"
­52.15