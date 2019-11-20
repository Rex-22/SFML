IncludeDir = {}
IncludeDir["stb_image"] = "extlibs/headers/stb_image"
IncludeDir["glad"] = "extlibs/headers/glad/include"
IncludeDir["freetype2"] = "extlibs/headers/freetype2"
IncludeDir["vulkan"] = "extlibs/headers/vulkan"

project "sfml-graphics"
    kind "StaticLib"
    architecture "x64"
    language "C++"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/SFML/Graphics/**.h",
        "src/SFML/Graphics/**.hpp",
        "src/SFML/Graphics/**.cpp",
    }
    
    includedirs 
    {
        "src",
        "include",
        "%{IncludeDir.stb_image}",
        "%{IncludeDir.glad}",
        "%{IncludeDir.freetype2}",
    }

    links
    {
        "sfml-window",
        "sfml-system",
        "opengl32.lib",
        "freetype.lib"
    }

    defines { "SFML_STATIC" }

    libdirs { "extlibs/libs-msvc/x64" }

    filter "configurations:Debug"
        targetsuffix "-s-d"
        defines {
            "WIN32",
            "_WINDOWS",
            "SFML_STATIC",
            "STBI_FAILURE_USERMSG",
            "_CRT_SECURE_NO_DEPRECATE",
            "_SCL_SECURE_NO_WARNINGS",
        }
        symbols "On"

    filter "configurations:Release"
        targetsuffix "-s"
        defines { 
            "WIN32",
            "_WINDOWS",
            "NDEBUG",
            "SFML_STATIC",
            "STBI_FAILURE_USERMSG",
            "_CRT_SECURE_NO_DEPRECATE",
            "_SCL_SECURE_NO_WARNINGS"
        }
        optimize "On"

project "sfml-system"
    kind "StaticLib"
    architecture "x64"
    language "C++"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/SFML/System/*.h",
        "src/SFML/System/*.hpp",
        "src/SFML/System/*.cpp",
    }
    
    includedirs 
    {
        "src",
        "include"
    }

    links {
        "winmm.lib"
    }

    defines { "SFML_STATIC" }

    libdirs { "extlibs/libs-msvc/x64" }

    filter "system:windows" 
        systemversion "latest"
        files {
            "src/SFML/System/Win32/*.h",
            "src/SFML/System/Win32/*.hpp",
            "src/SFML/System/Win32/*.cpp"
        }

    filter "system:Unix" 
        files {
            "src/SFML/System/Unix/*.h",
            "src/SFML/System/Unix/*.hpp",
            "src/SFML/System/Unix/*.cpp"
        }

    filter "system:Android" 
        files {
            "src/SFML/System/Android/*.h",
            "src/SFML/System/Android/*.hpp",
            "src/SFML/System/Android/*.cpp"
        }

    filter "configurations:Debug"
        targetsuffix "-s-d"
        defines { 
            "WIN32",
            "_WINDOWS",
            "SFML_STATIC",
            "_CRT_SECURE_NO_DEPRECATE",
            "_SCL_SECURE_NO_WARNINGS"
        }
        symbols "On"

    filter "configurations:Release"
        targetsuffix "-s"
        defines { 
            "WIN32",
            "_WINDOWS",
            "NDEBUG",
            "SFML_STATIC",
            "_CRT_SECURE_NO_DEPRECATE",
            "_SCL_SECURE_NO_WARNINGS",
            "UNICODE",
            "_UNICODE"
        }
        optimize "On"

project "sfml-window"
    kind "StaticLib"
    architecture "x64"
    language "C++"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/SFML/Window/*.h",
        "src/SFML/Window/*.hpp",
        "src/SFML/Window/*.cpp",
    }
    
    includedirs 
    {
        "src",
        "include",
        "%{IncludeDir.glad}",
        "%{IncludeDir.vulkan}"
    }
    
    links
    {
        "sfml-system",
        "opengl32.lib",
        "winmm.lib",
        "gdi32.lib"
    }

    defines { "SFML_STATIC" }

    libdirs { "extlibs/libs-msvc/x64" }

    filter "system:windows"
        systemversion "latest"
        files {
            "src/SFML/Window/Win32/*.h",
            "src/SFML/Window/Win32/*.hpp",
            "src/SFML/Window/Win32/*.cpp"
        }

        filter "system:Linux" 
        systemversion "latest"
        files {
            "src/SFML/Window/Unix/*.h",
            "src/SFML/Window/Unix/*.hpp",
            "src/SFML/Window/Unix/*.cpp"
        }

    filter "system:macosx" 
        systemversion "latest"
        files {
            "src/SFML/Window/OSX/*.h",
            "src/SFML/Window/OSX/*.hpp",
            "src/SFML/Window/OSX/*.cpp"
        }
    
    filter "system:Android" 
        systemversion "latest"
        files {
            "src/SFML/Window/Android/*.h",
            "src/SFML/Window/Android/*.hpp",
            "src/SFML/Window/Android/*.cpp"
        }

    filter "configurations:Debug"
        targetsuffix "-s-d"
        defines { 
            "WIN32",
            "_WINDOWS",
            "SFML_STATIC",
            "_CRT_SECURE_NO_DEPRECATE",
            "_SCL_SECURE_NO_WARNINGS",
            "UNICODE",
            "_UNICODE"
        }
        symbols "On"

    filter "configurations:Release"
        targetsuffix "-s"
        defines { 
            "WIN32",
            "_WINDOWS",
            "NDEBUG",
            "SFML_STATIC",
            "_CRT_SECURE_NO_DEPRECATE",
            "_SCL_SECURE_NO_WARNINGS",
            "UNICODE",
            "_UNICODE"
        }
        optimize "On"
