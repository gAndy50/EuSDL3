--EuSDLImage3
--Written by Andy P.
--Copyright (c) 2025

include std/ffi.e
include std/machine.e
include std/os.e

public atom img

include SDL.e

ifdef WINDOWS then
	img = open_dll("SDL3_image.dll")
	elsifdef LINUX or FREEBSD then
	img = open_dll("libSDL3_image.so")
	elsifdef OSX then
	img = open_dll("libSDL3_image.dylib")
end ifdef

if img = 0 then
	puts(1,"Failed to load SDL_Image!\n")
	abort(0)
end if

public constant SDL_IMAGE_MAJOR_VERSION = 3,
				SDL_IMAGE_MINOR_VERSION = 2,
				SDL_IMAGE_PATCHLEVEL = 2
				
public constant xIMG_Version = define_c_func(img,"+IMG_Version",{},C_INT)

public function IMG_Version()
	return c_func(xIMG_Version,{})
end function

public constant xIMG_LoadTyped_IO = define_c_func(img,"+IMG_LoadTyped_IO",{C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_LoadTyped_IO(atom src,atom closeio,sequence xtype)
	return c_func(xIMG_LoadTyped_IO,{src,closeio,xtype})
end function

public constant xIMG_Load_IO = define_c_func(img,"+IMG_Load_IO",{C_POINTER,C_BOOL},C_POINTER)

public function IMG_Load_IO(atom src,atom closeio)
	return c_func(xIMG_Load_IO,{src,closeio})
end function

public constant xIMG_Load = define_c_func(img,"+IMG_Load",{C_STRING},C_POINTER)

public function IMG_Load(sequence file)
	return c_func(xIMG_Load_IO,{file,0})
end function

public constant xIMG_LoadTexture_IO = define_c_func(img,"+IMG_LoadTexture_IO",{C_POINTER,C_POINTER,C_BOOL},C_POINTER)

public function IMG_LoadTexture_IO(atom rend,atom src,atom closeio)
	return c_func(xIMG_LoadTexture_IO,{rend,src,closeio})
end function

public constant xIMG_LoadTexture = define_c_func(img,"+IMG_LoadTexture",{C_POINTER,C_STRING},C_POINTER)

public function IMG_LoadTexture(atom rend,sequence file)
	return c_func(xIMG_LoadTexture_IO,{rend,file,0})
end function

public constant xIMG_LoadTextureTyped_IO = define_c_func(img,"+IMG_LoadTextureTyped_IO",{C_POINTER,C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_LoadTextureTyped_IO(atom rend,atom src,atom closeio,sequence xtype)
	return c_func(xIMG_LoadTextureTyped_IO,{rend,closeio,xtype})
end function

public constant xIMG_isAVIF = define_c_func(img,"+IMG_isAVIF",{C_POINTER},C_BOOL)

public function IMG_isAVIF(atom src)
	return c_func(xIMG_isAVIF,{src})
end function

public constant xIMG_isICO = define_c_func(img,"+IMG_isICO",{C_POINTER},C_BOOL)

public function IMG_isICO(atom src)
	return c_func(xIMG_isICO,{src})
end function

public constant xIMG_isCUR = define_c_func(img,"+IMG_isCUR",{C_POINTER},C_BOOL)

public function IMG_isCUR(atom src)
	return c_func(xIMG_isCUR,{src})
end function

public constant xIMG_isBMP = define_c_func(img,"+IMG_isBMP",{C_POINTER},C_BOOL)

public function IMG_isBMP(atom src)
	return c_func(xIMG_isBMP,{src})
end function

public constant xIMG_isGIF = define_c_func(img,"+IMG_isGIF",{C_POINTER},C_BOOL)

public function IMG_isGIF(atom src)
	return c_func(xIMG_isGIF,{src})
end function

public constant xIMG_isJPG = define_c_func(img,"+IMG_isJPG",{C_POINTER},C_BOOL)

public function IMG_isJPG(atom src)
	return c_func(xIMG_isJPG,{src})
end function

public constant xIMG_isJXL = define_c_func(img,"+IMG_isJXL",{C_POINTER},C_BOOL)

public function IMG_isJXL(atom src)
	return c_func(xIMG_isJXL,{src})
end function

public constant xIMG_isLBM = define_c_func(img,"+IMG_isLBM",{C_POINTER},C_BOOL)

public function IMG_isLBM(atom src)
	return c_func(xIMG_isLBM,{src})
end function

public constant xIMG_isPCX = define_c_func(img,"+IMG_isPCX",{C_POINTER},C_BOOL)

public function IMG_isPCX(atom src)
	return c_func(xIMG_isPCX,{src})
end function

public constant xIMG_isPNG = define_c_func(img,"+IMG_isPNG",{C_POINTER},C_BOOL)

public function IMG_isPNG(atom src)
	return c_func(xIMG_isPNG,{src})
end function

public constant xIMG_isPNM = define_c_func(img,"+IMG_isPNM",{C_POINTER},C_BOOL)

public function IMG_isPNM(atom src)
	return c_func(xIMG_isPNM,{src})
end function

public constant xIMG_isSVG = define_c_func(img,"+IMG_isSVG",{C_POINTER},C_BOOL)

public function IMG_isSVG(atom src)
	return c_func(xIMG_isSVG,{src})
end function

public constant xIMG_isQOI = define_c_func(img,"+IMG_isQOI",{C_POINTER},C_BOOL)

public function IMG_isQOI(atom src)
	return c_func(xIMG_isQOI,{src})
end function

public constant xIMG_isTIF = define_c_func(img,"+IMG_isTIF",{C_POINTER},C_BOOL)

public function IMG_isTIF(atom src)
	return c_func(xIMG_isTIF,{src})
end function

public constant xIMG_isXCF = define_c_func(img,"+IMG_isXCF",{C_POINTER},C_BOOL)

public function IMG_isXCF(atom src)
	return c_func(xIMG_isXCF,{src})
end function

public constant xIMG_isXPM = define_c_func(img,"+IMG_isXPM",{C_POINTER},C_BOOL)

public function IMG_isXPM(atom src)
	return c_func(xIMG_isXPM,{src})
end function

public constant xIMG_isXV = define_c_func(img,"+IMG_isXV",{C_POINTER},C_BOOL)

public function IMG_isXV(atom src)
	return c_func(xIMG_isXV,{src})
end function

public constant xIMG_isWEBP = define_c_func(img,"+IMG_isWEBP",{C_POINTER},C_BOOL)

public function IMG_isWEBP(atom src)
	return c_func(xIMG_isWEBP,{src})
end function

public constant xIMG_LoadAVIF_IO = define_c_func(img,"+IMG_LoadAVIF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadAVIF_IO(atom src)
	return c_func(xIMG_LoadAVIF_IO,{src})
end function

public constant xIMG_LoadICO_IO = define_c_func(img,"+IMG_LoadICO_IO",{C_POINTER},C_POINTER)

public function IMG_LoadICO_IO(atom src)
	return c_func(xIMG_LoadICO_IO,{src})
end function

public constant xIMG_LoadCUR_IO = define_c_func(img,"+IMG_LoadCUR_IO",{C_POINTER},C_POINTER)

public function IMG_LoadCUR_IO(atom src)
	return c_func(xIMG_LoadCUR_IO,{src})
end function

public constant xIMG_LoadBMP_IO = define_c_func(img,"+IMG_LoadBMP_IO",{C_POINTER},C_POINTER)

public function IMG_LoadBMP_IO(atom src)
	return c_func(xIMG_LoadBMP_IO,{src})
end function

public constant xIMG_LoadGIF_IO = define_c_func(img,"+IMG_LoadGIF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadGIF_IO(atom src)
	return c_func(xIMG_LoadGIF_IO,{src})
end function

public constant xIMG_LoadJPG_IO = define_c_func(img,"+IMG_LoadJPG_IO",{C_POINTER},C_POINTER)

public function IMG_LoadJPG_IO(atom src)
	return c_func(xIMG_LoadJPG_IO,{src})
end function

public constant xIMG_LoadJXL_IO = define_c_func(img,"+IMG_LoadJXL_IO",{C_POINTER},C_POINTER)

public function IMG_LoadJXL_IO(atom src)
	return c_func(xIMG_LoadJXL_IO,{src})
end function

public constant xIMG_LoadLBM_IO = define_c_func(img,"+IMG_LoadLBM_IO",{C_POINTER},C_POINTER)

public function IMG_LoadLBM_IO(atom src)
	return c_func(xIMG_LoadLBM_IO,{src})
end function

public constant xIMG_LoadPCX_IO = define_c_func(img,"+IMG_LoadPCX_IO",{C_POINTER},C_POINTER)

public function IMG_LoadPCX_IO(atom src)
	return c_func(xIMG_LoadPCX_IO,{src})
end function

public constant xIMG_LoadPNG_IO = define_c_func(img,"+IMG_LoadPNG_IO",{C_POINTER},C_POINTER)

public function IMG_LoadPNG_IO(atom src)
	return c_func(xIMG_LoadPNG_IO,{src})
end function

public constant xIMG_LoadPNM_IO = define_c_func(img,"+IMG_LoadPNM_IO",{C_POINTER},C_POINTER)

public function IMG_LoadPNM_IO(atom src)
	return c_func(xIMG_LoadPNM_IO,{src})
end function

public constant xIMG_LoadSVG_IO = define_c_func(img,"+IMG_LoadSVG_IO",{C_POINTER},C_POINTER)

public function IMG_LoadSVG_IO(atom src)
	return c_func(xIMG_LoadSVG_IO,{src})
end function

public constant xIMG_LoadQOI_IO = define_c_func(img,"+IMG_LoadQOI_IO",{C_POINTER},C_POINTER)

public function IMG_LoadQOI_IO(atom src)
	return c_func(xIMG_LoadQOI_IO,{src})
end function

public constant xIMG_LoadTGA_IO = define_c_func(img,"+IMG_LoadTGA_IO",{C_POINTER},C_POINTER)

public function IMG_LoadTGA_IO(atom src)
	return c_func(xIMG_LoadTGA_IO,{src})
end function

public constant xIMG_LoadTIF_IO = define_c_func(img,"+IMG_LoadTIF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadTIF_IO(atom src)
	return c_func(xIMG_LoadTIF_IO,{src})
end function

public constant xIMG_LoadXCF_IO = define_c_func(img,"+IMG_LoadXCF_IO",{C_POINTER},C_POINTER)

public function IMG_LoadXCF_IO(atom src)
	return c_func(xIMG_LoadXCF_IO,{src})
end function

public constant xIMG_LoadXPM_IO = define_c_func(img,"+IMG_LoadXPM_IO",{C_POINTER},C_POINTER)

public function IMG_LoadXPM_IO(atom src)
	return c_func(xIMG_LoadXPM_IO,{src})
end function

public constant xIMG_LoadXV_IO = define_c_func(img,"+IMG_LoadXV_IO",{C_POINTER},C_POINTER)

public function IMG_LoadXV_IO(atom src)
	return c_func(xIMG_LoadXV_IO,{src})
end function

public constant xIMG_LoadWEBP_IO = define_c_func(img,"+IMG_LoadWEBP_IO",{C_POINTER},C_POINTER)

public function IMG_LoadWEBP_IO(atom src)
	return c_func(xIMG_LoadWEBP_IO,{src})
end function

public constant xIMG_LoadSizedSVG_IO = define_c_func(img,"+IMG_LoadSizedSVG_IO",{C_POINTER,C_INT,C_INT},C_POINTER)

public function IMG_LoadSizedSVG_IO(atom src,atom width,atom height)
	return c_func(xIMG_LoadSizedSVG_IO,{src,width,height})
end function

public constant xIMG_ReadXPMFromArray = define_c_func(img,"+IMG_ReadXPMFromArray",{C_POINTER},C_POINTER)

public function IMG_ReadXPMFromArray(atom xpm)
	return c_func(xIMG_ReadXPMFromArray,{xpm})
end function

public constant xIMG_ReadXPMFromArrayToRGB888 = define_c_func(img,"+IMG_ReadXPMFromArrayToRGB888",{C_POINTER},C_POINTER)

public function IMG_ReadXPMFromArrayToRGB888(atom xpm)
	return c_func(xIMG_ReadXPMFromArrayToRGB888,{xpm})
end function

public constant xIMG_SaveAVIF = define_c_func(img,"+IMG_SaveAVIF",{C_POINTER,C_STRING,C_INT},C_BOOL)

public function IMG_SaveAVIF(atom surface,sequence file,atom quality)
	return c_func(xIMG_SaveAVIF,{surface,file,quality})
end function

public constant xIMG_SaveAVIF_IO = define_c_func(img,"+IMG_SaveAVIF_IO",{C_POINTER,C_POINTER,C_BOOL,C_INT},C_BOOL)

public function IMG_SaveAVIF_IO(atom surface,atom dst,atom closeio,atom quality)
	return c_func(xIMG_SaveAVIF_IO,{surface,dst,closeio,quality})
end function

public constant xIMG_SavePNG_IO = define_c_func(img,"+IMG_SavePNG_IO",{C_POINTER,C_POINTER,C_BOOL},C_BOOL)

public function IMG_SavePNG_IO(atom surface,atom dst,atom closeio)
	return c_func(xIMG_SavePNG_IO,{surface,dst,closeio})
end function

public constant xIMG_SavePNG = define_c_func(img,"+IMG_SavePNG",{C_POINTER,C_STRING},C_BOOL)

public function IMG_SavePNG(atom surface,sequence file)
	return c_func(xIMG_SavePNG_IO,{surface,file,0})
end function

public constant xIMG_SaveJPG_IO = define_c_func(img,"+IMG_SaveJPG_IO",{C_POINTER,C_POINTER,C_BOOL,C_INT},C_BOOL)

public function IMG_SaveJPG_IO(atom surface,atom dst,atom closeio,atom quality)
	return c_func(xIMG_SaveJPG_IO,{surface,dst,closeio,quality})
end function

public constant xIMG_SaveJPG = define_c_func(img,"+IMG_SaveJPG",{C_POINTER,C_STRING,C_INT},C_BOOL)

public function IMG_SaveJPG(atom surface,sequence file,atom quality)
	return c_func(xIMG_SaveJPG_IO,{surface,file,0,quality})
end function

public constant IMG_Animation = define_c_struct({
	C_INT,C_INT, --w,h
	C_INT, --count
	C_POINTER, --frames
	C_POINTER --delays
})

public constant xIMG_LoadAnimation_IO = define_c_func(img,"+IMG_LoadAnimation_IO",{C_POINTER,C_BOOL},C_POINTER)

public function IMG_LoadAnimation_IO(atom src,atom closeio)
	return c_func(xIMG_LoadAnimation_IO,{src,closeio})
end function

public constant xIMG_LoadAnimation = define_c_func(img,"+IMG_LoadAnimation",{C_STRING},C_POINTER)

public function IMG_LoadAnimation(sequence file)
	return c_func(xIMG_LoadAnimation_IO,{file,0})
end function

public constant xIMG_LoadAnimationTyped_IO = define_c_func(img,"+IMG_LoadAnimationTyped_IO",{C_POINTER,C_BOOL,C_STRING},C_POINTER)

public function IMG_LoadAnimationTyped_IO(atom src,atom closeio,sequence xtype)
	return c_func(xIMG_LoadAnimationTyped_IO,{src,closeio,xtype})
end function

public constant xIMG_FreeAnimation = define_c_proc(img,"+IMG_FreeAnimation",{C_POINTER})

public procedure IMG_FreeAnimation(atom anim)
	c_proc(xIMG_FreeAnimation,{anim})
end procedure

public constant xIMG_LoadGIFAnimation_IO = define_c_func(img,"+IMG_LoadGIFAnimation_IO",{C_POINTER},C_POINTER)

public function IMG_LoadGIFAnimation_IO(atom src)
	return c_func(xIMG_LoadGIFAnimation_IO,{src})
end function

public constant xIMG_LoadWEBPAnimation_IO = define_c_func(img,"+IMG_LoadWEBPAnimation_IO",{C_POINTER},C_POINTER)

public function IMG_LoadWEBPAnimation_IO(atom src)
	return c_func(xIMG_LoadWEBPAnimation_IO,{src})
end function
­7.16