# EuSDL3

This is a wrapper of SDL 3 for the OpenEuphoria programming language. This uses the x86 DLL builds of SDL3. You are free to use the x64 DLL builds, but they have not been tested. 

# Sample
```euphoria
include SDL3.e
include std/ffi.e

atom w = 800
atom h = 600
atom flags = SDL_WINDOW_RESIZABLE

if SDL_Init(SDL_INIT_VIDEO+SDL_INIT_EVENTS) = -1 then
	puts(1,"Failed to init SDL!\n")
	abort(0)
end if

sequence title = "Simple Window - Simple Event (Click 'X' to Close)"

atom win = SDL_CreateWindow(title,w,h,flags)
atom surface = SDL_GetWindowSurface(win)

integer run = 0
atom event = 0
atom event_type = 0

event = allocate_struct(SDL_Event)

while run = 0 do

	while SDL_PollEvent(event) != 0 do
		event_type = peek_type(event,C_UINT32)
		if event_type = SDL_EVENT_QUIT then
			run = 1
		end if
	end while
	
	SDL_UpdateWindowSurface(win)
	
end while

SDL_DestroySurface(surface)
SDL_DestroyWindow(win)

SDL_Quit()
```

# License
Copyright (c) <2025> <Icy_Viking>

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

# HELPING DEVELOPER
https://www.paypal.com/paypalme/IcyViking

https://ko-fi.com/thegeekpunkgamer
