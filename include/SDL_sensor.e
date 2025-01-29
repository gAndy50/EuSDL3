include std/ffi.e
include std/machine.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e
include SDL_properties.e

public constant SDL_STANDARD_GRAVITY = 9.80665

public enum type SDL_SensorType
	 SDL_SENSOR_INVALID = -1,    /**< Returned for an invalid sensor */
    SDL_SENSOR_UNKNOWN = 0,         /**< Unknown sensor type */
    SDL_SENSOR_ACCEL,           /**< Accelerometer */
    SDL_SENSOR_GYRO,            /**< Gyroscope */
    SDL_SENSOR_ACCEL_L,         /**< Accelerometer for left Joy-Con controller and Wii nunchuk */
    SDL_SENSOR_GYRO_L,          /**< Gyroscope for left Joy-Con controller */
    SDL_SENSOR_ACCEL_R,         /**< Accelerometer for right Joy-Con controller */
    SDL_SENSOR_GYRO_R           /**< Gyroscope for right Joy-Con controller */
end type

public constant xSDL_GetSensors = define_c_func(sdl,"+SDL_GetSensors",{C_POINTER},C_POINTER)

public function SDL_GetSensors(atom count)
	return c_func(xSDL_GetSensors,{count})
end function

public constant xSDL_GetSensorNameForID = define_c_func(sdl,"+SDL_GetSensorNameForID",{C_UINT32},C_STRING)

public function SDL_GetSensorNameForID(atom id)
	return c_func(xSDL_GetSensorNameForID,{id})
end function

public constant xSDL_GetSensorTypeForID = define_c_func(sdl,"+SDL_GetSensorTypeForID",{C_UINT32},C_INT)

public function SDL_GetSensorTypeForID(atom id)
	return c_func(xSDL_GetSensorTypeForID,{id})
end function

public constant xSDL_GetSensorNonPortableTypeForID = define_c_func(sdl,"+SDL_GetSensorNonPortableTypeForID",{C_UINT32},C_INT)

public function SDL_GetSensorNonPortableTypeForID(atom id)
	return c_func(xSDL_GetSensorNonPortableTypeForID,{id})
end function

public constant xSDL_OpenSensor = define_c_func(sdl,"+SDL_OpenSensor",{C_UINT32},C_POINTER)

public function SDL_OpenSensor(atom id)
	return c_func(xSDL_OpenSensor,{id})
end function

public constant xSDL_GetSensorFromID = define_c_func(sdl,"+SDL_GetSensorFromID",{C_UINT32},C_POINTER)

public function SDL_GetSensorFromID(atom id)
	return c_func(xSDL_GetSensorFromID,{id})
end function

public constant xSDL_GetSensorProperties = define_c_func(sdl,"+SDL_GetSensorProperties",{C_POINTER},C_UINT32)

public function SDL_GetSensorProperties(atom sensor)
	return c_func(xSDL_GetSensorProperties,{sensor})
end function

public constant xSDL_GetSensorName = define_c_func(sdl,"+SDL_GetSensorName",{C_POINTER},C_STRING)

public function SDL_GetSensorName(atom sensor)
	return c_func(xSDL_GetSensorName,{sensor})
end function

public constant xSDL_GetSensorType = define_c_func(sdl,"+SDL_GetSensorType",{C_POINTER},C_INT)

public function SDL_GetSensorType(atom sensor)
	return c_func(xSDL_GetSensorType,{sensor})
end function

public constant xSDL_GetSensorNonPortableType = define_c_func(sdl,"+SDL_GetSensorNonPortableType",{C_POINTER},C_INT)

public function SDL_GetSensorNonPortableType(atom sensor)
	return c_func(xSDL_GetSensorNonPortableType,{sensor})
end function

public constant xSDL_GetSensorID = define_c_func(sdl,"+SDL_GetSensorID",{C_POINTER},C_UINT32)

public function SDL_GetSensorID(atom sensor)
	return c_func(xSDL_GetSensorID,{sensor})
end function

public constant xSDL_GetSensorData = define_c_func(sdl,"+SDL_GetSensorData",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_GetSensorData(atom sensor,atom data,atom num)
	return c_func(xSDL_GetSensorData,{sensor,data,num})
end function

public constant xSDL_CloseSensor = define_c_proc(sdl,"+SDL_CloseSensor",{C_POINTER})

public procedure SDL_CloseSensor(atom sensor)
	c_proc(xSDL_CloseSensor,{sensor})
end procedure

public constant xSDL_UpdateSensors = define_c_proc(sdl,"+SDL_UpdateSensors",{})

public procedure SDL_UpdateSensors()
	c_proc(xSDL_UpdateSensors,{})
end procedure
­103.30