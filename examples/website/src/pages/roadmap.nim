import
  ../../../../src/happyx,
  ../path_params,
  ../components/[header, smart_card, card, section, code_block, about_section, drawer],
  ../ui/[colors, translations]



mount RoadMap:
  "/":
    tDiv(class = "flex flex-col min-h-screen w-full bg-[{Background}] dark:bg-[{BackgroundDark}] text-[{Foreground}] dark:text-[{ForegroundDark}]"):
      # Drawer
      component drawer_comp
      # Header
      tDiv(class = "w-full sticky top-0 z-20"):
        component Header(drawer = drawer_comp)
      tDiv(class = "flex flex-col w-full h-full items-center gap-8 px-4 py-8"):
        tP(class = "text-6xl lg:text-4xl xl:text-3xl font-bold"):
          {translate("🌎 RoadMap")}
        
        tP(class = "text-3xl lg:text-2xl xl:text-xl font-semibold w-3/4 lg:w-2/3 xl:w-1/2"):
          {translate("HappyX goals is development speed ⚡, efficiency 🎴 and speed 🔥")}
        
        tDiv(class = "w-full grid grid-cols-2 lg:w-2/3 xl:w-1/2 xl:grid-cols-3 gap-4 lg:gap-8 xl:gap-12"):
          # v1.0.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v1.0.0"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("General features 🛠")}
                tUl(class = "list-disc"):
                  tLi: {translate("SPA/SSR Support ⚡")}
                  tLi: {translate("Multiple HTTP Servers 👨‍🔬")}
                  tLi: {translate("Hot Code Reloading 🔥")}
                  tLi: {translate("CLI 📦")}
          # v1.5.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v1.5.0"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("Framework improvement ⚡")}
                tUl(class = "list-disc"):
                  tLi: {translate("Additional HTTP Servers 👨‍🔬")}
                  tLi: {translate("Translatable Strings 🔥")}
                  tLi: {translate("Static Directories 📁")}
          # v1.10.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v1.10.0"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("Components Update 🧩")}
                tUl(class = "list-disc"):
                  tLi: {translate("Inheritance 👶")}
                  tLi: {translate("Methods 📦")}
                  tLi: {translate("Constructors ⚙")}
          # v2.0.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v2.0.0"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("Nim v2.0 Support ⚡")}
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("Automatic Docs Generation 📕")}
          # v2.1.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v2.1.0"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate(".hpx files support ✨")}
          # v2.2.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v2.2.0"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("Python Bindings")}
          # v2.10.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v2.10.1"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("LiveViews")}
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate(".hpx files support")}
          # v3.0.0
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "v3.0.0"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                {translate("NodeJS Bindings")}
          # Future
          component Card():
            tDiv(class = "w-full flex flex-col items-center gap-2 p-4 lg:p-2 xl:p-0"):
              tP(class = "text-4xl lg:text-2xl xl:text-lg font-semibold"):
                "Future releases"
              tP(class = "w-full text-2xl lg:text-lg xl:text-base"):
                "ORM 🔨"
