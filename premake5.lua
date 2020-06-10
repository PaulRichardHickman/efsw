project "efsw"
    kind "StaticLib"
    language "C++"
	staticruntime "on"
    
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "src/efsw/*.cpp"
    }
    
	includedirs 
	{ 
		"include", 
		"src" 
	}
	
	filter "system:windows"
		systemversion "latest"
        
        files
        {
			"src/efsw/platform/win/*.cpp"
        }
		
		excludes { 
			"src/efsw/WatcherKqueue.cpp", 
			"src/efsw/WatcherFSEvents.cpp", 
			"src/efsw/WatcherInotify.cpp", 
			"src/efsw/FileWatcherKqueue.cpp", 
			"src/efsw/FileWatcherInotify.cpp", 
			"src/efsw/FileWatcherFSEvents.cpp" 
		}

		defines 
		{ 
            "_CRT_SECURE_NO_WARNINGS"
		}
		
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
	
	filter "configurations:Release"
		runtime "Debug"
		symbols "on"