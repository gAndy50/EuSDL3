include SDL3.e
include SDL_opengl.e

include std/ffi.e

if SDL_Init(SDL_INIT_EVERYTHING) = -1 then
	puts(1,"Failed to init SDL!\n")
	abort(0)
end if

SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION,3)
SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION,1)
SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK,SDL_GL_CONTEXT_PROFILE_CORE)

SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER,1)
SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE,24)

atom w = 800
atom h = 600
atom flags = SDL_WINDOW_RESIZABLE

sequence title = "OpenGL Example"

atom win = SDL_CreateWindow(title,w,h,flags)
atom ctx = SDL_GL_CreateContext(win)

if ctx = -1 then
	puts(1,"Failed to create OpenGL context!\n")
	abort(0)
end if

SDL_DestroyWindow(win)
SDL_Quit()
­32.22