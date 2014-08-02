--[[----------------------------------------------------------------------------
-- Duplex.LaunchKeyMini
----------------------------------------------------------------------------]]--

-- default configuration of the R-control

--==============================================================================

duplex_configurations:insert {

  -- configuration properties
  name = "Recorder",
  pinned = true,

  -- device properties
  device = {
    display_name = "Launchkey Mini",
    class_name = "LaunchKeyMini",
    device_port_in = "Launchkey Mini (LK Mini InControl)",
    device_port_out = "Launchkey Mini (LK Mini InControl)",
    control_map = "Controllers/LaunchKey-Mini/Controlmaps/LaunchKey-Mini.xml",
    thumbnail = "Controllers/LaunchKey-Mini/R-control.bmp",
    protocol = DEVICE_PROTOCOL.MIDI
  },


  applications = {
    Mixer = {
      mappings = {
        levels = {
          group_name = "Encoders",
        },
      },
    },
    Recorder = {
      mappings = {
        recorders = {
          group_name = "UpperSwitches"
        },
        sliders = {
          group_name = "LowerSwitches"
        },
      },
      options = {
        follow_track = 1
      },
    },
    PatternSequence = {
      mappings = {
        display_previous = {
          group_name = "CircleSwitches",
          index = 1
        },
        display_next = {
          group_name = "CircleSwitches",
          index = 2
        },
      }
    },
    SwitchConfiguration = {
      mappings = {
        goto_previous = {
          group_name = "VerticalScrollSwitches",
          index = 1
        },
        goto_next = {
          group_name = "VerticalScrollSwitches",
          index = 2
        }  
      }
    },
    TrackSelector = {
      mappings = {
        prev_page = {
          group_name = "HorizontalScrollSwitches",
          index = 1,
        },
        next_page = {
          group_name = "HorizontalScrollSwitches",
          index = 2,
        },
      },
      options = {
        page_size = 1 ,
      }
    }
  }
}
