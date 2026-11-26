# Google Gemini & Google Antigravity Blog Guide

> Vollständiger Leitfaden zur Nutzung des **Blog Creation & Optimization Toolkits** mit **Google Gemini** (Gemini CLI / Code Assist / Web) und **Google Antigravity IDE**.

---

## 🚀 Schnellstart

### 1. Verwendung in Google Antigravity
Wenn Sie dieses Projekt (`gemini-blog`) in Antigravity öffnen:
1. Antigravity erkennt automatisch die Steuerungsdatei `GEMINI.md` sowie die Workspace-Konfiguration unter `.agents/`.
2. Alle **32 Skills** (Recherche, Gliederung, Erstellung, Schema, Fact-Checking, SEO-Prüfung) sind sofort aktiv.
3. Sie können direkt im Chat Blog-Workflows starten (z. B. `/blog write "Vorteile von Headless CMS für E-Commerce"` oder `"Erstelle eine Content-Gliederung für..."`).

### 2. Globale Installation für alle Workspaces
Um das Blog-Toolkit machine-weit für alle Gemini- und Antigravity-Workspaces bereitzustellen:

```bash
cd /Users/daniel/Webseiten/gemini-blog
./install-gemini.sh --global
```

Dies registriert alle 32 Skills unter `~/.gemini/config/skills/`.

---

## ⚡ Gemini & Antigravity Superpowers für Content Creation

### 1. 1M–2M Token Context Window (Pillar Content & Buchprojekte)
* **Pillar Pages & Whitepaper:** Verfassen Sie extrem tiefgehende, umfassende Leitfäden (10.000+ Wörter) oder mehrteilige Artikelserien in einem kohärenten Kontext.
* **Multi-Source Research:** Führen Sie dutzende Quelltexte, PDFs oder Studien in einem Prompt zusammen.

### 2. Google Search Grounding & Fact-Checking (`blog-factcheck`)
* Nutzen Sie Geminis Echtzeit-Suche (`search_web`), um alle im Artikel genannten Statistiken, Jahreszahlen und Fakten live auf Richtigkeit und Primärquellen zu prüfen.

### 3. Native Bildgenerierung für Blog-Visuals (`blog-image`)
* Erstellen Sie 16:9 Hero-Bilder, Infografiken und illustrative Diagramme direkt mit Antigravitys `generate_image` oder Imagen.

### 4. Gemini TTS Audio-Narration (`blog-audio`)
* Erstellen Sie automatische Podcast- / Voice-Versionen Ihrer Blogartikel für Barrierefreiheit und User Engagement.

---

## 📋 Verfügbare Befehle & Beispiele

* `/blog write <thema>` – Vollständigen, leserorientierten Artikel schreiben.
* `/blog outline <thema>` – SERP- und Intent-basierte Gliederung erstellen.
* `/blog brief <thema>` – Redaktionsbriefing für Autoren definieren.
* `/blog rewrite <datei>` – Bestehende Posts überarbeiten und aufwerten.
* `/blog seo-check <datei>` – Post-Writing SEO-Check (Headings, Keywords, Schema).
* `/blog analyze <datei>` – 100-Punkte Text- und Qualitätsanalyse.
* `/blog factcheck <datei>` – Faktenprüfung mit Primärquellen.
* `/blog calendar <nische>` – Redaktionsplan mit Topic-Clustern erstellen.
* `/blog schema <datei>` – JSON-LD Schema.org Markup erzeugen.
* `/blog translate <datei> <sprache>` – Lokalisierte Übersetzung in andere Sprachen.
