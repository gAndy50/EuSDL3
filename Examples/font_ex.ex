include std/ffi.e  
 include std/os.e 
 include std/machine.e 
  
include sdl.e  
include sdl_ttf.e  
  
 
atom width = 800  
atom height = 600  
  
atom flags = NULL  
  
  
if SDL_Init(SDL_INIT_VIDEO+SDL_INIT_EVENTS) = -1 then  
	puts(1,"Failed to init SDL!\n")  
	abort(0)  
end if  
  
sequence title = "Font Example"  
  
atom win = SDL_CreateWindow(title,width,height,flags)  
atom render = SDL_CreateRenderer(win,NULL)  
 
atom running = 1  
atom event = 0  
atom event_type = 0  
  
event = allocate_struct(SDL_Event)  
  
sequence color = {0,0,255,SDL_ALPHA_OPAQUE} --SDL_Color I prefer blue over white blink 
  
if TTF_Init() = 0 then  
	puts(1,"Failed to init TTF!\n")  
	abort(0)  
end if  

--user can replace with any font they want  
atom font = TTF_OpenFont("arial.ttf",20)  -- this way it needs to be a file in the current directory -- returns zero not -1 on error 
  
 --?font 
  
if font = 0 then -- returns zero not -1 on error 
	puts(1,"Failed to open font!\n")  
	abort(0)  
end if  
  
atom text = TTF_RenderText_Blended(font,"Hello World",0,color)  
 
 
atom texture = SDL_CreateTextureFromSurface(render,text)  
  
atom w = 50 -- width and height should be > 0 
atom h = 50 
atom scale = 4.0  
  
atom pw=allocate(4)  -- it seems it want pointer 
atom ph=allocate(4)  
 
 atom key = 0 
  
atom text_rect = allocate_struct(SDL_FRect,{w/scale,h/scale,w,h})  
  
while running = 1 do  
	  
	SDL_GetRenderOutputSize(render,pw,ph) -- it seems it want pointer 
	SDL_SetRenderScale(render,scale,scale)  
	SDL_GetTextureSize(texture,pw,ph)  -- it seems it want pointer 
	  
	while SDL_PollEvent(event) != 0 do  
		event_type = peek_type(event,C_UINT32)  
		if event_type = SDL_EVENT_QUIT then  
			running = 0  
		end if  
	end while  
 
	SDL_RenderClear(render)  
	SDL_RenderTexture(render,texture,NULL,text_rect)  
	SDL_RenderPresent(render)  
  
end while  
  
SDL_DestroyTexture(texture)  
SDL_DestroyRenderer(render)  
SDL_DestroyWindow(win)  
SDL_Quit()  
­38.42