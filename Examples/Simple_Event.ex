include SDL.e
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
­1.11