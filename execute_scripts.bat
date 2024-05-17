@echo off
setlocal

rem Definir variáveis de ambiente
set host_address=%1
set port=%2
set user=%3
shift
shift
shift

rem Loop para executar cada script passado como argumento
for %%s in (%*) do (
    if exist "%%s" (
        "mysql.exe" --host=%host_address% --port=%port% --user=%user% < "%%s"
        if %errorlevel% neq 0 (
            echo Erro ao executar o script: %%s
        ) else (
            echo Script %%s foi executado com sucesso
        )
    ) else (
        echo Arquivo não encontrado: %%s
    )
)

endlocal
