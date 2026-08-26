#!/bin/bash
cd "$(dirname "$0")"

# 1. Débloquer git si nécessaire
if [ -f .git/index.lock ]; then
  rm .git/index.lock
  echo "🔓 index.lock supprimé"
fi

# 2. Désindexer les backups de git
git rm --cached lecons_html/*.bak* 2>/dev/null
echo "*.bak_before_qm" >> .gitignore
echo "*.bak_before_match" >> .gitignore
git add .gitignore

# 3. Supprimer les fichiers physiques
rm -f lecons_html/*.bak*
echo "🗑️  Fichiers .bak supprimés"

# 4. Commit
git commit -m "Nettoyage : suppression backups .bak + .gitignore"
echo "✅ Nettoyage terminé"
