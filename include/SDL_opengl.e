include std/ffi.e
include std/os.e
include std/machine.e

public atom gl = 0

ifdef WINDOWS then
	gl = open_dll("opengl32.dll")
end ifdef

if gl = -1 then
	puts(1,"Failed to load OpenGL!\n")
	abort(0)
end if

public constant GL_VERSION_1_1 = 1,
				GL_VERSION_1_2 = 1,
				GL_VERSION_1_3 = 1,
				GL_ARB_imaging = 1
			
----------------------------------	
--GL datatypes
--GLenum - C_UINT
--Glboolean - C_UCHAR
--GLbitfield - C_UINT
--GLvoid - C_VOID
--GLbyte - C_CHAR
--GLshort - C_SHORT
--GLint - C_INT
--GLubyte - C_UCHAR
--GLushort - C_USHORT
--GLuint - C_UINT
--Glsizei - C_INT
--GLfloat - C_FLOAT
--GLclampf - C_FLOAT
--GLdouble - C_DOUBLE
--GLclampd - C_DOUBLE
----------------------------------

--Boolean
public constant GL_FALSE = 0,
				GL_TRUE = 1
		
--Data types		
public constant GL_BYTE = 0x1400,
				GL_UNSIGNED_BYTE = 0x1401,
				GL_SHORT = 0x1402,
				GL_UNSIGNED_SHORT = 0x1403,
				GL_INT = 0x1404,
				GL_UNSIGNED_INT = 0x1405,
				GL_FLOAT = 0x1406,
				GL_2_BYTES = 0x1407,
				GL_3_BYTES = 0x1408,
				GL_4_BYTES = 0x1409,
				GL_DOUBLE = 0x140A
				
--Primitives
public constant GL_POINTS = 0x0000,
				GL_LINES = 0x0001,
				GL_LINE_LOOP = 0x0002,
				GL_LINE_STRIP = 0x0003,
				GL_TRIANGLES = 0x0004,
				GL_TRIANGLE_STRIP = 0x0005,
				GL_TRIANGLE_FAN = 0x0006,
				GL_QUADS = 0x0007,
				GL_QUAD_STRIP = 0x0008,
				GL_POLYGON = 0x0009
				
--Vertex Arrays
public constant GL_VERTEX_ARRAY	=			0x8074
public constant GL_NORMAL_ARRAY	=			0x8075
public constant GL_COLOR_ARRAY	=			0x8076
public constant GL_INDEX_ARRAY	=			0x8077
public constant GL_TEXTURE_COORD_ARRAY =			0x8078
public constant GL_EDGE_FLAG_ARRAY	=		0x8079
public constant GL_VERTEX_ARRAY_SIZE=			0x807A
public constant GL_VERTEX_ARRAY_TYPE=			0x807B
public constant GL_VERTEX_ARRAY_STRIDE=			0x807C
public constant GL_NORMAL_ARRAY_TYPE=			0x807E
public constant GL_NORMAL_ARRAY_STRIDE=			0x807F
public constant GL_COLOR_ARRAY_SIZE	=		0x8081
public constant GL_COLOR_ARRAY_TYPE	=		0x8082
public constant GL_COLOR_ARRAY_STRIDE=			0x8083
public constant GL_INDEX_ARRAY_TYPE	=		0x8085
public constant GL_INDEX_ARRAY_STRIDE=			0x8086
public constant GL_TEXTURE_COORD_ARRAY_SIZE=		0x8088
public constant GL_TEXTURE_COORD_ARRAY_TYPE	=	0x8089
public constant GL_TEXTURE_COORD_ARRAY_STRIDE=		0x808A
public constant GL_EDGE_FLAG_ARRAY_STRIDE=		0x808C
public constant GL_VERTEX_ARRAY_POINTER	=		0x808E
public constant GL_NORMAL_ARRAY_POINTER	=		0x808F
public constant GL_COLOR_ARRAY_POINTER	=		0x8090
public constant GL_INDEX_ARRAY_POINTER	=		0x8091
public constant GL_TEXTURE_COORD_ARRAY_POINTER	=	0x8092
public constant GL_EDGE_FLAG_ARRAY_POINTER	=	0x8093
public constant GL_V2F	=				0x2A20
public constant GL_V3F	=				0x2A21
public constant GL_C4UB_V2F	=			0x2A22
public constant GL_C4UB_V3F	=			0x2A23
public constant GL_C3F_V3F	=			0x2A24
public constant GL_N3F_V3F	=			0x2A25
public constant GL_C4F_N3F_V3F=				0x2A26
public constant GL_T2F_V3F	=			0x2A27
public constant GL_T4F_V4F	=			0x2A28
public constant GL_T2F_C4UB_V3F=				0x2A29
public constant GL_T2F_C3F_V3F	=			0x2A2A
public constant GL_T2F_N3F_V3F	=			0x2A2B
public constant GL_T2F_C4F_N3F_V3F=			0x2A2C
public constant GL_T4F_C4F_N3F_V4F=			0x2A2D

--/* Matrix Mode */
public constant GL_MATRIX_MODE=				0x0BA0
public constant GL_MODELVIEW=				0x1700
public constant GL_PROJECTION=				0x1701
public constant GL_TEXTURE=				0x1702

--/* Points */
public constant GL_POINT_SMOOTH=				0x0B10
public constant GL_POINT_SIZE	=			0x0B11
public constant GL_POINT_SIZE_GRANULARITY= 		0x0B13
public constant GL_POINT_SIZE_RANGE		=	0x0B12

--/* Lines */
public constant GL_LINE_SMOOTH=				0x0B20
public constant GL_LINE_STIPPLE=				0x0B24
public constant GL_LINE_STIPPLE_PATTERN=			0x0B25
public constant GL_LINE_STIPPLE_REPEAT=			0x0B26
public constant GL_LINE_WIDTH		=		0x0B21
public constant GL_LINE_WIDTH_GRANULARITY=		0x0B23
public constant GL_LINE_WIDTH_RANGE	=		0x0B22

--/* Polygons */
public constant GL_POINT=				0x1B00
public constant GL_LINE	=				0x1B01
public constant GL_FILL	=				0x1B02
public constant GL_CW	=				0x0900
public constant GL_CCW	=				0x0901
public constant GL_FRONT=				0x0404
public constant GL_BACK	=				0x0405
public constant GL_POLYGON_MODE=				0x0B40
public constant GL_POLYGON_SMOOTH=			0x0B41
public constant GL_POLYGON_STIPPLE=			0x0B42
public constant GL_EDGE_FLAG=				0x0B43
public constant GL_CULL_FACE=				0x0B44
public constant GL_CULL_FACE_MODE=			0x0B45
public constant GL_FRONT_FACE=				0x0B46
public constant GL_POLYGON_OFFSET_FACTOR=		0x8038
public constant GL_POLYGON_OFFSET_UNITS	=		0x2A00
public constant GL_POLYGON_OFFSET_POINT	=		0x2A01
public constant GL_POLYGON_OFFSET_LINE=			0x2A02
public constant GL_POLYGON_OFFSET_FILL=			0x8037

