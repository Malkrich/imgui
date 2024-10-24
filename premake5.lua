project "imgui"
    kind "StaticLib"
    language "C++"
    staticruntime "off"
    
    targetdir ("bin/" .. outputDir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputDir .. "/%{prj.name}")

    files
    {
        "*.h",
        "*.cpp",

        -- GLFW / OpenGL implementation
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_opengl3.cpp",

        -- Guizmo extension
        "ImGuizmo/**.h",
        "ImGuizmo/**.cpp"
    }

    includedirs
    {
        "./",
        "../GLFW/glfw-3.3.8/include"
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"