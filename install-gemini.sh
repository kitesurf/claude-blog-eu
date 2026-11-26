#!/usr/bin/env bash
set -euo pipefail

# ══════════════════════════════════════════════════════════════
# Gemini & Google Antigravity Blog Toolkit - Installer
# ══════════════════════════════════════════════════════════════

main() {
    local MODE="global"
    local REPO_URL="https://github.com/AgriciDaniel/claude-blog"
    local REPO_TAG="${GEMINI_BLOG_TAG:-main}"
    local GEMINI_CONFIG_DIR="${HOME}/.gemini/config"
    local GEMINI_SKILLS_DIR="${GEMINI_CONFIG_DIR}/skills"
    local GEMINI_PLUGIN_DIR="${GEMINI_CONFIG_DIR}/plugins/gemini-blog"
    local SCRIPT_DIR
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --local)
                MODE="local"
                shift
                ;;
            --global)
                MODE="global"
                shift
                ;;
            --help|-h)
                echo "Usage: ./install-gemini.sh [--local | --global]"
                echo "  --global (default): Install to ~/.gemini/config/ for all workspaces"
                echo "  --local:            Configure current project workspace (.agents/ & .venv)"
                exit 0
                ;;
            *)
                echo "Unknown option: $1"
                echo "Usage: ./install-gemini.sh [--local | --global]"
                exit 1
                ;;
        esac
    done

    echo "════════════════════════════════════════════════════════"
    echo "║   Gemini & Antigravity Blog Toolkit - Installer      ║"
    echo "║   Blog Creation & Optimization Skills Setup          ║"
    echo "════════════════════════════════════════════════════════"
    echo ""
    echo "→ Installation mode: ${MODE}"
    echo ""

    # Check prerequisites
    command -v git >/dev/null 2>&1 || { echo "✗ Git is required but not installed."; exit 1; }
    
    # Check Python 3.11+
    local py_found=0
    for cmd in python3 python py; do
        if command -v "${cmd}" >/dev/null 2>&1; then
            if "${cmd}" -c "import sys; exit(0 if sys.version_info >= (3, 11) else 1)" >/dev/null 2>&1; then
                py_found=1
                break
            fi
        fi
    done

    if [ "${py_found}" -eq 0 ]; then
        echo "✗ Python 3.11 or newer is required." >&2
        exit 1
    fi

    local SOURCE_DIR="${SCRIPT_DIR}"

    if [ "${MODE}" = "local" ]; then
        echo "→ Setting up local workspace (.agents/)..."
        local workspace_agents="${SCRIPT_DIR}/.agents"
        mkdir -p "${workspace_agents}/skills"
        mkdir -p "${workspace_agents}/rules"

        # Create Python venv
        echo "→ Creating Python virtual environment (.venv)..."
        if [ ! -d "${SCRIPT_DIR}/.venv" ]; then
            python3 -m venv "${SCRIPT_DIR}/.venv"
        fi
        
        echo "→ Installing dependencies..."
        "${SCRIPT_DIR}/.venv/bin/pip" install --quiet --disable-pip-version-check -r "${SCRIPT_DIR}/requirements.txt" 2>/dev/null || true

        # Make scripts executable
        chmod +x "${SCRIPT_DIR}/scripts/"*.py 2>/dev/null || true

    else
        echo "→ Installing globally to ${GEMINI_CONFIG_DIR}..."
        mkdir -p "${GEMINI_SKILLS_DIR}"
        mkdir -p "${GEMINI_PLUGIN_DIR}"

        # Copy plugin bundle
        echo "  → Copying files to ${GEMINI_PLUGIN_DIR}..."
        cp -r "${SOURCE_DIR}/skills" "${GEMINI_PLUGIN_DIR}/"
        [ -d "${SOURCE_DIR}/agents" ] && cp -r "${SOURCE_DIR}/agents" "${GEMINI_PLUGIN_DIR}/"
        [ -d "${SOURCE_DIR}/scripts" ] && cp -r "${SOURCE_DIR}/scripts" "${GEMINI_PLUGIN_DIR}/"
        [ -d "${SOURCE_DIR}/data" ] && cp -r "${SOURCE_DIR}/data" "${GEMINI_PLUGIN_DIR}/"
        [ -f "${SOURCE_DIR}/requirements.txt" ] && cp "${SOURCE_DIR}/requirements.txt" "${GEMINI_PLUGIN_DIR}/"
        [ -f "${SOURCE_DIR}/GEMINI.md" ] && cp "${SOURCE_DIR}/GEMINI.md" "${GEMINI_PLUGIN_DIR}/"

        # Register individual skills in ~/.gemini/config/skills/
        echo "  → Registering 32 skills in ~/.gemini/config/skills/..."
        for skill_dir in "${SOURCE_DIR}/skills"/*/; do
            [ -d "${skill_dir}" ] || continue
            skill_name=$(basename "${skill_dir}")
            target="${GEMINI_SKILLS_DIR}/${skill_name}"
            rm -rf "${target}"
            mkdir -p "${target}"
            cp -r "${skill_dir}"* "${target}/"
        done

        # Create Python venv in plugin dir
        echo "  → Setting up Python runtime in ${GEMINI_PLUGIN_DIR}/.venv..."
        python3 -m venv "${GEMINI_PLUGIN_DIR}/.venv"
        "${GEMINI_PLUGIN_DIR}/.venv/bin/pip" install --quiet --disable-pip-version-check -r "${GEMINI_PLUGIN_DIR}/requirements.txt" 2>/dev/null || true
        chmod +x "${GEMINI_PLUGIN_DIR}/scripts/"*.py 2>/dev/null || true
    fi

    echo ""
    echo "════════════════════════════════════════════════════════"
    echo "✓ Blog Toolkit for Gemini & Antigravity is ready!"
    echo "════════════════════════════════════════════════════════"
    echo ""
    echo "Verwendung in Google Antigravity & Gemini:"
    echo "  1. In Antigravity öffnen: Dieses Projekt wird automatisch mit allen Skills erkannt."
    echo "  2. Befehle ausführen (Beispiele):"
    echo "     - /blog write <thema>"
    echo "     - /blog outline <thema>"
    echo "     - /blog brief <thema>"
    echo "     - /blog seo-check <datei.md>"
    echo "     - 'Schreibe einen informativen Blogartikel über XYZ'"
    echo ""
    echo "Dokumentation: docs/GEMINI-ANTIGRAVITY.md"
    echo ""
}

main "$@"
