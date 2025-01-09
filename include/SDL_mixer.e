--EuSDLMixer3
--Written by Andy P.
--Copyright(c) 2024

include std/ffi.e
include std/machine.e
include std/os.e

include SDL3.e

public atom mix = 0

ifdef WINDOWS then
	mix = open_dll("SDL3_mixer.dll")
	elsifdef LINUX or FREEBSD then
	mix = open_dll("libSDL3_mixer.so")
end ifdef

public constant SDL_MIXER_MAJOR_VERSION = 3,
				SDL_MIXER_MINOR_VERSION = 0,
				SDL_MIXER_PATCHLEVEL = 0
				
public constant xMix_Linked_Version = define_c_func(mix,"+Mix_Linked_Version",{},C_POINTER)

public function Mix_Linked_Version()
	return c_func(xMix_Linked_Version,{})
end function

public enum type MIX_InitFlags
	MIX_INIT_FLAG = 0x00000001,
	MIX_INIT_MOD = 0x00000002,
	MIX_INIT_MP3 = 0x00000008,
	MIX_INIT_OGG = 0x00000010,
	MIX_INIT_MID = 0x00000020,
	MIX_INIT_OPUS = 0x00000040,
	MIX_INIT_WAVPACK = 0x00000080
end type

public constant xMix_Init = define_c_func(mix,"+Mix_Init",{C_INT},C_INT)

public function Mix_Init(atom flags)
	return c_func(xMix_Init,{flags})
end function

public constant xMix_Quit = define_c_proc(mix,"+Mix_Quit",{})

public procedure Mix_Quit()
	c_proc(xMix_Quit,{})
end procedure

public constant MIX_CHANNELS = 8

public constant MIX_DEFAULT_FREQUENCY = 44100,
				MIX_DEFAULT_FORMAT = SDL_AUDIO_S16,
				MIX_DEFAULT_CHANNELS = 2,
				MIX_MAX_VOLUME = SDL_MIX_MAXVOLUME
				
public constant Mix_Chunk = define_c_struct({
	C_INT, --allocated
	C_POINTER, --abuf
	C_UINT32, --alen
	C_UINT8 --volume
})

public enum type Mix_Fading
	MIX_NO_FADING = 0,
	MIX_FADING_OUT,
	MIX_FADING_IN
end type

public enum type Mix_MusicType
	MUS_NONE = 0,
	MUS_CMD,
	MUS_WAV,
	MUS_MOD,
	MUS_MID,
	MUS_OGG,
	MUS_MP3,
	MUS_MP3_MAD_UNUSED,
	MUS_FLAC,
	MUS_MODPLUG_UNUSED,
	MUS_OPUS,
	MUS_WAVPACK,
	MUS_GME
end type

public constant xMix_OpenAudio = define_c_func(mix,"+Mix_OpenAudio",{C_UINT32,C_POINTER},C_INT)

public function Mix_OpenAudio(atom devid,atom spec)
	return c_func(xMix_OpenAudio,{devid,spec})
end function

public constant xMix_PauseAudio = define_c_proc(mix,"+Mix_PauseAudio",{C_INT})

public procedure Mix_PauseAudio(atom pause)
	c_proc(xMix_PauseAudio,{pause})
end procedure

