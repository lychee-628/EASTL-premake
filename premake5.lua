function IncludeEASTL(_path)
    includedirs
    {
        string.format("%s/include", _path),
        string.format("%s/EABase/include/Common", _path)
    }
end

project "EASTL"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    
    staticruntime "On"
    systemversion "latest"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/**.h",
        "source/**.cpp"
    }

    IncludeEASTL(".")

    --Modify these to match your own configs!
    filter { "configurations:debug" }
        symbols "On"

    filter { "configurations:release" }
        symbols "Off"
        optimize "Speed"
    filter { "configurations:dist" }
        symbols "Off"
        optimize "Speed"

