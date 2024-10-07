include std/ffi.e
include std/machine.e
include std/math.e

include SDL3.e

include SDL_error.e
include SDL_endian.e
include SDL_mutex.e
include SDL_thread.e
include SDL_rwops.e

--TODO: Wrap callback functions

public constant SDL_AudioFormat = C_UINT16

public constant SDL_AUDIO_MASK_BITSIZE = 0xFF
public constant SDL_AUDIO_MASK_DATATYPE = shift_bits(1,-8)
public constant SDL_AUDIO_MASK_ENDIAN = shift_bits(1,-12)
public constant SDL_AUDIO_MASK_SIGNED = shift_bits(1,-15)
public constant SDL_AUDIO_BITSIZE = SDL_AUDIO_MASK_BITSIZE
public constant SDL_AUDIO_ISFLOAT = SDL_AUDIO_MASK_DATATYPE
public constant SDL_AUDIO_ISBIGENDIAN = SDL_AUDIO_MASK_ENDIAN
public constant SDL_AUDIO_ISSIGNED = SDL_AUDIO_MASK_SIGNED
public constant SDL_AUDIO_ISINT = not SDL_AUDIO_ISFLOAT
public constant SDL_AUDIO_ISLITTLEENDIAN = not SDL_AUDIO_ISBIGENDIAN
public constant SDL_AUDIO_ISUNSIGNED = not SDL_AUDIO_ISSIGNED

public constant SDL_AUDIO_U8 = 0x0008
public constant SDL_AUDIO_S8 = 0x8008
public constant SDL_AUDIO_S16LSB = 0x8010
public constant SDL_AUDIO_S16MSB = 0x9010
public constant SDL_AUDIO_S16 = SDL_AUDIO_S16LSB

public constant SDL_AUDIO_S32LSB = 0x8020
public constant SDL_AUDIO_S32MSB = 0x9020
public constant SDL_AUDIO_S32 = SDL_AUDIO_S32LSB

public constant SDL_AUDIO_F32LSB = 0x8120
public constant SDL_AUDIO_F32MSB = 0x9120

public constant SDL_AUDIO_F32 = SDL_AUDIO_F32LSB

public constant SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001
public constant SDL_AUDIO_ALLOW_FORMAT_CHANGE = 0x00000002
public constant SDL_AUDIO_ALLOW_CHANNELS_CHANGE = 0x00000004
public constant SDL_AUDIO_ALLOW_SAMPLES_CHANGE = 0x00000008

public constant SDL_AUDIO_ALLOW_ANY_CHANGE = or_all({SDL_AUDIO_ALLOW_FREQUENCY_CHANGE,SDL_AUDIO_ALLOW_FORMAT_CHANGE,SDL_AUDIO_ALLOW_CHANNELS_CHANGE,SDL_AUDIO_ALLOW_SAMPLES_CHANGE})

public constant SDL_AudioSpec = define_c_struct({
	SDL_AudioFormat, --format
	C_INT, --channels
	C_INT  --freq
})

export constant xSDL_GetNumAudioDrivers = define_c_func(sdl,"+SDL_GetNumAudioDrivers",{},C_INT)

public function SDL_GetNumAudioDrivers()
	return c_func(xSDL_GetNumAudioDrivers,{})
end function

export constant xSDL_GetAudioDriver = define_c_func(sdl,"+SDL_GetAudioDriver",{C_INT},C_STRING)

public function SDL_GetAudioDriver(atom index)
	return c_func(xSDL_GetAudioDriver,{index})
end function

export constant xSDL_GetCurrentAudioDriver = define_c_func(sdl,"+SDL_GetCurrentAudioDriver",{},C_STRING)

public function SDL_GetCurrentAudioDriver()
	return c_func(xSDL_GetCurrentAudioDriver,{})
end function

--SDL_AudioDeviceID C_UINT32

public constant xSDL_GetAudioOutputDevices = define_c_func(sdl,"+SDL_GetAudioOutputDevices",{C_POINTER},C_POINTER)

public function SDL_GetAudioOutputDevices(atom cnt)
	return c_func(xSDL_GetAudioOutputDevices,{cnt})
end function

export constant xSDL_GetNumAudioDevices = define_c_func(sdl,"+SDL_GetNumAudioDevices",{C_INT},C_INT)

public function SDL_GetNumAudioDevices(atom iscapture)
	return c_func(xSDL_GetNumAudioDevices,{iscapture})
end function

export constant xSDL_GetAudioDeviceName = define_c_func(sdl,"+SDL_GetAudioDeviceName",{C_INT,C_INT},C_STRING)

public function SDL_GetAudioDeviceName(atom index,atom iscapture)
	return c_func(xSDL_GetAudioDeviceName,{index,iscapture})
