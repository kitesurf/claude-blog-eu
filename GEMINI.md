# Gemini & Antigravity Blog: Universal Blog Creation & Content Engine

> **Instruktionen für Google Gemini (CLI, Web, Code Assist) und Google Antigravity Agents**
> Für Claude Code Nutzer: siehe `CLAUDE.md`. Für Multi-Platform-Agents: siehe `AGENTS.md`.

---

## 🌟 Übersicht

Dieses Repository enthält das umfassendste Content- & Blog-Erstellungs-Toolkit für KI-Agents:
* **32 spezialisierte Sub-Skills** für Recherche, Gliederung, Erstellung, Optimierung, Fact-Checking und Multilingual-Publishing.
* **5 spezialisierte Sub-Agents** (inkl. Blocking Blog-Reviewer nach dem 5-Gate Blog Delivery Contract).
* **12 erprobte Content-Templates** (How-To, Listicle, Case Study, Comparison, Thought Leadership, etc.).
* **19 Python-Skripte** für Analyse, Preflight-Prüfung, Rendering, Konzeptdichte und SEO-Prüfung.
* **Native Gemini & Antigravity Features:** 1M–2M Token Kontextfenster für Whitepaper/Bücher, Google Search Grounding, native Bildgenerierung (`generate_image`) und Gemini TTS Sprachausgabe (`blog-audio`).

---

## 🛠️ Tool-Mapping für Antigravity & Gemini

| Vorgang / Claude-Äquivalent | Antigravity / Gemini Tool | Ausführung / Verwendung |
| :--- | :--- | :--- |
| **Python-Skripte ausführen** (`Bash`) | `run_command` | `python3 scripts/<script_name>.py [args]` |
| **Dateien & Referenzen lesen** (`Read`) | `view_file` | Absolute Pfade zu `skills/*/references/*.md` oder Vorlagen |
| **Artikel / Briefings schreiben** (`Write`/`Edit`) | `write_to_file` / `replace_file_content` | Erstellung von Markdown-Artikeln, Outlines und Briefs |
| **Bilder erstellen (Hero, Infografiken)** | `generate_image` / `gemini_generate_image` | Native Bildgenerierung für Header & Grafiken |
| **Live Faktenprüfung & SERP Recherche** | `search_web` / Google Grounding | Echtzeit-Validierung von Fakten, Statistiken & Rankings |
| **Audits & Preflight Checks** | `run_command` | Ausführung von `python3 scripts/blog_preflight.py <post.md>` |

---

## 🚀 Schnellreferenz: Blog-Befehle & Workflows

Die Skills können über Slash-Commands (`/blog <cmd>`) oder direkte Prompts auf Deutsch/Englisch genutzt werden:

| Befehl / Intent | Was der Agent ausführt | Relevanter Skill |
| :--- | :--- | :--- |
| `/blog write <thema>`<br>*"Schreibe einen Blogartikel über..."* | Vollständige Recherche, Gliederung und Verfassung eines E-E-A-T-optimierten Artikels | `skills/blog-write/`<br>`skills/blog/` |
| `/blog outline <thema>`<br>*"Erstelle eine Gliederung für..."* | SERP-informierte Gliederung mit H2/H3-Hierarchie, Suchintention und Entitäten | `skills/blog-outline/` |
| `/blog brief <thema>`<br>*"Erstelle ein Content-Briefing"* | Detailliertes Redaktionsbriefing mit Zielgruppe, Word-Count-Zielen und Keywords | `skills/blog-brief/` |
| `/blog rewrite <datei>`<br>*"Optimiere diesen Artikel..."* | Überarbeitung bestehender Beiträge hinsichtlich E-E-A-T, Hook, Lesbarkeit und Tiefe | `skills/blog-rewrite/` |
| `/blog seo-check <datei>`<br>*"Prüfe das SEO des Blogartikels"* | Post-Writing Validierung (Keywords, Heading-Flow, Meta-Tags, Schema) | `skills/blog-seo-check/` |
| `/blog analyze <datei>`<br>*"Analysiere diesen Text"* | 5-Kategorien 100-Punkte Qualitätsbewertung (`scripts/analyze_blog.py`) | `skills/blog-analyze/` |
| `/blog factcheck <datei>`<br>*"Faktenprüfung durchführen"* | Überprüfung aller Fakten, Zahlen und Quellen über Google Search Grounding | `skills/blog-factcheck/` |
| `/blog calendar <niche>`<br>*"Erstelle einen Redaktionsplan"* | Strategischer Redaktionsplan mit Topic-Clustern für 1–3 Monate | `skills/blog-calendar/` |
| `/blog cluster <keyword>`<br>*"Topic-Cluster planen"* | Hub-and-Spoke Content-Cluster mit interner Verlinkungsmatrix | `skills/blog-cluster/` |
| `/blog schema <datei>`<br>*"Generiere Schema.org Markup"* | JSON-LD Schema (Article, BlogPosting, HowTo, FAQPage) | `skills/blog-schema/` |
| `/blog image <prompt>`<br>*"Erstelle ein Hero-Bild"* | KI-Bildgenerierung für Artikel-Header und Social Share Visuals | `skills/blog-image/` |
| `/blog audio <datei>`<br>*"Erstelle Audio-Narration"* | Erzeugung von natürlicher Sprachausgabe (TTS) via Gemini Audio API | `skills/blog-audio/` |
| `/blog translate <datei> <lang>`<br>*"Übersetze & lokalisiere"* | Kulturell angepasste Übersetzung in DE, EN, ES, FR, IT, etc. | `skills/blog-translate/` |

---

## ⚡ Superpowers mit Gemini & Antigravity

### 1. 1M–2M Context Window (Long-form & Book-length Content)
* **Pillar Pages & E-Books:** Gemini kann vollständige Leitfäden (10.000+ Wörter), Serien oder ganze E-Books in einem Durchgang kohärent strukturieren und verfassen.
* **Multi-Source Synthesis:** Laden Sie mehrere PDFs, Forschungsberichte oder Wettbewerber-Artikel parallel zur Synthese.

### 2. Google Search Grounding & Live Fact-Checking
* Nutzen Sie Geminis Live-Suche (`search_web`), um aktuelle Statistiken, Studien, Gesetzesänderungen oder Branchen-News in Blogartikel einfließen zu lassen.

### 3. Native Bildgenerierung (`generate_image`)
* Erstellen Sie 16:9 Blog-Header-Grafiken, Infografiken und illustrative Diagramme direkt beim Schreiben.

### 4. 5-Gate Blog Delivery Contract
Jeder geschriebene Artikel durchläuft vor der Fertigstellung automatische Prüfungen:
1. **Gate 1:** Struktur & Heading-Flow (H1 -> H2 -> H3)
2. **Gate 2:** E-E-A-T & Fakten-Integrität
3. **Gate 3:** Prose Hygiene (keine generischen KI-Füllwörter wie "Tauchen Sie ein in...", "In der heutigen digitalen Welt...")
4. **Gate 4:** Schema.org JSON-LD Validierung
5. **Gate 5:** Review & Preflight Check (`python3 scripts/blog_preflight.py`)
