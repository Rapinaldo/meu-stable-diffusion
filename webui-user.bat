@echo off

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=

:: Instala automaticamente a aceleração por GPU se a venv for nova
if exist venv\Scripts\python.exe (
    venv\Scripts\python.exe -m pip show onnxruntime-gpu >nul 2>&1
    if errorlevel 1 (
        echo [INFO] Instalando aceleracao ONNX para GPU...
        venv\Scripts\python.exe -m pip install onnxruntime-gpu==1.17.1 --quiet
    )
)

call webui.bat