end function

export constant xSDL_GetAudioDeviceSpec = define_c_func(sdl,"+SDL_GetAudioDeviceSpec",{C_INT,C_INT,C_POINTER},C_INT)

public function SDL_GetAudioDeviceSpec(atom index,atom iscapture,atom spec)
	return c_func(xSDL_GetAudioDeviceSpec,{index,iscapture,spec})
end function

export constant xSDL_GetDefaultAudioInfo = define_c_func(sdl,"+SDL_GetDefaultAudioInfo",{C_STRING,C_POINTER,C_INT},C_INT)

public function SDL_GetDefaultAudioInfo(sequence name,atom spec,atom iscapture)
	return c_func(xSDL_GetDefaultAudioInfo,{name,spec,iscapture})
end function

public constant xSDL_GetAudioCaptureDevices = define_c_func(sdl,"+SDL_GetAudioCaptureDevices",{C_POINTER},C_POINTER)

public function SDL_GetAudioCaptureDevices(atom cnt)
	return c_func(xSDL_GetAudioCaptureDevices,{cnt})
end function

public constant xSDL_GetAudioDeviceFormat = define_c_func(sdl,"+SDL_GetAudioDeviceFormat",{C_UINT16,C_POINTER,C_POINTER},C_INT)

public function SDL_GetAudioDeviceFormat(atom id,atom spec,atom samp_frame)
	return c_func(xSDL_GetAudioDeviceFormat,{id,spec,samp_frame})
end function

export constant xSDL_OpenAudioDevice = define_c_func(sdl,"+SDL_OpenAudioDevice",{C_STRING,C_INT,C_POINTER,C_POINTER,C_INT},C_UINT32)

public function SDL_OpenAudioDevice(sequence device,atom iscapture,atom desired,atom obtained,atom allow)
	return c_func(xSDL_OpenAudioDevice,{device,iscapture,desired,obtained,allow})
end function

public enum type SDL_AudioStatus
	SDL_AUDIO_STOPPED = 0,
	SDL_AUDIO_PLAYING,
	SDL_AUDIO_PAUSED
end type

export constant xSDL_GetAudioDeviceStatus = define_c_func(sdl,"+SDL_GetAudioDeviceStatus",{C_UINT32},C_INT)

public function SDL_GetAudioDeviceStatus(atom dev)
	return c_func(xSDL_GetAudioDeviceStatus,{dev})
end function

export constant xSDL_PlayAudioDevice = define_c_func(sdl,"+SDL_PlayAudioDevice",{C_UINT32},C_INT)

public function SDL_PlayAudioDevice(atom dev)
	return c_func(xSDL_PlayAudioDevice,{dev})
end function

export constant xSDL_PauseAudioDevice = define_c_func(sdl,"+SDL_PauseAudioDevice",{C_UINT32},C_INT)

public function SDL_PauseAudioDevice(atom dev)
	return c_func(xSDL_PauseAudioDevice,{dev})
end function

public constant xSDL_ResumeAudioDevice = define_c_func(sdl,"+SDL_ResumeAudioDevice",{C_UINT16},C_INT)

public function SDL_ResumeAudioDevice(atom dev)
	return c_func(xSDL_ResumeAudioDevice,{dev})
end function

public constant xSDL_AudioDevicePaused = define_c_func(sdl,"+SDL_AudioDevicePaused",{C_UINT16},C_BOOL)

public function SDL_AudioDevicePaused(atom dev)
	return c_func(xSDL_AudioDevicePaused,{dev})
end function

