function Save-Hash{
    param(
        [hashtable] $hash
    )
    $fullPath = "$env:APPDATA\CurrencyWatcher\$CurrencyCode.json"
    if(-not(Test-Path($fullPath))){
        $null = New-Item $fullPath -ItemType File -Force
    }
    $content = Get-Content -Path $fullPath | ConvertFrom-Json -AsHashtable
    if($null -eq $content){
        $content = @{
            "Rates" = @()
        }
    }
    $content.Rates += $hash
    $json = $content | ConvertTo-Json
    $json | Set-Content -Path $fullPath
}