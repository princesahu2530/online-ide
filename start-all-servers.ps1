# Online IDE - Start All Servers
# PowerShell Script

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Starting Online IDE - All Servers" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Get the script directory
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Start GenAI Backend (Port 5000)
Write-Host "Starting GenAI Backend Server (Port 5000)..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath\Backend\Genai'; python app.py" -WindowStyle Normal

Start-Sleep -Seconds 2

# Start Login Backend (Port 3000)
Write-Host "Starting Login Backend Server (Port 3000)..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath\Backend\Login'; node server.js" -WindowStyle Normal

Start-Sleep -Seconds 2

# Start TempFile Backend (Port 5001)
Write-Host "Starting TempFile Backend Server (Port 5001)..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath\Backend\TempFile'; python app.py" -WindowStyle Normal

Start-Sleep -Seconds 2

# Start Frontend (Port 5173)
Write-Host "Starting Frontend Development Server (Port 5173)..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$scriptPath\Frontend'; npm run dev" -WindowStyle Normal

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "All servers are starting..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "GenAI Backend:    http://localhost:5000" -ForegroundColor Yellow
Write-Host "Login Backend:    http://localhost:3000" -ForegroundColor Yellow
Write-Host "TempFile Backend: http://localhost:5001" -ForegroundColor Yellow
Write-Host "Frontend:         http://localhost:5173" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit this window..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
