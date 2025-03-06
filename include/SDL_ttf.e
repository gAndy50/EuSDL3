--EuSDLTTF3
--Written by Andy P.
--Icy Viking Games
--SDL_TTF Wrapper for Euphoria
--Copyright (c) 2025

include std/ffi.e
include std/os.e

include SDL.e

public atom ttf

public constant SDL_TTF_MAJOR_VERSION = 3
public constant SDL_TFF_MINOR_VERSION = 2
public constant SDL_TFF_MICRO_VERSION = 0

ifdef WINDOWS then
	ttf = open_dll("SDL3_ttf.dll")
	elsifdef LINUX or FREEBSD then
	ttf = open_dll("libSDL3_ttf.so")
	elsifdef OSX then
	ttf = open_dll("libSDL3_ttf.dylib")
end ifdef

if ttf = 0 then
	puts(1,"Failed to load SDL_TTF!\n")
	abort(0)
end if
				
public constant xTTF_Version = define_c_func(ttf,"+TTF_Version",{},C_INT)

public function TTF_Version()
	return c_func(xTTF_Version,{})
end function

public constant xTTF_GetFreeTypeVersion = define_c_proc(ttf,"+TTF_GetFreeTypeVersion",{C_POINTER,C_POINTER,C_POINTER})

public procedure TTF_GetFreeTypeVersion(atom major,atom minor,atom patch)
	c_proc(xTTF_GetFreeTypeVersion,{major,minor,patch})
end procedure

public constant xTTF_GetHarfBuzzVersion = define_c_proc(ttf,"+TTF_GetHarfBuzzVersion",{C_POINTER,C_POINTER,C_POINTER})

public procedure TTF_GetHarfBuzzVersion(atom major,atom minor,atom patch)
	c_proc(xTTF_GetHarfBuzzVersion,{major,minor,patch})
end procedure

public constant TTF_Font = C_POINTER

public constant xTTF_Init = define_c_func(ttf,"+TTF_Init",{},C_BOOL)

public function TTF_Init()
	return c_func(xTTF_Init,{})
end function

public constant xTTF_OpenFontIO = define_c_func(ttf,"+TTF_OpenFontIO",{C_POINTER,C_BOOL,C_FLOAT},C_POINTER)

public function TTF_OpenFontIO(atom src,atom closeio,atom ptsize)
	return c_func(xTTF_OpenFontIO,{src,closeio,ptsize})
end function

public constant xTTF_OpenFont = define_c_func(ttf,"+TTF_OpenFont",{C_STRING,C_FLOAT},C_POINTER)

public function TTF_OpenFont(sequence file,atom ptsize)
	return c_func(xTTF_OpenFont,{file,ptsize})
end function

public constant xTTF_OpenFontWithProperties = define_c_func(ttf,"+TTF_OpenFontWithProperties",{C_UINT32},C_POINTER)

public function TTF_OpenFontWithProperties(atom props)
	return c_func(xTTF_OpenFontWithProperties,{props})
end function

public constant TTF_PROP_FONT_CREATE_FILENAME_STRING   =         "SDL_ttf.font.create.filename"
public constant TTF_PROP_FONT_CREATE_IOSTREAM_POINTER         =  "SDL_ttf.font.create.iostream"
public constant TTF_PROP_FONT_CREATE_IOSTREAM_OFFSET_NUMBER    = "SDL_ttf.font.create.iostream.offset"
public constant TTF_PROP_FONT_CREATE_IOSTREAM_AUTOCLOSE_BOOLEAN  = "SDL_ttf.font.create.iostream.autoclose"
public constant TTF_PROP_FONT_CREATE_SIZE_FLOAT               =  "SDL_ttf.font.create.size"
public constant TTF_PROP_FONT_CREATE_FACE_NUMBER              =  "SDL_ttf.font.create.face"
public constant TTF_PROP_FONT_CREATE_HORIZONTAL_DPI_NUMBER    =  "SDL_ttf.font.create.hdpi"
public constant TTF_PROP_FONT_CREATE_VERTICAL_DPI_NUMBER      =  "SDL_ttf.font.create.vdpi"

public constant xTTF_GetFontProperties = define_c_func(ttf,"+TTF_GetFontProperties",{C_POINTER},C_UINT32)

public function TTF_GetFontProperties(atom font)
	return c_func(xTTF_GetFontProperties,{font})
end function

public constant TTF_PROP_FONT_OUTLINE_LINE_CAP_NUMBER  =         "SDL_ttf.font.outline.line_cap"
public constant TTF_PROP_FONT_OUTLINE_LINE_JOIN_NUMBER        =  "SDL_ttf.font.outline.line_join"
public constant TTF_PROP_FONT_OUTLINE_MITER_LIMIT_NUMBER      =  "SDL_ttf.font.outline.miter_limit"

public constant xTTF_GetFontGeneration = define_c_func(ttf,"+TTF_GetFontGeneration",{C_POINTER},C_UINT32)

public function TTF_GetFontGeneration(atom font)
	return c_func(xTTF_GetFontGeneration,{font})
