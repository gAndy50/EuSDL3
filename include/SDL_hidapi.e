include std/machine.e
include std/ffi.e

include SDL.e
include SDL_stdinc.e
include SDL_error.e

public enum type SDL_hid_bus_type
	    /** Unknown bus type */
    SDL_HID_API_BUS_UNKNOWN = 0x00,

    /** USB bus
       Specifications:
       https://usb.org/hid */
    SDL_HID_API_BUS_USB = 0x01,

    /** Bluetooth or Bluetooth LE bus
       Specifications:
       https://www.bluetooth.com/specifications/specs/human-interface-device-profile-1-1-1/
       https://www.bluetooth.com/specifications/specs/hid-service-1-0/
       https://www.bluetooth.com/specifications/specs/hid-over-gatt-profile-1-0/ */
    SDL_HID_API_BUS_BLUETOOTH = 0x02,

    /** I2C bus
       Specifications:
       https://docs.microsoft.com/previous-versions/windows/hardware/design/dn642101(v=vs.85) */
    SDL_HID_API_BUS_I2C = 0x03,

    /** SPI bus
       Specifications:
       https://www.microsoft.com/download/details.aspx?id=103325 */
    SDL_HID_API_BUS_SPI = 0x04
end type

public constant SDL_hid_device_info = define_c_struct({
	C_STRING, --path
	C_USHORT, --vendor_id
	C_USHORT, --product_id
	C_WSTRING, --serial_number
	C_USHORT, --release_number
	C_WSTRING, --manufacturer_string
	C_WSTRING, --product_string
	C_USHORT, --usage_page
	C_USHORT, --usage
	C_INT, --interface_number
	C_INT, --interface_class
	C_INT, --interface_subclass
	C_INT, --interface_potocol
	C_INT, --bus_type
	C_POINTER --next
})

public constant xSDL_hid_init = define_c_func(sdl,"+SDL_hid_init",{},C_INT)

public function SDL_hid_init()
	return c_func(xSDL_hid_init,{})
end function

public constant xSDL_hid_exit = define_c_func(sdl,"+SDL_hid_exit",{},C_INT)

public function SDL_hid_exit()
	return c_func(xSDL_hid_exit,{})
end function

public constant xSDL_hid_device_change_count = define_c_func(sdl,"+SDL_hid_device_change_count",{},C_UINT32)

public function SDL_hid_device_change_count()
	return c_func(xSDL_hid_device_change_count,{})
end function

public constant xSDL_hid_enumerate = define_c_func(sdl,"+SDL_hid_enumerate",{C_USHORT,C_USHORT},C_POINTER)

public function SDL_hid_enumerate(atom vendor_id,atom product_id)
	return c_func(xSDL_hid_enumerate,{vendor_id,product_id})
end function

public constant xSDL_hid_free_enumeration = define_c_proc(sdl,"+SDL_hid_free_enumeration",{C_POINTER})

public procedure SDL_hid_free_enumeration(atom devs)
	c_proc(xSDL_hid_free_enumeration,{devs})
end procedure

public constant xSDL_hid_open = define_c_func(sdl,"+SDL_hid_open",{C_USHORT,C_USHORT,C_WSTRING},C_POINTER)

public function SDL_hid_open(atom vendor_id,atom product_id,sequence serial_num)
	return c_func(xSDL_hid_open,{vendor_id,product_id,serial_num})
end function

public constant xSDL_hid_open_path = define_c_func(sdl,"+SDL_hid_open_path",{C_STRING},C_POINTER)

public function SDL_hid_open_path(sequence path)
	return c_func(xSDL_hid_open_path,{path})
end function

public constant xSDL_hid_write = define_c_func(sdl,"+SDL_hid_write",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)

public function SDL_hid_write(atom dev,atom data,atom len)
	return c_func(xSDL_hid_write,{dev,data,len})
end function

public constant xSDL_hid_read_timeout = define_c_func(sdl,"+SDL_hid_read_timeout",{C_POINTER,C_POINTER,C_SIZE_T,C_INT},C_INT)

public function SDL_hid_read_timeout(atom dev,atom data,atom len,atom milsecs)
	return c_func(xSDL_hid_read_timeout,{dev,data,len,milsecs})