--/* Display Lists */
public constant GL_COMPILE	=			0x1300
public constant GL_COMPILE_AND_EXECUTE=			0x1301
public constant GL_LIST_BASE		=		0x0B32
public constant GL_LIST_INDEX		=		0x0B33
public constant GL_LIST_MODE		=		0x0B30

--/* Depth buffer */
public constant GL_NEVER=				0x0200
public constant GL_LESS	=				0x0201
public constant GL_EQUAL=				0x0202
public constant GL_LEQUAL=				0x0203
public constant GL_GREATER=				0x0204
public constant GL_NOTEQUAL=				0x0205
public constant GL_GEQUAL	=			0x0206
public constant GL_ALWAYS	=			0x0207
public constant GL_DEPTH_TEST=				0x0B71
public constant GL_DEPTH_BITS=				0x0D56
public constant GL_DEPTH_CLEAR_VALUE=			0x0B73
public constant GL_DEPTH_FUNC		=		0x0B74
public constant GL_DEPTH_RANGE		=		0x0B70
public constant GL_DEPTH_WRITEMASK	=		0x0B72
public constant GL_DEPTH_COMPONENT	=		0x1902

--/* Lighting */
public constant GL_LIGHTING	=			0x0B50
public constant GL_LIGHT0	=			0x4000
public constant GL_LIGHT1	=			0x4001
public constant GL_LIGHT2	=			0x4002
public constant GL_LIGHT3	=			0x4003
public constant GL_LIGHT4	=			0x4004
public constant GL_LIGHT5	=			0x4005
public constant GL_LIGHT6	=			0x4006
public constant GL_LIGHT7	=			0x4007
public constant GL_SPOT_EXPONENT=			0x1205
public constant GL_SPOT_CUTOFF	=			0x1206
public constant GL_CONSTANT_ATTENUATION=			0x1207
public constant GL_LINEAR_ATTENUATION	=		0x1208
public constant GL_QUADRATIC_ATTENUATION=		0x1209
public constant GL_AMBIENT	=			0x1200
public constant GL_DIFFUSE	=			0x1201
public constant GL_SPECULAR	=			0x1202
public constant GL_SHININESS=				0x1601
public constant GL_EMISSION	=			0x1600
public constant GL_POSITION	=			0x1203
public constant GL_SPOT_DIRECTION=			0x1204
public constant GL_AMBIENT_AND_DIFFUSE=			0x1602
public constant GL_COLOR_INDEXES	=		0x1603
public constant GL_LIGHT_MODEL_TWO_SIDE=			0x0B52
public constant GL_LIGHT_MODEL_LOCAL_VIEWER=		0x0B51
public constant GL_LIGHT_MODEL_AMBIENT		=	0x0B53
public constant GL_FRONT_AND_BACK	=		0x0408
public constant GL_SHADE_MODEL	=			0x0B54
public constant GL_FLAT			=		0x1D00
public constant GL_SMOOTH		=		0x1D01
public constant GL_COLOR_MATERIAL	=		0x0B57
public constant GL_COLOR_MATERIAL_FACE=			0x0B55
public constant GL_COLOR_MATERIAL_PARAMETER=		0x0B56
public constant GL_NORMALIZE	=			0x0BA1

--/* User clipping planes */
public constant GL_CLIP_PLANE0	=			0x3000
public constant GL_CLIP_PLANE1	=			0x3001
public constant GL_CLIP_PLANE2	=			0x3002
public constant GL_CLIP_PLANE3	=			0x3003
public constant GL_CLIP_PLANE4	=			0x3004
public constant GL_CLIP_PLANE5	=			0x3005

--/* Accumulation buffer */
public constant GL_ACCUM_RED_BITS=			0x0D58
public constant GL_ACCUM_GREEN_BITS=			0x0D59
public constant GL_ACCUM_BLUE_BITS	=		0x0D5A
public constant GL_ACCUM_ALPHA_BITS	=		0x0D5B
public constant GL_ACCUM_CLEAR_VALUE=			0x0B80
public constant GL_ACCUM	=			0x0100
public constant GL_ADD		=			0x0104
public constant GL_LOAD		=			0x0101
public constant GL_MULT		=			0x0103
public constant GL_RETURN	=			0x0102

--/* Alpha testing */
public constant GL_ALPHA_TEST	=			0x0BC0
public constant GL_ALPHA_TEST_REF=			0x0BC2
public constant GL_ALPHA_TEST_FUNC	=		0x0BC1

--/* Blending */
public constant GL_BLEND	=			0x0BE2
public constant GL_BLEND_SRC=				0x0BE1
public constant GL_BLEND_DST=				0x0BE0
public constant GL_ZERO		=			0
public constant GL_ONE		=			1
public constant GL_SRC_COLOR=				0x0300
public constant GL_ONE_MINUS_SRC_COLOR	=		0x0301
public constant GL_SRC_ALPHA			=	0x0302
public constant GL_ONE_MINUS_SRC_ALPHA	=		0x0303
public constant GL_DST_ALPHA			=	0x0304
public constant GL_ONE_MINUS_DST_ALPHA	=		0x0305
public constant GL_DST_COLOR			=	0x0306
public constant GL_ONE_MINUS_DST_COLOR	=		0x0307
public constant GL_SRC_ALPHA_SATURATE	=		0x0308

--/* Render Mode */
public constant GL_FEEDBACK	=			0x1C01
public constant GL_RENDER=				0x1C00
public constant GL_SELECT=				0x1C02

--/* Feedback */
public constant GL_2D=					0x0600
public constant GL_3D=					0x0601
public constant GL_3D_COLOR=				0x0602
public constant GL_3D_COLOR_TEXTURE=			0x0603
public constant GL_4D_COLOR_TEXTURE	=		0x0604
public constant GL_POINT_TOKEN	=			0x0701
public constant GL_LINE_TOKEN	=			0x0702
public constant GL_LINE_RESET_TOKEN	=		0x0707
public constant GL_POLYGON_TOKEN=			0x0703
public constant GL_BITMAP_TOKEN	=			0x0704
public constant GL_DRAW_PIXEL_TOKEN	=		0x0705
public constant GL_COPY_PIXEL_TOKEN	=		0x0706
public constant GL_PASS_THROUGH_TOKEN	=		0x0700
public constant GL_FEEDBACK_BUFFER_POINTER=		0x0DF0
public constant GL_FEEDBACK_BUFFER_SIZE=			0x0DF1
public constant GL_FEEDBACK_BUFFER_TYPE	=		0x0DF2

