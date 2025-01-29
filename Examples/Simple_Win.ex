include SDL.e

atom w = 800
atom h = 600
atom flags = SDL_WINDOW_RESIZABLE

if SDL_Init(SDL_INIT_VIDEO) = -1 then
	puts(1,"Failed to init SDL!\n")
	abort(0)
end if

sequence title = "Simple Window - Stays open for 3 seconds"

atom win = SDL_CreateWindow(title,w,h,flags)

SDL_Delay(3000)

SDL_DestroyWindow(win)

SDL_Quit()
­1.11