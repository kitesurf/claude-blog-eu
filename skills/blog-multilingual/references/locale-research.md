# Sprachraum-First Research Profiles (EU-Overlay)

**Zweck:** Search-Intent- und Keyword-Recherche immer NATIV im Zielsprachraum —
niemals Blind-Recherche in einer Sprache mit anschließender Übersetzung.

## Unveränderliche Regeln
1. Für JEDE Zielsprache wird VOR dem Schreiben eigenständig recherchiert.
2. Alle Suchanfragen laufen in der Sprache des Zielsprachraums
   (Google: `hl=<sprache>&gl=<land>`; SERP-Konkurrenzanalyse nur aus den
   Top-10 des Zielsprachraums — niemals die EN-SERP als Stellvertreter).
   Umsetzung: Queries vollständig nativ formulieren, Regionalbezug in der
   Query tragen (z. B. ‚… Deutschland', `site:.de`); SERP-Alternativen:
   DuckDuckGo `kl=de-de`, Bing `mkt=de-DE`; mit DataForSEO
   `location_code`/`language_code` explizit setzen.
3. Keyword-Sets werden NICHT aus der Ursprungssprache übersetzt. Jeder Markt
   erhält ein nativ recherchiertes Set (Volumen, Intent und Formulierungen
   unterscheiden sich je Sprachraum).
4. Quellenpräferenzen je Sprachraum: siehe `skills/blog-translate/references/cultural-adaptation.md` (liegt im claude-blog-Repo und wird mitinstalliert).
5. Ergebnis pro Sprache: `research-<hreflang>.md` (z. B. `research-de-DE.md`)
   mit Suchintent, Keyword-Set, Top-10-Gegner, Struktur-/FAQ-Ideen,
   Quellen + Erhebungsdatum. Dieses Schema ersetzt für Sprachraum-Recherchen
   das Standard-Output-Format des Researchers.

## Profile (Startwert) — Ergänzungen im Overlay-Repo pflegen, nicht in der installierten Kopie (`~/.claude` wird bei Rollouts überschrieben).
| Locale | hl/gl | Branchenspezifische Ergänzungen | Notizen |
|---|---|---|---|
| de-DE | de/de | Wassersport: VDWS, TÜV | Sie/du je Zielgruppe, EUR |
| pl-PL | pl/pl | Wassersport: PZŻ/PSKite, Hel/Chałupy/Rewa | Kein DIN/VDWS-Bezug |
| fr-FR | fr/fr | Wassersport: FFVela, Météo-France | vous-Standard |
| pt-PT | pt/pt | Wassersport: FPVELA | EUR |
| es-ES | es/es | Wassersport: RFEV | EUR |
| en-US | en/us | — | Fallback |

Bei Überschneidungen gilt `skills/blog-translate/references/cultural-adaptation.md` als Single Source of Truth.

Verweis aus: `blog-multilingual` (Phase 2), `blog-researcher`-Agent, `blog-brief`.