public constant xMix_QuerySpec = define_c_func(mix,"+Mix_QuerySpec",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function Mix_QuerySpec(atom freq,atom format,atom chan)
	return c_func(xMix_QuerySpec,{freq,format,chan})
end function

public constant xMix_AllocateChannels = define_c_func(mix,"+Mix_AllocateChannels",{C_INT},C_INT)

public function Mix_AllocateChannels(atom num)
	return c_func(xMix_AllocateChannels,{num})
end function

public constant xMix_LoadWAV_IO = define_c_func(mix,"+Mix_LoadWAV_IO",{C_POINTER,C_BOOL},C_POINTER)

public function Mix_LoadWAV_IO(atom src,atom fs)
	return c_func(xMix_LoadWAV_IO,{src,fs})
end function

public constant xMix_LoadWAV = define_c_func(mix,"+Mix_LoadWAV",{C_STRING},C_POINTER)

public function Mix_LoadWAV(sequence file)
	return Mix_LoadWAV_IO(SDL_IOFromFile(file,"rb"),1)
end function

public constant xMix_LoadMUS_IO = define_c_func(mix,"+Mix_LoadMUS_IO",{C_POINTER,C_BOOL},C_POINTER)

public function Mix_LoadMUS_IO(atom src,atom fs)
	return c_func(xMix_LoadMUS_IO,{src,fs})
end function

public constant xMix_LoadMUS = define_c_func(mix,"+Mix_LoadMUS",{C_STRING},C_POINTER)

public function Mix_LoadMUS(sequence file)
	return Mix_LoadMUS_IO(SDL_IOFromFile(file,"rb"),1)
end function

public constant xMix_LoadMUSType_IO = define_c_func(mix,"+Mix_LoadMUSType_IO",{C_POINTER,C_INT,C_BOOL},C_POINTER)

public function Mix_LoadMUSType_IO(atom src,Mix_MusicType t,atom fs)
	return c_func(xMix_LoadMUSType_IO,{src,t,fs})
end function

public constant xMix_QuickLoad_WAV = define_c_func(mix,"+Mix_QuickLoad_WAV",{C_POINTER},C_POINTER)

public function Mix_QuickLoad_WAV(atom mem)
	return c_func(xMix_QuickLoad_WAV,{mem})
end function

public constant xMix_QuickLoad_RAW = define_c_func(mix,"+Mix_QuickLoad_RAW",{C_POINTER,C_UINT32},C_POINTER)

public function Mix_QuickLoad_RAW(atom mem,atom len)
	return c_func(xMix_QuickLoad_RAW,{mem,len})
end function

public constant xMix_FreeChunk = define_c_proc(mix,"+Mix_FreeChunk",{C_POINTER})

public procedure Mix_FreeChunk(atom chunk)
	c_proc(xMix_FreeChunk,{chunk})
end procedure

public constant xMix_FreeMusic = define_c_proc(mix,"+Mix_FreeMusic",{C_POINTER})

public procedure Mix_FreeMusic(atom mus)
	c_proc(xMix_FreeMusic,{mus})
end procedure

public constant xMix_GetNumChunkDecoders = define_c_func(mix,"+Mix_GetNumChunkDecoders",{},C_INT)

public function Mix_GetNumChunkDeocders()
	return c_func(xMix_GetNumChunkDecoders,{})
end function

public constant xMix_GetChunkDecoder = define_c_func(mix,"+Mix_GetChunkDecoder",{C_INT},C_STRING)

public function Mix_GetChunkDecoder(atom idx)
	return c_func(xMix_GetChunkDecoder,{idx})
end function

public constant xMix_HasChunkDecoder = define_c_func(mix,"+Mix_HasChunkDecoder",{C_STRING},C_BOOL)

public function Mix_HasChunkDecoder(sequence name)
	return c_func(xMix_HasChunkDecoder,{name})
end function

public constant xMix_GetNumMusicDecoders = define_c_func(mix,"+Mix_GetNumMusicDeoders",{},C_INT)

public function Mix_GetNumMusicDecoders()
	return c_func(xMix_GetNumMusicDecoders,{})
end function

public constant xMix_GetMusicDecoder = define_c_func(mix,"+Mix_GetMusicDecoder",{C_INT},C_STRING)

public function Mix_GetMusicDecoder(atom idx)
	return c_func(xMix_GetMusicDecoder,{idx})
end function

public constant xMix_HasMusicDecoder = define_c_func(mix,"+Mix_HasMusicDecoder",{C_STRING},C_BOOL)

public function Mix_HasMusicDecoder(sequence name)
	return c_func(xMix_HasMusicDecoder,{name})
end function

public constant xMix_GetMusicType = define_c_func(mix,"+Mix_GetMusicType",{C_POINTER},C_INT)

public function Mix_GetMusicType(atom mus)
	return c_func(xMix_GetMusicType,{mus})
end function

public constant xMix_GetMusicTitle = define_c_func(mix,"+Mix_GetMusicTitle",{C_POINTER},C_STRING)

public function Mix_GetMusicTitle(atom mus)
	return c_func(xMix_GetMusicTitle,{mus})
end function

public constant xMix_GetMusicTitleTag = define_c_func(mix,"+Mix_GetMusicTitleTag",{C_POINTER},C_STRING)

public function Mix_GetMusicTitleTag(atom mus)
	return c_func(xMix_GetMusicTitleTag,{mus})
end function

public constant xMix_GetMusicArtistTag = define_c_func(mix,"+Mix_GetMusicArtistTag",{C_POINTER},C_STRING)

public function Mix_GetMusicArtistTag(atom mus)
	return c_func(xMix_GetMusicArtistTag,{mus})
end function

public constant xMix_GetMusicAlbumTag = define_c_func(mix,"+Mix_GetMusicAlbumTag",{C_POINTER},C_STRING)

public function Mix_GetMusicAlbumTag(atom mus)
	return c_func(xMix_GetMusicAlbumTag,{mus})
end function

public constant xMix_GetMusicCopyrightTag = define_c_func(mix,"+Mix_GetMusicCopyrightTag",{C_POINTER},C_STRING)

public function Mix_GetMusicCopyrightTag(atom mus)
	return c_func(xMix_GetMusicCopyrightTag,{mus})
end function

public constant xMix_SetPostMix = define_c_proc(mix,"+Mix_SetPostMix",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER})

