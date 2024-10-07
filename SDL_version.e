include std/ffi.e
include std/machine.e

include SDL3.e

public constant SDL_version = define_c_struct({
	C_UINT8, --major
	C_UINT8, --minor
	C_UINT8 --patch
})

public constant SDL_MAJOR_VERSION = 3,
				SDL_MINOR_VERSION = 1,
				SDL_PATCHLEVEL = 3
				
public constant xSDL_GetVersion = define_c_proc(sdl,"+SDL_GetVersion",{C_POINTER})

public function SDL_GetVersion()
	
	atom ver = allocate_struct(SDL_version)
	
	c_proc(xSDL_GetVersion,{ver})
	
	sequence res = peek_struct(ver,SDL_version)
	
	free(ver)
	
	return res
	
end function

export constant xSDL_GetRevision = define_c_func(sdl,"+SDL_GetRevision",{},C_STRING)

public function SDL_GetRevision()
	return c_func(xSDL_GetRevision,{})
end function
­14.22