include std/ffi.e
include std/machine.e

include SDL3.e

include SDL_error.e
include SDL_surface.e
include SDL_video.e

public constant SDL_Tray = C_POINTER
public constant SDL_TrayMenu = C_POINTER
public constant SDL_TrayEntry = C_POINTER

public constant SDL_TrayEntryFlags = C_UINT32

public constant SDL_TRAYENTRY_BUTTON = 0x00000001
public constant SDL_TRAYENTRY_CHECKBOX = 0x00000002
public constant SDL_TRAYENTRY_SUBMENU = 0x00000004
public constant SDL_TRAYENTRY_DISABLED = 0x80000000
public constant SDL_TRAYENTRY_CHECKED = 0x40000000

public function SDL_TrayCallback(atom userData,atom xentry)
	return 1
end function

public object SDL_TrayCB_ID = routine_id("SDL_TrayCallback")
public atom SDL_TrayCB_CB = call_back(SDL_TrayCB_ID)

public constant xSDL_CreateTray = define_c_func(sdl,"+SDL_CreateTray",{C_POINTER,C_STRING},C_POINTER)

public function SDL_CreateTray(atom icon,sequence tooltip)
	return c_func(xSDL_CreateTray,{icon,tooltip})
end function

public constant xSDL_SetTrayIcon = define_c_proc(sdl,"+SDL_SetTrayIcon",{C_POINTER,C_POINTER})

public procedure SDL_SetTrayIcon(atom tray,atom icon)
	c_proc(xSDL_SetTrayIcon,{tray,icon})
end procedure

public constant xSDL_SetTrayTooltip = define_c_proc(sdl,"+SDL_SetTrayTooltip",{C_POINTER,C_STRING})

public procedure SDL_SetTrayTooltip(atom tray,sequence tooltip)
	c_proc(xSDL_SetTrayTooltip,{tray,tooltip})
end procedure

public constant xSDL_CreateTrayMenu = define_c_func(sdl,"+SDL_CreateTrayMenu",{C_POINTER},C_POINTER)

public function SDL_CreateTrayMenu(atom tray)
	return c_func(xSDL_CreateTrayMenu,{tray})
end function

public constant xSDL_CreateTraySubmenu = define_c_func(sdl,"+SDL_CreateTraySubmenu",{C_POINTER},C_POINTER)

public function SDL_CreateTraySubmenu(atom xentry)
	return c_func(xSDL_CreateTraySubmenu,{xentry})
end function

public constant xSDL_GetTrayMenu = define_c_func(sdl,"+SDL_GetTrayMenu",{C_POINTER},C_POINTER)

public function SDL_GetTrayMenu(atom tray)
	return c_func(xSDL_GetTrayMenu,{tray})
end function

public constant xSDL_GetTraySubmenu = define_c_func(sdl,"+SDL_GetTraySubmenu",{C_POINTER},C_POINTER)

public function SDL_GetTraySubmenu(atom xentry)
	return c_func(xSDL_GetTraySubmenu,{xentry})
end function

public constant xSDL_GetTrayEntries = define_c_func(sdl,"+SDL_GetTrayEntries",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetTrayEntries(atom menu,atom size)
	return c_func(xSDL_GetTrayEntries,{menu,size})
end function

public constant xSDL_RemoveTrayEntry = define_c_proc(sdl,"+SDL_RemoveTrayEntry",{C_POINTER})

public procedure SDL_RemoveTrayEntry(atom xentry)
	c_proc(xSDL_RemoveTrayEntry,{xentry})
end procedure

public constant xSDL_InsertTrayEntryAt = define_c_func(sdl,"+SDL_InsertTrayEntryAt",{C_POINTER,C_INT,C_STRING,C_INT},C_POINTER)

public function SDL_InsertTrayEntryAt(atom menu,atom pos,sequence xlabel,atom flags)
	return c_func(xSDL_InsertTrayEntryAt,{menu,pos,xlabel,flags})
end function

public constant xSDL_SetTrayEntryLabel = define_c_proc(sdl,"+SDL_SetTrayEntryLabel",{C_POINTER,C_STRING})

public procedure SDL_SetTrayEntryLabel(atom xentry,sequence xlabel)
	c_proc(xSDL_SetTrayEntryLabel,{xentry,xlabel})
end procedure

public constant xSDL_GetTrayEntryLabel = define_c_func(sdl,"+SDL_GetTrayEntryLabel",{C_POINTER},C_STRING)

public function SDL_GetTrayEntryLabel(atom xentry)
	return c_func(xSDL_GetTrayEntryLabel,{xentry})
end function

public constant xSDL_SetTrayEntryChecked = define_c_proc(sdl,"+SDL_SetTrayEntryChecked",{C_POINTER,C_BOOL})

public procedure SDL_SetTrayEntryChecked(atom xentry,atom checked)
	c_proc(xSDL_SetTrayEntryChecked,{xentry,checked})
end procedure

public constant xSDL_GetTrayEntryChecked = define_c_func(sdl,"+SDL_GetTrayEntryChecked",{C_POINTER},C_BOOL)

public function SDL_GetTrayEntryChecked(atom xentry)
	return c_func(xSDL_GetTrayEntryChecked,{xentry})
end function

public constant xSDL_SetTrayEntryEnabled = define_c_proc(sdl,"+SDL_SetTrayEntryEnabled",{C_POINTER,C_BOOL})

public procedure SDL_SetTrayEntryEnabled(atom xentry,atom enabled)
	c_proc(xSDL_SetTrayEntryEnabled,{xentry,enabled})
end procedure

public constant xSDL_GetTrayEntryEnable = define_c_func(sdl,"+SDL_GetTrayEntryEnable",{C_POINTER},C_BOOL)

public function SDL_GetTrayEntryEnable(atom xentry)
	return c_func(xSDL_GetTrayEntryEnable,{xentry})
end function

public constant xSDL_SetTrayEntryCallback = define_c_proc(sdl,"+SDL_SetTrayEntryCallback",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_SetTrayEntryCallback(atom xentry,object cb,atom userData)
	c_proc(xSDL_SetTrayEntryCallback,{xentry,cb,userData})
end procedure

public constant xSDL_DestroyTray = define_c_proc(sdl,"+SDL_DestroyTray",{C_POINTER})

public procedure SDL_DestroyTray(atom tray)
	c_proc(xSDL_DestroyTray,{tray})
end procedure

public constant xSDL_GetTrayEntryParent = define_c_func(sdl,"+SDL_GetTrayEntryParent",{C_POINTER},C_POINTER)

public function SDL_GetTrayEntryParent(atom xentry)
	return c_func(xSDL_GetTrayEntryParent,{xentry})
end function

public constant xSDL_GetTrayMenuParentEntry = define_c_func(sdl,"+SDL_GetTrayMenuParentEntry",{C_POINTER},C_POINTER)

public function SDL_GetTrayMenuParentEntry(atom menu)
	return c_func(xSDL_GetTrayMenuParentEntry,{menu})
end function

public constant xSDL_GetTrayMenuParentTray = define_c_func(sdl,"+SDL_GetTrayMenuParentTray",{C_POINTER},C_POINTER)

public function SDL_GetTrayMenuParentTray(atom menu)
	return c_func(xSDL_GetTrayMenuParentTray,{menu})
end function
­99.12