while($true)
{
    $n = [int]$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp").Character;
    if($n -ge 49 -and $n -le 57)
    {
        [System.Console]::Beep($n * 30, 500);
    }
}
