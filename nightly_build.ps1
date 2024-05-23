$thisPath = Split-Path $MyInvocation.MyCommand.Path -Parent
cd $thisPath

set PATH=C:\Program Files\dotnet;%PATH%

git pull https://github.com/Stability-AI/StableSwarmUI.git master:master

rmdir /s /q .\src\bin\live_release_backup
move .\src\bin\live_release .\src\bin\live_release_backup

dotnet build src/StableSwarmUI.csproj --configuration Release -o src/bin/live_release
for /f "delims=" %%i in ('git rev-parse HEAD') do set CUR_HEAD2=%%i
echo !CUR_HEAD2!> src/bin/last_build

set ASPNETCORE_ENVIRONMENT="Production"
set ASPNETCORE_URLS="http://*:7801"