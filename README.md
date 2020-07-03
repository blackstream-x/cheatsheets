# VMWare-ESXi
## Cheatsheet
### Lokale Konsole
Starten der Konsole mit Alt-F1, anmelden.

Anzeige der konfigurierten VMs:  
`vim-cmd vmsvc/getallvms`  
(in der Ersten Spalte wird die jeweilige ID der VM angezeigt)

Anzeige aller laufenden VMs:  
`esxcli vm process list`  
(falls keine läuft, wird Unix-befehlstypisch nichts angezeigt)

Anzeige des Zustands der VM mit ID 2:  
`vim-cmd vmsvc/power.getstate 2`  
(liefert "powered off" oder "powered on")

"Einschalten" (=Starten) der VM mit ID 2:  
`vim-cmd vmsvc/power.on 2`  
(liefert nur eine kurze Meldung über das Starten, das Booten des Betriebssystems auf der VM läuft im Hintergrund)

