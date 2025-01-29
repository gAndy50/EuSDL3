include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_surface.e
include SDL_video.e

public constant SDL_TrayEntryFlags = C_UINT32

public constant SDL_TRAYENTRY_BUTTON = 0x00000001
public constant SDL_TRAYENTRY_CHECKBOX = 0x00000002
public constant SDL_TRAYENTRY_SUBMENU = 0x00000004
public constant SDL_TRAYENTRY_DISABLED = 0x80000000
public constant SDL_TRAYENTRY_CHECKED = 0x40000000

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

public function SDL_CreateTraySubmenu(atom _entry)
	return c_func(xSDL_CreateTraySubmenu,{_entry})
end function

public constant xSDL_GetTrayMenu = define_c_func(sdl,"+SDL_GetTrayMenu",{C_POINTER},C_POINTER)

public function SDL_GetTrayMenu(atom tray)
	return c_func(xSDL_GetTrayMenu,{tray})
end function

public constant xSDL_GetTraySubmenu = define_c_func(sdl,"+SDL_GetTraySubmenu",{C_POINTER},C_POINTER)

public function SDL_GetTraySubmenu(atom _entry)
	return c_func(xSDL_GetTraySubmenu,{_entry})
end function

public constant xSDL_GetTrayEntries = define_c_func(sdl,"+SDL_GetTrayEntries",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetTrayEntries(atom menu,atom size)
	return c_func(xSDL_GetTrayEntries,{menu,size})
end function

public constant xSDL_RemoveTrayEntry = define_c_proc(sdl,"+SDL_RemoveTrayEntry",{C_POINTER})

public procedure SDL_RemoveTrayEntry(atom _entry)
	c_proc(xSDL_RemoveTrayEntry,{_entry})
end procedure

public constant xSDL_InsertTrayEntryAt = define_c_func(sdl,"+SDL_InsertTrayEntryAt",{C_POINTER,C_INT,C_STRING,C_INT},C_POINTER)

public function SDL_InsertTrayEntryAt(atom menu,atom pos,sequence _label,atom flags)
	return c_func(xSDL_InsertTrayEntryAt,{menu,pos,_label,flags})
end function

public constant xSDL_SetTrayEntryLabel = define_c_proc(sdl,"+SDL_SetTrayEntryLabel",{C_POINTER,C_STRING})

public procedure SDL_SetTrayEntryLabel(atom _entry,sequence _label)
	c_proc(xSDL_SetTrayEntryLabel,{_entry,_label})
end procedure

public constant xSDL_GetTrayEntryLabel = define_c_func(sdl,"+SDL_GetTrayEntryLabel",{C_POINTER},C_STRING)

public function SDL_GetTrayEntryLabel(atom _entry)
	return c_func(xSDL_GetTrayEntryLabel,{_entry})
end function

public constant xSDL_SetTrayEntryChecked = define_c_proc(sdl,"+SDL_SetTrayEntryChecked",{C_POINTER,C_BOOL})

public procedure SDL_SetTrayEntryChecked(atom _entry,atom checked)
	c_proc(xSDL_SetTrayEntryChecked,{_entry,checked})
end procedure

public constant xSDL_GetTrayEntryChecked = define_c_func(sdl,"+SDL_GetTrayEntryChecked",{C_POINTER},C_BOOL)

public function SDL_GetTrayEntryChecked(atom _entry)
	return c_func(xSDL_GetTrayEntryChecked,{_entry})
end function

public constant xSDL_SetTrayEntryEnabled = define_c_proc(sdl,"+SDL_SetTrayEntryEnabled",{C_POINTER,C_BOOL})

public procedure SDL_SetTrayEntryEnabled(atom _entry,atom enabled)
	c_proc(xSDL_SetTrayEntryEnabled,{_entry,enabled})
end procedure

public constant xSDL_GetTrayEntryEnabled = define_c_func(sdl,"+SDL_GetTrayEntryEnabled",{C_POINTER},C_BOOL)

public function SDL_GetTrayEntryEnabled(atom _entry)
	return c_func(xSDL_GetTrayEntryEnabled,{_entry})
end function

public constant xSDL_SetTrayEntryCallback = define_c_proc(sdl,"+SDL_SetTrayEntryCallback",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_SetTrayEntryCallback(atom _entry,object cb,atom userdata)
	c_proc(xSDL_SetTrayEntryCallback,{_entry,cb,userdata})
end procedure

public constant xSDL_ClickTrayEntry = define_c_proc(sdl,"+SDL_ClickTrayEntry",{C_POINTER})

public procedure SDL_ClickTrayEntry(atom _entry)
	c_proc(xSDL_ClickTrayEntry,{_entry})
end procedure

public constant xSDL_DestroyTray = define_c_proc(sdl,"+SDL_DestroyTray",{C_POINTER})

public procedure SDL_DestroyTray(atom tray)
	c_proc(xSDL_DestroyTray,{tray})
end procedure

public constant xSDL_GetTrayEntryParent = define_c_func(sdl,"+SDL_GetTrayEntryParent",{C_POINTER},C_POINTER)

public function SDL_GetTrayEntryParent(atom _entry)
	return c_func(xSDL_GetTrayEntryParent,{_entry})
end function

public constant xSDL_GetTrayMenuParentEntry = define_c_func(sdl,"+SDL_GetTrayMenuParentEntry",{C_POINTER},C_POINTER)

public function SDL_GetTrayMenuParentEntry(atom menu)
	return c_func(xSDL_GetTrayMenuParentEntry,{menu})
end function

public constant xSDL_GetTrayMenuParentTray = define_c_func(sdl,"+SDL_GetTrayMenuParentTray",{C_POINTER},C_POINTER)

public function SDL_GetTrayMenuParentTray(atom menu)
	return c_func(xSDL_GetTrayMenuParentTray,{menu})
end function

public constant xSDL_UpdateTrays = define_c_proc(sdl,"+SDL_UpdateTrays",{})

public procedure SDL_UpdateTrays()
	c_proc(xSDL_UpdateTrays,{})
end procedure
­10.45