param(
    [int]$Port = 3000
)

# Move to script directory (so relative paths work)
try {
    $scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
    if ($scriptDir) { Set-Location $scriptDir }
} catch {}

Write-Host "Serving folder: $(Get-Location) on port $Port" -ForegroundColor Cyan

# Helper to open browser
function Open-LocalUrl($port) {
    $url = "http://localhost:$port"
    Write-Host "Local URL: $url" -ForegroundColor Green
    try {
        Start-Process $url
    } catch {
        Write-Host "Không thể mở trình duyệt tự động. Mở thủ công: $url"
    }
}

# Try Python (python or py)
if (Get-Command python -ErrorAction SilentlyContinue) {
    Write-Host "Found 'python'. Starting http.server..." -ForegroundColor Yellow
    Open-LocalUrl -port $Port
    & python -m http.server $Port
    exit $LASTEXITCODE
} elseif (Get-Command py -ErrorAction SilentlyContinue) {
    Write-Host "Found 'py'. Starting http.server..." -ForegroundColor Yellow
    Open-LocalUrl -port $Port
    & py -3 -m http.server $Port
    exit $LASTEXITCODE
}

# Try npx http-server (Node.js)
if (Get-Command npx -ErrorAction SilentlyContinue) {
    Write-Host "Found 'npx'. Starting http-server..." -ForegroundColor Yellow
    Open-LocalUrl -port $Port
    & npx http-server -p $Port
    exit $LASTEXITCODE
}

Write-Host "Không tìm thấy 'python' hoặc 'npx' trên hệ thống." -ForegroundColor Red
Write-Host "Cài đặt Python (hoặc Node.js) hoặc mở server tĩnh bằng công cụ bạn muốn." -ForegroundColor Red
Write-Host "Ví dụ: Install Python và chạy: python -m http.server 8000" -ForegroundColor DarkYellow
