include std/ffi.e
include std/machine.e

include SDL3.e

atom w = 800
atom h = 600
atom flags = SDL_WINDOW_RESIZABLE

if SDL_Init(SDL_INIT_VIDEO) = -1 then
	puts(1,"Failed to init SDL!\n")
	abort(0)
end if

sequence title = "Simple Window - Simple Image"

atom win = SDL_CreateWindow(title,w,h,flags)

--SDL_CreateRender(window,name[graphics-name])
--[graphics-name] can be direct3d12,opengl,vulkan,etc
atom ren = SDL_CreateRenderer(win,"opengl")

--printf(1,"%s",{SDL_GetRenderDriver(1)}) --use this to find name of driver for renderer

atom ball = SDL_LoadBMP("Images/Ball.bmp")
atom ball_tex = SDL_CreateTextureFromSurface(ren,ball)

integer run = 0
atom event = 0
atom event_type = 0

--allocate the SDL_Event struct (union)
event = allocate_struct(SDL_Event)

--Change these values to change position and size of ball
atom ball_x = 250 --x pos
atom ball_y = 150 --y pos
atom ball_w = 300 --width
atom ball_h = 300 --height


--SDL3 uses SDL_FRect for SDL_RenderTexture()
atom ball_rect = allocate_struct(SDL_FRect,{ball_x,ball_y,ball_w,ball_h})

atom key = 0

while run = 0 do

	while SDL_PollEvent(event) != 0 do
		event_type = peek_type(event,C_UINT32)
		if event_type = SDL_EVENT_QUIT then
			run = 1
		end if
	end while
	
	--Use ESC to close or press on "X" on the window to exit program
	SDL_PumpEvents()
	key = SDL_GetKeyboardState(key)
	
	if peek(key+SDL_SCANCODE_ESCAPE) > 0 then
		run = 1
	end if
	
	SDL_SetRenderDrawColor(ren,0,0,0,0)
	
	SDL_RenderClear(ren)
	
	--SDL_RenderTexture(Render,Texture,SDL_FRect[srcRect]*,SDL_FRect[dstRect]*)
	--Asterisk's indicates pointer
	--SDL_RenderTexutre replaces SDL_RenderCopy()
	SDL_RenderTexture(ren,ball_tex,NULL,ball_rect)
	
	SDL_RenderPresent(ren)
	
end while

SDL_DestroyTexture(ball_tex)
SDL_DestroySurface(ball) --Replaces SDL_FreeSurface()
SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)

SDL_Quit()
­19.45