end function

public constant xTTF_AddFallbackFont = define_c_func(ttf,"+TTF_AddFallbackFont",{C_POINTER,C_POINTER},C_BOOL)

public function TTF_AddFallbackFont(atom font,atom fallback)
	return c_func(xTTF_AddFallbackFont,{font,fallback})
end function

public constant xTTF_RemoveFallbackFont = define_c_proc(ttf,"+TTF_RemoveFallbackFont",{C_POINTER,C_POINTER})

public procedure TTF_RemoveFallbackFont(atom font,atom fallback)
	c_proc(xTTF_RemoveFallbackFont,{font,fallback})
end procedure

public constant xTTF_ClearFallbackFonts = define_c_proc(ttf,"+TTF_ClearFallbackFonts",{C_POINTER})

public procedure TTF_ClearFallbackFonts(atom font)
	c_proc(xTTF_ClearFallbackFonts,{font})
end procedure

public constant xTTF_SetFontSize = define_c_func(ttf,"+TTF_SetFontSize",{C_POINTER,C_FLOAT},C_BOOL)

public function TTF_SetFontSize(atom font,atom ptsize)
	return c_func(xTTF_SetFontSize,{font,ptsize})
end function

public constant xTTF_SetFontSizeDPI = define_c_func(ttf,"+TTF_SetFontSizeDPI",{C_POINTER,C_FLOAT,C_INT,C_INT},C_BOOL)

public function TTF_SetFontSizeDPI(atom font,atom ptsize,atom hdpi,atom vdpi)
	return c_func(xTTF_SetFontSizeDPI,{font,ptsize,hdpi,vdpi})
end function

public constant xTTF_GetFontSize = define_c_func(ttf,"+TTF_GetFontSize",{C_POINTER},C_FLOAT)

public function TTF_GetFontSize(atom font)
	return c_func(xTTF_GetFontSize,{font})
end function

