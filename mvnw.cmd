@echo off
setlocal
set "MAVEN_VERSION=3.9.11"
set "MAVEN_OPTS=%MAVEN_OPTS% -Djavax.net.ssl.trustStoreType=Windows-ROOT -Djavax.net.ssl.trustStore=NONE"
set "MAVEN_DIST=%USERPROFILE%\.m2\wrapper\dists\apache-maven-%MAVEN_VERSION%-bin"
set "MAVEN_HOME=%MAVEN_DIST%\apache-maven-%MAVEN_VERSION%"
if not exist "%MAVEN_HOME%\bin\mvn.cmd" (
  echo First run: downloading Apache Maven. Internet is needed once for Maven and Java libraries.
  powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $d=$env:USERPROFILE+'\.m2\wrapper\dists\apache-maven-3.9.11-bin'; New-Item -ItemType Directory -Force -Path $d ^| Out-Null; $z=$env:TEMP+'\apache-maven-3.9.11-bin.zip'; Invoke-WebRequest -UseBasicParsing 'https://archive.apache.org/dist/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.zip' -OutFile $z; Expand-Archive -LiteralPath $z -DestinationPath $d -Force"
  if errorlevel 1 exit /b 1
)
call "%MAVEN_HOME%\bin\mvn.cmd" %*
exit /b %errorlevel%