@echo off
echo ========================================
echo Starting Online IDE - All Servers
echo ========================================
echo.

REM Start GenAI Backend (Port 5000)
echo Starting GenAI Backend Server (Port 5000)...
start "GenAI Backend - Port 5000" cmd /k "cd Backend\Genai && python app.py"
timeout /t 2 /nobreak >nul

REM Start Login Backend (Port 3000)
echo Starting Login Backend Server (Port 3000)...
start "Login Backend - Port 3000" cmd /k "cd Backend\Login && node server.js"
timeout /t 2 /nobreak >nul

REM Start TempFile Backend (Port 5001)
echo Starting TempFile Backend Server (Port 5001)...
start "TempFile Backend - Port 5001" cmd /k "cd Backend\TempFile && python app.py"
timeout /t 2 /nobreak >nul

REM Start Frontend (Port 5173)
echo Starting Frontend Development Server (Port 5173)...
start "Frontend - Port 5173" cmd /k "cd Frontend && npm run dev"

echo.
echo ========================================
echo All servers are starting...
echo ========================================
echo.
echo GenAI Backend:    http://localhost:5000
echo Login Backend:    http://localhost:3000
echo TempFile Backend: http://localhost:5001
echo Frontend:         http://localhost:5173
echo.
echo Press any key to exit this window...
pause >nul
