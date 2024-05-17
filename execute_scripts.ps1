param (
    [string]$host_address,
    [string]$port,
    [string]$user
)

# Shift 4 arguments (host, port, user, pass)
$files = $args[3..($args.Count - 1)]

foreach ($sql_file in $files) {
    $filePath = ".\files\$sql_file"
    if (Test-Path $filePath) {
        $command = "mysql.exe"
        $arguments = "--host=$host_address --port=$port --user=$user < $filePath"
        
        try {
            Start-Process -FilePath $command -ArgumentList $arguments -NoNewWindow -Wait
            Write-Output "script $sql_file foi executado com sucesso"
        } catch {
            Write-Error "Ocorreu um erro na execucao do script $sql_file"
            Write-Error $_.Exception.Message
        }
    } else {
        Write-Warning "File not found: $filePath"
    }
}