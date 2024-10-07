include std/ffi.e
include std/machine.e

include SDL3.e

public enum type SDL_SensorType
	SDL_SENSOR_INVALID = -1,
	SDL_SENSOR_UNKNOWN = 0,
	SDL_SENSOR_ACCEL,
	SDL_SENSOR_GYRO,
	SDL_SENSOR_ACCEL_L,
	SDL_SENSOR_ACCEL_R,
	SDL_SENSOR_GYRO_R
end type

public constant SDL_STANDARD_GRAVITY = 9.80665

export constant xSDL_GetSensors = define_c_func(sdl,"+SDL_GetSensors",{C_POINTER},C_POINTER)

public function SDL_GetSensors(atom count)
	return c_func(xSDL_GetSensors,{count})
end function

export constant xSDL_GetSensorInstanceName = define_c_func(sdl,"+SDL_GetSensorInstanceName",{C_UINT32},C_STRING)

public function SDL_GetSensorInstanceName(atom instance_id)
	return c_func(xSDL_GetSensorInstanceName,{instance_id})
end function

export constant xSDL_GetSensorInstanceType = define_c_func(sdl,"+SDL_GetSensorInstanceType",{C_UINT32},C_INT)

public function SDL_GetSensorInstanceType(atom instance_id)
	return c_func(xSDL_GetSensorInstanceType,{instance_id})
end function

export constant xSDL_GetSensorInstanceNonPortableType = define_c_func(sdl,"+SDL_GetSensorInstanceNonPortableType",{C_UINT32},C_INT)

public function SDL_GetSensorInstanceNonPortableType(atom instance_id)
	return c_func(xSDL_GetSensorInstanceNonPortableType,{instance_id})
end function

public constant xSDL_OpenSensor = define_c_func(sdl,"+SDL_OpenSensor",{C_UINT32},C_POINTER)

public function SDL_OpenSensor(atom instance_id)
	return c_func(xSDL_OpenSensor,{instance_id})
end function

export constant xSDL_GetSensorFromInstanceID = define_c_func(sdl,"+SDL_GetSensorFromInstanceID",{C_UINT32},C_POINTER)

public function SDL_GetSensorFromInstanceID(atom instance_id)
	return c_func(xSDL_GetSensorFromInstanceID,{instance_id})
end function

export constant xSDL_GetSensorName = define_c_func(sdl,"+SDL_GetSensorName",{C_POINTER},C_STRING)

public function SDL_GetSensorName(atom sensor)
	return c_func(xSDL_GetSensorName,{sensor})
end function

export constant xSDL_GetSensorType = define_c_func(sdl,"+SDL_GetSensorType",{C_POINTER},C_INT)

public function SDL_GetSensorType(atom sensor)
	return c_func(xSDL_GetSensorType,{sensor})
end function

export constant xSDL_GetSensorNonPortableType = define_c_func(sdl,"+SDL_GetSensorNonPortableType",{C_POINTER},C_INT)

public function SDL_GetSensorNonPortableType(atom sensor)
	return c_func(xSDL_GetSensorNonPortableType,{sensor})
end function

export constant xSDL_GetSensorInstanceID = define_c_func(sdl,"+SDL_GetSensorInstanceID",{C_POINTER},C_INT)

public function SDL_GetSensorInstanceID(atom sensor)
	return c_func(xSDL_GetSensorInstanceID,{sensor})
end function

export constant xSDL_GetSensorData = define_c_func(sdl,"+SDL_GetSensorData",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_GetSensorData(atom sensor,atom data,atom num_values)
	return c_func(xSDL_GetSensorData,{sensor,data,num_values})
end function

export constant xSDL_CloseSensor = define_c_proc(sdl,"+SDL_CloseSensor",{C_POINTER})

public procedure SDL_CloseSensor(atom sensor)
	c_proc(xSDL_CloseSensor,{sensor})
end procedure

export constant xSDL_UpdateSensors = define_c_proc(sdl,"+SDL_UpdateSensors",{})

public procedure SDL_UpdateSensors()
	c_proc(xSDL_UpdateSensors,{})
end procedure
­93.30