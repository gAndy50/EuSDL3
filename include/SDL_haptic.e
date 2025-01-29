include std/ffi.e
include std/machine.e
include std/math.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_joystick.e

public constant SDL_HAPTIC_CONSTANT = shift_bits(1,0)

public constant SDL_HAPTIC_SINE = shift_bits(1,-1)

public constant SDL_HAPTIC_SQUARE = shift_bits(1,-2)

public constant SDL_HAPTIC_TRIANGLE = shift_bits(1,-3)

public constant SDL_HAPTIC_SAWTOOTHUP = shift_bits(1,-4)

public constant SDL_HAPTIC_SAWTOOTHDOWN = shift_bits(1,-5)

public constant SDL_HAPTIC_RAMP = shift_bits(1,-6)

public constant SDL_HAPTIC_SPRING = shift_bits(1,-7)

public constant SDL_HAPTIC_DAMPER = shift_bits(1,-8)

public constant SDL_HAPTIC_INERTIA = shift_bits(1,-9)

public constant SDL_HAPTIC_FRICTION = shift_bits(1,-10)

public constant SDL_HAPTIC_LEFTRIGHT = shift_bits(1,-11)

public constant SDL_HAPTIC_RESERVED1 = shift_bits(1,-12)

public constant SDL_HAPTIC_RESERVED2 = shift_bits(1,-13)

public constant SDL_HAPTIC_RESERVED3 = shift_bits(1,-14)

public constant SDL_HAPTIC_CUSTOM = shift_bits(1,-15)

public constant SDL_HAPTIC_GAIN = shift_bits(1,-16)

public constant SDL_HAPTIC_AUTOCENTER = shift_bits(1,-17)

public constant SDL_HAPTIC_STATUS = shift_bits(1,-18)

public constant SDL_HAPTIC_PAUSE = shift_bits(1,-19)

public constant SDL_HAPTIC_POLAR = 0
public constant SDL_HAPTIC_CARTESIAN = 1
public constant SDL_HAPTIC_SPHERICAL = 2
public constant SDL_HAPTIC_STEERING_AXIS = 3

public constant SDL_HAPTIC_INFINITY = 4294967295

public constant SDL_HapticDirection = define_c_struct({
	C_UINT8, --type
	{C_INT32,3} --dir[3]
})

public constant SDL_HapticConstant = define_c_struct({
	C_UINT16, --type
	SDL_HapticDirection, --direction
	
	C_UINT32, --length
	C_UINT16, --delay
	
	C_UINT16, --button
	C_UINT16, --interval
	
	C_INT16, --level
	
	C_UINT16, --attack_length
	C_UINT16, --attack_level
	C_UINT16, --fade_length
	C_UINT16  --fade_level
})

public constant SDL_HapticPeriodic = define_c_struct({
	C_UINT16, --type
	
	SDL_HapticDirection, --direction
	
	C_UINT32, --length
	C_UINT16, --delay
	
	C_UINT16, --button
	C_UINT16, --interval
	
	C_UINT16, --period
	C_INT16, --mangitude
	C_INT16, --offset
	C_UINT16, --phase
	
	C_UINT16, --attack_length
	C_UINT16, --attack_level
	C_UINT16, --fade_length
	C_UINT16  --fade_level
})

public constant SDL_HapticCondition = define_c_struct({
	C_UINT16, --type
	
	SDL_HapticDirection, --direction
	
	C_UINT32, --length
	C_UINT16, --delay
	
	C_UINT16, --button
	C_UINT16, --delay
	
	C_UINT16, --button
	C_UINT16, --interval
	
	{C_UINT16,3}, --right_sat[3]
	{C_UINT16,3}, --left_sat[3]
	{C_UINT16,3}, --right_coeff[3]
	{C_UINT16,3}, --left_coeff[3]
	{C_UINT16,3}, --deadband[3]
	{C_UINT16,3} --center[3]
})

public constant SDL_HapticRamp = define_c_struct({
	C_UINT16, --type
	SDL_HapticDirection, --direction
	
	C_UINT32, --length
	C_UINT16, --delay
	
	C_UINT16, --button
	C_UINT16, --interval
	
	C_INT16, --start
	C_INT16, --end
	
	C_UINT16, --attack_length
	C_UINT16, --attack_level
	C_UINT16, --fade_length
	C_UINT16 --fade_level
})

public constant SDL_HapticLeftRight = define_c_struct({
	C_UINT16, --type
	C_UINT32, --length
	C_UINT16, --large_mag
	C_UINT16  --small_mag
})

public constant SDL_HapticCustom = define_c_struct({
	C_UINT16, --type
	SDL_HapticDirection, --direction
	
	C_UINT32, --length
	C_UINT16, --delay
	
	C_UINT16, --button
	C_UINT16, --interval
	
	C_UINT8, --channels
	C_UINT16, --period
	C_UINT16, --samples
	C_POINTER, --data
	
	C_UINT16, --attack_length
	C_UINT16, --attack_level
	C_UINT16, --fade_length
	C_UINT16  --fade_level
})