export constant xSDL_LoadWAV_RW = define_c_func(sdl,"+SDL_LoadWAV_RW",{C_POINTER,C_INT,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_LoadWAV_RW(atom src,atom freesrc,atom spec,atom audio_buf,atom audio_len)
	return c_func(xSDL_LoadWAV_RW,{src,freesrc,spec,audio_buf,audio_len})
end function

--SDL_AudioStream - typedef struct

export constant xSDL_CreateAudioStream = define_c_func(sdl,"+SDL_CreateAudioStream",{C_UINT16,C_INT,C_INT,C_UINT16,C_INT,C_INT},C_POINTER)

public function SDL_CreateAudioStream(atom src_format,atom src_channels,atom src_rate,atom dst_format,atom dst_channels,atom dst_rate)
	return c_func(xSDL_CreateAudioStream,{src_format,src_channels,src_rate,dst_format,dst_channels,dst_rate})
end function

export constant xSDL_GetAudioStreamFormat = define_c_func(sdl,"+SDL_GetAudioStreamFormat",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetAudioStreamFormat(atom stream,atom src_format,atom src_channels,atom src_rate,atom dst_format,atom dst_channels,atom dst_rate)
	return c_func(xSDL_GetAudioStreamFormat,{stream,src_format,src_channels,src_rate,dst_format,dst_channels,dst_rate})
end function

export constant xSDL_SetAudioStreamFormat = define_c_func(sdl,"+SDL_SetAudioStreamFormat",{C_POINTER,C_UINT16,C_INT,C_INT,C_UINT16,C_INT,C_INT},C_INT)

public function SDL_SetAudioStreamFormat(atom stream,atom src_format,atom src_channels,atom src_rate,atom dst_format,atom dst_channels,atom dst_rate)
	return c_func(xSDL_SetAudioStreamFormat,{stream,src_format,src_channels,src_rate,dst_format,dst_channels,dst_rate})
end function

export constant xSDL_PutAudioStreamData = define_c_func(sdl,"+SDL_PutAudioStreamData",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_PutAudioStreamData(atom stream,object buf,atom len)
	return c_func(xSDL_PutAudioStreamData,{stream,buf,len})
end function

export constant xSDL_GetAudioStreamData = define_c_func(sdl,"+SDL_GetAudioStreamData",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_GetAudioStreamData(atom stream,object buf,atom len)
	return c_func(xSDL_GetAudioStreamData,{stream,buf,len})
end function

export constant xSDL_GetAudioStreamAvailable = define_c_func(sdl,"+SDL_GetAudioStreamAvailable",{C_POINTER},C_INT)

public function SDL_GetAudioStreamAvailable(atom stream)
	return c_func(xSDL_GetAudioStreamAvailable,{stream})
end function

public constant xSDL_GetAudioStreamQueued = define_c_func(sdl,"+SDL_GetAudioStreamQueued",{C_POINTER},C_INT)

public function SDL_GetAudioStreamQueued(atom str)
	return c_func(xSDL_GetAudioStreamQueued,{str})
end function

export constant xSDL_FlushAudioStream = define_c_func(sdl,"+SDL_FlushAudioStream",{C_POINTER},C_INT)

public function SDL_FlushAudioStream(atom stream)
	return c_func(xSDL_FlushAudioStream,{stream})
end function

export constant xSDL_ClearAudioStream = define_c_func(sdl,"+SDL_ClearAudioStream",{C_POINTER},C_INT)

public function SDL_ClearAudioStream(atom stream)
	return c_func(xSDL_ClearAudioStream,{stream})
end function

public constant xSDL_LockAudioStream = define_c_func(sdl,"+SDL_LockAudioStream",{C_POINTER},C_INT)

public function SDL_LockAudioStream(atom str)
	return c_func(xSDL_LockAudioStream,{str})
end function

public constant xSDL_UnlockAudioStream = define_c_func(sdl,"+SDL_UnlockAudioStream",{C_POINTER},C_INT)

public function SDL_UnlockAudioStream(atom str)
	return c_func(xSDL_UnlockAudioStream,{str})
end function

export constant xSDL_DestroyAudioStream = define_c_proc(sdl,"+SDL_DestroyAudioStream",{C_POINTER})

public procedure SDL_DestroyAudioStream(atom stream)
	c_proc(xSDL_DestroyAudioStream,{stream})
end procedure

public constant xSDL_BindAudioStreams = define_c_func(sdl,"+SDL_BindAudioStreams",{C_UINT16,C_POINTER,C_INT},C_INT)

public function SDL_BindAudioStreams(atom id,atom stream,atom num)
	return c_func(xSDL_BindAudioStreams,{id,stream,num})
end function

public constant xSDL_BindAudioStream = define_c_func(sdl,"+SDL_BindAudioStream",{C_UINT16,C_POINTER},C_INT)

public function SDL_BindAudioStream(atom id,atom stream)
	return c_func(xSDL_BindAudioStream,{id,stream})
end function

public constant xSDL_UnbindAudioStreams = define_c_proc(sdl,"+SDL_UnbindAudioStreams",{C_POINTER,C_INT})

public procedure SDL_UnbindAudioStreams(atom streams,atom num)
	c_proc(xSDL_UnbindAudioStreams,{streams,num})
end procedure

public constant xSDL_UnbindAudioStream = define_c_proc(sdl,"+SDL_UnbindAudioStream",{C_POINTER})

public procedure SDL_UnbindAudioStream(atom str)
	c_proc(xSDL_UnbindAudioStream,{str})
end procedure

public constant xSDL_GetAudioStreamDevices = define_c_func(sdl,"+SDL_GetAudioStreamDevices",{C_POINTER},C_UINT16)

public function SDL_GetAudioStreamDevices(atom str)
	return c_func(xSDL_GetAudioStreamDevices,{str})
end function

public constant xSDL_GetAudioStreamFrequencyRatio = define_c_func(sdl,"+SDL_GetAudioStreamFrequencyRatio",{C_POINTER},C_FLOAT)

public function SDL_GetAudioStreamFrequencyRatio(atom str)
	return c_func(xSDL_GetAudioStreamFrequencyRatio,{str})
end function

public constant xSDL_SetAudioStreamFrequencyRatio = define_c_func(sdl,"+SDL_SetAudioStreamFrequencyRatio",{C_POINTER,C_FLOAT},C_INT)

public function SDL_SetAudioStreamFrequencyRatio(atom str,atom ratio)
	return c_func(xSDL_SetAudioStreamFrequencyRatio,{str,ratio})
end function

public constant SDL_MIX_MAXVOLUME = 128

export constant xSDL_MixAudioFormat = define_c_func(sdl,"+SDL_MixAudioFormat",{C_POINTER,C_POINTER,C_UINT16,C_UINT32,C_INT},C_INT)

public function SDL_MixAudioFormat(atom dst,atom src,atom format,atom len,atom volume)
	return c_func(xSDL_MixAudioFormat,{dst,src,format,len,volume})
end function

export constant xSDL_QueueAudio = define_c_func(sdl,"+SDL_QueueAudio",{C_UINT32,C_POINTER,C_UINT32},C_INT)

public function SDL_QueueAudio(atom dev,object data,atom len)
	return c_func(xSDL_QueueAudio,{dev,data,len})
end function

export constant xSDL_DequeueAudio = define_c_func(sdl,"+SDL_DequeueAudio",{C_UINT32,C_POINTER,C_UINT32},C_UINT32)

public function SDL_DequeueAudio(atom dev,object data,atom len)
	return c_func(xSDL_DequeueAudio,{dev,data,len})
end function

export constant xSDL_GetQueuedAudioSize = define_c_func(sdl,"+SDL_GetQueuedAudioSize",{C_UINT32},C_UINT32)

public function SDL_GetQueuedAudioSize(atom dev)
	return c_func(xSDL_GetQueuedAudioSize,{dev})
end function

export constant xSDL_ClearQueuedAudio = define_c_func(sdl,"+SDL_ClearQueuedAudio",{C_UINT32},C_INT)

public function SDL_ClearQueuedAudio(atom dev)
	return c_func(xSDL_ClearQueuedAudio,{dev})
end function

export constant xSDL_LockAudioDevice = define_c_func(sdl,"+SDL_LockAudioDevice",{C_UINT32},C_INT)

public function SDL_LockAudioDevice(atom dev)
	return c_func(xSDL_LockAudioDevice,{dev})
end function

export constant xSDL_UnlockAudioDevice = define_c_proc(sdl,"+SDL_UnlockAudioDevice",{C_UINT32})

public procedure SDL_UnlockAudioDevice(atom dev)
	c_proc(xSDL_UnlockAudioDevice,{dev})
end procedure

export constant xSDL_CloseAudioDevice = define_c_proc(sdl,"+SDL_CloseAudioDevice",{C_UINT32})

public procedure SDL_CloseAudioDevice(atom dev)
	c_proc(xSDL_CloseAudioDevice,{dev})
end procedure

export constant xSDL_ConvertAudioSamples = define_c_func(sdl,"+SDL_ConvertAudioSamples",{C_UINT16,C_UINT8,C_INT,C_POINTER,C_INT,C_UINT16,C_UINT8,C_INT,C_POINTER,C_POINTER},C_INT)

public function SDL_ConvertAudioSamples(atom src_format,atom src_channels,atom src_rate,atom src_data,atom src_len,atom dst_format,atom dst_channels,atom dst_rate,atom dst_data,atom dst_len)
	return c_func(xSDL_ConvertAudioSamples,{src_format,src_channels,src_rate,src_data,src_len,dst_format,dst_channels,dst_rate,dst_data,dst_len})
end function

public constant xSDL_GetSilenceValueForFormat = define_c_func(sdl,"+SDL_GetSilenceValueForFormat",{SDL_AudioFormat},C_INT)

public function SDL_GetSilenceValueForFormat(sequence mat)
	return c_func(xSDL_GetSilenceValueForFormat,{mat})
end function

public constant xSDL_OpenAudioDeviceStream = define_c_func(sdl,"+SDL_OpenAudioDeviceStream",{C_UINT16,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_OpenAudioDeviceStream(atom id,atom spec,atom cb,atom ud)
	return c_func(xSDL_OpenAudioDeviceStream,{id,spec,cb,ud})
end function
­13.31