public constant xTTF_GetFontDPI = define_c_func(ttf,"+TTF_GetFontDPI",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetFontDPI(atom font,atom hdpi,atom vdpi)
	return c_func(xTTF_GetFontDPI,{font,hdpi,vdpi})
end function

public constant TTF_FontStyleFlags = C_UINT32

public constant TTF_STYLE_NORMAL = 0x00,
				TTF_STYLE_BOLD = 0x01,
				TTF_STYLE_ITALIC = 0x02,
				TTF_STYLE_UNDERLINE = 0x04,
				TTF_STYLE_STRIKETHROUGH = 0x08
				
public constant xTTF_SetFontStyle = define_c_proc(ttf,"+TTF_SetFontStyle",{C_POINTER,C_UINT32})

public procedure TTF_SetFontStyle(atom font,atom style)
	c_proc(xTTF_SetFontStyle,{font,style})
end procedure

public constant xTTF_GetFontStyle = define_c_func(ttf,"+TTF_GetFontStyle",{C_POINTER},C_UINT32)

public function TTF_GetFontStyle(atom font)
	return c_func(xTTF_GetFontStyle,{font})
end function

public constant xTTF_SetFontOutline = define_c_func(ttf,"+TTF_SetFontOutline",{C_POINTER,C_INT},C_BOOL)

public function TTF_SetFontOutline(atom font,atom outline)
	return c_func(xTTF_SetFontOutline,{font,outline})
end function

public constant xTTF_GetFontOutline = define_c_func(ttf,"+TTF_GetFontOutline",{C_POINTER},C_INT)

public function TTF_GetFontOutline(atom font)
	return c_func(xTTF_GetFontOutline,{font})
end function

public enum type TTF_HintingFlags
	TTF_HINTING_NORMAL = 0,
	TTF_HINTING_LIGHT,
	TTF_HINTING_MONO,
	TTF_HINTING_NONE,
	TTF_HINTING_LIGHT_SUBPIXEL
end type

public constant xTTF_SetFontHinting = define_c_proc(ttf,"+TTF_SetFontHinting",{C_POINTER,C_INT})

public procedure TTF_SetFontHinting(atom font,TTF_HintingFlags flags)
	c_proc(xTTF_SetFontHinting,{font,flags})
end procedure

public constant xTTF_GetNumFontFaces = define_c_func(ttf,"+TTF_GetNumFontFaces",{C_POINTER},C_INT)

public function TTF_GetNumFontFaces(atom font)
	return c_func(xTTF_GetNumFontFaces,{font})
end function

public constant xTTF_GetFontHinting = define_c_func(ttf,"+TTF_GetFontHinting",{C_POINTER},C_INT)

public function TTF_GetFontHinting(atom font)
	return c_func(xTTF_GetFontHinting,{font})
end function

public constant xTTF_SetFontSDF = define_c_func(ttf,"+TTF_SetFontSDF",{C_POINTER,C_BOOL},C_BOOL)

public function TTF_SetFontSDF(atom font,atom enabled)
	return c_func(xTTF_SetFontSDF,{font,enabled})
end function

public constant xTTF_GetFontSDF = define_c_func(ttf,"+TTF_GetFontSDF",{C_POINTER},C_BOOL)

public function TTF_GetFontSDF(atom font)
	return c_func(xTTF_GetFontSDF,{font})
end function

public enum type TTF_HorizontalAlignment
	TTF_HORIZONTAL_ALIGN_INVALID = -1,
    TTF_HORIZONTAL_ALIGN_LEFT = 0,
    TTF_HORIZONTAL_ALIGN_CENTER,
    TTF_HORIZONTAL_ALIGN_RIGHT
end type

public constant xTTF_SetFontWrapAlignment = define_c_proc(ttf,"+TTF_SetFontWrapAlignment",{C_POINTER,C_INT})

public procedure TTF_SetFontWrapAlignment(atom font,TTF_HorizontalAlignment align)
	c_proc(xTTF_SetFontWrapAlignment,{font,align})
end procedure

public constant xTTF_GetFontWrapAlignment = define_c_func(ttf,"+TTF_GetFontWrapAlignment",{C_POINTER},C_INT)

public function TTF_GetFontWrapAlignment(atom font)
	return c_func(xTTF_GetFontWrapAlignment,{font})
end function

public constant xTTF_GetFontHeight = define_c_func(ttf,"+TTF_GetFontHeight",{C_POINTER},C_INT)

public function TTF_GetFontHeight(atom font)
	return c_func(xTTF_GetFontHeight,{font})
end function

public constant xTTF_GetFontAscent = define_c_func(ttf,"+TTF_GetFontAscent",{C_POINTER},C_INT)

public function TTF_GetFontAscent(atom font)
	return c_func(xTTF_GetFontAscent,{font})
end function

public constant xTTF_GetFontDescent = define_c_func(ttf,"+TTF_GetFontDescent",{C_POINTER},C_INT)

public function TTF_GetFontDescent(atom font)
	return c_func(xTTF_GetFontDescent,{font})
end function

public constant xTTF_SetFontLineSkip = define_c_proc(ttf,"+TTF_SetFontLineSkip",{C_POINTER,C_INT})

public procedure TTF_SetFontLineSkip(atom font,atom lineskip)
	c_proc(xTTF_SetFontLineSkip,{font,lineskip})
end procedure

public constant xTTF_GetFontLineSkip = define_c_func(ttf,"+TTF_GetFontLineSkip",{C_POINTER},C_INT)

public function TTF_GetFontLineSkip(atom font)
	return c_func(xTTF_GetFontLineSkip,{font})
end function

public constant xTTF_SetFontKerning = define_c_proc(ttf,"+TTF_SetFontKerning",{C_POINTER,C_BOOL})

public procedure TTF_SetFontKerning(atom font,atom enabled)
	c_proc(xTTF_SetFontKerning,{font,enabled})
end procedure

public constant xTTF_GetFontKerning = define_c_func(ttf,"+TTF_GetFontKerning",{C_POINTER},C_BOOL)

public function TTF_GetFontKerning(atom font)
	return c_func(xTTF_GetFontKerning,{font})
end function

public constant xTTF_FontIsFixedWidth = define_c_func(ttf,"+TTF_FontIsFixedWidth",{C_POINTER},C_BOOL)

public function TTF_FontIsFixedWidth(atom font)
	return c_func(xTTF_FontIsFixedWidth,{font})
end function

public constant xTTF_FontIsScalable = define_c_func(ttf,"+TTF_FontIsScalable",{C_POINTER},C_BOOL)

public function TTF_FontIsScalable(atom font)
	return c_func(xTTF_FontIsScalable,{font})
end function

public constant xTTF_GetFontFamilyName = define_c_func(ttf,"+TTF_GetFontFamilyName",{C_POINTER},C_STRING)

public function TTF_GetFontFamilyName(atom font)
	return c_func(xTTF_GetFontFamilyName,{font})
end function

public constant xTTF_GetFontStyleName = define_c_func(ttf,"+TTF_GetFontStyleName",{C_POINTER},C_STRING)

public function TTF_GetFontStyleName(atom font)
	return c_func(xTTF_GetFontStyleName,{font})
end function

public enum type TTF_Direction
	TTF_DIRECTION_INVALID = 0,
  TTF_DIRECTION_LTR = 4,        /**< Left to Right */
  TTF_DIRECTION_RTL,            /**< Right to Left */
  TTF_DIRECTION_TTB,            /**< Top to Bottom */
  TTF_DIRECTION_BTT             /**< Bottom to Top */
end type

public constant xTTF_SetFontDirection = define_c_func(ttf,"+TTF_SetFontDirection",{C_POINTER,C_INT},C_BOOL)

public function TTF_SetFontDirection(atom font,TTF_Direction direction)
	return c_func(xTTF_SetFontDirection,{font,direction})
end function

public constant xTTF_GetFontDirection = define_c_func(ttf,"+TTF_GetFontDirection",{C_POINTER},C_INT)

public function TTF_GetFontDirection(atom font)
	return c_func(xTTF_GetFontDirection,{font})
end function

public constant xTTF_SetFontScript = define_c_func(ttf,"+TTF_SetFontScript",{C_POINTER,C_UINT32},C_BOOL)

public function TTF_SetFontScript(atom font,atom script)
	return c_func(xTTF_SetFontScript,{font,script})
end function

public constant xTTF_GetFontScript = define_c_func(ttf,"+TTF_GetFontScript",{C_POINTER},C_UINT32)

public function TTF_GetFontScript(atom font)
	return c_func(xTTF_GetFontScript,{font})
end function

public constant xTTF_GetGlyphScript = define_c_func(ttf,"+TTF_GetGlyphScript",{C_UINT32},C_UINT32)

public function TTF_GetGlyphScript(atom ch)
	return c_func(xTTF_GetGlyphScript,{ch})
end function

public constant xTTF_SetFontLanguage = define_c_func(ttf,"+TTF_SetFontLanguage",{C_POINTER,C_STRING},C_BOOL)

public function TTF_SetFontLanguage(atom font,sequence lang)
	return c_func(xTTF_SetFontLanguage,{font,lang})
end function

public constant xTTF_FontHasGlyph = define_c_func(ttf,"+TTF_FontHasGlyph",{C_POINTER,C_UINT32},C_BOOL)

public function TTF_FontHasGlyph(atom font,atom ch)
	return c_func(xTTF_FontHasGlyph,{font,ch})
end function

public enum type TTF_ImageType
	 TTF_IMAGE_INVALID = 0,
    TTF_IMAGE_ALPHA,    /**< The color channels are white */
    TTF_IMAGE_COLOR,    /**< The color channels have image data */
    TTF_IMAGE_SDF      /**< The alpha channel has signed distance field information */
end type

public constant xTTF_GetGlyphImage = define_c_func(ttf,"+TTF_GetGlyphImage",{C_POINTER,C_UINT32,C_POINTER},C_POINTER)

public function TTF_GetGlyphImage(atom font,atom ch,atom image_type)
	return c_func(xTTF_GetGlyphImage,{font,ch,image_type})
end function

public constant xTTF_GetGlyphImageForIndex = define_c_func(ttf,"+TTF_GetGlyphImageForIndex",{C_POINTER,C_UINT32,C_POINTER},C_POINTER)

public function TTF_GetGlyphImageForIndex(atom font,atom glyph_index,atom image_type)
	return c_func(xTTF_GetGlyphImageForIndex,{font,glyph_index,image_type})
end function

public constant xTTF_GetGlyphMetrics = define_c_func(ttf,"+TTF_GetGlyphMetrics",{C_POINTER,C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetGlyphMetrics(atom font,atom ch,atom minx,atom maxx,atom miny,atom maxy,atom advance)
	return c_func(xTTF_GetGlyphMetrics,{font,ch,minx,maxx,miny,maxy,advance})
end function

public constant xTTF_GetGlyphKerning = define_c_func(ttf,"+TTF_GetGlyphKerning",{C_POINTER,C_UINT32,C_POINTER},C_BOOL)

public function TTF_GetGlyphKerning(atom font,atom prev_ch,atom kerning)
	return c_func(xTTF_GetGlyphKerning,{font,prev_ch,kerning})
end function

public constant xTTF_GetStringSize = define_c_func(ttf,"+TTF_GetStringSize",{C_POINTER,C_STRING,C_SIZE_T,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetStringSize(atom font,sequence text,atom len,atom w,atom h)
	return c_func(xTTF_GetStringSize,{font,text,len,w,h})
end function

public constant xTTF_GetStringSizeWrapped = define_c_func(ttf,"+TTF_GetStringSizeWrapped",{C_POINTER,C_STRING,C_SIZE_T,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetStringSizeWrapped(atom font,sequence text,atom len,atom wrap_width,atom w,atom h)
	return c_func(xTTF_GetStringSizeWrapped,{font,text,len,wrap_width,w,h})
end function

public constant xTTF_MeasureString = define_c_func(ttf,"+TTF_MeasureString",{C_POINTER,C_STRING,C_SIZE_T,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function TTF_MeasureString(atom font,sequence text,atom len,atom max_width,atom measure_width,atom measure_len)
	return c_func(xTTF_MeasureString,{font,text,len,max_width,measure_width,measure_len})
end function

public constant xTTF_RenderText_Solid = define_c_func(ttf,"+TTF_RenderText_Solid",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color},C_POINTER)

public function TTF_RenderText_Solid(atom font,sequence text,atom len,sequence fg)
	return c_func(xTTF_RenderText_Solid,{font,text,len,fg})
end function

public constant xTTF_RenderText_Solid_Wrapped = define_c_func(ttf,"+TTF_RenderText_Solid_Wrapped",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color,C_INT},C_POINTER)

public function TTF_RenderText_Solid_Wrapped(atom font,sequence text,atom len,sequence fg,atom wrapLen)
	return c_func(xTTF_RenderText_Solid_Wrapped,{font,text,len,fg,wrapLen})
end function

public constant xTTF_RenderGlyph_Solid = define_c_func(ttf,"+TTF_RenderGlyph_Solid",{C_POINTER,C_UINT32,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_Solid(atom font,atom ch,sequence fg)
	return c_func(xTTF_RenderGlyph_Solid,{font,ch,fg})
end function

public constant xTTF_RenderText_Shaded = define_c_func(ttf,"+TTF_RenderText_Shaded",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderText_Shaded(atom font,sequence text,atom len,sequence fg,sequence bg)
	return c_func(xTTF_RenderText_Shaded,{font,text,len,fg,bg})
end function

public constant xTTF_RenderText_Shaded_Wrapped = define_c_func(ttf,"+TTF_RenderText_Shaded_Wrapped",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color,SDL_Color,C_INT},C_POINTER)

public function TTF_RenderText_Shaded_Wrapped(atom font,sequence text,atom len,sequence fg,sequence bg,atom wrap_width)
	return c_func(xTTF_RenderText_Shaded_Wrapped,{font,text,len,fg,bg,wrap_width})
end function

public constant xTTF_RenderGlyph_Shaded = define_c_func(ttf,"+TTF_RenderGlyph_Shaded",{C_POINTER,C_UINT32,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_Shaded(atom font,atom ch,sequence fg,sequence bg)
	return c_func(xTTF_RenderGlyph_Shaded,{font,ch,fg,bg})
end function

public constant xTTF_RenderText_Blended = define_c_func(ttf,"+TTF_RenderText_Blended",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color},C_POINTER)

public function TTF_RenderText_Blended(atom font,sequence text,atom len,sequence fg)
	return c_func(xTTF_RenderText_Blended,{font,text,len,fg})
end function

public constant xTTF_RenderText_Blended_Wrapped = define_c_func(ttf,"+TTF_RenderText_Blended_Wrapped",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color,C_INT},C_POINTER)

public function TTF_RenderText_Blended_Wrapped(atom font,sequence text,atom len,sequence fg,atom wrap_width)
	return c_func(xTTF_RenderText_Blended_Wrapped,{font,text,len,fg,wrap_width})
end function

public constant xTTF_RenderGlyph_Blended = define_c_func(ttf,"+TTF_RenderGlyph_Blended",{C_POINTER,C_UINT32,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_Blended(atom font,atom ch,sequence fg)
	return c_func(xTTF_RenderGlyph_Blended,{font,ch,fg})
end function

public constant xTTF_RenderText_LCD = define_c_func(ttf,"+TTF_RenderText_LCD",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderText_LCD(atom font,sequence text,atom len,sequence fg,sequence bg)
	return c_func(xTTF_RenderText_LCD,{font,text,len,fg,bg})
end function

public constant xTTF_RenderText_LCD_Wrapped = define_c_func(ttf,"+TTF_RenderText_LCD_Wrapped",{C_POINTER,C_STRING,C_SIZE_T,SDL_Color,SDL_Color,C_INT},C_POINTER)

public function TTF_RenderText_LCD_Wrapped(atom font,sequence text,atom len,sequence fg,sequence bg,atom wrap_width)
	return c_func(xTTF_RenderText_LCD_Wrapped,{font,text,len,fg,bg,wrap_width})
end function

public constant xTTF_RenderGlyph_LCD = define_c_func(ttf,"+TTF_RenderGlyph_LCD",{C_POINTER,C_UINT32,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_LCD(atom font,atom ch,sequence fg,sequence bg)
	return c_func(xTTF_RenderGlyph_LCD,{font,ch,fg,bg})
end function

public constant TTF_Text = define_c_struct({
	C_STRING, --text
	C_INT, --num_lines
	C_INT, --refcount
	C_POINTER --internal
})

public constant xTTF_CreateSurfaceTextEngine = define_c_func(ttf,"+TTF_CreateSurfaceTextEngine",{},C_POINTER)

public function TTF_CreateSurfaceTextEngine()
	return c_func(xTTF_CreateSurfaceTextEngine,{})
end function

public constant xTTF_DrawSurfaceText = define_c_func(ttf,"+TTF_DrawSurfaceText",{C_POINTER,C_INT,C_INT,C_POINTER},C_BOOL)

public function TTF_DrawSurfaceText(object text,atom x,atom y,atom surface)
	return c_func(xTTF_DrawSurfaceText,{text,x,y,surface})
end function

public constant xTTF_DestroySurfaceTextEngine = define_c_proc(ttf,"+TTF_DestroySurfaceTextEngine",{C_POINTER})

public procedure TTF_DestroySurfaceTextEngine(atom engine)
	c_proc(xTTF_DestroySurfaceTextEngine,{engine})
end procedure

public constant xTTF_CreateRendererTextEngine = define_c_func(ttf,"+TTF_CreateRendererTextEngine",{C_POINTER},C_POINTER)

public function TTF_CreateRendererTextEngine(atom render)
	return c_func(xTTF_CreateRendererTextEngine,{render})	
end function

public constant xTTF_CreateRendererTextEngineWithProperties = define_c_func(ttf,"+TTF_CreateRendererTextEngineWithProperties",{C_UINT32},C_POINTER)

public function TTF_CreateRendererTextEngineWithProperties(atom props)
	return c_func(xTTF_CreateRendererTextEngineWithProperties,{props})
end function

public constant TTF_PROP_RENDERER_TEXT_ENGINE_RENDERER     =            "SDL_ttf.renderer_text_engine.create.renderer"
public constant TTF_PROP_RENDERER_TEXT_ENGINE_ATLAS_TEXTURE_SIZE  =     "SDL_ttf.renderer_text_engine.create.atlas_texture_size"

public constant xTTF_DrawRendererText = define_c_func(ttf,"+TTF_DrawRendererText",{C_POINTER,C_FLOAT,C_FLOAT},C_BOOL)

public function TTF_DrawRendererText(object text,atom x,atom y)
	return c_func(xTTF_DrawRendererText,{text,x,y})
end function

public constant xTTF_DestroyRendererTextEngine = define_c_proc(ttf,"+TTF_DestroyRendererTextEngine",{C_POINTER})

public procedure TTF_DestroyRendererTextEngine(atom engine)
	c_proc(xTTF_DestroyRendererTextEngine,{engine})
end procedure

public constant xTTF_CreateGPUTextEngine = define_c_func(ttf,"+TTF_CreateGPUTextEngine",{C_POINTER},C_POINTER)

public function TTF_CreateGPUTextEngine(atom device)
	return c_func(xTTF_CreateGPUTextEngine,{device})
end function

public constant xTTF_CreateGPUTextEngineWithProperties = define_c_func(ttf,"+TTF_CreateGPUTextEngineWithProperties",{C_UINT32},C_POINTER)

public function TTF_CreateGPUTextEngineWithProperties(atom props)
	return c_func(xTTF_CreateGPUTextEngineWithProperties,{props})
end function

public constant TTF_PROP_GPU_TEXT_ENGINE_DEVICE      =             "SDL_ttf.gpu_text_engine.create.device"
public constant TTF_PROP_GPU_TEXT_ENGINE_ATLAS_TEXTURE_SIZE  =     "SDL_ttf.gpu_text_engine.create.atlas_texture_size"

public constant TTF_GPUAtlasDrawSequence = define_c_struct({
	C_POINTER, --atlas_texture
	C_POINTER, --xy
	C_POINTER, --uv
	C_INT, --num_vertices
	C_POINTER, --indices
	C_INT, --num_indices
	C_INT, --image_type
	C_POINTER --next
})

public constant xTTF_GetGPUTextDrawData = define_c_func(ttf,"+TTF_GetGPUTextDrawData",{C_POINTER},C_POINTER)

public function TTF_GetGPUTextDrawData(atom text)
	return c_func(xTTF_GetGPUTextDrawData,{text})
end function

public constant xTTF_DestroyGPUTextEngine = define_c_proc(ttf,"+TTF_DestroyGPUTextEngine",{C_POINTER})

public procedure TTF_DestroyGPUTextEngine(atom engine)
	c_proc(xTTF_DestroyGPUTextEngine,{engine})
end procedure

public enum type TTF_GPUTextEngineWinding
	TTF_GPU_TEXTENGINE_WINDING_INVALID = -1,
	TTF_GPU_TEXTENGINE_WINDING_CLOCKWISE = 0,
	TTF_GPU_TEXTENGINE_WINDING_COUNTER_CLOCKWISE
end type

public constant xTTF_SetGPUTextEngineWinding = define_c_proc(ttf,"+TTF_SetGPUTextEngineWinding",{C_POINTER,C_INT})

public procedure TTF_SetGPUTextEngineWinding(atom engine,TTF_GPUTextEngineWinding winding)
	c_proc(xTTF_SetGPUTextEngineWinding,{engine,winding})
end procedure

public constant xTTF_GetGPUTextEngineWinding = define_c_func(ttf,"+TTF_GetGPUTextEngineWinding",{C_POINTER},C_INT)

public function TTF_GetGPUTextEngineWinding(atom engine)
	return c_func(xTTF_GetGPUTextEngineWinding,{engine})
end function

public constant xTTF_CreateText = define_c_func(ttf,"+TTF_CreateText",{C_POINTER,C_POINTER,C_STRING,C_SIZE_T},C_POINTER)

public function TTF_CreateText(atom engine,atom font,sequence text,atom len)
	return c_func(xTTF_CreateText,{engine,font,text,len})
end function

public constant xTTF_GetTextProperties = define_c_func(ttf,"+TTF_GetTextProperties",{C_POINTER},C_UINT32)

public function TTF_GetTextProperties(atom text)
	return c_func(xTTF_GetTextProperties,{text})
end function

public constant xTTF_SetTextEngine = define_c_func(ttf,"+TTF_SetTextEngine",{C_POINTER,C_POINTER},C_BOOL)

public function TTF_SetTextEngine(atom text,atom engine)
	return c_func(xTTF_SetTextEngine,{text,engine})
end function

public constant xTTF_GetTextEngine = define_c_func(ttf,"+TTF_GetTextEngine",{C_POINTER},C_POINTER)

public function TTF_GetTextEngine(atom text)
	return c_func(xTTF_GetTextEngine,{text})
end function

public constant xTTF_SetTextFont = define_c_func(ttf,"+TTF_SetTextFont",{C_POINTER,C_POINTER},C_BOOL)

public function TTF_SetTextFont(atom text,atom font)
	return c_func(xTTF_SetTextFont,{text,font})
end function

public constant xTTF_GetTextFont = define_c_func(ttf,"+TTF_GetTextFont",{C_POINTER},C_POINTER)

public function TTF_GetTextFont(atom text)
	return c_func(xTTF_GetTextFont,{text})
end function

public constant xTTF_SetTextDirection = define_c_func(ttf,"+TTF_SetTextDirection",{C_POINTER,C_INT},C_BOOL)

public function TTF_SetTextDirection(atom text,TTF_Direction direction)
	return c_func(xTTF_SetTextDirection,{text,direction})
end function

public constant xTTF_GetTextDirection = define_c_func(ttf,"+TTF_GetTextDirection",{C_POINTER},C_INT)

public function TTF_GetTextDirection(atom text)
	return c_func(xTTF_GetTextDirection,{text})
end function

public constant xTTF_SetTextScript = define_c_func(ttf,"+TTF_SetTextScript",{C_POINTER,C_UINT32},C_BOOL)

public function TTF_SetTextScript(atom text,atom script)
	return c_func(xTTF_SetTextScript,{text,script})
end function

public constant xTTF_GetTextScript = define_c_func(ttf,"+TTF_GetTextScript",{C_POINTER},C_UINT32)

public function TTF_GetTextScript(atom text)
	return c_func(xTTF_GetTextScript,{text})
end function

public constant xTTF_SetTextColor = define_c_func(ttf,"+TTF_SetTextColor",{C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_BOOL)

public function TTF_SetTextColor(atom text,atom r,atom g,atom b,atom a)
	return c_func(xTTF_SetTextColor,{text,r,g,b,a})
end function

public constant xTTF_SetTextColorFloat = define_c_func(ttf,"+TTF_SetTextColorFloat",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_BOOL)

public function TTF_SetTextColorFloat(atom text,atom r,atom g,atom b,atom a)
	return c_func(xTTF_SetTextColorFloat,{text,r,g,b,a})
end function

public constant xTTF_GetTextColor = define_c_func(ttf,"+TTF_GetTextColor",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetTextColor(atom text,atom r,atom g,atom b,atom a)
	return c_func(xTTF_GetTextColor,{text,r,g,b,a})
end function

public constant xTTF_GetTextColorFloat = define_c_func(ttf,"+TTF_GetTextColorFloat",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetTextColorFloat(atom text,atom r,atom g,atom b,atom a)
	return c_func(xTTF_GetTextColorFloat,{text,r,g,b,a})
end function

public constant xTTF_SetTextPosition = define_c_func(ttf,"+TTF_SetTextPosition",{C_POINTER,C_INT,C_INT},C_BOOL)

public function TTF_SetTextPosition(atom text,atom x,atom y)
	return c_func(xTTF_SetTextPosition,{text,x,y})
end function

public constant xTTF_GetTextPosition = define_c_func(ttf,"+TTF_GetTextPosition",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetTextPosition(atom text,atom x,atom y)
	return c_func(xTTF_GetTextPosition,{text,x,y})
end function

public constant xTTF_SetTextWrapWidth = define_c_func(ttf,"+TTF_SetTextWrapWidth",{C_POINTER,C_INT},C_BOOL)

public function TTF_SetTextWrapWidth(atom text,atom wrap_width)
	return c_func(xTTF_SetTextWrapWidth,{text,wrap_width})
end function

public constant xTTF_GetTextWrapWidth = define_c_func(ttf,"+TTF_GetTextWrapWidth",{C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetTextWrapWidth(atom text,atom wrap_width)
	return c_func(xTTF_GetTextWrapWidth,{text,wrap_width})
end function

public constant xTTF_SetTextWrapWhitespaceVisible = define_c_func(ttf,"+TTF_SetTextWrapWhitespaceVisible",{C_POINTER,C_BOOL},C_BOOL)

public function TTF_SetTextWrapWhitespaceVisible(atom text,atom visible)
	return c_func(xTTF_SetTextWrapWhitespaceVisible,{text,visible})
end function

public constant xTTF_TextWrapWhitespaceVisible = define_c_func(ttf,"+TTF_TextWrapWhitespaceVisible",{C_POINTER},C_BOOL)

public function TTF_TextWrapWhitespaceVisible(atom text)
	return c_func(xTTF_TextWrapWhitespaceVisible,{text})
end function

public constant xTTF_SetTextString = define_c_func(ttf,"+TTF_SetTextString",{C_POINTER,C_STRING,C_SIZE_T},C_BOOL)

public function TTF_SetTextString(atom text,sequence str,atom len)
	return c_func(xTTF_SetTextString,{text,str,len})
end function

public constant xTTF_InsertTextString = define_c_func(ttf,"+TTF_InsertTextString",{C_POINTER,C_INT,C_STRING,C_SIZE_T},C_BOOL)

public function TTF_InsertTextString(atom text,atom offset,sequence str,atom len)
	return c_func(xTTF_InsertTextString,{text,offset,str,len})
end function

public constant xTTF_AppendTextString = define_c_func(ttf,"+TTF_AppendTextString",{C_POINTER,C_STRING,C_SIZE_T},C_BOOL)

public function TTF_AppendTextString(atom text,sequence str,atom len)
	return c_func(xTTF_AppendTextString,{text,str,len})
end function

public constant xTTF_DeleteTextString = define_c_func(ttf,"+TTF_DeleteTextString",{C_POINTER,C_INT,C_INT},C_BOOL)

public function TTF_DeleteTextString(atom text,atom offset,atom len)
	return c_func(xTTF_DeleteTextString,{text,offset,len})
end function

public constant xTTF_GetTextSize = define_c_func(ttf,"+TTF_GetTextSize",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetTextSize(atom text,atom w,atom h)
	return c_func(xTTF_GetTextSize,{text,w,h})
end function

public constant TTF_SubStringFlags = C_UINT32

public constant TTF_SUBSTRING_DIRECTION_MASK = 0x000000FF
public constant TTF_SUBSTRING_TEXT_START = 0x00000100
public constant TTF_SUBSTRING_LINE_START = 0x00000200
public constant TTF_SUBSTRING_LINE_END = 0x00000400
public constant TTF_SUBSTRING_TEXT_END = 0x00000800

public constant TTF_SubString = define_c_struct({
	C_UINT32, --flags
	C_INT, --offset
	C_INT, --length
	C_INT, --line_index
	C_INT, --cluster_index
	SDL_Rect --rect
})

public constant xTTF_GetTextSubString = define_c_func(ttf,"+TTF_GetTextSubString",{C_POINTER,C_INT,C_POINTER},C_BOOL)

public function TTF_GetTextSubString(atom text,atom offset,atom substr)
	return c_func(xTTF_GetTextSubString,{text,offset,substr})
end function

public constant xTTF_GetTextSubStringForLine = define_c_func(ttf,"+TTF_GetTextSubStringForLine",{C_POINTER,C_INT,C_POINTER},C_BOOL)

public function TTF_GetTextSubStringForLine(atom text,atom line,atom substr)
	return c_func(xTTF_GetTextSubStringForLine,{text,line,substr})
end function

public constant xTTF_GetTextSubStringsForRange = define_c_func(ttf,"+TTF_GetTextSubStringsForRange",{C_POINTER,C_INT,C_INT,C_POINTER},C_POINTER)

public function TTF_GetTextSubStringsForRange(atom text,atom offset,atom len,atom count)
	return c_func(xTTF_GetTextSubStringsForRange,{text,offset,len,count})
end function

public constant xTTF_GetTextSubStringForPoint = define_c_func(ttf,"+TTF_GetTextSubStringForPoint",{C_POINTER,C_INT,C_INT,C_POINTER},C_BOOL)

public function TTF_GetTextSubStringForPoint(atom text,atom x,atom y,atom substr)
	return c_func(xTTF_GetTextSubStringForPoint,{text,x,y,substr})
end function

public constant xTTF_GetPreviousTextSubString = define_c_func(ttf,"+TTF_GetPreviousTextSubString",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetPreviousTextSubString(atom text,atom substr,atom previous)
	return c_func(xTTF_GetPreviousTextSubString,{text,substr,previous})
end function

public constant xTTF_GetNextTextSubString = define_c_func(ttf,"+TTF_GetNextTextSubString",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function TTF_GetNextTextSubString(atom text,atom substr,atom next)
	return c_func(xTTF_GetNextTextSubString,{text,substr,next})
end function

public constant xTTF_UpdateText = define_c_func(ttf,"+TTF_UpdateText",{C_POINTER},C_BOOL)

public function TTF_UpdateText(atom text)
	return c_func(xTTF_UpdateText,{text})
end function

public constant xTTF_DestroyText = define_c_proc(ttf,"+TTF_DestroyText",{C_POINTER})

public procedure TTF_DestroyText(atom text)
	c_proc(xTTF_DestroyText,{text})
end procedure

public constant xTTF_CloseFont = define_c_proc(ttf,"+TTF_CloseFont",{C_POINTER})

public procedure TTF_CloseFont(atom font)
	c_proc(xTTF_CloseFont,{font})
end procedure

public constant xTTF_Quit = define_c_proc(ttf,"+TTF_Quit",{})

public procedure TTF_Quit()
	c_proc(xTTF_Quit,{})
end procedure

public constant xTTF_WasInit = define_c_func(ttf,"+TTF_WasInit",{},C_INT)

public function TTF_WasInit()
	return c_func(xTTF_WasInit,{})
end function
­61.12