public constant SDL_HapticEffect = define_c_union({
	C_UINT16, --type
	SDL_HapticConstant, --constant
	SDL_HapticPeriodic, --periodic
	SDL_HapticCondition, --condition
	SDL_HapticRamp, --ramp
	SDL_HapticLeftRight, --leftright
	SDL_HapticCustom --custom
})

public constant SDL_HapticID = C_UINT32

public constant xSDL_GetHaptics = define_c_func(sdl,"+SDL_GetHaptics",{C_POINTER},C_POINTER)

public function SDL_GetHaptics(atom count)
	return c_func(xSDL_GetHaptics,{count})
end function

public constant xSDL_GetHapticNameForID = define_c_func(sdl,"+SDL_GetHapticNameForID",{C_UINT32},C_STRING)

public function SDL_GetHapticNameForID(atom id)
	return c_func(xSDL_GetHapticNameForID,{id})
end function

public constant xSDL_OpenHaptic = define_c_func(sdl,"+SDL_OpenHaptic",{C_UINT32},C_POINTER)

public function SDL_OpenHaptic(atom id)
	return c_func(xSDL_OpenHaptic,{id})
end function

public constant xSDL_GetHapticFromID = define_c_func(sdl,"+SDL_GetHapticFromID",{C_UINT32},C_POINTER)

public function SDL_GetHapticFromID(atom id)
	return c_func(xSDL_GetHapticFromID,{id})
end function

public constant xSDL_GetHapticID = define_c_func(sdl,"+SDL_GetHapticID",{C_POINTER},C_UINT32)

public function SDL_GetHapticID(atom haptic)
	return c_func(xSDL_GetHapticID,{haptic})
end function

public constant xSDL_GetHapticName = define_c_func(sdl,"+SDL_GetHapticName",{C_POINTER},C_STRING)

public function SDL_GetHapticName(atom haptic)
	return c_func(xSDL_GetHapticName,{haptic})
end function

public constant xSDL_IsMouseHaptic = define_c_func(sdl,"+SDL_IsMouseHaptic",{},C_BOOL)

public function SDL_IsMouseHaptic()
	return c_func(xSDL_IsMouseHaptic,{})
end function

public constant xSDL_OpenHapticFromMouse = define_c_func(sdl,"+SDL_OpenHapticFromMouse",{},C_POINTER)

public function SDL_OpenHapticFromMouse()
	return c_func(xSDL_OpenHapticFromMouse,{})
end function

public constant xSDL_IsJoystickHaptic = define_c_func(sdl,"+SDL_IsJoystickHaptic",{C_POINTER},C_BOOL)

public function SDL_IsJoystickHaptic(atom joystick)
	return c_func(xSDL_IsJoystickHaptic,{joystick})
end function

public constant xSDL_OpenHapticFromJoystick = define_c_func(sdl,"+SDL_OpenHapticFromJoystick",{C_POINTER},C_POINTER)

public function SDL_OpenHapticFromJoystick(atom joystick)
	return c_func(xSDL_OpenHapticFromJoystick,{joystick})
end function

public constant xDL_CloseHaptic = define_c_proc(sdl,"+DL_CloseHaptic",{C_POINTER})

public procedure DL_CloseHaptic(atom haptic)
	c_proc(xDL_CloseHaptic,{haptic})
end procedure

public constant xSDL_GetMaxHapticEffects = define_c_func(sdl,"+SDL_GetMaxHapticEffects",{C_POINTER},C_INT)

public function SDL_GetMaxHapticEffects(atom haptic)
	return c_func(xSDL_GetMaxHapticEffects,{haptic})
end function

public constant xSDL_GetMaxHapticEffectsPlaying = define_c_func(sdl,"+SDL_GetMaxHapticEffectsPlaying",{C_POINTER},C_INT)

public function SDL_GetMaxHapticEffectsPlaying(atom haptic)
	return c_func(xSDL_GetMaxHapticEffectsPlaying,{haptic})
end function

public constant xSDL_GetHapticFeatures = define_c_func(sdl,"+SDL_GetHapticFeatures",{C_POINTER},C_UINT32)

public function SDL_GetHapticFeatures(atom haptic)
	return c_func(xSDL_GetHapticFeatures,{haptic})
end function

public constant xSDL_GetNumHapticAxes = define_c_func(sdl,"+SDL_GetNumHapticAxes",{C_POINTER},C_INT)

public function SDL_GetNumHapticAxes(atom haptic)
	return c_func(xSDL_GetNumHapticAxes,{haptic})
end function