end function

public constant xSDL_hid_read = define_c_func(sdl,"+SDL_hid_read",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)

public function SDL_hid_read(atom dev,atom data,atom len)
	return c_func(xSDL_hid_read,{dev,data,len})
end function

public constant xSDL_hid_set_nonblocking = define_c_func(sdl,"+SDL_hid_set_nonblocking",{C_POINTER,C_INT},C_INT)

public function SDL_hid_set_nonblocking(atom dev,atom nonblock)
	return c_func(xSDL_hid_set_nonblocking,{dev,nonblock})
end function

public constant xSDL_hid_send_feature_report = define_c_func(sdl,"+SDL_hid_send_feature_report",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)

public function SDL_hid_send_feature_report(atom dev,atom data,atom len)
	return c_func(xSDL_hid_send_feature_report,{dev,data,len})
end function

public constant xSDL_hid_get_feature_report = define_c_func(sdl,"+SDL_hid_get_feature_report",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)

public function SDL_hid_get_feature_report(atom dev,atom data,atom len)
	return c_func(xSDL_hid_get_feature_report,{dev,data,len})
end function

public constant xSDL_hid_get_input_report = define_c_func(sdl,"+SDL_hid_get_input_report",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)

public function SDL_hid_get_input_report(atom dev,atom data,atom len)
	return c_func(xSDL_hid_get_input_report,{dev,data,len})
end function

public constant xSDL_hid_close = define_c_func(sdl,"+SDL_hid_close",{C_POINTER},C_INT)

public function SDL_hid_close(atom dev)
	return c_func(xSDL_hid_close,{dev})
end function

public constant xSDL_hid_get_manufacturer_string = define_c_func(sdl,"+SDL_hid_get_manufacturer_string",{C_POINTER,C_WSTRING,C_SIZE_T},C_INT)

public function SDL_hid_get_manufacturer_string(atom dev,sequence str,atom maxlen)
	return c_func(xSDL_hid_get_manufacturer_string,{dev,str,maxlen})
end function

public constant xSDL_hid_get_product_string = define_c_func(sdl,"+SDL_hid_get_product_string",{C_POINTER,C_WSTRING,C_SIZE_T},C_INT)

public function SDL_hid_get_product_string(atom dev,sequence str,atom maxlen)
	return c_func(xSDL_hid_get_product_string,{dev,str,maxlen})
end function

public constant xSDL_hid_get_serial_number_string = define_c_func(sdl,"+SDL_hid_get_serial_number_string",{C_POINTER,C_WSTRING,C_SIZE_T},C_INT)

public function SDL_hid_get_serial_number_string(atom dev,sequence str,atom maxlen)
	return c_func(xSDL_hid_get_serial_number_string,{dev,str,maxlen})
end function

public constant xSDL_hid_get_indexed_string = define_c_func(sdl,"+SDL_hid_get_indexed_string",{C_POINTER,C_INT,C_WSTRING,C_SIZE_T},C_INT)

public function SDL_hid_get_indexed_string(atom dev,atom index,sequence str,atom maxlen)
	return c_func(xSDL_hid_get_indexed_string,{dev,index,str,maxlen})
end function

public constant xSDL_hid_get_device_info = define_c_func(sdl,"+SDL_hid_get_device_info",{C_POINTER},C_POINTER)

public function SDL_hid_get_device_info(atom dev)
	return c_func(xSDL_hid_get_device_info,{dev})
end function

public constant xSDL_hid_get_report_descriptor = define_c_func(sdl,"+SDL_hid_get_report_descriptor",{C_POINTER,C_POINTER,C_SIZE_T},C_INT)

public function SDL_hid_get_report_descriptor(atom dev,atom buf,atom buf_size)
	return c_func(xSDL_hid_get_report_descriptor,{dev,buf,buf_size})
end function

public constant xSDL_hid_ble_scan = define_c_proc(sdl,"+SDL_hid_ble_scan",{C_BOOL})

public procedure SDL_hid_ble_scan(atom active)
	c_proc(xSDL_hid_ble_scan,{active})
end procedure
­182.35