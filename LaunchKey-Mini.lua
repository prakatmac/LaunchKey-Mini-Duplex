--[[----------------------------------------------------------------------------
-- Duplex.LaunchKeyMini
----------------------------------------------------------------------------]]--

--[[

Inheritance: LaunchKeyMini > MidiDevice > Device

LaunchKey Mini Class 

--]]

class "LaunchKeyMini" (MidiDevice)

function LaunchKeyMini:__init(display_name, message_stream, port_in, port_out)
  TRACE("LaunchKeyMini:__init", display_name, message_stream, port_in, port_out)

  MidiDevice.__init(self, display_name, message_stream, port_in, port_out)

  -- this device has a color-space with 2 degrees of red and green
  self.colorspace = {2, 2, 0}

  -- InControl Mode On
  self:send_note_message(12, 127, 1)
  -- LED Flashing On
  self:send_cc_message(0, 40, 1)
end

--------------------------------------------------------------------------------

-- clear display before releasing device:
-- all LEDs are turned off, and the mapping mode, buffer settings, 
-- and duty cycle are reset to defaults

function LaunchKeyMini:release()
  TRACE("LaunchKeyMini:release()")

  -- InControl Mode Off
  self:send_note_message(12, 0, 1)
  -- LED Flashing Off
  self:send_cc_message(0, 32, 1)

  self:send_cc_message(0,0)
  MidiDevice.release(self)

end

--------------------------------------------------------------------------------

function LaunchKeyMini:point_to_value(pt)
  TRACE("Launchpad:point_to_value")

  -- these values are 0-255
  local red = math.floor(pt.color[1]/64)
  local green = math.floor(pt.color[2]/64)
  local blue = math.floor(pt.color[3]/64)

  local rslt = 29

  if (red == 3 and green == 3 and blue == 3) then 
    -- turn green
    rslt = 60
  elseif (red == 3 and green == 1 and blue == 1) then
    -- turn bright amber
    rslt = 63
  elseif (red >= 1 and green == 0 and blue == 0) then
    -- turn red
    rslt = 15
  elseif (red == 0 and green == 0 and blue == 0) then
    -- turn off
    rslt = 4
  else
    -- turn half amber
    rslt = 29
  end
  
  return rslt
end
