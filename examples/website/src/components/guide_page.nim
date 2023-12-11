# Import HappyX
import
  ../../../../src/happyx,
  ../ui/[colors, translations],
  ../docs/docs,
  ./[button, drawer, sidebar, code_block_guide],
  unicode,
  json


component GuidePage:
  current: string = ""

  `template`:
    tDiv(
      class = "flex flex-col text-3xl lg:text-xl xl:text-base w-full h-full px-4 lg:px-12 xl:px-24 py-2 bg-[{BackgroundSecondary}] dark:bg-[{BackgroundSecondaryDark}] gap-8"
    ):
      tDiv(class = "flex flex-col gap-4"):
        case currentGuidePage.val
        of "introduction":
          Introduction
        of "getting_started":
          GettingStarted
        of "happyx_app":
          HappyxApp
        of "path_params":
          PathParams
        of "spa_basics":
          SpaBasics
        of "reactivity":
          Reactivity
        of "ssr_basics":
          SsrBasics
        of "tailwind_and_other":
          TailwindAndOther
        of "route_decorators":
          Decorators
        of "db_access":
          DbIntro
        of "mongo_db":
          MongoDB
        of "sqlite":
          SQLite
        of "postgres":
          Postgres

      tDiv(class = "hidden xl:flex justify-between items-center w-full pb-8"):
        if guidePages[currentGuidePage]["prev"].getStr != "":
          Button(
              action = proc() =
                route(fmt"""/guide/{guidePages[currentGuidePage]["prev"].getStr}""")
          ):
            {"👈 " & translate(guidePages[guidePages[currentGuidePage]["prev"].getStr]["title"].getStr)}
        else:
          tDiv(class = "w-1 h-1 p-1")
        if guidePages[currentGuidePage]["next"].getStr != "":
          Button(
              action = proc() =
                route(fmt"""/guide/{guidePages[currentGuidePage]["next"].getStr}""")
          ):
            {translate(guidePages[guidePages[currentGuidePage]["next"].getStr]["title"].getStr) & " 👉"}
        else:
          tDiv(class = "w-1 h-1 p-1")
      tDiv(class = "flex xl:hidden justify-between items-center w-full pb-8"):
        if guidePages[currentGuidePage]["prev"].getStr != "":
          Button(
              action = proc() =
                route(fmt"""/guide/{guidePages[currentGuidePage]["prev"].getStr}"""),
              flat = true
          ):
            {"👈 " & translate(guidePages[guidePages[currentGuidePage]["prev"].getStr]["title"].getStr)}
        else:
          tDiv(class = "w-1 h-1 p-1")
        if guidePages[currentGuidePage]["next"].getStr != "":
          Button(
              action = proc() =
                route(fmt"""/guide/{guidePages[currentGuidePage]["next"].getStr}"""),
              flat = true
          ):
            {translate(guidePages[guidePages[currentGuidePage]["next"].getStr]["title"].getStr) & " 👉"}
        else:
          tDiv(class = "w-1 h-1 p-1")