public constant xSDL_HapticEffectSupported = define_c_func(sdl,"+SDL_HapticEffectSupported",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_HapticEffectSupported(atom haptic,atom effect)
	return c_func(xSDL_HapticEffectSupported,{haptic,effect})
end function

public constant xSDL_CreateHapticEffect = define_c_func(sdl,"+SDL_CreateHapticEffect",{C_POINTER,C_POINTER},C_INT)

public function SDL_CreateHapticEffect(atom haptic,atom effect)
	return c_func(xSDL_CreateHapticEffect,{haptic,effect})
end function

public constant xSDL_UpdateHapticEffect = define_c_func(sdl,"+SDL_UpdateHapticEffect",{C_POINTER,C_INT,C_POINTER},C_BOOL)

public function SDL_UpdateHapticEffect(atom haptic,atom effect,atom data)
	return c_func(xSDL_UpdateHapticEffect,{haptic,effect,data})
end function

public constant xSDL_RunHapticEffect = define_c_func(sdl,"+SDL_RunHapticEffect",{C_POINTER,C_INT,C_UINT32},C_BOOL)

public function SDL_RunHapticEffect(atom haptic,atom effect,atom iterations)
	return c_func(xSDL_RunHapticEffect,{haptic,effect,iterations})
end function

public constant xSDL_StopHapticEffect = define_c_func(sdl,"+SDL_StopHapticEffect",{C_POINTER,C_INT},C_BOOL)

public function SDL_StopHapticEffect(atom haptic,atom effect)
	return c_func(xSDL_StopHapticEffect,{haptic,effect})
end function

public constant xSDL_DestroyHapticEffect = define_c_proc(sdl,"+SDL_DestroyHapticEffect",{C_POINTER,C_INT})

public procedure SDL_DestroyHapticEffect(atom haptic,atom effect)
	c_proc(xSDL_DestroyHapticEffect,{haptic,effect})
end procedure

public constant xSDL_GetHapticEffectStatus = define_c_func(sdl,"+SDL_GetHapticEffectStatus",{C_POINTER,C_INT},C_BOOL)

public function SDL_GetHapticEffectStatus(atom haptic,atom effect)
	return c_func(xSDL_GetHapticEffectStatus,{haptic,effect})
end function

public constant xSDL_SetHapticGain = define_c_func(sdl,"+SDL_SetHapticGain",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetHapticGain(atom haptic,atom gain)
	return c_func(xSDL_SetHapticGain,{haptic,gain})
end function

public constant xSDL_SetHapticAutocenter = define_c_func(sdl,"+SDL_SetHapticAutocenter",{C_POINTER,C_INT},C_BOOL)

public function SDL_SetHapticAutocenter(atom haptic,atom autocenter)
	return c_func(xSDL_SetHapticAutocenter,{haptic,autocenter})
end function

public constant xSDL_PauseHaptic = define_c_func(sdl,"+SDL_PauseHaptic",{C_POINTER},C_BOOL)

public function SDL_PauseHaptic(atom haptic)
	return c_func(xSDL_PauseHaptic,{haptic})
end function

public constant xSDL_ResumeHaptic = define_c_func(sdl,"+SDL_ResumeHaptic",{C_POINTER},C_BOOL)

public function SDL_ResumeHaptic(atom haptic)
	return c_func(xSDL_ResumeHaptic,{haptic})
end function

public constant xSDL_StopHapticEffects = define_c_func(sdl,"+SDL_StopHapticEffects",{C_POINTER},C_BOOL)

public function SDL_StopHapticEffects(atom haptic)
	return c_func(xSDL_StopHapticEffects,{haptic})
end function

public constant xSDL_HapticRumbleSupported = define_c_func(sdl,"+SDL_HapticRumbleSupported",{C_POINTER},C_BOOL)

public function SDL_HapticRumbleSupported(atom haptic)
	return c_func(xSDL_HapticRumbleSupported,{haptic})
end function

public constant xSDL_InitHapticRumble = define_c_func(sdl,"+SDL_InitHapticRumble",{C_POINTER},C_BOOL)

public function SDL_InitHapticRumble(atom haptic)
	return c_func(xSDL_InitHapticRumble,{haptic})
end function

public constant xSDL_PlayHapticRumble = define_c_func(sdl,"+SDL_PlayHapticRumble",{C_POINTER,C_FLOAT,C_UINT32},C_BOOL)

public function SDL_PlayHapticRumble(atom haptic,atom strength,atom len)
	return c_func(xSDL_PlayHapticRumble,{haptic,strength,len})
end function

public constant xSDL_StopHapticRumble = define_c_func(sdl,"+SDL_StopHapticRumble",{C_POINTER},C_BOOL)

public function SDL_StopHapticRumble(atom haptic)
	return c_func(xSDL_StopHapticRumble,{haptic})
end function
­160.20