include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_error.e
include SDL_pixels.e
include SDL_rwops.e

public constant SDL_Point = define_c_struct({
	C_INT, --x
	C_INT --y
})

public constant SDL_FPoint = define_c_struct({
	C_FLOAT, --x
	C_FLOAT --y
})

public constant SDL_Rect = define_c_struct({
	C_INT, --x
	C_INT, --y
	C_INT, --w
	C_INT --h
})

public constant SDL_FRect = define_c_struct({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --w
	C_FLOAT --h
})

export constant xSDL_HasRectIntersection = define_c_func(sdl,"+SDL_HasRectIntersection",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_HasRectIntersection(atom a,atom b)
	return c_func(xSDL_HasRectIntersection,{a,b})
end function

export constant xSDL_GetRectIntersection = define_c_func(sdl,"+SDL_GetRectIntersection",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectIntersection(atom a,atom b,atom result)
	return c_func(xSDL_GetRectIntersection,{a,b,result})
end function

export constant xSDL_GetRectUnion = define_c_func(sdl,"+SDL_GetRectUnion",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRectUnion(atom a,atom b,atom result)
	return c_func(xSDL_GetRectUnion,{a,b,result})
end function

export constant xSDL_GetRectEnclosingPoints = define_c_func(sdl,"+SDL_GetRectEnclosingPoints",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectEnclosingPoints(atom points,atom count,atom clip,atom result)
	return c_func(xSDL_GetRectEnclosingPoints,{points,count,clip,result})
end function

export constant xSDL_GetRectAndLineIntersection = define_c_func(sdl,"+SDL_GetRectAndLineIntersection",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectAndLineIntersection(atom rect,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_GetRectAndLineIntersection,{rect,x,y,x,x2,y2})
end function

export constant xSDL_HasRectIntersectionFloat = define_c_func(sdl,"+SDL_HasRectIntersectionFloat",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_HasRectIntersectionFloat(atom a,atom b)
	return c_func(xSDL_HasRectIntersectionFloat,{a,b})
end function

export constant xSDL_GetRectIntersectionFloat = define_c_func(sdl,"+SDL_GetRectIntersectionFloat",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectIntersectionFloat(atom a,atom b,atom result)
	return c_func(xSDL_GetRectIntersectionFloat,{a,b,result})
end function

export constant xSDL_GetRectUnionFloat = define_c_func(sdl,"+SDL_GetRectUnionFloat",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRectUnionFloat(atom a,atom b,atom result)
	return c_func(xSDL_GetRectUnionFloat,{a,b,result})
end function

export constant xSDL_GetRectEnclosingPointsFloat = define_c_func(sdl,"+SDL_GetRectEnclosingPointsFloat",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectEnclosingPointsFloat(atom points,atom count,atom clip,atom result)
	return c_func(xSDL_GetRectEnclosingPointsFloat,{points,count,clip,result})
end function

export constant xSDL_GetRectAndLineIntersectionFloat = define_c_func(sdl,"+SDL_GetRectAndLineIntersectionFloat",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetRectAndLineIntersectionFloat(atom rect,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_GetRectAndLineIntersectionFloat,{rect,x,y,x2,y2})
end function
­92.69
