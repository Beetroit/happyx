import
  ./utils


proc serveCommand*(host: string = "0.0.0.0", port: int = 80, buildDirectory: string = "build"): int =
  ## Serve SPA for production
  var
    project = compileProject()
  
  if project.error.len > 0:
    return QuitFailure

  # Explain SSG Error
  if project.projectType in [ptSSG, ptSSR]:
    styledEcho fgYellow, emoji["❌"](), " SSG projects not required to be supported in serve mode."
    styledEcho fgMagenta, emoji["💡"](), " Compile and run your SSG server!"
    shutdownCli()
    return QuitSuccess

  # Start SPA server
  styledEcho emoji["🔥"](), " Server launched at ", fgGreen, styleUnderscore, "http://", host, ":", $port, fgWhite
  
  serve host, port:
    get "/":
      let f = open(getCurrentDir() / buildDirectory / "index.html")
      var data = f.readAll()
      f.close()
      req.answerHtml(data)
 
    get "/{file:path}":
      var result = ""
      let path = getCurrentDir() / buildDirectory / file.replace('\\', '/').replace('/', DirSep)
      echo "File: ", file
      echo "Path: ", path
      if fileExists(path):
        await req.answerFile(path, forceResponse = true)
  shutdownCli()
  QuitSuccess