--/* Selection */
public constant GL_SELECTION_BUFFER_POINTER	=	0x0DF3
public constant GL_SELECTION_BUFFER_SIZE	=	0x0DF4

--/* Fog */
public constant GL_FOG	=				0x0B60
public constant GL_FOG_MODE=				0x0B65
public constant GL_FOG_DENSITY=				0x0B62
public constant GL_FOG_COLOR=				0x0B66
public constant GL_FOG_INDEX=				0x0B61
public constant GL_FOG_START=				0x0B63
public constant GL_FOG_END	=			0x0B64
public constant GL_LINEAR	=			0x2601
public constant GL_EXP		=			0x0800
public constant GL_EXP2		=			0x0801

--/* Logic Ops */
public constant GL_LOGIC_OP	=			0x0BF1
public constant GL_INDEX_LOGIC_OP=			0x0BF1
public constant GL_COLOR_LOGIC_OP=			0x0BF2
public constant GL_LOGIC_OP_MODE=			0x0BF0
public constant GL_CLEAR		=		0x1500
public constant GL_SET			=		0x150F
public constant GL_COPY			=		0x1503
public constant GL_COPY_INVERTED	=		0x150C
public constant GL_NOOP	=				0x1505
public constant GL_INVERT	=			0x150A
public constant GL_AND		=			0x1501
public constant GL_NAND		=			0x150E
public constant GL_OR		=			0x1507
public constant GL_NOR		=			0x1508
public constant GL_XOR		=			0x1506
public constant GL_EQUIV	=			0x1509
public constant GL_AND_REVERSE=				0x1502
public constant GL_AND_INVERTED=				0x1504
public constant GL_OR_REVERSE	=			0x150B
public constant GL_OR_INVERTED	=			0x150D

--/* Stencil */
public constant GL_STENCIL_BITS	=			0x0D57
public constant GL_STENCIL_TEST	=			0x0B90
public constant GL_STENCIL_CLEAR_VALUE	=		0x0B91
public constant GL_STENCIL_FUNC	=			0x0B92
public constant GL_STENCIL_VALUE_MASK	=		0x0B93
public constant GL_STENCIL_FAIL	=			0x0B94
public constant GL_STENCIL_PASS_DEPTH_FAIL=		0x0B95
public constant GL_STENCIL_PASS_DEPTH_PASS=		0x0B96
public constant GL_STENCIL_REF	=			0x0B97
public constant GL_STENCIL_WRITEMASK=			0x0B98
public constant GL_STENCIL_INDEX	=		0x1901
public constant GL_KEEP	=				0x1E00
public constant GL_REPLACE=				0x1E01
public constant GL_INCR	=				0x1E02
public constant GL_DECR	=				0x1E03

--/* Buffers, Pixel Drawing/Reading */
public constant GL_NONE	=				0
public constant GL_LEFT	=				0x0406
public constant GL_RIGHT=				0x0407
--/*GL_FRONT					0x0404 */
--/*GL_BACK					0x0405 */
--/*GL_FRONT_AND_BACK				0x0408 */
public constant GL_FRONT_LEFT =				0x0400
public constant GL_FRONT_RIGHT=				0x0401
public constant GL_BACK_LEFT=				0x0402
public constant GL_BACK_RIGHT=				0x0403
public constant GL_AUX0		=			0x0409
public constant GL_AUX1		=			0x040A
public constant GL_AUX2		=			0x040B
public constant GL_AUX3		=			0x040C
public constant GL_COLOR_INDEX	=			0x1900
public constant GL_RED		=			0x1903
public constant GL_GREEN	=			0x1904
public constant GL_BLUE		=			0x1905
public constant GL_ALPHA	=			0x1906
public constant GL_LUMINANCE	=			0x1909
public constant GL_LUMINANCE_ALPHA	=		0x190A
public constant GL_ALPHA_BITS	=			0x0D55
public constant GL_RED_BITS		=		0x0D52
public constant GL_GREEN_BITS	=			0x0D53
public constant GL_BLUE_BITS	=			0x0D54
public constant GL_INDEX_BITS	=			0x0D51
public constant GL_SUBPIXEL_BITS	=		0x0D50
public constant GL_AUX_BUFFERS		=		0x0C00
public constant GL_READ_BUFFER		=		0x0C02
public constant GL_DRAW_BUFFER		=		0x0C01
public constant GL_DOUBLEBUFFER		=		0x0C32
public constant GL_STEREO			=	0x0C33
public constant GL_BITMAP			=	0x1A00
public constant GL_COLOR			=	0x1800
public constant GL_DEPTH			=	0x1801
public constant GL_STENCIL			=	0x1802
public constant GL_DITHER			=	0x0BD0
public constant GL_RGB				=	0x1907
public constant GL_RGBA				=	0x1908

--/* Implementation limits */
public constant GL_MAX_LIST_NESTING	=		0x0B31
public constant GL_MAX_EVAL_ORDER	=		0x0D30
public constant GL_MAX_LIGHTS		=		0x0D31
public constant GL_MAX_CLIP_PLANES	=		0x0D32
public constant GL_MAX_TEXTURE_SIZE	=		0x0D33
public constant GL_MAX_PIXEL_MAP_TABLE=			0x0D34
public constant GL_MAX_ATTRIB_STACK_DEPTH=		0x0D35
public constant GL_MAX_MODELVIEW_STACK_DEPTH=		0x0D36
public constant GL_MAX_NAME_STACK_DEPTH		=	0x0D37
public constant GL_MAX_PROJECTION_STACK_DEPTH=		0x0D38
public constant GL_MAX_TEXTURE_STACK_DEPTH	=	0x0D39
public constant GL_MAX_VIEWPORT_DIMS		=	0x0D3A
public constant GL_MAX_CLIENT_ATTRIB_STACK_DEPTH=	0x0D3B

