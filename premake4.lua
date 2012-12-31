------------------------------------------------------------------------------------------------------------------------
-- signature: nil set_flags()
------------------------------------------------------------------------------------------------------------------------
-- brief: Sets the flags for the project
------------------------------------------------------------------------------------------------------------------------
local set_flags = function()
  flags {
    "Symbols",
    "ExtraWarnings",
    "FatalWarnings",
  }
end

------------------------------------------------------------------------------------------------------------------------
-- signature: nil set_configuration_defines()
------------------------------------------------------------------------------------------------------------------------
-- brief: Sets some defines to identify each configuration
------------------------------------------------------------------------------------------------------------------------
local set_configuration_defines = function()
  configuration "with-linking"
    defines {
      "WITH_LINKING"
    }
  configuration "with-def"
    defines {
      "WITH_DEF"
    }
  configuration "with-pragma"
    defines {
      "WITH_PRAGMAS"
    }

  -- reset the configuration block
  --
  configuration {}
end

------------------------------------------------------------------------------------------------------------------------
-- signature: nil set_target_suffix()
------------------------------------------------------------------------------------------------------------------------
-- brief: Sets the target suffix
------------------------------------------------------------------------------------------------------------------------
local set_target_suffix = function()
  configuration "with-linking"
    targetsuffix "-with-linking"
  configuration "with-def"
    targetsuffix "-with-def"
  configuration "with-pragma"
    targetsuffix "-with-pragma"

  -- reset the configuration block
  --
  configuration {}
end

------------------------------------------------------------------------------------------------------------------------
-- define the solution and projects
------------------------------------------------------------------------------------------------------------------------
solution "dllexport-snippet"
  configurations {
    "with-linking", -- staticlib must be linked by dynamiclib and application
    "with-def",     -- staticlib is linked only by dynamiclib and re-exported using a .def file
    "with-pragma",  -- staticlib is linked only by dynamiclib and re-exported using #pragmas
  }
  
  -- the staticlib project
  --
  project "staticlib"
    uuid "F65FA83C-D694-0D44-BC09-A68F63C8AF44"
    language "C++"
    kind "StaticLib"
    set_flags()
    set_configuration_defines()
    set_target_suffix()
    files {
      path.join("staticlib", "include", "**.h"),
      path.join("staticlib", "src", "**.cpp"),
    }
    vpaths {
      [""] = "staticlib",
    }
    includedirs {
      path.join("staticlib", "include"),
    }

  -- the dynamiclib project
  --
  project "dynamiclib"
    uuid "3DFB2D9F-5D8B-1541-90E3-733227950813"
    language "C++"
    kind "SharedLib"
    set_flags()
    set_configuration_defines()
    set_target_suffix()
    files {
      path.join("dynamiclib", "include", "**.h"),
      path.join("dynamiclib", "src", "**.cpp"),
    }
    vpaths {
      [""] = "dynamiclib",
    }
    includedirs {
      path.join("staticlib", "include"),
      path.join("dynamiclib", "include"),
    }
    defines {
      "DYNAMICLIB_EXPORTS",
    }
    configuration "with-linking"
      links {
        "staticlib-with-linking",
      }
    configuration "with-def"
      links {
        "staticlib-with-def",
      }
      linkoptions {
        "/DEF:dynamiclib.def"
      }
    configuration "with-pragma"
      links {
        "staticlib-with-pragma",
      }

  -- the application project
  --
  project "application"
    uuid "32D7C5C4-07BB-B340-B576-B15FFD3B98B3"
    language "C++"
    kind "ConsoleApp"
    set_flags()
    set_configuration_defines()
    set_target_suffix()
    files {
      path.join("application", "src", "**.cpp"),
    }
    vpaths {
      [""] = "application",
    }
    includedirs {
      path.join("staticlib", "include"),
      path.join("dynamiclib", "include"),
    }
    configuration "with-linking"
      links {
        "staticlib-with-linking",
        "dynamiclib-with-linking",
      }
    configuration "with-def"
      links {
        "dynamiclib-with-def",
      }
    configuration "with-pragma"
      links {
        "dynamiclib-with-pragma",
      }