public procedure Mix_SetPostMix(atom func,atom udata,atom str,atom len,atom arg)
	c_proc(xMix_SetPostMix,{func,udata,str,len,arg})
end procedure

public constant xMix_HookMusic = define_c_proc(mix,"+Mix_HookMusic",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER})

public procedure Mix_HookMusic(atom func,atom udata,atom str,atom len,atom arg)
	c_proc(xMix_HookMusic,{func,udata,str,len,arg})
end procedure

public constant xMix_HookMusicFinished = define_c_proc(mix,"+Mix_HookMusicFinished",{C_POINTER})

public procedure Mix_HookMusicFinished(atom fin)
	c_proc(xMix_HookMusicFinished,{fin})
end procedure

public constant xMix_GetMusicHookData = define_c_func(mix,"+Mix_GetMusicHookData",{},C_POINTER)

public function Mix_GetMusicHookData()
	return c_func(xMix_GetMusicHookData,{})
end function

public constant xMix_ChannelFinished = define_c_proc(mix,"+Mix_ChannelFinished",{C_POINTER,C_INT})

public procedure Mix_ChannelFinished(atom fin,atom chan)
	c_proc(xMix_ChannelFinished,{fin,chan})
end procedure

public constant MIX_CHANNEL_POST = -2

public constant xMix_RegisterEffect = define_c_func(mix,"+Mix_RegisterEffect",{C_INT,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function Mix_RegisterEffect(atom chan,atom f,atom d,atom arg)
	return c_func(xMix_RegisterEffect,{chan,f,d,arg})
end function

public constant xMix_UnregisterEffect = define_c_func(mix,"+Mix_UnregisterEfect",{C_INT,C_POINTER},C_INT)

public function Mix_UnregisterEffect(atom chan,atom f)
	return c_func(xMix_UnregisterEffect,{chan,f})
end function

public constant xMix_UnregisterAllEffects = define_c_func(mix,"+Mix_UnregisterAllEffects",{C_INT},C_INT)

public function Mix_UnregisterAllEffects(atom chan)
	return c_func(xMix_UnregisterAllEffects,{chan})
end function

public constant MIX_EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"

public constant xMix_SetPanning = define_c_func(mix,"+Mix_SetPanning",{C_INT,C_UINT8,C_UINT8},C_INT)

public function Mix_SetPanning(atom chan,atom l,atom r)
	return c_func(xMix_SetPanning,{chan,l,r})
end function

public constant xMix_SetPosition = define_c_func(mix,"+Mix_SetPosition",{C_INT,C_INT16,C_UINT8},C_INT)

public function Mix_SetPosition(atom chan,atom angle,atom dist)
	return c_func(xMix_SetPosition,{chan,angle,dist})
end function

public constant xMix_SetDistance = define_c_func(mix,"+Mix_SetDistance",{C_INT,C_UINT8},C_INT)

public function Mix_SetDistance(atom chan,atom dist)
	return c_func(xMix_SetDistance,{chan,dist})
end function

public constant xMix_SetReverseStereo = define_c_func(mix,"+Mix_SetReverseStereo",{C_INT,C_INT},C_INT)

public function Mix_SetReverseStereo(atom chan,atom flip)
	return c_func(xMix_SetReverseStereo,{chan,flip})
end function

public constant xMix_ReserveChannels = define_c_func(mix,"+Mix_ReserveChannels",{C_INT},C_INT)

public function Mix_ReserveChannels(atom num)
	return c_func(xMix_ReserveChannels,{num})
end function

public constant xMix_GroupChannel = define_c_func(mix,"+Mix_GroupChannel",{C_INT,C_INT},C_INT)

public function Mix_GroupChannel(atom which,atom tag)
	return c_func(xMix_GroupChannel,{which,tag})
end function

public constant xMix_GroupChannels = define_c_func(mix,"+Mix_GroupChannels",{C_INT,C_INT,C_INT},C_INT)

public function Mix_GroupChannels(atom fr,atom t,atom tag)
	return c_func(xMix_GroupChannels,{fr,t,tag})
end function

public constant xMix_GroupAvailable = define_c_func(mix,"+Mix_GroupAvailable",{C_INT},C_INT)

public function Mix_GroupAvailable(atom tag)
	return c_func(xMix_GroupAvailable,{tag})
end function

public constant xMix_GroupCount = define_c_func(mix,"+Mix_GroupCount",{C_INT},C_INT)

public function Mix_GroupCount(atom tag)
	return c_func(xMix_GroupCount,{tag})
end function

public constant xMix_GroupOldest = define_c_func(mix,"+Mix_GroupOldest",{C_INT},C_INT)

public function Mix_GroupOldest(atom tag)
	return c_func(xMix_GroupOldest,{tag})
end function

public constant xMix_GroupNewer = define_c_func(mix,"+Mix_GroupNewer",{C_INT},C_INT)

public function Mix_GroupNewer(atom tag)
	return c_func(xMix_GroupNewer,{tag})
end function

public constant xMix_PlayChannel = define_c_func(mix,"+Mix_PlayChannel",{C_INT,C_POINTER,C_INT},C_INT)

public function Mix_PlayChannel(atom chan,atom chunk,atom loops)
	return c_func(xMix_PlayChannel,{chan,chunk,loops})
end function

public constant xMix_PlayChannelTimed = define_c_func(mix,"+Mix_PlayChannelTimed",{C_INT,C_POINTER,C_INT,C_INT},C_INT)

public function Mix_PlayChannelTimed(atom chan,atom chunk,atom loops,atom ticks)
	return c_func(xMix_PlayChannelTimed,{chan,chunk,loops,ticks})	
end function

public constant xMix_PlayMusic = define_c_func(mix,"+Mix_PlayMusic",{C_POINTER,C_INT},C_INT)

public function Mix_PlayMusic(atom mus,atom l)
	return c_func(xMix_PlayMusic,{mus,l})
end function

public constant xMix_FadeInMusic = define_c_func(mix,"+Mix_FadeInMusic",{C_POINTER,C_INT,C_INT},C_INT)

public function Mix_FadeInMusic(atom mus,atom l,atom ms)
	return c_func(xMix_FadeInMusic,{mus,l,ms})
end function

public constant xMix_FadeInMusicPos = define_c_func(mix,"+Mix_FadeInMusicPos",{C_POINTER,C_INT,C_INT,C_DOUBLE},C_INT)

public function Mix_FadeInMusicPos(atom mus,atom l,atom ms,atom pos)
	return c_func(xMix_FadeInMusicPos,{mus,l,ms,pos})
end function

public constant xMix_FadeInChannel = define_c_func(mix,"+Mix_FadeInChannel",{C_INT,C_POINTER,C_INT,C_INT},C_INT)

public function Mix_FadeInChannel(atom chan,atom chunk,atom l,atom ms)
	return c_func(xMix_FadeInChannel,{chan,chunk,l,ms})
end function

public constant xMix_FadeInChannelTimed = define_c_func(mix,"+Mix_FadeInChannelTimed",{C_INT,C_POINTER,C_INT,C_INT},C_INT)

public function Mix_FadeInChannelTimed(atom chan,atom chunk,atom l,atom ms,atom ticks)
	return c_func(xMix_FadeInChannelTimed,{chan,chunk,l,ms,ticks})
end function

public constant xMix_Volume = define_c_func(mix,"+Mix_Volume",{C_INT,C_INT},C_INT)

public function Mix_Volume(atom chan,atom vol)
 return c_func(xMix_Volume,{chan,vol})
end function

public constant xMix_VolumeChunk = define_c_func(mix,"+Mix_VolumeChunk",{C_POINTER,C_INT},C_INT)

public function Mix_VolumeChunk(atom chunk,atom vol)
	return c_func(xMix_VolumeChunk,{chunk,vol})
end function

public constant xMix_VolumeMusic = define_c_func(mix,"+Mix_VolumeMusic",{C_INT},C_INT)

public function Mix_VolumeMusic(atom vol)
	return c_func(xMix_VolumeMusic,{vol})
end function

public constant xMix_GetMusicVolume = define_c_func(mix,"+Mix_GetMusicVolume",{C_POINTER},C_INT)

public function Mix_GetMusicVolume(atom mus)
	return c_func(xMix_GetMusicVolume,{mus})
end function

public constant xMix_MasterVolume = define_c_func(mix,"+Mix_MasterVolume",{C_INT},C_INT)

public function Mix_MasterVolume(atom vol)
	return c_func(xMix_MasterVolume,{vol})
end function

public constant xMix_HaltChannel = define_c_func(mix,"+Mix_HaltChannel",{C_INT},C_INT)

public function Mix_HaltChannel(atom chan)
	return c_func(xMix_HaltChannel,{chan})
end function

public constant xMix_HaltGroup = define_c_func(mix,"+Mix_HaltGroup",{C_INT},C_INT)

public function Mix_HaltGroup(atom tag)
	return c_func(xMix_HaltGroup,{tag})
end function

public constant xMix_HaltMusic = define_c_func(mix,"+Mix_HaltMusic",{},C_INT)

public function Mix_HaltMusic()
	return c_func(xMix_HaltMusic,{})
end function

public constant xMix_ExpireChannel = define_c_func(mix,"+Mix_ExpireChannel",{C_INT,C_INT},C_INT)

public function Mix_ExpireChannel(atom chan,atom ticks)
	return c_func(xMix_ExpireChannel,{chan,ticks})
end function

public constant xMix_FadeOutChannel = define_c_func(mix,"+Mix_FadeOutChannel",{C_INT,C_INT},C_INT)

public function Mix_FadeOutChannel(atom which,atom ms)
	return c_func(xMix_FadeOutChannel,{which,ms})
end function

public constant xMix_FadeOutGroup = define_c_func(mix,"+Mix_FadeOutGroup",{C_INT,C_INT},C_INT)

public function Mix_FadeOutGroup(atom tag,atom ms)
	return c_func(xMix_FadeOutGroup,{tag,ms})
end function

public constant xMix_FadeOutMusic = define_c_func(mix,"+Mix_FadeOutMusic",{C_INT},C_INT)

public function Mix_FadeOutMusic(atom ms)
	return c_func(xMix_FadeOutMusic,{ms})
end function

public constant xMix_FadingMusic = define_c_func(mix,"+Mix_FadingMusic",{},C_INT)

public function Mix_FadingMusic()
	return c_func(xMix_FadingMusic,{})
end function

public constant xMix_FadingChannel = define_c_func(mix,"+Mix_FadingChannel",{C_INT},C_INT)

public function Mix_FadingChannel(atom which)
	return c_func(xMix_FadingChannel,{which})
end function

public constant xMix_Pause = define_c_proc(mix,"+Mix_Pause",{C_INT})

public procedure Mix_Pause(atom chan)
	c_proc(xMix_Pause,{chan})
end procedure

public constant xMix_Resume = define_c_proc(mix,"+Mix_Resume",{C_INT})

public procedure Mix_Resume(atom chan)
	c_proc(xMix_Resume,{chan})
end procedure

public constant xMix_Paused = define_c_func(mix,"+Mix_Paused",{C_INT},C_INT)

public function Mix_Paused(atom chan)
	return c_func(xMix_Paused,{chan})
end function

public constant xMix_PauseMusic = define_c_proc(mix,"+Mix_PauseMusic",{})

public procedure Mix_PauseMusic()
	c_proc(xMix_PauseMusic,{})
end procedure

public constant xMix_ResumeMusic = define_c_proc(mix,"+Mix_ResumeMusic",{})

public procedure Mix_ResumeMusic()
	c_proc(xMix_ResumeMusic,{})
end procedure

public constant xMix_RewindMusic = define_c_proc(mix,"+Mix_RewindMusic",{})

public procedure Mix_RewindMusic()
	c_proc(xMix_RewindMusic,{})
end procedure

public constant xMix_PausedMusic = define_c_func(mix,"+Mix_PausedMusic",{},C_INT)

public function Mix_PausedMusic()
	return c_func(xMix_PausedMusic,{})
end function

public constant xMix_ModMusicJumpToOrder = define_c_func(mix,"+Mix_ModMusicJumpToOrder",{C_INT},C_INT)

public function Mix_ModMusicJumpToOrder(atom order)
	return c_func(xMix_ModMusicJumpToOrder,{order})
end function

public constant xMix_StartTrack = define_c_func(mix,"+Mix_StartTrack",{C_POINTER,C_INT},C_INT),
				xMix_GetNumTracks = define_c_func(mix,"+Mix_GetNumTracks",{C_POINTER},C_INT)
				
public function Mix_StartTrack(atom mus,atom trk)
	return c_func(xMix_StartTrack,{mus,trk})
end function

public function Mix_GetNumTracks(atom mus)
	return c_func(xMix_GetNumTracks,{mus})
end function

public constant xMix_SetMusicPosition = define_c_func(mix,"+Mix_SetMusicPosition",{C_DOUBLE},C_INT)

public function Mix_SetMusicPosition(atom pos)
	return c_func(xMix_SetMusicPosition,{pos})
end function

public constant xMix_GetMusicPosition = define_c_func(mix,"+Mix_GetMusicPosition",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicPosition(atom mus)
	return c_func(xMix_GetMusicPosition,{mus})
end function

public constant xMix_MusicDuration = define_c_func(mix,"+Mix_MusicDuration",{C_POINTER},C_DOUBLE)

public function Mix_MusicDuration(atom mus)
	return c_func(xMix_MusicDuration,{mus})
end function

public constant xMix_GetMusicLoopStartTime = define_c_func(mix,"+Mix_GetMusicLoopStartTime",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicLoopStartTime(atom mus)
	return c_func(xMix_GetMusicLoopStartTime,{mus})
end function

public constant xMix_GetMusicLoopEndTime = define_c_func(mix,"+Mix_GetMusicLoopEndTime",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicLoopEndTime(atom mus)
	return c_func(xMix_GetMusicLoopEndTime,{mus})
end function

public constant xMix_GetMusicLoopLengthTime = define_c_func(mix,"+Mix_GetMusicLoopLengthtime",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicLoopLengthTime(atom mus)
	return c_func(xMix_GetMusicLoopLengthTime,{mus})
end function

public constant xMix_Playing = define_c_func(mix,"+Mix_Playing",{C_INT},C_INT)

public function Mix_Playing(atom chan)
	return c_func(xMix_Playing,{chan})
end function

public constant xMix_PlayingMusic = define_c_func(mix,"+Mix_PlayingMusic",{},C_INT)

public function Mix_PlayingMusic()
	return c_func(xMix_PlayingMusic,{})
end function

public constant xMix_SetMusicCMD = define_c_func(mix,"+Mix_SetMusicCMD",{C_STRING},C_INT)

public function Mix_SetMusicCMD(sequence cmd)
	return c_func(xMix_SetMusicCMD,{cmd})
end function

public constant xMix_SetSynchroValue = define_c_func(mix,"+Mix_SetSynchroValue",{C_INT},C_INT)

public function Mix_SetSynchroValue(atom val)
	return c_func(xMix_SetSynchroValue,{val})
end function

public constant xMix_GetSynchroValue = define_c_func(mix,"+Mix_GetSynchroValue",{},C_INT)

public function Mix_GetSynchroValue()
	return c_func(xMix_GetSynchroValue,{})
end function

public constant xMix_SetSoundFonts = define_c_func(mix,"+Mix_SetSoundFonts",{C_STRING},C_INT)

public function Mix_SetSoundFonts(sequence paths)
	return c_func(xMix_SetSoundFonts,{paths})
end function

public constant xMix_GetSoundFonts = define_c_func(mix,"+Mix_GetSoundFonts",{},C_STRING)

public function Mix_GetSoundFonts()
	return c_func(xMix_GetSoundFonts,{})
end function

public constant xMix_EachSoundFont = define_c_func(mix,"+Mix_EachSoundFont",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_INT)

public function Mix_EachSoundFont(atom func,sequence chr,atom p,atom data)
	return c_func(xMix_EachSoundFont,{func,chr,p,data})
end function

public constant xMix_SetTimidityCfg = define_c_func(mix,"+Mix_SetTimidityCfg",{C_STRING},C_INT)

public function Mix_SetTimidityCfg(sequence path)
	return c_func(xMix_SetTimidityCfg,{path})
end function

public constant xMix_GetTimidityCfg = define_c_func(mix,"+Mix_GetTimidityCfg",{},C_STRING)

public function Mix_GetTimidityCfg()
	return c_func(xMix_GetTimidityCfg,{})
end function

public constant xMix_GetChunk = define_c_func(mix,"+Mix_GetChunk",{C_INT},C_POINTER)

public function Mix_GetChunk(atom chan)
	return c_func(xMix_GetChunk,{chan})
end function

public constant xMix_CloseAudio = define_c_proc(mix,"+Mix_CloseAudio",{})

public procedure Mix_CloseAudio()
	c_proc(xMix_CloseAudio,{})
end procedure
­3.19