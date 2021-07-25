function Get-Rates{
    param(
        [string] $CurrencyCode
    )
    $rates = Invoke-RateRequest -CurrencyCode $CurrencyCode
    @{
        "CurrencyCode" = $CurrencyCode
        "Rate" = $rates."$CurrencyCode".rate 
        "Timestamp" =  (Get-Date -UnixTimeSeconds ($rates."$CurrencyCode".timestamp)).ToString()
    }
}