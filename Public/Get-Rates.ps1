function Get-Rates{
    $currencyCode = "USDPLN"
    $rates = Invoke-RateRequest -CurrencyCode $currencyCode
    $param = @{
        "CurrencyCode" = $currencyCode
        "Rate" = $rates."$currencyCode".rate 
        "Timestamp" =  Get-Date -UnixTimeSeconds $rates."$currencyCode".timestamp
    }
    Save-Rate @param
}