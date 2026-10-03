#!/bin/bash
set -euo pipefail

DEST_DIR="${HOME}/.local/bin"
mkdir -p "${DEST_DIR}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rm -f "${DEST_DIR}/rz-goresym"
cp "${SCRIPT_DIR}/rz_goresym.py" "${DEST_DIR}/rz-goresym"
chmod +x "${DEST_DIR}/rz-goresym"

echo "[+] Successfully installed rz-goresym to ${DEST_DIR}/rz-goresym"
echo "[*] Pre-bootstrapping GoReSym engine..."
"${DEST_DIR}/rz-goresym" --download
echo "[+] Done."
