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

--public constant SDL_AudioFormat = C_UINT16

public constant SDL_AUDIO_MASK_BITSIZE = 0xFF
public constant SDL_AUDIO_MASK_FLOAT = shift_bits(1,-8)
public constant SDL_AUDIO_MASK_BIG_ENDIAN = shift_bits(1,-12)
public constant SDL_AUDIO_MASK_SIGNED = shift_bits(1,-15)

public enum type SDL_AudioFormat
	SDL_AUDIO_UNKNOWN = 0x0000,
	SDL_AUDIO_U8 = 0x0008,
	SDL_AUDIO_S8 = 0x8008,
	SDL_AUDIO_S16LE = 0x8010,
	SDL_AUDIO_S16BE = 0x9010,
	SDL_AUDIO_S32LE = 0x8020,
	SDL_AUDIO_S32BE = 0x9020,
	SDL_AUDIO_F32LE = 0x8120,
	SDL_AUDIO_F32BE = 0x9120
end type

public constant SDL_AUDIO_BITSIZE = SDL_AUDIO_MASK_BITSIZE

public constant SDL_AUDIO_BYTESIZE = SDL_AUDIO_BITSIZE / 8

public constant SDL_AUDIO_ISFLOAT = SDL_AUDIO_MASK_FLOAT

public constant SDL_AUDIO_ISBIGENDIAN = SDL_AUDIO_MASK_BIG_ENDIAN

public constant SDL_AUDIO_ISLITTLEENDIAN = not SDL_AUDIO_ISBIGENDIAN

public constant SDL_AUDIO_ISSIGNED = SDL_AUDIO_MASK_SIGNED

public constant SDL_AUDIO_ISINT = not SDL_AUDIO_ISFLOAT

public constant SDL_AUDIO_ISUNSIGNED = not SDL_AUDIO_ISSIGNED


public constant SDL_AudioDeviceID = C_UINT32

public constant SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK = 0xFFFFFFFF

public constant SDL_AUDIO_DEVICE_DEFAULT_RECORDING = 0xFFFFFFFE

public constant SDL_AudioSpec = define_c_struct({
	C_INT, --format SDL_AudioFormat
	C_INT, --channels
	C_INT  --freq
})

public constant SDL_AUDIO_FRAMESIZE = SDL_AUDIO_BYTESIZE

public constant SDL_AudioStream = C_POINTER

public constant xSDL_GetNumAudioDrivers = define_c_func(sdl,"+SDL_GetNumAudioDrivers",{},C_INT)

public function SDL_GetNumAudioDrivers()
	return c_func(xSDL_GetNumAudioDrivers,{})
end function

public constant xSDL_GetAudioDriver = define_c_func(sdl,"+SDL_GetAudioDriver",{C_INT},C_STRING)

public function SDL_GetAudioDriver(atom index)
	return c_func(xSDL_GetAudioDriver,{index})
end function

public constant xSDL_GetCurrentAudioDriver = define_c_func(sdl,"+SDL_GetCurrentAudioDriver",{},C_STRING)

public function SDL_GetCurrentAudioDriver()
	return c_func(xSDL_GetCurrentAudioDriver,{})
end function

public constant xSDL_GetAudioPlaybackDevices = define_c_func(sdl,"+SDL_GetAudioPlaybackDevices",{C_POINTER},C_POINTER)

public function SDL_GetAudioPlaybackDevices(atom count)
	return c_func(xSDL_GetAudioPlaybackDevices,{count})
end function

public constant xSDL_GetAudioRecordingDevices = define_c_func(sdl,"+SDL_GetAudioRecordingDevices",{C_POINTER},C_POINTER)

public function SDL_GetAudioRecordingDevices(atom count)
	return c_func(xSDL_GetAudioRecordingDevices,{count})
end function

public constant xSDL_GetAudioDeviceName = define_c_func(sdl,"+SDL_GetAudioDeviceName",{SDL_AudioDeviceID},C_STRING)

