param(
    [string]$filePath = $(throw "required..."),
    [int]$fontWide = 8,
    [int]$fontHigh = 16)

[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
$image = [System.Drawing.Bitmap]::FromFile((Convert-Path -Path $filePath));
$characters = @('#', '8', '0', 'V', '1', 'i', ':', '*', '|', '.', ' ', '¶î');

0..[Math]::Floor($image.Height / $fontHigh - 1) | % { $sy = $_ ;
0..[Math]::Floor($image.Width / $fontWide - 1) | % { $sx = $_;
    $brightnesses = 0.0;
    0..($fontHigh - 1) | % { $y = $_;
    0..($fontWide - 1) | % { $x = $_;
        $brightnesses += $image.GetPixel($sx * $fontWide + $x, $sy * $fontHigh + $y).GetBrightness();
    }}
    $idx = [Math]::Floor($brightnesses / ($fontWide * $fontHigh) * ($characters.Length - 1));
    Write-Host $characters[$idx] -NoNewline
}
Write-Host
}