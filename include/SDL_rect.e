include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public constant SDL_Point = define_c_struct({
	C_INT, --x
	C_INT  --y
})

public constant SDL_FPoint = define_c_struct({
	C_FLOAT, --x
	C_FLOAT --y
})

public constant SDL_Rect = define_c_struct({
	C_INT,C_INT, --x,y
	C_INT,C_INT --w,h
})

public constant SDL_FRect = define_c_struct({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --w
	C_FLOAT  --h
})

public constant xSDL_HasRectIntersection = define_c_func(sdl,"+SDL_HasRectIntersection",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_HasRectIntersection(atom A,atom B)
	return c_func(xSDL_HasRectIntersection,{A,B})
end function

public constant xSDL_GetRectIntersection = define_c_func(sdl,"+SDL_GetRectIntersection",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectIntersection(atom A,atom B,atom result)
	return c_func(xSDL_GetRectIntersection,{A,B,result})
end function

public constant xSDL_GetRectUnion = define_c_func(sdl,"+SDL_GetRectUnion",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectUnion(atom A,atom B,atom result)
	return c_func(xSDL_GetRectUnion,{A,B,result})
end function

public constant xSDL_GetRectEnclosingPoints = define_c_func(sdl,"+SDL_GetRectEnclosingPoints",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectEnclosingPoints(atom points,atom count,atom clip,atom result)
	return c_func(xSDL_GetRectEnclosingPoints,{points,count,clip,result})
end function

public constant xSDL_GetRectAndLineIntersection = define_c_func(sdl,"+SDL_GetRectAndLineIntersection",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectAndLineIntersection(atom rect,atom x1,atom y1,atom x2,atom y2)
	return c_func(xSDL_GetRectAndLineIntersection,{rect,x1,y1,x2,y2})
end function

public constant xSDL_HasRectIntersectionFloat = define_c_func(sdl,"+SDL_HasRectIntersectionFloat",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_HasRectIntersectionFloat(atom A,atom B)
	return c_func(xSDL_HasRectIntersectionFloat,{A,B})
end function

public constant xSDL_GetRectIntersectionFloat = define_c_func(sdl,"+SDL_GetRectIntersectionFloat",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectIntersectionFloat(atom A,atom B,atom result)
	return c_func(xSDL_GetRectIntersectionFloat,{A,B,result})
end function

public constant xSDL_GetRectUnionFloat = define_c_func(sdl,"+SDL_GetRectUnionFloat",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectUnionFloat(atom A,atom B,atom result)
	return c_func(xSDL_GetRectUnionFloat,{A,B,result})
end function

public constant xSDL_GetRectEnclosingPointsFloat = define_c_func(sdl,"+SDL_GetRectEnclosingPointsFloat",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectEnclosingPointsFloat(atom points,atom count,atom clip,atom result)
	return c_func(xSDL_GetRectEnclosingPointsFloat,{points,count,clip,result})
end function

public constant xSDL_GetRectAndLineIntersectionFloat = define_c_func(sdl,"+SDL_GetRectAndLineIntersectionFloat",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectAndLineIntersectionFloat(atom rect,atom x1,atom y1,atom x2,atom y2)
	return c_func(xSDL_GetRectAndLineIntersectionFloat,{rect,x1,y1,x2,y2})
end function
­87.71