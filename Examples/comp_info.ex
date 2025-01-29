include std/ffi.e
include std/get.e

include SDL.e

atom cpus = SDL_GetNumLogicalCPUCores()
atom cache = SDL_GetCPUCacheLineSize()

atom key = get_key()

printf(1,"CPUs (cores): %d\n",{cpus})
printf(1,"Cache Line Size: %d\n",{cache})
printf(1,"Has AltiVec: %d\n",{SDL_HasAltiVec()})
printf(1,"Has MMX: %d\n",{SDL_HasMMX()})
printf(1,"Has SSE: %d\n",{SDL_HasSSE()})
printf(1,"Has SSE2: %d\n",{SDL_HasSSE2()})
printf(1,"Has SSE3: %d\n",{SDL_HasSSE3()})
printf(1,"Has SSE41: %d\n",{SDL_HasSSE41()})
printf(1,"Has SSE42: %d\n",{SDL_HasSSE42()})
printf(1,"Has AVX: %d\n",{SDL_HasAVX()})
printf(1,"Has AVX2: %d\n",{SDL_HasAVX2()})
printf(1,"Has AVX512F: %d\n",{SDL_HasAVX512F()})
printf(1,"Has ARMSIMD: %d\n",{SDL_HasARMSIMD()})
printf(1,"Has NEON: %d\n",{SDL_HasNEON()})
printf(1,"Has LSX: %d\n",{SDL_HasLSX()})
printf(1,"Has LASX: %d\n",{SDL_HasLASX()})
printf(1,"System RAM: %d GB\n",{SDL_GetSystemRAM()})
printf(1,"SIMD Realignment: %d\n",{SDL_GetSIMDAlignment()})

printf(1,"SDL Version: %d",{SDL_GetVersion()})

while 1 do
	key = get_key()
	if key = 27 then
		exit
	end if
end while
­30.25