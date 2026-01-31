for /F "skip=3 tokens=2 delims=: " %%i in (pubspec.yaml) do (
    set VERSION=%%i
    goto :break
)
:break

set VERSION=%VERSION:"=%

echo LuckyBeastCardTemplateGenerator-%VERSION%

set WINDOWS_BUILD_DIR=.\build\windows\x64\runner\Release\*

rar a -r -ep1 LuckyBeastCardTemplateGenerator-%VERSION%-windows-x64.rar %WINDOWS_BUILD_DIR%
