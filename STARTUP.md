# 🚀 Quick Start Scripts

## Automated Server Startup

Yeh scripts automatically sab backend aur frontend servers ko start kar denge.

### Windows Users

**Option 1: Batch Script (Recommended)**
```bash
start-all-servers.bat
```

**Option 2: PowerShell Script**
```powershell
.\start-all-servers.ps1
```

### What These Scripts Do

1. Start GenAI Backend (Port 5000)
2. Start Login Backend (Port 3000)
3. Start TempFile Backend (Port 5001)
4. Start Frontend Development Server (Port 5173)

Har server apni alag window mein open hoga, jisse aap easily logs dekh sakte ho.

### After Running

Browser mein jao: http://localhost:5173

---

## Manual Start (Agar Scripts Kaam Na Karein)

4 separate terminals kholo aur ye commands run karo:

**Terminal 1:**
```bash
cd Backend\Genai
python app.py
```

**Terminal 2:**
```bash
cd Backend\Login
node server.js
```

**Terminal 3:**
```bash
cd Backend\TempFile
python app.py
```

**Terminal 4:**
```bash
cd Frontend
npm run dev
```

---

## First Time Setup

Agar pehli baar run kar rahe ho:

```bash
# Install Python dependencies
cd Backend\Genai
pip install -r requirements.txt

cd ..\TempFile
pip install -r requirements.txt

# Install Node.js dependencies
cd ..\Login
npm install

cd ..\..\Frontend
npm install
```

---

## Troubleshooting

### Port Already in Use
```bash
netstat -ano | findstr :5000
taskkill /PID <process_id> /F
```

### Dependencies Missing
Re-run the installation commands above.

---

For detailed documentation, see the main [README.md](README.md)