--/* Gets */
public constant GL_ATTRIB_STACK_DEPTH =			0x0BB0
public constant GL_CLIENT_ATTRIB_STACK_DEPTH=		0x0BB1
public constant GL_COLOR_CLEAR_VALUE		=	0x0C22
public constant GL_COLOR_WRITEMASK			= 0x0C23
public constant GL_CURRENT_INDEX	=		0x0B01
public constant GL_CURRENT_COLOR	=		0x0B00
public constant GL_CURRENT_NORMAL	=		0x0B02
public constant GL_CURRENT_RASTER_COLOR	=		0x0B04
public constant GL_CURRENT_RASTER_DISTANCE=		0x0B09
public constant GL_CURRENT_RASTER_INDEX	=		0x0B05
public constant GL_CURRENT_RASTER_POSITION	=	0x0B07
public constant GL_CURRENT_RASTER_TEXTURE_COORDS=	0x0B06
public constant GL_CURRENT_RASTER_POSITION_VALID=	0x0B08
public constant GL_CURRENT_TEXTURE_COORDS=		0x0B03
public constant GL_INDEX_CLEAR_VALUE=			0x0C20
public constant GL_INDEX_MODE		=		0x0C30
public constant GL_INDEX_WRITEMASK	=		0x0C21
public constant GL_MODELVIEW_MATRIX	=		0x0BA6
public constant GL_MODELVIEW_STACK_DEPTH	=	0x0BA3
public constant GL_NAME_STACK_DEPTH	=		0x0D70
public constant GL_PROJECTION_MATRIX=			0x0BA7
public constant GL_PROJECTION_STACK_DEPTH=		0x0BA4
public constant GL_RENDER_MODE		=		0x0C40
public constant GL_RGBA_MODE		=		0x0C31
public constant GL_TEXTURE_MATRIX	=		0x0BA8
public constant GL_TEXTURE_STACK_DEPTH	=		0x0BA5
public constant GL_VIEWPORT		=		0x0BA2

--/* Evaluators */
public constant GL_AUTO_NORMAL	=			0x0D80
public constant GL_MAP1_COLOR_4	=			0x0D90
public constant GL_MAP1_INDEX	=			0x0D91
public constant GL_MAP1_NORMAL	=			0x0D92
public constant GL_MAP1_TEXTURE_COORD_1=			0x0D93
public constant GL_MAP1_TEXTURE_COORD_2	=		0x0D94
public constant GL_MAP1_TEXTURE_COORD_3	=		0x0D95
public constant GL_MAP1_TEXTURE_COORD_4	=		0x0D96
public constant GL_MAP1_VERTEX_3=			0x0D97
public constant GL_MAP1_VERTEX_4=			0x0D98
public constant GL_MAP2_COLOR_4	=			0x0DB0
public constant GL_MAP2_INDEX	=			0x0DB1
public constant GL_MAP2_NORMAL	=			0x0DB2
public constant GL_MAP2_TEXTURE_COORD_1	=		0x0DB3
public constant GL_MAP2_TEXTURE_COORD_2	=		0x0DB4
public constant GL_MAP2_TEXTURE_COORD_3	=		0x0DB5
public constant GL_MAP2_TEXTURE_COORD_4	=		0x0DB6
public constant GL_MAP2_VERTEX_3	=		0x0DB7
public constant GL_MAP2_VERTEX_4	=		0x0DB8
public constant GL_MAP1_GRID_DOMAIN	=		0x0DD0
public constant GL_MAP1_GRID_SEGMENTS=			0x0DD1
public constant GL_MAP2_GRID_DOMAIN	=		0x0DD2
public constant GL_MAP2_GRID_SEGMENTS=			0x0DD3
public constant GL_COEFF	=			0x0A00
public constant GL_ORDER	=			0x0A01
public constant GL_DOMAIN	=			0x0A02

--/* Hints */
public constant GL_PERSPECTIVE_CORRECTION_HINT=		0x0C50
public constant GL_POINT_SMOOTH_HINT	=		0x0C51
public constant GL_LINE_SMOOTH_HINT	=		0x0C52
public constant GL_POLYGON_SMOOTH_HINT=			0x0C53
public constant GL_FOG_HINT	=			0x0C54
public constant GL_DONT_CARE=				0x1100
public constant GL_FASTEST	=			0x1101
public constant GL_NICEST	=			0x1102

--/* Scissor box */
public constant GL_SCISSOR_BOX	=			0x0C10
public constant GL_SCISSOR_TEST	=			0x0C11

--/* Pixel Mode / Transfer */
public constant GL_MAP_COLOR =				0x0D10
public constant GL_MAP_STENCIL	=			0x0D11
public constant GL_INDEX_SHIFT	=			0x0D12
public constant GL_INDEX_OFFSET	=			0x0D13
public constant GL_RED_SCALE=				0x0D14
public constant GL_RED_BIAS	=			0x0D15
public constant GL_GREEN_SCALE	=			0x0D18
public constant GL_GREEN_BIAS	=			0x0D19
public constant GL_BLUE_SCALE	=			0x0D1A
public constant GL_BLUE_BIAS	=			0x0D1B
public constant GL_ALPHA_SCALE	=			0x0D1C
public constant GL_ALPHA_BIAS	=			0x0D1D
public constant GL_DEPTH_SCALE	=			0x0D1E
public constant GL_DEPTH_BIAS	=			0x0D1F
public constant GL_PIXEL_MAP_S_TO_S_SIZE=		0x0CB1
public constant GL_PIXEL_MAP_I_TO_I_SIZE=		0x0CB0
public constant GL_PIXEL_MAP_I_TO_R_SIZE=		0x0CB2
public constant GL_PIXEL_MAP_I_TO_G_SIZE=		0x0CB3
public constant GL_PIXEL_MAP_I_TO_B_SIZE=		0x0CB4
public constant GL_PIXEL_MAP_I_TO_A_SIZE=		0x0CB5
public constant GL_PIXEL_MAP_R_TO_R_SIZE=		0x0CB6
public constant GL_PIXEL_MAP_G_TO_G_SIZE=		0x0CB7
public constant GL_PIXEL_MAP_B_TO_B_SIZE=		0x0CB8
public constant GL_PIXEL_MAP_A_TO_A_SIZE=		0x0CB9
public constant GL_PIXEL_MAP_S_TO_S	=		0x0C71
public constant GL_PIXEL_MAP_I_TO_I	=		0x0C70
public constant GL_PIXEL_MAP_I_TO_R	=		0x0C72
public constant GL_PIXEL_MAP_I_TO_G	=		0x0C73
public constant GL_PIXEL_MAP_I_TO_B	=		0x0C74
public constant GL_PIXEL_MAP_I_TO_A	=		0x0C75
public constant GL_PIXEL_MAP_R_TO_R	=		0x0C76
public constant GL_PIXEL_MAP_G_TO_G	=		0x0C77
public constant GL_PIXEL_MAP_B_TO_B	=		0x0C78
public constant GL_PIXEL_MAP_A_TO_A	=		0x0C79
public constant GL_PACK_ALIGNMENT	=		0x0D05
public constant GL_PACK_LSB_FIRST	=		0x0D01
public constant GL_PACK_ROW_LENGTH	=		0x0D02
public constant GL_PACK_SKIP_PIXELS	=		0x0D04
public constant GL_PACK_SKIP_ROWS	=		0x0D03
public constant GL_PACK_SWAP_BYTES	=		0x0D00
public constant GL_UNPACK_ALIGNMENT	=		0x0CF5
public constant GL_UNPACK_LSB_FIRST	=		0x0CF1
public constant GL_UNPACK_ROW_LENGTH=			0x0CF2
public constant GL_UNPACK_SKIP_PIXELS=			0x0CF4
public constant GL_UNPACK_SKIP_ROWS	=		0x0CF3
public constant GL_UNPACK_SWAP_BYTES=			0x0CF0
public constant GL_ZOOM_X			=	0x0D16
public constant GL_ZOOM_Y			=	0x0D17

