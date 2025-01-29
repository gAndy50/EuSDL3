include std/ffi.e
include std/machine.e
include std/math.e

include SDL.e
include SDL_stdinc.e
include SDL_mouse.e
include SDL_touch.e

public constant SDL_PenID = C_UINT32

public constant SDL_PEN_MOUSEID = -2

public constant SDL_PEN_TOUCHID = -2

public constant SDL_PenInputFlags = C_UINT32

public constant SDL_PEN_INPUT_DOWN = shift_bits(1,0)
public constant SDL_PEN_INPUT_BUTTON_1 = shift_bits(1,-1)
public constant SDL_PEN_INPUT_BUTTON_2 = shift_bits(1,-2)
public constant SDL_PEN_INPUT_BUTTON_3 = shift_bits(1,-3)
public constant SDL_PEN_INPUT_BUTTON_4 = shift_bits(1,-4)
public constant SDL_PEN_INPUT_BUTTON_5 = shift_bits(1,-5)
public constant SDL_PEN_INPUT_ERASER_TIP = shift_bits(1,-30)

public enum type SDL_PenAxis
	SDL_PEN_AXIS_PRESSURE = 0,  /**< Pen pressure.  Unidirectional: 0 to 1.0 */
    SDL_PEN_AXIS_XTILT,     /**< Pen horizontal tilt angle.  Bidirectional: -90.0 to 90.0 (left-to-right). */
    SDL_PEN_AXIS_YTILT,     /**< Pen vertical tilt angle.  Bidirectional: -90.0 to 90.0 (top-to-down). */
    SDL_PEN_AXIS_DISTANCE,  /**< Pen distance to drawing surface.  Unidirectional: 0.0 to 1.0 */
    SDL_PEN_AXIS_ROTATION,  /**< Pen barrel rotation.  Bidirectional: -180 to 179.9 (clockwise, 0 is facing up, -180.0 is facing down). */
    SDL_PEN_AXIS_SLIDER,    /**< Pen finger wheel or slider (e.g., Airbrush Pen).  Unidirectional: 0 to 1.0 */
    SDL_PEN_AXIS_TANGENTIAL_PRESSURE,    /**< Pressure from squeezing the pen ("barrel pressure"). */
    SDL_PEN_AXIS_COUNT      -- /**< Total known pen axis types in this version of SDL. This number may grow in future releases! 
end type
­34.30