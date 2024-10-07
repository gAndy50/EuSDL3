include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_error.e
include SDL_joystick.e

--typedefstruct SDL_Haptic

public constant SDL_HAPTIC_CONSTANT = shift_bits(1,0)

public constant SDL_HAPTIC_SINE = shift_bits(1,-1)

public constant SDL_HAPTIC_LEFTRIGHT = shift_bits(1,-2)

public constant SDL_HAPTIC_TRIANGLE = shift_bits(1,-3)

public constant SDL_HAPTIC_SAWTOOTHUP = shift_bits(1,-4)

public constant SDL_HAPTIC_SAWTOOTHDOWN = shift_bits(1,-5)

public constant SDL_HAPTIC_RAMP = shift_bits(1,-6)

public constant SDL_HAPTIC_SPRING = shift_bits(1,-7)

public constant SDL_HAPTIC_DAMPER = shift_bits(1,-8)

public constant SDL_HAPTIC_INERTIA = shift_bits(1,-9)

public constant SDL_HAPTIC_FRICTION = shift_bits(1,-10)

public constant SDL_HAPTIC_CUSTOM = shift_bits(1,-11)

public constant SDL_HAPTIC_GAIN = shift_bits(1,-12)

public constant SDL_HAPTIC_AUTOCENTER = shift_bits(1,-13)

public constant SDL_HAPTIC_STATUS = shift_bits(1,-14)

public constant SDL_HAPTIC_PAUSE = shift_bits(1,-15)

public constant SDL_HAPTIC_POLAR = 0
public constant SDL_HAPTIC_CARTESIAN = 1
public constant SDL_HAPTIC_SPHERICAL = 2
public constant SDL_HAPTIC_STEERING_AXIS = 3

public constant SDL_HAPTIC_INFINITY = 4294967295

public constant SDL_HapticDirection = define_c_struct({
	C_UINT8, --type
	{C_INT32,3} --direction
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
	C_UINT16 --fade_level
})

public constant SDL_HapticPeriodic = define_c_struct({
	C_UINT16, --type
	SDL_HapticDirection, --direction
	C_UINT32, --length
	C_UINT16, --delay
	C_UINT16, --button
	C_UINT16, --interval
	C_UINT16, --period
	C_UINT16, --magnitude
	C_UINT16, --offset
	C_UINT16, --phase
	C_UINT16, --attack_length
	C_UINT16, --attack_level
	C_UINT16, --fade_length
	C_UINT16 --fade_level
})

public constant SDL_HapticCondition = define_c_struct({
	C_UINT16, --type
	SDL_HapticDirection, --direction
	C_UINT32, --length
	C_UINT16, --delay
	C_UINT16, --button
	C_UINT16, --interval
	{C_UINT16,3}, --right_sat[3]
	{C_UINT16,3}, --left_sat[3]
	{C_UINT16,3}, --coeff[3]
	{C_UINT16,3}, --coeff[3]
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
	C_UINT16, --large_magnitude
	C_UINT16 --small_magnitude
})