--/* Texture mapping */
public constant GL_TEXTURE_ENV	=			0x2300
public constant GL_TEXTURE_ENV_MODE=			0x2200
public constant GL_TEXTURE_1D		=		0x0DE0
public constant GL_TEXTURE_2D		=		0x0DE1
public constant GL_TEXTURE_WRAP_S	=		0x2802
public constant GL_TEXTURE_WRAP_T	=		0x2803
public constant GL_TEXTURE_MAG_FILTER	=		0x2800
public constant GL_TEXTURE_MIN_FILTER	=		0x2801
public constant GL_TEXTURE_ENV_COLOR	=		0x2201
public constant GL_TEXTURE_GEN_S		=	0x0C60
public constant GL_TEXTURE_GEN_T		=	0x0C61
public constant GL_TEXTURE_GEN_R		=	0x0C62
public constant GL_TEXTURE_GEN_Q		=	0x0C63
public constant GL_TEXTURE_GEN_MODE		=	0x2500
public constant GL_TEXTURE_BORDER_COLOR	=		0x1004
public constant GL_TEXTURE_WIDTH		=	0x1000
public constant GL_TEXTURE_HEIGHT		=	0x1001
public constant GL_TEXTURE_BORDER		=	0x1005
public constant GL_TEXTURE_COMPONENTS	=		0x1003
public constant GL_TEXTURE_RED_SIZE		=	0x805C
public constant GL_TEXTURE_GREEN_SIZE	=		0x805D
public constant GL_TEXTURE_BLUE_SIZE	=		0x805E
public constant GL_TEXTURE_ALPHA_SIZE	=		0x805F
public constant GL_TEXTURE_LUMINANCE_SIZE=		0x8060
public constant GL_TEXTURE_INTENSITY_SIZE=		0x8061
public constant GL_NEAREST_MIPMAP_NEAREST=		0x2700
public constant GL_NEAREST_MIPMAP_LINEAR=		0x2702
public constant GL_LINEAR_MIPMAP_NEAREST=		0x2701
public constant GL_LINEAR_MIPMAP_LINEAR	=		0x2703
public constant GL_OBJECT_LINEAR		=	0x2401
public constant GL_OBJECT_PLANE			=	0x2501
public constant GL_EYE_LINEAR			=	0x2400
public constant GL_EYE_PLANE			=	0x2502
public constant GL_SPHERE_MAP			=	0x2402
public constant GL_DECAL			=	0x2101
public constant GL_MODULATE			=	0x2100
public constant GL_NEAREST			=	0x2600
public constant GL_REPEAT			=	0x2901
public constant GL_CLAMP			=	0x2900
public constant GL_S				=	0x2000
public constant GL_T				=	0x2001
public constant GL_R				=	0x2002
public constant GL_Q				=	0x2003

--/* Utility */
public constant GL_VENDOR	=			0x1F00
public constant GL_RENDERER	=			0x1F01
public constant GL_VERSION	=			0x1F02
public constant GL_EXTENSIONS	=			0x1F03

--/* Errors */
public constant GL_NO_ERROR =				0
public constant GL_INVALID_ENUM=				0x0500
public constant GL_INVALID_VALUE=			0x0501
public constant GL_INVALID_OPERATION=			0x0502
public constant GL_STACK_OVERFLOW	=		0x0503
public constant GL_STACK_UNDERFLOW	=		0x0504
public constant GL_OUT_OF_MEMORY=			0x0505

--/* glPush/PopAttrib bits */
public constant GL_CURRENT_BIT	=			0x00000001
public constant GL_POINT_BIT	=			0x00000002
public constant GL_LINE_BIT		=		0x00000004
public constant GL_POLYGON_BIT	=			0x00000008
public constant GL_POLYGON_STIPPLE_BIT	=		0x00000010
public constant GL_PIXEL_MODE_BIT		=	0x00000020
public constant GL_LIGHTING_BIT			=	0x00000040
public constant GL_FOG_BIT			=	0x00000080
public constant GL_DEPTH_BUFFER_BIT	=		0x00000100
public constant GL_ACCUM_BUFFER_BIT	=		0x00000200
public constant GL_STENCIL_BUFFER_BIT	=		0x00000400
public constant GL_VIEWPORT_BIT		=		0x00000800
public constant GL_TRANSFORM_BIT	=		0x00001000
public constant GL_ENABLE_BIT		=		0x00002000
public constant GL_COLOR_BUFFER_BIT	=		0x00004000
public constant GL_HINT_BIT			=	0x00008000
public constant GL_EVAL_BIT			=	0x00010000
public constant GL_LIST_BIT			=	0x00020000
public constant GL_TEXTURE_BIT		=		0x00040000
public constant GL_SCISSOR_BIT		=		0x00080000
public constant GL_ALL_ATTRIB_BITS	=		0x000FFFFF


--/* OpenGL 1.1 */
public constant GL_PROXY_TEXTURE_1D	=		0x8063
public constant GL_PROXY_TEXTURE_2D	=		0x8064
public constant GL_TEXTURE_PRIORITY	=		0x8066
public constant GL_TEXTURE_RESIDENT	=		0x8067
public constant GL_TEXTURE_BINDING_1D=			0x8068
public constant GL_TEXTURE_BINDING_2D=			0x8069
public constant GL_TEXTURE_INTERNAL_FORMAT=		0x1003
public constant GL_ALPHA4	=			0x803B
public constant GL_ALPHA8	=			0x803C
public constant GL_ALPHA12	=			0x803D
public constant GL_ALPHA16	=			0x803E
public constant GL_LUMINANCE4	=			0x803F
public constant GL_LUMINANCE8	=			0x8040
public constant GL_LUMINANCE12	=			0x8041
public constant GL_LUMINANCE16	=			0x8042
public constant GL_LUMINANCE4_ALPHA4	=		0x8043
public constant GL_LUMINANCE6_ALPHA2	=		0x8044
public constant GL_LUMINANCE8_ALPHA8	=		0x8045
public constant GL_LUMINANCE12_ALPHA4	=		0x8046
public constant GL_LUMINANCE12_ALPHA12	=		0x8047
public constant GL_LUMINANCE16_ALPHA16	=		0x8048
public constant GL_INTENSITY		=		0x8049
public constant GL_INTENSITY4		=		0x804A
public constant GL_INTENSITY8		=		0x804B
public constant GL_INTENSITY12		=		0x804C
public constant GL_INTENSITY16		=		0x804D
public constant GL_R3_G3_B2		=		0x2A10
public constant GL_RGB4			=		0x804F
public constant GL_RGB5			=		0x8050
public constant GL_RGB8			=		0x8051
public constant GL_RGB10		=		0x8052
public constant GL_RGB12		=		0x8053
public constant GL_RGB16		=		0x8054
public constant GL_RGBA2		=		0x8055
public constant GL_RGBA4		=		0x8056
public constant GL_RGB5_A1		=		0x8057
public constant GL_RGBA8		=		0x8058
public constant GL_RGB10_A2		=		0x8059
public constant GL_RGBA12		=		0x805A
public constant GL_RGBA16		=		0x805B
public constant GL_CLIENT_PIXEL_STORE_BIT=		0x00000001
public constant GL_CLIENT_VERTEX_ARRAY_BIT=		0x00000002
public constant GL_ALL_CLIENT_ATTRIB_BITS =		0xFFFFFFFF
public constant GL_CLIENT_ALL_ATTRIB_BITS =		0xFFFFFFFF
				
