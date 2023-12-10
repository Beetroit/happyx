# Import HappyX
import
  ../../../../src/happyx,
  ../ui/[colors, translations],
  ./[button, drawer],
  regex,
  unicode,
  macros,
  json,
  os


var
  currentGuidePage* = remember "introduction"
  guidePages* = %*{
    "introduction": {
      "title": "Introduction ✌",
      "prev": "",
      "next": "getting_started"
    },
    "getting_started": {
      "title": "Getting Started 💫",
      "prev": "introduction",
      "next": "happyx_app"
    },
    "happyx_app": {
      "title": "HappyX Application 🍍",
      "prev": "getting_started",
      "next": "path_params"
    },
    "path_params": {
      "title": "Path Params 🔌",
      "prev": "happyx_app",
      "next": "tailwind_and_other"
    },
    "tailwind_and_other": {
      "title": "Tailwind And Other 🎴",
      "prev": "path_params",
      "next": "route_decorators"
    },
    "route_decorators": {
      "title": "Route Decorators 🔌",
      "prev": "tailwind_and_other",
      "next": "spa_basics"
    },
    "spa_basics": {
      "title": "Single-page Applications Basics 🎴",
      "prev": "route_decorators",
      "next": "reactivity"
    },
    "reactivity": {
      "title": "Reactivity ⚡",
      "prev": "spa_basics",
      "next": "ssr_basics"
    },
    "ssr_basics": {
      "title": "Server-side Applications Basics 🖥",
      "prev": "reactivity",
      "next": "db_access"
    },
    "db_access": {
      "title": "Database access 📦",
      "prev": "ssr_basics",
      "next": "sqlite"
    },
    "sqlite": {
      "title": "SQLite 📦",
      "prev": "db_access",
      "next": "postgres"
    },
    "postgres": {
      "title": "PostgreSQL 📦",
      "prev": "sqlite",
      "next": "mongo_db"
    },
    "mongo_db": {
      "title": "MongoDB 🍃",
      "prev": "postgres",
      "next": ""
    }
  }


component SideBarTitle:
  `template`:
    tDiv(class = "flex flex-col gap-8 lg:gap-4 xl:gap-2 text-7xl lg:text-2xl xl:text-xl font-bold select-none"):
      slot


component SideBarFolder:
  id: string
  text: string
  `template`:
    tDiv(class = "flex flex-col gap-4 lg:gap-2 xl:gap-0 text-5xl lg:text-xl xl:text-lg font-bold cursor-pointer select-none pl-2"):
      tDiv:
        {translate(self.text)}
        @click:
          route(fmt"/guide/{self.id}")
      slot


component SideBarItem:
  id: string
  `template`:
    tDiv(
      class =
        if currentGuidePage.val == self.id:
          fmt"pl-12 lg:pl-8 xl:pl-4 text-4xl opacity-90 lg:text-lg xl:text-base cursor-pointer select-none bg-[{Foreground}]/25 dark:bg-[{ForegroundDark}]/25 duration-300"
        else:
          fmt"pl-12 lg:pl-8 xl:pl-4 text-4xl opacity-60 hover:opacity-70 active:opacity-80 lg:text-lg xl:text-base cursor-pointer select-none bg-[{Foreground}]/0 dark:bg-[{ForegroundDark}]/0 hover:bg-[{Foreground}]/[.10] dark:hover:bg-[{ForegroundDark}]/[.10] active:bg-[{Foreground}]/[.20] dark:active:bg-[{ForegroundDark}]/[.20] duration-300"
    ):
      slot
      @click:
        route(fmt"/guide/{self.id}")


# Declare component
component SideBar:
  isMobile: bool = false

  # Declare HTML template
  `template`:
    tDiv(class =
        if self.isMobile:
          "flex-col xl:flex gap-12 lg:gap-8 xl:gap-4 px-2 h-full"
        else:
          "flex-col hidden xl:flex gap-12 lg:gap-8 xl:gap-4 px-2 pt-8 h-full"
    ):
      if not self.isMobile:
        tP(class = "text-5xl lg:text-3xl xl:text-2xl font-bold text-center w-max"):
          {translate("📕 Documentation")}
      tDiv(class = "flex flex-col justify-between gap-16 lg:gap-12 xl:gap-8"):
        tDiv(class = "flex flex-col pl-8 lg:pl-6 xl:pl-4 gap-8 lg:gap-4 xl:gap-2"):
          component SideBarTitle:
            {translate("User Guide 📖")}

            component SideBarFolder("introduction", "General 🍍"):
              component SideBarItem("introduction"):
                {translate("Introduction ✌")}
              component SideBarItem("getting_started"):
                {translate("Getting Started 💫")}

            component SideBarFolder("happyx_app", "Basics 📖"):
              component SideBarItem("happyx_app"):
                {translate("HappyX Application 🍍")}
              component SideBarItem("path_params"):
                {translate("Path Params 🔌")}

            component SideBarFolder("tailwind_and_other", "Advanced 🧪"):
              component SideBarItem("tailwind_and_other"):
                {translate("Tailwind And Other 🎴")}
              component SideBarItem("route_decorators"):
                {translate("Route Decorators 🔌")}

            component SideBarFolder("spa_basics", "Single-page Applications 🎴"):
              component SideBarItem("spa_basics"):
                {translate("Single-page Applications Basics 🎴")}
              component SideBarItem("reactivity"):
                {translate("Reactivity ⚡")}

            component SideBarFolder("ssr_basics", "Server-side Applications 🖥"):
              component SideBarItem("ssr_basics"):
                {translate("Server-side Applications Basics 🖥")}
              component SideBarItem("db_access"):
                {translate("Database access 📦")}
              component SideBarItem("sqlite"):
                {translate("SQLite 📦")}
              component SideBarItem("postgres"):
                {translate("PostgreSQL 📦")}
              component SideBarItem("mongo_db"):
                {translate("MongoDB 🍃")}
        tDiv(class = "flex"):
          component Button(
            action = proc() =
              {.emit: """//js
              window.open('https://hapticx.github.io/happyx/happyx.html', '_blank').focus();
              """.},
            flat = true
          ):
            {translate("📕 API Reference")}
