@echo off
setlocal EnableExtensions
cd /d "%~dp0"
echo Starting Samasya Setu Java web application...
set "SS_JAVA_HOME=%ProgramFiles%\Java\jdk-25"
if not exist "%SS_JAVA_HOME%\bin\javac.exe" set "SS_JAVA_HOME=%JAVA_HOME%"
if not exist "%SS_JAVA_HOME%\bin\javac.exe" (
  set "SS_JAVA_HOME="
  for /d %%J in ("%ProgramFiles%\Java\jdk-*") do if exist "%%~fJ\bin\javac.exe" set "SS_JAVA_HOME=%%~fJ"
)
if not exist "%SS_JAVA_HOME%\bin\javac.exe" goto NoJdk
set "PATH=%SS_JAVA_HOME%\bin;%PATH%"
if exist "%~dp0target\samasyasetu-1.0.0.jar" (
  "%SS_JAVA_HOME%\bin\java.exe" -Dfile.encoding=UTF-8 -jar "%~dp0target\samasyasetu-1.0.0.jar"
) else (
  call "%~dp0mvnw.cmd" spring-boot:run
)
if errorlevel 1 (
  echo.
  echo Samasya Setu stopped with an error. Read the message above.
  pause
)
goto End
:NoJdk
echo Java JDK 17 or newer was not found. Install a JDK and run this file again.
echo Java is checked from Program Files\Java and JAVA_HOME.
echo.
pause
:End