--Functions

public constant xglClearIndex = define_c_proc(gl,"+glClearIndex",{C_FLOAT})

public procedure glClearIndex(atom c)
	c_proc(xglClearIndex,{c})
end procedure

public constant xglClearColor = define_c_proc(gl,"+glClearColor",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure glClearColor(atom r,atom g,atom b,atom a)
	c_proc(xglClearColor,{r,g,b,a})
end procedure

public constant xglClear = define_c_proc(gl,"+glClear",{C_UINT})

public procedure glClear(atom mask)
	c_proc(xglClear,{mask})
end procedure

public constant xglIndexMask = define_c_proc(gl,"+glIndexMask",{C_UINT})

public procedure glIndexMask(atom mask)
	c_proc(xglIndexMask,{mask})
end procedure 

public constant xglColorMask = define_c_proc(gl,"+glColorMask",{C_UCHAR,C_UCHAR,C_UCHAR,C_UCHAR})

public procedure glColorMask(atom r,atom g,atom b,atom a)
	c_proc(xglColorMask,{r,g,b,a})
end procedure

public constant xglAlphaFunc = define_c_proc(gl,"+glAlphaFunc",{C_UINT,C_FLOAT})

public procedure glAlphaFunc(atom func,atom ref)
	c_proc(xglAlphaFunc,{func,ref})
end procedure

public constant xglBlendFunc = define_c_proc(gl,"+glBlendFunc",{C_UINT,C_UINT})

public procedure glBlendFunc(atom sfactor,atom dfactor)
	c_proc(xglBlendFunc,{sfactor,dfactor})
end procedure

public constant xglLogicOp = define_c_proc(gl,"+glLogicOp",{C_UINT})

public procedure glLogicOp(atom opcode)
	c_proc(xglLogicOp,{opcode})
end procedure

public constant xglCullFace = define_c_proc(gl,"+glCullFace",{C_UINT})

public procedure glCullFace(atom mode)
	c_proc(xglCullFace,{mode})
end procedure

public constant xglFrontFace = define_c_proc(gl,"+glFrontFace",{C_UINT})

public procedure glFrontFace(atom mode)
	c_proc(xglFrontFace,{mode})
end procedure

public constant xglPointSize = define_c_proc(gl,"+glPointSize",{C_FLOAT})

public procedure glPointSize(atom size)
	c_proc(xglPointSize,{size})
end procedure

public constant xglLineWidth = define_c_proc(gl,"+glLineWidth",{C_FLOAT})

public procedure glLineWidth(atom width)
	c_proc(xglLineWidth,{width})
end procedure

public constant xglLineStipple = define_c_proc(gl,"+glLineStipple",{C_INT,C_USHORT})

public procedure glLineStipple(atom factor,atom pattern)
	c_proc(xglLineStipple,{factor,pattern})
end procedure

public constant xglPolygonMode = define_c_proc(gl,"+glPolygonMode",{C_UINT,C_UINT})

public procedure glPolygonMode(atom face,atom mode)
	c_proc(xglPolygonMode,{face,mode})
end procedure

public constant xglPolygonOffset = define_c_proc(gl,"+glPolygonOffset",{C_FLOAT,C_FLOAT})

public procedure glPolygonOffset(atom factor,atom units)
	c_proc(xglPolygonOffset,{factor,units})
end procedure

public constant xglPolygonStipple = define_c_proc(gl,"+glPolygonStipple",{C_POINTER})

public procedure glPolygonStipple(atom mask)
	c_proc(xglPolygonStipple,{mask})
end procedure

public constant xglGetPolygonStipple = define_c_proc(gl,"+glGetPolygonStipple",{C_POINTER})

public procedure glGetPolygonStipple(atom mask)
	c_proc(xglGetPolygonStipple,{mask})
end procedure

public constant xglEdgeFlag = define_c_proc(gl,"+glEdgeFlag",{C_UCHAR})

public procedure glEdgeFlag(atom flag)
	c_proc(xglEdgeFlag,{flag})
end procedure

public constant xglEdgeFlagv = define_c_proc(gl,"+glEdgeFlagv",{C_POINTER})

public procedure glEdgeFlagv(atom flag)
	c_proc(xglEdgeFlagv,{flag})
end procedure

public constant xglScissor = define_c_proc(gl,"+glScissor",{C_INT,C_INT,C_INT,C_INT})

public procedure glScissor(atom x,atom y,atom w,atom h)
	c_proc(xglScissor,{x,y,w,h})
end procedure

public constant xglClipPlane = define_c_proc(gl,"+glClipPlane",{C_UINT,C_POINTER})

public procedure glClipPlane(atom plane,atom equation)
	c_proc(xglClipPlane,{plane,equation})
end procedure

public constant xglGetClipPlane = define_c_proc(gl,"+glGetClipPlane",{C_UINT,C_POINTER})

public procedure glGetClipPlane(atom plane,atom equation)
	c_proc(xglGetClipPlane,{plane,equation})
end procedure

public constant xglDrawBuffer = define_c_proc(gl,"+glDrawBuffer",{C_UINT})

public procedure glDrawBuffer(atom mode)
	c_proc(xglDrawBuffer,{mode})
end procedure

public constant xglReadBuffer = define_c_proc(gl,"+glReadBuffer",{C_UINT})

public procedure glReadBuffer(atom mode)
	c_proc(xglReadBuffer,{mode})
end procedure

public constant xglEnable = define_c_proc(gl,"+glEnable",{C_UINT})

public procedure glEnable(atom cap)
	c_proc(xglEnable,{cap})
end procedure

public constant xglDisable = define_c_proc(gl,"+glDisable",{C_UINT})

public procedure glDisable(atom cap)
	c_proc(xglDisable,{cap})
end procedure

public constant xglIsEnabled = define_c_func(gl,"+glIsEnabled",{C_UINT},C_UCHAR)

public function glIsEnabled(atom cap)
	return c_func(xglIsEnabled,{cap})
end function

public constant xglEnableClientState = define_c_proc(gl,"+glEnableClientState",{C_UINT}),
				xglDisableClientState = define_c_proc(gl,"+glDisableClientState",{C_UINT})
				
public procedure glEnableClientState(atom cap)
	c_proc(xglEnableClientState,{cap})
end procedure

public procedure glDisableClientState(atom cap)
	c_proc(xglDisableClientState,{cap})
end procedure

public constant xglGetBooleanv = define_c_proc(gl,"+glGetBooleanv",{C_UINT,C_POINTER}),
				xglGetDoublev = define_c_proc(gl,"+glGetDoublev",{C_UINT,C_POINTER}),
				xglGetFloatv = define_c_proc(gl,"+glGetFloatv",{C_UINT,C_POINTER}),
				xglGetIntegerv = define_c_proc(gl,"+glGetIntegerv",{C_UINT,C_POINTER})
				
public procedure glGetBooleanv(atom pname,atom parms)
	c_proc(xglGetBooleanv,{pname,parms})
end procedure

public procedure glGetDoublev(atom pname,atom parm)
	c_proc(xglGetDoublev,{pname,parm})
end procedure

public procedure glGetFloatv(atom pname,atom parm)
	c_proc(xglGetFloatv,{pname,parm})
end procedure

public procedure glGetIntegerv(atom pname,atom parm)
	c_proc(xglGetIntegerv,{pname,parm})
end procedure

public constant xglPushAttrib = define_c_proc(gl,"+glPushAttrib",{C_UINT}),
				xglPopAttrib = define_c_proc(gl,"+glPopAttrib",{})
				
public procedure glPushAttrib(atom mask)
	c_proc(xglPushAttrib,{mask})
end procedure

public procedure glPopAttrib()
	c_proc(xglPopAttrib,{})
end procedure

public constant xglPushClientAttrib = define_c_proc(gl,"+glPushClientAttrib",{C_UINT}),
				xglPopClientAttrib = define_c_proc(gl,"+glPopClientAttrib",{})
				
public procedure glPushClientAttrib(atom mask)
	c_proc(xglPushClientAttrib,{mask})
end procedure

public procedure glPopClientAttrib()
	c_proc(xglPopClientAttrib,{})
end procedure

public constant xglRenderMode = define_c_func(gl,"+glRenderMode",{C_UINT},C_INT),
				xglGetError = define_c_func(gl,"+glGetError",{},C_UINT),
				xglGetString = define_c_func(gl,"+glGetString",{C_UINT},C_POINTER),
				xglFinish = define_c_proc(gl,"+glFinish",{}),
				xglFlush = define_c_proc(gl,"+glFlush",{}),
				xglHint = define_c_proc(gl,"+glHint",{C_UINT,C_UINT})
				
public function glRenderMode(atom mode)
	return c_func(xglRenderMode,{mode})
end function

public function glGetError()
	return c_func(xglGetError,{})
end function

public function glGetString(atom name)
	return c_func(xglGetString,{name})
end function

public procedure glFinish()
	c_proc(xglFinish,{})
end procedure

public procedure glFlush()
	c_proc(xglFlush,{})
end procedure

public procedure glHint(atom target,atom mode)
	c_proc(xglHint,{target,mode})
end procedure

public constant xglClearDepth = define_c_proc(gl,"+glClearDepth",{C_DOUBLE}),
				xglDepthFunc = define_c_proc(gl,"+glDepthFunc",{C_UINT}),
				xglDepthMask = define_c_proc(gl,"+glDepthMask",{C_UCHAR}),
				xglDepthRange = define_c_proc(gl,"+glDepthRange",{C_DOUBLE,C_DOUBLE})
				
public procedure glClearDepth(atom depth)
	c_proc(xglClearDepth,{depth})
end procedure

public procedure glDepthFunc(atom func)
	c_proc(xglDepthFunc,{func})
end procedure

public procedure glDepthMask(atom flag)
	c_proc(xglDepthMask,{flag})
end procedure

public procedure glDepthRange(atom near_val,atom far_val)
	c_proc(xglDepthRange,{near_val,far_val})
end procedure

public constant xglClearAccum = define_c_proc(gl,"+glClearAccum",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT}),
				xglAccum = define_c_proc(gl,"+glAccum",{C_UINT,C_FLOAT})
				
