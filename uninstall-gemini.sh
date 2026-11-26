#!/usr/bin/env bash
set -euo pipefail

main() {
    local GEMINI_CONFIG_DIR="${HOME}/.gemini/config"
    local GEMINI_SKILLS_DIR="${GEMINI_CONFIG_DIR}/skills"
    local GEMINI_PLUGIN_DIR="${GEMINI_CONFIG_DIR}/plugins/gemini-blog"

    echo "→ Uninstalling Blog Toolkit for Gemini & Antigravity..."

    local removed=0
    if [ -d "${GEMINI_PLUGIN_DIR}" ]; then
        rm -rf "${GEMINI_PLUGIN_DIR}"
        echo "  Removed: ${GEMINI_PLUGIN_DIR}"
        removed=$((removed + 1))
    fi

    shopt -s nullglob
    for skill_path in "${GEMINI_SKILLS_DIR}"/blog*; do
        if [ -d "${skill_path}" ]; then
            rm -rf "${skill_path}"
            echo "  Removed: ${skill_path}"
            removed=$((removed + 1))
        fi
    done
    shopt -u nullglob

    if [ "${removed}" -eq 0 ]; then
        echo "  Nothing to remove."
        return 0
    fi

    echo "✓ Blog Toolkit successfully uninstalled from Gemini/Antigravity configuration."
}

main "$@"