public constant SDL_HapticCustom = define_c_struct({
	C_UINT16, --type
	SDL_HapticDirection, --direction
	C_UINT32, --length
	C_UINT16, --delay
	C_UINT16, --button
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
	C_UINT16 --fade_level
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

public constant xSDL_NumHaptics = define_c_func(sdl,"+SDL_NumHaptics",{},C_INT)

public function SDL_NumHaptics()
	return c_func(xSDL_NumHaptics,{})
end function

public constant xSDL_HapticName = define_c_func(sdl,"+SDL_HapticName",{C_INT},C_STRING)

public function SDL_HapticName(atom idx)
	return c_func(xSDL_HapticName,{idx})
end function

public constant xSDL_HapticOpen = define_c_func(sdl,"+SDL_HapticOpen",{C_INT},C_POINTER)

public function SDL_HapticOpen(atom idx)
	return c_func(xSDL_HapticOpen,{idx})
end function

public constant xSDL_HapticOpened = define_c_func(sdl,"+SDL_HapticOpened",{C_INT},C_INT)

public function SDL_HapticOpened(atom idx)
	return c_func(xSDL_HapticOpened,{idx})
end function

public constant xSDL_HapticIndex = define_c_func(sdl,"+SDL_HapticIndex",{C_POINTER},C_INT)

public function SDL_HapticIndex(atom hap)
	return c_func(xSDL_HapticIndex,{hap})
end function

public constant xSDL_MouseIsHaptic = define_c_func(sdl,"+SDL_MouseIsHaptic",{},C_INT)

public function SDL_MouseIsHaptic()
	return c_func(xSDL_MouseIsHaptic,{})
end function

public constant xSDL_HapticOpenFromMouse = define_c_func(sdl,"+SDL_HapticOpenFromMouse",{},C_POINTER)

public function SDL_HapticOpenFromMouse()
	return c_func(xSDL_HapticOpenFromMouse,{})
end function

public constant xSDL_JoystickIsHaptic = define_c_func(sdl,"+SDL_JoystickIsHaptic",{C_POINTER},C_INT)

public function SDL_JoystickIsHaptic(atom joy)
	return c_func(xSDL_JoystickIsHaptic,{joy})
end function

public constant xSDL_HapticOpenFromJoystick = define_c_func(sdl,"+SDL_HapticOpenFromJoystick",{C_POINTER},C_POINTER)

public function SDL_HapticOpenFromJoystick(atom joy)
	return c_func(xSDL_HapticOpenFromJoystick,{joy})
end function

public constant xSDL_HapticClose = define_c_proc(sdl,"+SDL_HapticClose",{C_POINTER})

public procedure SDL_HapticClose(atom hap)
	c_proc(xSDL_HapticClose,{hap})
end procedure

public constant xSDL_HapticNumEffects = define_c_func(sdl,"+SDL_HapticNumEffects",{C_POINTER},C_INT)

public function SDL_HapticNumEffects(atom hap)
	return c_func(xSDL_HapticNumEffects,{hap})
end function

public constant xSDL_HapticNumEffectsPlaying = define_c_func(sdl,"+SDL_HapticNumEffectsPlaying",{C_POINTER},C_INT)

public function SDL_HapticNumEffectsPlaying(atom hap)
	return c_func(xSDL_HapticNumEffectsPlaying,{hap})
end function

public constant xSDL_HapticQuery = define_c_func(sdl,"+SDL_HapticQuery",{C_POINTER},C_UINT)

public function SDL_HapticQuery(atom hap)
	return c_func(xSDL_HapticQuery,{hap})
end function

public constant xSDL_HapticNumAxes = define_c_func(sdl,"+SDL_HapticNumAxes",{C_POINTER},C_INT)

public function SDL_HapticNumAxes(atom hap)
	return c_func(xSDL_HapticNumAxes,{hap})
end function

public constant xSDL_HapticEffectSupported = define_c_func(sdl,"+SDL_HapticEffectSupported",{C_POINTER,C_POINTER},C_INT)

public function SDL_HapticEffectSupported(atom hap,atom eft)
	return c_func(xSDL_HapticEffectSupported,{hap,eft})
end function

public constant xSDL_HapticNewEffect = define_c_func(sdl,"+SDL_HapticNewEffect",{C_POINTER,C_POINTER},C_INT)

public function SDL_HapticNewEffect(atom hap,atom eft)
	return c_func(xSDL_HapticNewEffect,{hap,eft})
end function

public constant xSDL_HapticUpdateEffect = define_c_func(sdl,"+SDL_HapticUpdateEffect",{C_POINTER,C_INT,C_POINTER},C_INT)

public function SDL_HapticUpdateEffect(atom hap,atom eft,atom dat)
	return c_func(xSDL_HapticUpdateEffect,{hap,eft,dat})
end function

public constant xSDL_HapticRunEffect = define_c_func(sdl,"+SDL_HapticRunEffect",{C_POINTER,C_INT,C_UINT32},C_INT)

public function SDL_HapticRunEffect(atom hap,atom eft,atom its)
	return c_func(xSDL_HapticRunEffect,{hap,eft,its})
end function

public constant xSDL_HapticStopEffect = define_c_func(sdl,"+SDL_HapticStopEffect",{C_POINTER,C_INT},C_INT)

public function SDL_HapticStopEffect(atom hap,atom eft)
	return c_func(xSDL_HapticStopEffect,{hap,eft})
end function

public constant xSDL_HapticDestroy = define_c_proc(sdl,"+SDL_HapticDestroy",{C_POINTER,C_INT})

public procedure SDL_HapticDestroy(atom hap,atom eft)
	c_proc(xSDL_HapticDestroy,{hap,eft})
end procedure

public constant xSDL_HapticGetEffectStatus = define_c_func(sdl,"+SDL_HapticGetEffectStatus",{C_POINTER,C_INT},C_INT)

public function SDL_HapticGetEffectStatus(atom hap,atom eft)
	return c_func(xSDL_HapticGetEffectStatus,{hap,eft})
end function

public constant xSDL_HapticSetGain = define_c_func(sdl,"+SDL_HapticSetGain",{C_POINTER,C_INT},C_INT)

public function SDL_HapticSetGain(atom hap,atom gain)
	return c_func(xSDL_HapticSetGain,{hap,gain})
end function

public constant xSDL_HapticSetAutocenter = define_c_func(sdl,"+SDL_HapticSetAutocenter",{C_POINTER,C_INT},C_INT)

public function SDL_HapticSetAutocenter(atom hap,atom auto)
	return c_func(xSDL_HapticSetAutocenter,{hap,auto})
end function

public constant xSDL_HapticPause = define_c_func(sdl,"+SDL_HapticPause",{C_POINTER},C_INT)

public function SDL_HapticPause(atom hap)
	return c_func(xSDL_HapticPause,{hap})
end function

public constant xSDL_HapticUnpause = define_c_func(sdl,"+SDL_HapticUnpause",{C_POINTER},C_INT)

public function SDL_HapticUnpause(atom hap)
	return c_func(xSDL_HapticUnpause,{hap})
end function

public constant xSDL_HapticStopAll = define_c_func(sdl,"+SDL_HapticStopAll",{C_POINTER},C_INT)

public function SDL_HapticStopAll(atom hap)
	return c_func(xSDL_HapticStopAll,{hap})
end function

public constant xSDL_HapticRumbleSupported = define_c_func(sdl,"+SDL_HapticRumbleSupported",{C_POINTER},C_INT)

public function SDL_HapticRumbleSupported(atom hap)
	return c_func(xSDL_HapticRumbleSupported,{hap})
end function

public constant xSDL_HapticRumbleInit = define_c_func(sdl,"+SDL_HapticRumbleInit",{C_POINTER},C_INT)

public function SDL_HapticRumbleInit(atom hap)
	return c_func(xSDL_HapticRumbleInit,{hap})
end function

public constant xSDL_HapticRumblePlay = define_c_func(sdl,"+SDL_HapticRumblePlay",{C_POINTER,C_FLOAT,C_UINT32},C_INT)

public function SDL_HapticRumblePlay(atom hap,atom str,atom len)
	return c_func(xSDL_HapticRumblePlay,{hap,str,len})
end function

public constant xSDL_HapticRumbleStop = define_c_func(sdl,"+SDL_HapticRumbleStop",{C_POINTER},C_INT)

public function SDL_HapticRumbleStop(atom hap)
	return c_func(xSDL_HapticRumbleStop,{hap})
end function
­320.0