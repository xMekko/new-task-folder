cls
Write-Host "##### Nad czym bedziesz pracowac? #####`n 1. Sekcja head`n 2. Propozycja zmian`n 3. Wdrozenie`n 4. Inne`n#######################################`n"

#uzytkownik wybiera opcje
do {
        $wybor = Read-Host("Wybierz opcje")
} while ($wybor -notin "1","2","3","4")

#opcja 1. sekcja head
if ($wybor -eq "1") {
    Write-Host "`n##### Wyborano sekcje head #####`n"
    #jesli nie ma utworzonego folderu z sekcjami head - utworz go
    if (-not ( Test-Path .\sekcje_head -PathType Container ) ) {
        New-Item -Name sekcje_head -ItemType Directory | Out-Null
        cd .\sekcje_head\
    }
    else { cd .\sekcje_head }
}
#opcja 2. propozycja zmian
elseif ($wybor -eq "2") {
    Write-Host "`n##### Wyborano propozycje zmian #####`n"
    #jesli nie ma utworzonego folderu z propozycjami zmian - utworz go
    if (-not ( Test-Path .\propozycje_zmian -PathType Container ) ) {
        New-Item -Name propozycje_zmian -ItemType Directory | Out-Null
        cd .\propozycje_zmian\
    }
    else { cd .\propozycje_zmian }
}
#opcja 3. wdrozenie
elseif ($wybor -eq "3") {
    Write-Host "`n##### Wyborano wdrozenie #####`n"
    #jesli nie ma utworzonego folderu z kopiami do wdrozen - utworz go
    if (-not ( Test-Path .\wdrozenia -PathType Container ) ) {
        New-Item -Name wdrozenia -ItemType Directory | Out-Null
        cd .\wdrozenia\
    }
    else { cd .\wdrozenia }
}


#podaje nazwe klienta (nie przyjmuje spacji na poczatku)
do {
    $klient = Read-Host("Podaj nazwe klienta lub strony")
} while ($klient -eq "" -or $klient -match "\s+")

#jesli nie ma utworzonego folderu dla podanego klienta - utworz go
if (-not ( Test-Path ".\$klient" -PathType Container ) ) {
    New-Item -Name "$klient" -ItemType Directory | Out-Null
    cd ".\$klient"
}
else { cd ".\$klient" }

#jesli nie ma, tworzy folder z dzisiejsza data w formacie YYYY-MM-DD
$dzisiaj = Get-Date -Format "yyyy-MM-dd"
if (-not ( Test-Path ".\$dzisiaj" -PathType Container ) ) {
    New-Item -Name "$dzisiaj" -ItemType Directory | Out-Null
    cd ".\$dzisiaj"
}
else { cd ".\$dzisiaj" }

#jesli wybrano opcje wdrozen, automatycznie tworzy foldery A oraz Z
if ($wybor -eq "3") {
    if (-not ( Test-Path .\A -PathType Container ) ) {
        New-Item -Name A -ItemType Directory | Out-Null
    }
    if (-not ( Test-Path .\Z -PathType Container ) ) {
        New-Item -Name Z -ItemType Directory | Out-Null
    }
}

#na koniec - otwiera utworzony folder z dzisiejsza data w folderze klienta
Invoke-Item .\