public procedure glClearAccum(atom r,atom g,atom b,atom a)
	c_proc(xglClearAccum,{r,g,b,a})
end procedure

public procedure glAccum(atom op,atom val)
	c_proc(xglAccum,{op,val})
end procedure

public constant xglMatrixMode = define_c_proc(gl,"+glMatrixMode",{C_UINT})

public procedure glMatrixMode(atom mode)
	c_proc(xglMatrixMode,{mode})
end procedure

public constant xglOrtho = define_c_proc(gl,"+glOrtho",{C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE})

public procedure glOrtho(atom left,atom right,atom bottom,atom top,atom near,atom far)
	c_proc(xglOrtho,{left,right,bottom,top,near,far})
end procedure

public constant xglFrustum = define_c_proc(gl,"+glFrustum",{C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE})

public procedure glFrustum(atom left,atom right,atom bottom,atom top,atom near,atom far)
	c_proc(xglFrustum,{left,right,bottom,top,near,far})
end procedure

public constant xglViewport = define_c_proc(gl,"+glViewport",{C_INT,C_INT,C_INT,C_INT})

public procedure glViewport(atom x,atom y,atom w,atom h)
	c_proc(xglViewport,{x,y,w,h})
end procedure

public constant xglPushMatrix = define_c_proc(gl,"+glPushMatrix",{})

public procedure glPushMatrix()
	c_proc(xglPushMatrix,{})
end procedure

public constant xglPopMatrix = define_c_proc(gl,"+glPopMatrix",{})

public procedure glPopMatrix()
	c_proc(xglPopMatrix,{})
end procedure

public constant xglLoadIdentity = define_c_proc(gl,"+glLoadIdentity",{})

public procedure glLoadIdentity()
	c_proc(xglLoadIdentity,{})
end procedure

public constant xglLoadMatrixd = define_c_proc(gl,"+glLoadMatrixd",{C_POINTER}),
				xglLoadMatrixf = define_c_proc(gl,"+glLoadMatrixf",{C_POINTER})
				
public procedure glLoadMatrixd(atom m)
	c_proc(xglLoadMatrixd,{m})
end procedure

public procedure glLoadMatrixf(atom m)
	c_proc(xglLoadMatrixf,{m})
end procedure

