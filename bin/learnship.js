#!/usr/bin/env node
// learnship — npx installer
// Usage: npx learnship [--local|--global] [--uninstall]

const { execSync, spawnSync } = require('child_process');
const path = require('path');
const fs = require('fs');
const os = require('os');

const args = process.argv.slice(2);
const hasLocal = args.includes('--local');
const hasGlobal = args.includes('--global');
const hasUninstall = args.includes('--uninstall');
const hasHelp = args.includes('--help') || args.includes('-h');

if (hasHelp) {
  console.log(`
learnship — Learn as you build. Build with intent.

Usage:
  npx github:FavioVazquez/learnship                  # interactive install
  npx github:FavioVazquez/learnship --local          # install to current project (.windsurf/)
  npx github:FavioVazquez/learnship --global         # install to all Windsurf projects (~/.codeium/windsurf/)
  npx github:FavioVazquez/learnship --uninstall --local
  npx github:FavioVazquez/learnship --uninstall --global

After installing, open Windsurf and type /new-project to start.
  `);
  process.exit(0);
}

// Resolve the install.sh path (bundled alongside this script)
const repoRoot = path.resolve(__dirname, '..');
const installScript = path.join(repoRoot, 'install.sh');

if (!fs.existsSync(installScript)) {
  console.error('Error: install.sh not found. The package may be incomplete.');
  process.exit(1);
}

// Build args to forward to install.sh
const forwardArgs = [];
if (hasLocal) forwardArgs.push('--local');
if (hasGlobal) forwardArgs.push('--global');
if (hasUninstall) forwardArgs.push('--uninstall');

const result = spawnSync('bash', [installScript, ...forwardArgs], {
  stdio: 'inherit',
  cwd: repoRoot,
  env: {
    ...process.env,
    LEARNSHIP_INSTALL_CWD: process.env.INIT_CWD || process.cwd(),
  },
});

process.exit(result.status ?? 0);
