include std/ffi.e
include std/machine.e

include SDL3.e

include SDL_error.e

public constant SDL_DateTime = define_c_struct({
	C_INT, --year
	C_INT, --month
	C_INT, --day
	C_INT, --hour
	C_INT, --minute
	C_INT, --second
	C_INT, --nanosecond
	C_INT, --day_of_week
	C_INT  --utc_offset
})

public enum type SDL_DATE_FORMAT
	SDL_DATE_FORMAT_YYYYMMDD = 0,
	SDL_DATE_FORMAT_DDMMYYYY = 1,
	SDL_DATE_FORMAT_MMDDYYYY = 2
end type

public enum type SDL_TIME_FORMAT
	SDL_TIME_FORMAT_24HR = 0,
	SDL_TIME_FORMAT_12HR = 1
end type

public constant SDL_PROP_GLOBAL_SYSTEM_DATE_FORMAT_NUMBER = "SDL.time.date_format"
public constant SDL_PROP_GLOBAL_SYSTEM_TIME_FORMAT_NUMBER = "SDL.time.time_format"

public constant SDL_Time = C_INT64

public constant xSDL_GetCurrentTime = define_c_func(sdl,"+SDL_GetCurrentTime",{C_POINTER},C_INT)

public function SDL_GetCurrentTime(atom ticks)
	return c_func(xSDL_GetCurrentTime,{ticks})
end function

public constant xSDL_TimeToDateTime = define_c_func(sdl,"+SDL_TimeToDateTime",{SDL_Time,C_POINTER,C_BOOL},C_INT)

public function SDL_TimeToDateTime(atom ticks,atom dt,atom localTime)
	return c_func(xSDL_TimeToDateTime,{ticks,dt,localTime})
end function

public constant xSDL_DateTimeToTime = define_c_func(sdl,"+SDL_DateTimeToTime",{C_POINTER,C_POINTER},C_INT)

public function SDL_DateTimeToTime(atom dt,atom ticks)
	return c_func(xSDL_DateTimeToTime,{dt,ticks})
end function

public constant xSDL_TimeToWindows = define_c_proc(sdl,"+SDL_TimeToWindows",{SDL_Time,C_POINTER,C_POINTER})

public procedure SDL_TimeToWindows(atom ticks,atom dwLowDateTime,atom dwHighDateTime)
	c_proc(xSDL_TimeToWindows,{ticks,dwLowDateTime,dwHighDateTime})
end procedure

public constant xSDL_TimeFromWindows = define_c_func(sdl,"+SDL_TimeFromWindows",{C_UINT32,C_UINT32},SDL_Time)

public function SDL_TimeFromWindows(atom dwLowDateTime,atom dwHighDateTime)
	return c_func(xSDL_TimeFromWindows,{dwLowDateTime,dwHighDateTime})
end function

public constant xSDL_GetDaysInMonth = define_c_func(sdl,"+SDL_GetDaysInMonth",{C_INT,C_INT},C_INT)

public function SDL_GetDaysInMonth(atom year,atom month)
	return c_func(xSDL_GetDaysInMonth,{year,month})
end function

public constant xSDL_GetDayOfYear = define_c_func(sdl,"+SDL_GetDayOfYear",{C_INT,C_INT,C_INT},C_INT)

public function SDL_GetDayOfYear(atom year,atom month,atom day)
	return c_func(xSDL_GetDayOfYear,{year,month,day})
end function

public constant xSDL_GetDayOfWeek = define_c_func(sdl,"+SDL_GetDayOfWeek",{C_INT,C_INT,C_INT},C_INT)

public function SDL_GetDayOfWeek(atom year,atom month,atom day)
	return c_func(xSDL_GetDayOfWeek,{year,month,day})
end function
­60.108