public constant xglMultMatrixd = define_c_proc(gl,"+glMultMatrixd",{C_POINTER}),
				xglMultMatrixf = define_c_proc(gl,"+glMultMatrixf",{C_POINTER})
				
public procedure glMultMatrixd(atom m)
	c_proc(xglMultMatrixd,{m})
end procedure

public procedure glMultMatrixf(atom m)
	c_proc(xglMultMatrixf,{m})
end procedure

public constant xglRotated = define_c_proc(gl,"+glRotated",{C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE}),
				xglRotatef = define_c_proc(gl,"+glRotatef",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})
				
public procedure glRotated(atom angle,atom x,atom y,atom z)
	c_proc(xglRotated,{angle,x,y,z})
end procedure

public procedure glRotatef(atom angle,atom x,atom y,atom z)
	c_proc(xglRotatef,{angle,x,y,z})
end procedure

public constant xglScaled = define_c_proc(gl,"+glScaled",{C_DOUBLE,C_DOUBLE,C_DOUBLE}),
				xglScalef = define_c_proc(gl,"+glScalef",{C_FLOAT,C_FLOAT,C_FLOAT})
				
public procedure glScaled(atom x,atom y,atom z)
	c_proc(xglScaled,{x,y,z})
end procedure

public procedure glScalef(atom x,atom y,atom z)
	c_proc(xglScalef,{x,y,z})
end procedure

public constant xglTranslated = define_c_proc(gl,"+glTranslated",{C_DOUBLE,C_DOUBLE,C_DOUBLE}),
				xglTranslatef = define_c_proc(gl,"+glTranslatef",{C_FLOAT,C_FLOAT,C_FLOAT})
				
public procedure glTranslated(atom x,atom y,atom z)
	c_proc(xglTranslated,{x,y,z})
end procedure

public procedure glTranslatef(atom x,atom y,atom z)
	c_proc(xglTranslatef,{x,y,z})
end procedure

public constant xglIsList = define_c_func(gl,"+glIsList",{C_UINT},C_UCHAR),
				xglDeleteLists = define_c_proc(gl,"+glDeleteLists",{C_UINT,C_INT}),
				xglGenLists = define_c_func(gl,"+glGenLists",{C_INT},C_UINT),
				xglNewList = define_c_proc(gl,"+glNewList",{C_UINT,C_UINT}),
				xglEndList = define_c_proc(gl,"+glEndList",{}),
				xglCallList = define_c_proc(gl,"+glCallList",{C_UINT}),
				xglCallLists = define_c_proc(gl,"+glCallLists",{C_INT,C_UINT,C_POINTER}),
				xglListBase = define_c_proc(gl,"+glListBase",{C_UINT})
				
public function glIsList(atom l)
	return c_func(xglIsList,{l})
end function

public procedure glDeleteLists(atom l,atom range)
	c_proc(xglDeleteLists,{l,range})
end procedure

public function glGenLists(atom range)
	return c_func(xglGenLists,{range})
end function

public procedure glNewList(atom l,atom mode)
	c_proc(xglNewList,{l,mode})
end procedure

public procedure glEndList()
	c_proc(xglEndList,{})
end procedure

public procedure glCallList(atom l)
	c_proc(xglCallList,{l})
end procedure

public procedure glCallLists(atom n,atom t,atom l)
	c_proc(xglCallLists,{n,t,l})
end procedure

public procedure glListBase(atom base)
	c_proc(xglListBase,{base})
end procedure

public constant xglBegin = define_c_proc(gl,"+glBegin",{C_UINT}),
				xglEnd = define_c_proc(gl,"+glEnd",{})
				
public procedure glBegin(atom mode)
	c_proc(xglBegin,{mode})
end procedure

public procedure glEnd()
	c_proc(xglEnd,{})
end procedure

public constant xglVertex2d = define_c_proc(gl,"+glVertex2d",{C_DOUBLE,C_DOUBLE}),
				xglVertex2f = define_c_proc(gl,"+glVertex2f",{C_FLOAT,C_FLOAT}),
				xglVertex2i = define_c_proc(gl,"+glVertex2i",{C_INT,C_INT}),
				xglVertex2s = define_c_proc(gl,"+glVertex2s",{C_SHORT,C_SHORT})
				
public procedure glVertex2d(atom x,atom y)
	c_proc(xglVertex2d,{x,y})
end procedure

public procedure glVertex2f(atom x,atom y)
	c_proc(xglVertex2f,{x,y})
end procedure

public procedure glVertex2i(atom x,atom y)
	c_proc(xglVertex2i,{x,y})
end procedure

public procedure glVertex2s(atom x,atom y)
	c_proc(xglVertex2s,{x,y})
end procedure

public constant xglVertex3d = define_c_proc(gl,"+glVertex3d",{C_DOUBLE,C_DOUBLE,C_DOUBLE}),
				xglVertex3f = define_c_proc(gl,"+glVertex3f",{C_FLOAT,C_FLOAT,C_FLOAT}),
				xglVertex3i = define_c_proc(gl,"+glVertex3i",{C_INT,C_INT,C_INT}),
				xglVertex3s = define_c_proc(gl,"+glVertex3s",{C_SHORT,C_SHORT,C_SHORT})
				
public procedure glVertex3d(atom x,atom y,atom z)
	c_proc(xglVertex3d,{x,y,z})
end procedure

public procedure glVertex3df(atom x,atom y,atom z)
	c_proc(xglVertex3df,{x,y,z})
end procedure

public procedure glVertex3i(atom x,atom y,atom z)
	c_proc(xglVertex3i,{x,y,z})
end procedure

public procedure glVertex3s(atom x,atom y,atom z)
	c_proc(xglVertex3s,{x,y,z})
end procedure

public constant xglVertex4d = define_c_proc(gl,"+glVertex4d",{C_DOUBLE,C_DOUBLE,C_DOUBLE,C_DOUBLE}),
				xglVertex4f = define_c_proc(gl,"+glVertex4f",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT}),
				xglVertex4i = define_c_proc(gl,"+glVertex4i",{C_INT,C_INT,C_INT,C_INT}),
				xglVertex4s = define_c_proc(gl,"+glVertex4s",{C_SHORT,C_SHORT,C_SHORT,C_SHORT})
				
public procedure glVertex4d(atom x,atom y,atom z,atom w)
	c_proc(xglVertex4d,{x,y,z,w})
end procedure

public procedure glVertex4f(atom x,atom y,atom z,atom w)
	c_proc(xglVertex4f,{x,y,z,w})
end procedure

public procedure glVertex4i(atom x,atom y,atom z,atom w)
	c_proc(xglVertex4i,{x,y,z,w})
end procedure

public procedure glVertex4s(atom x,atom y,atom x,atom w)
	c_proc(xglVertex4s,{x,y,z,w})
end procedure
­1129.30