public function SDL_GetAudioDeviceName(atom devid)
	return c_func(xSDL_GetAudioDeviceName,{devid})
end function

public constant xSDL_GetAudioDeviceFormat = define_c_func(sdl,"+SDL_GetAudioDeviceFormat",{SDL_AudioDeviceID,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetAudioDeviceFormat(atom devid,atom spec,atom sample_frames)
	return c_func(xSDL_GetAudioDeviceFormat,{devid,spec,sample_frames})
end function

public constant xSDL_GetAudioDeviceChannelMap = define_c_func(sdl,"+SDL_GetAudioDeviceChannelMap",{SDL_AudioDeviceID,C_POINTER},C_POINTER)

public function SDL_GetAudioDeviceChannelMap(atom devid,atom count)
	return c_func(xSDL_GetAudioDeviceChannelMap,{devid,count})
end function

public constant xSDL_OpenAudioDevice = define_c_func(sdl,"+SDL_OpenAudioDevice",{SDL_AudioDeviceID,C_POINTER},SDL_AudioDeviceID)

public function SDL_OpenAudioDevice(atom devid,atom spec)
	return c_func(xSDL_OpenAudioDevice,{devid,spec})
end function

public constant xSDL_PauseAudioDevice = define_c_func(sdl,"+SDL_PauseAudioDevice",{SDL_AudioDeviceID},C_BOOL)

public function SDL_PauseAudioDevice(atom dev)
	return c_func(xSDL_PauseAudioDevice,{dev})
end function

public constant xSDL_ResumeAudioDevice = define_c_func(sdl,"+SDL_ResumeAudioDevice",{SDL_AudioDeviceID},C_BOOL)

public function SDL_ResumeAudioDevice(atom dev)
	return c_func(xSDL_ResumeAudioDevice,{dev})
end function

public constant xSDL_AudioDevicePaused = define_c_func(sdl,"+SDL_AudioDevicePaused",{SDL_AudioDeviceID},C_BOOL)

public function SDL_AudioDevicePaused(atom dev)
	return c_func(xSDL_AudioDevicePaused,{dev})
end function

public constant xSDL_GetAudioDeviceGain = define_c_func(sdl,"+SDL_GetAudioDeviceGain",{SDL_AudioDeviceID},C_FLOAT)

public function SDL_GetAudioDeviceGain(atom devid)
	return c_func(xSDL_GetAudioDeviceGain,{devid})
end function

public constant xSDL_SetAudioDeviceGain = define_c_func(sdl,"+SDL_SetAudioDeviceGain",{SDL_AudioDeviceID,C_FLOAT},C_BOOL)

public function SDL_SetAudioDeviceGain(atom devid,atom gain)
	return c_func(xSDL_SetAudioDeviceGain,{devid,gain})
end function

public constant xSDL_CloseAudioDevice = define_c_proc(sdl,"+SDL_CloseAudioDevice",{SDL_AudioDeviceID})

public procedure SDL_CloseAudioDevice(atom devid)
	c_proc(xSDL_CloseAudioDevice,{devid})
end procedure

public constant xSDL_BindAudioStreams = define_c_func(sdl,"+SDL_BindAudioStreams",{SDL_AudioDeviceID,C_POINTER,C_INT},C_BOOL)

public function SDL_BindAudioStreams(atom devid,atom streams,atom num_streams)
	return c_func(xSDL_BindAudioStreams,{devid,streams,num_streams})
end function

public constant xSDL_BindAudioStream = define_c_func(sdl,"+SDL_BindAudioStream",{SDL_AudioDeviceID,C_POINTER},C_BOOL)

public function SDL_BindAudioStream(atom devid,atom stream)
	return c_func(xSDL_BindAudioStream,{devid,stream})
end function

public constant xSDL_UnbindAudioStreams = define_c_proc(sdl,"+SDL_UnbindAudioStreams",{C_POINTER,C_INT})

public procedure SDL_UnbindAudioStreams(atom streams,atom num_streams)
	c_proc(xSDL_UnbindAudioStreams,{streams,num_streams})
end procedure

public constant xSDL_UnbindAudioStream = define_c_proc(sdl,"+SDL_UnbindAudioStream",{C_POINTER})

public procedure SDL_UnbindAudioStream(atom stream)
	c_proc(xSDL_UnbindAudioStream,{stream})
end procedure

public constant xSDL_GetAudioStreamDevice = define_c_func(sdl,"+SDL_GetAudioStreamDevice",{C_POINTER},SDL_AudioDeviceID)

public function SDL_GetAudioStreamDevice(atom stream)
	return c_func(xSDL_GetAudioStreamDevice,{stream})
end function

public constant xSDL_CreateAudioStream = define_c_func(sdl,"+SDL_CreateAudioStream",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateAudioStream(atom src_spec,atom dst_spec)
	return c_func(xSDL_CreateAudioStream,{src_spec,dst_spec})
end function

public constant xSDL_GetAudioStreamProperties = define_c_func(sdl,"+SDL_GetAudioStreamProperties",{C_POINTER},C_UINT32)

public function SDL_GetAudioStreamProperties(atom stream)
	return c_func(xSDL_GetAudioStreamProperties,{stream})
end function

public constant xSDL_GetAudioStreamFormat = define_c_func(sdl,"+SDL_GetAudioStreamFormat",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetAudioStreamFormat(atom stream,atom src_spec,atom dst_spec)
	return c_func(xSDL_GetAudioStreamFormat,{stream,src_spec,dst_spec})
end function

public constant xSDL_SetAudioStreamFormat = define_c_func(sdl,"+SDL_SetAudioStreamFormat",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetAudioStreamFormat(atom stream,atom src_spec,atom dst_spec)
	return c_func(xSDL_SetAudioStreamFormat,{stream,src_spec,dst_spec})
end function

public constant xSDL_GetAudioStreamFrequencyRatio = define_c_func(sdl,"+SDL_GetAudioStreamFrequencyRatio",{C_POINTER},C_FLOAT)

public function SDL_GetAudioStreamFrequencyRatio(atom stream)
	return c_func(xSDL_GetAudioStreamFrequencyRatio,{stream})
end function

public constant xSDL_SetAudioStreamFrequencyRatio = define_c_func(sdl,"+SDL_SetAudioStreamFrequencyRatio",{C_POINTER,C_FLOAT},C_BOOL)

public function SDL_SetAudioStreamFrequencyRatio(atom stream,atom ratio)
	return c_func(xSDL_SetAudioStreamFrequencyRatio,{stream,ratio})
end function

public constant xSDL_GetAudioStreamGain = define_c_func(sdl,"+SDL_GetAudioStreamGain",{C_POINTER},C_FLOAT)

public function SDL_GetAudioStreamGain(atom stream)
	return c_func(xSDL_GetAudioStreamGain,{stream})
end function

public constant xSDL_SetAudioStreamGain = define_c_func(sdl,"+SDL_SetAudioStreamGain",{C_POINTER,C_FLOAT},C_BOOL)

public function SDL_SetAudioStreamGain(atom stream,atom gain)
	return c_func(xSDL_SetAudioStreamGain,{stream,gain})
end function

public constant xSDL_GetAudioStreamInputChannelMap = define_c_func(sdl,"+SDL_GetAudioStreamInputChannelMap",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetAudioStreamInputChannelMap(atom stream,atom count)
	return c_func(xSDL_GetAudioStreamInputChannelMap,{stream,count})
end function

public constant xSDL_GetAudioStreamOutputChannelMap = define_c_func(sdl,"+SDL_GetAudioStreamOutputChannelMap",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetAudioStreamOutputChannelMap(atom stream,atom count)
	return c_func(xSDL_GetAudioStreamOutputChannelMap,{stream,count})
end function

public constant xSDL_SetAudioStreamInputChannelMap = define_c_func(sdl,"+SDL_SetAudioStreamInputChannelMap",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_SetAudioStreamInputChannelMap(atom stream,atom chmap,atom count)
	return c_func(xSDL_SetAudioStreamInputChannelMap,{stream,chmap,count})
end function

public constant xSDL_SetAudioStreamOutputChannelMap = define_c_func(sdl,"+SDL_SetAudioStreamOutputChannelMap",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_SetAudioStreamOutputChannelMap(atom stream,atom chmap,atom count)
	return c_func(xSDL_SetAudioStreamOutputChannelMap,{stream,chmap,count})
end function

public constant xSDL_PutAudioStreamData = define_c_func(sdl,"+SDL_PutAudioStreamData",{C_POINTER,C_POINTER,C_INT},C_BOOL)

public function SDL_PutAudioStreamData(atom stream,object buf,atom len)
	return c_func(xSDL_PutAudioStreamData,{stream,buf,len})
end function

public constant xSDL_GetAudioStreamData = define_c_func(sdl,"+SDL_GetAudioStreamData",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_GetAudioStreamData(atom stream,object buf,atom len)
	return c_func(xSDL_GetAudioStreamData,{stream,buf,len})
end function

public constant xSDL_GetAudioStreamAvailable = define_c_func(sdl,"+SDL_GetAudioStreamAvailable",{C_POINTER},C_INT)

public function SDL_GetAudioStreamAvailable(atom stream)
	return c_func(xSDL_GetAudioStreamAvailable,{stream})
end function

public constant xSDL_GetAudioStreamQueued = define_c_func(sdl,"+SDL_GetAudioStreamQueued",{C_POINTER},C_INT)

public function SDL_GetAudioStreamQueued(atom stream)
	return c_func(xSDL_GetAudioStreamQueued,{stream})
end function

public constant xSDL_FlushAudioStream = define_c_func(sdl,"+SDL_FlushAudioStream",{C_POINTER},C_BOOL)

public function SDL_FlushAudioStream(atom stream)
	return c_func(xSDL_FlushAudioStream,{stream})
end function

public constant xSDL_ClearAudioStream = define_c_func(sdl,"+SDL_ClearAudioStream",{C_POINTER},C_BOOL)

public function SDL_ClearAudioStream(atom stream)
	return c_func(xSDL_ClearAudioStream,{stream})
end function

public constant xSDL_PauseAudioStreamDevice = define_c_func(sdl,"+SDL_PauseAudioStreamDevice",{C_POINTER},C_BOOL)

public function SDL_PauseAudioStreamDevice(atom stream)
	return c_func(xSDL_PauseAudioStreamDevice,{stream})
end function

public constant xSDL_ResumeAudioStreamDevice = define_c_func(sdl,"+SDL_ResumeAudioStreamDevice",{C_POINTER},C_BOOL)

public function SDL_ResumeAudioStreamDevice(atom stream)
	return c_func(xSDL_ResumeAudioStreamDevice,{stream})
end function

public constant xSDL_LockAudioStream = define_c_func(sdl,"+SDL_LockAudioStream",{C_POINTER},C_BOOL)

public function SDL_LockAudioStream(atom stream)
	return c_func(xSDL_LockAudioStream,{stream})
end function

public constant xSDL_UnlockAudioStream = define_c_func(sdl,"+SDL_UnlockAudioStream",{C_POINTER},C_BOOL)

public function SDL_UnlockAudioStream(atom stream)
	return c_func(xSDL_UnlockAudioStream,{stream})
end function

--TODO: SDL_AudioStreamCallback

public constant xSDL_SetAudioStreamGetCallback = define_c_func(sdl,"+SDL_SetAudioStreamGetCallback",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetAudioStreamGetCallback(atom stream,atom cb,object userdata)
	return c_func(xSDL_SetAudioStreamGetCallback,{stream,cb,userdata})
end function

public constant xSDL_SetAudioStreamPutCallback = define_c_func(sdl,"+SDL_SetAudioStreamPutCallback",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetAudioStreamPutCallback(atom stream,atom cb,object userdata)
	return c_func(xSDL_SetAudioStreamPutCallback,{stream,cb,userdata})
end function

public constant xSDL_DestroyAudioStream = define_c_proc(sdl,"+SDL_DestroyAudioStream",{C_POINTER})

public procedure SDL_DestroyAudioStream(atom stream)
	c_proc(xSDL_DestroyAudioStream,{stream})
end procedure

public constant xSDL_OpenAudioDeviceStream = define_c_func(sdl,"+SDL_OpenAudioDeviceStream",{SDL_AudioDeviceID,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_OpenAudioDeviceStream(atom devid,atom spec,atom cb,object userdata)
	return c_func(xSDL_OpenAudioDeviceStream,{devid,spec,cb,userdata})
end function

--TODO: AudioPostmixCallback

public constant xSDL_SetAudioPostmixCallback = define_c_func(sdl,"+SDL_SetAudioPostmixCallback",{SDL_AudioDeviceID,C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetAudioPostmixCallback(atom devid,atom cb,object userdata)
	return c_func(xSDL_SetAudioPostmixCallback,{devid,cb,userdata})
end function

public constant xSDL_LoadWAV_IO = define_c_func(sdl,"+SDL_LoadWAV_IO",{C_POINTER,C_BOOL,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_LoadWAV_IO(atom src,atom closeio,atom spec,atom audio_buf,atom audio_len)
	return c_func(xSDL_LoadWAV_IO,{src,closeio,spec,audio_buf,audio_len})
end function

public constant xSDL_LoadWAV = define_c_func(sdl,"+SDL_LoadWAV",{C_STRING,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_LoadWAV(sequence path,atom spec,atom audio_buf,atom audio_len)
	return c_func(xSDL_LoadWAV,{path,spec,audio_buf,audio_len})
end function

public constant xSDL_MixAudio = define_c_func(sdl,"+SDL_MixAudio",{C_POINTER,C_POINTER,C_INT,C_UINT32,C_FLOAT},C_BOOL)

public function SDL_MixAudio(atom dst,atom src,atom format,atom len,atom volume)
	return c_func(xSDL_MixAudio,{dst,src,format,len,volume})
end function

public constant xSDL_ConvertAudioSamples = define_c_func(sdl,"+SDL_ConvertAudioSamples",{C_POINTER,C_POINTER,C_INT,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_ConvertAudioSamples(atom src_spec,atom src_data,atom src_len,atom dst_spec,atom dst_data,atom dst_len)
	return c_func(xSDL_ConvertAudioSamples,{src_spec,src_data,src_len,dst_spec,dst_data,dst_len})
end function

public constant xSDL_GetAudioFormatName = define_c_func(sdl,"+SDL_GetAudioFormatName",{C_INT},C_STRING)

public function SDL_GetAudioFormatName(atom format)
   return c_func(xSDL_GetAudioFormatName,{format})
end function

public constant xSDL_GetSilenceValueForFormat = define_c_func(sdl,"+SDL_GetSilenceValueForFormat",{C_INT},C_INT)

public function SDL_GetSilenceValueForFormat(atom format)
	return c_func(xSDL_GetSilenceValueForFormat,{format})
end function

public constant xSDL_IsAudioDevicePhysical = define_c_func(sdl,"+SDL_IsAudioDevicePhysical",{C_UINT32},C_BOOL)

public function SDL_IsAudioDevicePhysical(atom devid)
	return c_func(xSDL_IsAudioDevicePhysical,{devid})
end function

public constant xSDL_IsAudioDevicePlayback = define_c_func(sdl,"+SDL_IsAudioDevicePlayback",{C_UINT32},C_BOOL)

public function SDL_IsAudioDevicePlayback(atom devid)
	return c_func(xSDL_IsAudioDevicePlayback,{devid})
end function
­398.50