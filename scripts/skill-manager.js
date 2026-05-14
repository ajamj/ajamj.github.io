#!/usr/bin/env node
// Simple Skill Manager for AI agent tools
// Supports: Agents, Cursor, Claude (YAML SKILL.md format), Windsurf/Cline/Continue/Roo (plain .md format), and single-file tools.
// Paths follow the conventions described in the user guide.
// Usage examples:
//   node scripts/skill-manager.js list agents
//   node scripts/skill-manager.js read agents my-skill
//   node scripts/skill-manager.js create agents my-new-skill -d "Desc" -c "Instructions..."
//   node scripts/skill-manager.js enable agents my-new-skill
//   node scripts/skill-manager.js disable agents my-new-skill
//   node scripts/skill-manager.js delete agents my-old-skill
//   node scripts/skill-manager.js copy agents my-skill claude new-skill

import fs from 'fs'
import path from 'path'
import os from 'os'

const home = process.env.HOME || process.env.USERPROFILE || os.homedir()

function resolve(p) {
  if (!p) return p
  if (p.startsWith('~')) {
    return path.join(home, p.slice(1))
  }
  return p
}

const TOOL_DEFS = {
  yaml: {
    agents:  { global: path.join(resolve('~/.agents/skills')),   project: path.join(process.cwd(), '.agents/skills') },
    cursor:   { global: path.join(resolve('~/.cursor/skills')),   project: path.join(process.cwd(), '.cursor/skills') },
    claude:  { global: path.join(resolve('~/.claude/skills')),   project: path.join(process.cwd(), '.claude/skills') },
  },
  plain: {
    windsurf: { global: path.join(resolve('~/.windsurf/rules')),  project: path.join(process.cwd(), '.windsurf/rules') },
    cline:   { global: path.join(resolve('~/.cline/rules')),    project: path.join(process.cwd(), '.cline/rules') },
    cont:    { global: path.join(resolve('~/.continue/rules')),  project: path.join(process.cwd(), '.continue/rules') },
    roo:     { global: path.join(resolve('~/.roo/rules')),       project: path.join(process.cwd(), '.roo/rules') },
  },
  single: {
    Copilot: { global: resolve('~/.github/copilot-instructions.md'), project: path.join(process.cwd(), '.github/copilot-instructions.md') },
    Codex:   { global: resolve('~/.codex/AGENTS.md'),            project: path.join(process.cwd(), '.codex/AGENTS.md') },
    Aider:   { global: resolve('~/.aider.conf.yml'),               project: path.join(process.cwd(), '.aider.conf.yml') },
    Augment: { global: resolve('~/augment-guidelines.md'),         project: path.join(process.cwd(), 'augment-guidelines.md') },
  },
  // project root variant for some tools is the same structure in this script
}

function ensureDir(p) {
  if (!fs.existsSync(p)) fs.mkdirSync(p, { recursive: true })
}

function titleCaseName(n) {
  return n.split(/[-_]/).map(w => w.charAt(0).toUpperCase() + w.slice(1)).join(' ')
}

function readYamlSkill(root, name) {
  const file = path.join(root, name, 'SKILL.md')
  if (fs.existsSync(file)) return file
  const alt = path.join(root, name, 'SKILL.md.disabled')
  if (fs.existsSync(alt)) return alt
  return null
}

function readPlainSkill(root, name) {
  const file = path.join(root, name, `${name}.md`)
  if (fs.existsSync(file)) return file
  const alt = path.join(root, name, `${name}.md.disabled`)
  if (fs.existsSync(alt)) return alt
  return null
}

function listYaml(toolKey, scope) {
  const root = TOOL_DEFS.yaml[toolKey]?.[scope]
  if (!root) {
    console.log(`Unknown YAML tool: ${toolKey} or scope: ${scope}`)
    return
  }
  if (!fs.existsSync(root)) { console.log(`Path does not exist: ${root}`); return }
  const items = []
  for (const name of fs.readdirSync(root)) {
    const dir = path.join(root, name)
    if (!fs.statSync(dir).isDirectory()) continue
    const s1 = path.join(dir, 'SKILL.md')
    const s2 = path.join(dir, 'SKILL.md.disabled')
    if (fs.existsSync(s1) || fs.existsSync(s2)) {
      items.push({ name, path: fs.existsSync(s1) ? s1 : s2, enabled: fs.existsSync(s1) })
    }
  }
  if (items.length === 0) {
    console.log(`No YAML skills found for ${toolKey} (${scope})`)
    return
  }
  items.sort((a,b)=> a.name.localeCompare(b.name))
  items.forEach(it => console.log(`- ${it.name}  [${it.enabled? 'enabled':'disabled'}]  -> ${it.path}`))
}

function listPlain(toolKey) {
  const root = TOOL_DEFS.plain[toolKey]?.global
  if (!root) { console.log(`Unknown plain tool: ${toolKey}`); return }
  if (!fs.existsSync(root)) { console.log(`Path does not exist: ${root}`); return }
  const dirNames = []
  for (const name of fs.readdirSync(root)) {
    const dir = path.join(root, name)
    if (fs.statSync(dir).isDirectory()) {
      const fm = path.join(dir, `${name}.md`)
      if (fs.existsSync(fm)) dirNames.push(name)
    }
  }
  if (dirNames.length === 0) { console.log(`No plain skills found for ${toolKey}`); return }
  dirNames.sort()
  dirNames.forEach(n => console.log(`- ${n}  -> ${path.join(root, n, `${n}.md`)}`))
}

// (duplicate removed)

// (readPlainSkill duplicate removed)

function showRead(file) {
  if (!file) { console.log('Skill not found.'); return }
  console.log(`--- ${file} ---`)
  console.log(fs.readFileSync(file, 'utf8'))
}

function createYamlSkill(rootGlobal, rootProject, name, description, content) {
  const dir = path.join(rootGlobal, name)
  ensureDir(dir)
  const file = path.join(dir, 'SKILL.md')
  const title = titleCaseName(name)
  const front = ['---', `name: ${name}`, `description: ${description || ''}`, '---', '', `# ${title}`, '', content || 'Instructions for the agent go here.', ''].join('\n')
  fs.writeFileSync(file, front, 'utf8')
  console.log(`Created YAML skill at ${file}`)
  // Optional: also create in project scope
  if (rootProject) {
    const dirP = path.join(rootProject, name); ensureDir(dirP)
    const fileP = path.join(dirP, 'SKILL.md')
    fs.writeFileSync(fileP, front, 'utf8')
    console.log(`Also created in project scope: ${fileP}`)
  }
}

function createPlainSkill(rootGlobal, rootProject, name) {
  const dir = path.join(rootGlobal, name)
  ensureDir(dir)
  const file = path.join(dir, `${name}.md`)
  const title = titleCaseName(name)
  const content = `# ${title}\n\nInstructions for the rule go here.`
  fs.writeFileSync(file, content, 'utf8')
  console.log(`Created plain skill at ${file}`)
  if (rootProject) {
    const dirP = path.join(rootProject, name); ensureDir(dirP)
    const fileP = path.join(dirP, `${name}.md`)
    fs.writeFileSync(fileP, content, 'utf8')
    console.log(`Also created in project scope: ${fileP}`)
  }
}

function enableSkill(root, name) {
  const skillDir = path.join(root, name)
  const md = path.join(skillDir, 'SKILL.md')
  if (fs.existsSync(md)) {
    // Already enabled
    console.log(`Enabled: ${md}`)
    return
  }
  const mdDisabled = path.join(skillDir, 'SKILL.md.disabled')
  if (fs.existsSync(mdDisabled)) {
    fs.renameSync(mdDisabled, md)
    console.log(`Enabled: ${md}`)
  } else {
    console.log(`No disabled skill found at ${mdDisabled}`)
  }
}

function disableSkill(root, name) {
  const skillDir = path.join(root, name)
  const md = path.join(skillDir, 'SKILL.md')
  if (fs.existsSync(md)) {
    fs.renameSync(md, md + '.disabled')
    console.log(`Disabled: ${md}.disabled`)
  } else {
    console.log(`No skill found to disable at ${md}`)
  }
}

function deleteSkill(root, name, force = false) {
  const skillDir = path.join(root, name)
  if (fs.existsSync(skillDir)) {
    if (!force) {
      console.log(`Deletion requires --force flag. Aborting: ${skillDir}`)
      return
    }
    // For safety, do not delete project/global conflict; just remove directory
    fs.rmSync(skillDir, { recursive: true, force: true })
    console.log(`Deleted: ${skillDir}`)
  } else {
    console.log(`Skill not found: ${skillDir}`)
  }
}

function copySkill(srcRoot, destRoot, name) {
  const srcDir = path.join(srcRoot, name)
  const destDir = path.join(destRoot, name)
  if (!fs.existsSync(srcDir)) {
    console.log(`Source skill not found: ${srcDir}`)
    return
  }
  ensureDir(destDir)
  // Copy entire directory
  const srcFiles = fs.readdirSync(srcDir)
  for (const f of srcFiles) {
    const srcPath = path.join(srcDir, f)
    const dstPath = path.join(destDir, f)
    if (fs.statSync(srcPath).isDirectory()) {
      // shallow copy for nested dirs
      fs.mkdirSync(dstPath, { recursive: true })
      // skip deep copy for simplicity
    } else {
      fs.copyFileSync(srcPath, dstPath)
    }
  }
  console.log(`Copied ${name} from ${srcRoot} to ${destRoot}`)
}

function copyGlobalToProject(toolName, name) {
  // Copy a global YAML skill to project scope for the same tool, if available
  const srcRoot = TOOL_DEFS.yaml?.[toolName]?.global
  const destRoot = TOOL_DEFS.yaml?.[toolName]?.project
  if (!srcRoot || !destRoot) {
    console.log('Could not determine YAML skill roots for project copy (tool not supported).')
    return
  }
  copySkill(srcRoot, destRoot, name)
}

// Prune unused skills by age and (optional) usage log
function pruneUnusedSkills(daysThreshold = 180, dryRun = false, logPath = null, force = false) {
  const now = Date.now()
  const skills = []

  // Gather YAML-based skills
  for (const [toolKey, root] of Object.entries(TOOL_DEFS.yaml)) {
    const rootDir = root.global
    if (!rootDir || !fs.existsSync(rootDir)) continue
    const names = fs.readdirSync(rootDir)
    for (const name of names) {
      const dir = path.join(rootDir, name)
      let isDir = false
      try { isDir = fs.statSync(dir).isDirectory() } catch {
        continue
      }
      if (!isDir) continue
      const f = path.join(dir, 'SKILL.md')
      if (fs.existsSync(f)) {
        const m = fs.statSync(f).mtimeMs
        const daysOld = Math.floor((now - m) / (1000 * 60 * 60 * 24))
        skills.push({ tool: toolKey, name, filePath: f, daysOld, type: 'yaml' })
      }
    }
  }

  // Gather plain-rule skills
  for (const [toolKey, root] of Object.entries(TOOL_DEFS.plain)) {
    const rootDir = root.global
    if (!rootDir || !fs.existsSync(rootDir)) continue
    const names = fs.readdirSync(rootDir)
    for (const name of names) {
      const dir = path.join(rootDir, name)
      if (!fs.statSync(dir).isDirectory()) continue
      const f = path.join(dir, `${name}.md`)
      if (fs.existsSync(f)) {
        const m = fs.statSync(f).mtimeMs
        const daysOld = Math.floor((now - m) / (1000 * 60 * 60 * 24))
        skills.push({ tool: toolKey, name, filePath: f, daysOld, type: 'plain' })
      }
    }
  }

  // Very lightweight usage-detection from log if provided
  const usedSet = new Set()
  if (logPath && fs.existsSync(logPath)) {
    try {
      const lines = fs.readFileSync(logPath, 'utf8').split(/\r?\n/)
      for (const line of lines) {
        const l = line.trim()
        if (!l) continue
        // crude heuristic: extract path-like segments ending in SKILL.md or *.md
        const matches = l.match(/\/[^\s]+?\/[^\s]+?\.(md|MD)$/g)
        if (matches) matches.forEach(p => usedSet.add(p.toLowerCase()))
        // also capture any explicit skill path mention
        if (l.includes('SKILL.md')) usedSet.add(l.toLowerCase())
        if (l.includes('.md')) usedSet.add(l.toLowerCase())
      }
    } catch {
      // ignore log parsing errors
    }
  }

  const toDelete = skills.filter(s => s.daysOld >= daysThreshold && !usedSet.has(s.filePath.toLowerCase()))
  if (toDelete.length === 0) {
    console.log('No unused skills found based on the provided threshold.');
    return
  }
  toDelete.sort((a,b) => b.daysOld - a.daysOld)
  console.log('Unused skills candidate for deletion:')
  for (const s of toDelete) {
    console.log(`- ${s.tool} ${s.name} (daysOld=${s.daysOld}, path=${s.filePath})`)
  }
  if (dryRun) {
    console.log('Dry-run: no deletions performed. Use --force to delete.')
    return
  }
  // Proceed to delete
  for (const s of toDelete) {
    const root = s.type === 'yaml' ? TOOL_DEFS.yaml[s.tool]?.global : TOOL_DEFS.plain[s.tool]?.global
    if (root) deleteSkill(root, s.name, force)
  }
}
function printHelp() {
  console.log(`Skill Manager (node scripts/skill-manager.js) usage:
  list [tool]                - List skills for a tool (e.g., agents, windsfo, claude, etc.)
  read <tool> <name>          - Read a skill's SKILL.md (yaml) or md (plain)
  create <tool> <name> -d <desc> [-c <content>]   - Create a new skill (yaml for Agents/Cursor/Claude; md for Windsurf/Cline/Continue/Roo)
  enable <tool> <name>        - Enable a skill (un-hide SKILL.md)
  disable <tool> <name>       - Disable a skill (rename to .disabled)
  delete <tool> <name>        - Delete a skill
  copy <src-tool> <src-name> <dest-tool> <dest-name> - Copy a skill between tools
  copy-global-to-project <tool> <name> - Copy a global skill to project scope (best-effort)
  help                        - Print this help`)
}

function main() {
  const args = process.argv.slice(2)
  if (args.length === 0 || args[0] === 'help') return printHelp()
  const cmd = args[0]
  switch (cmd) {
    case 'list': {
      const tool = args[1]
      if (!tool) {
        // List all known tools
        console.log('Agents (yaml):', Object.keys(TOOL_DEFS.yaml).join(', '))
        console.log('Plain (windsurf/cline/continue/roo):', Object.keys(TOOL_DEFS.plain).join(', '))
        console.log('Single-file tools: Copilot, Codex, Aider, Augment')
        return
      }
      // Determine if YAML or plain
      if (TOOL_DEFS.yaml[tool]) return listYaml(tool, 'global'), void 0
      if (TOOL_DEFS.plain[tool]) return listPlain(tool), void 0
      console.log(`Unknown tool: ${tool}`)
      break
    }
    case 'read': {
      const tool = args[1]
      const name = args[2]
      if (!tool || !name) { console.log('Please specify tool and skill name.'); return }
      // YAML-based
      if (TOOL_DEFS.yaml[tool]) {
        const file = readYamlSkill(tool, 'global', name)
        showRead(file)
        return
      }
      // Plain
      if (TOOL_DEFS.plain[tool]) {
        const file = readPlainSkill(tool, name)
        showRead(file)
        return
      }
      // Single-file tools
      if (TOOL_DEFS.single[toolTitleCase(tool)]) {
        const rt = TOOL_DEFS.single[toolTitleCase(tool)]
        const file = rt?.global
        if (file && fs.existsSync(file)) { showRead(file); return }
        console.log('Skill not found for single-file tool.');
        return
      }
      console.log('Unknown tool.');
      break
    }
    case 'create': {
      const tool = args[1]
      const name = args[2]
      if (!tool || !name) { console.log('Please specify tool and name.'); return }
      // Simple parsing for -d and -c options
      function getOpt(flag){ const idx = args.indexOf(flag); return idx>=0 && idx+1<args.length ? args[idx+1] : null }
      const desc = getOpt('-d') || getOpt('--description') || ''
      const content = getOpt('-c') || getOpt('--content') || ''
      if (TOOL_DEFS.yaml[tool]) {
        const roots = TOOL_DEFS.yaml[tool];
        createYamlSkill(roots.global, roots.project, name, desc, content)
        return
      }
      if (TOOL_DEFS.plain[tool]) {
        const roots = TOOL_DEFS.plain[tool]
        // For plain, create a new rule md named <name>.md
        createPlainSkill(roots.global, roots.project, name)
        return
      }
      console.log('Unsupported tool for create.');
      break
    }
    case 'enable': {
      const tool = args[1]; const name = args[2]
      if (!tool || !name) { console.log('Please specify tool and name to enable.'); return }
      if (TOOL_DEFS.yaml[tool]) return enableSkill(TOOL_DEFS.yaml[tool].global, name) // enable in global YAML
      if (TOOL_DEFS.plain[tool]) return enableSkill(TOOL_DEFS.plain[tool].global, name)
      console.log('Unknown tool');
      break
    }
    case 'disable': {
      const tool = args[1]; const name = args[2]
      if (!tool || !name) { console.log('Please specify tool and name to disable.'); return }
      if (TOOL_DEFS.yaml[tool]) return disableSkill(TOOL_DEFS.yaml[tool].global, name)
      if (TOOL_DEFS.plain[tool]) return disableSkill(TOOL_DEFS.plain[tool].global, name)
      console.log('Unknown tool');
      break
    }
    case 'delete': {
      const tool = args[1], name = args[2]
      const force = args.includes('--force') || args.includes('-f')
      if (!tool || !name) { console.log('Please specify tool and name to delete.'); return }
      // delete from global or plain depending on tool
      if (TOOL_DEFS.yaml[tool]) return deleteSkill(TOOL_DEFS.yaml[tool].global, name, force)
      if (TOOL_DEFS.plain[tool]) return deleteSkill(TOOL_DEFS.plain[tool].global, name, force)
      console.log('Unknown tool');
      break
    }
    case 'copy': {
      const srcTool = args[1], srcName = args[2], destTool = args[3], destName = args[4]
      if (!srcTool || !srcName || !destTool || !destName) { console.log('Usage: copy <src-tool> <src-name> <dest-tool> <dest-name>'); return }
      // Copy within YAML tools if possible
      const srcRootYaml = TOOL_DEFS.yaml[srcTool]?.global
      const destRootYaml = TOOL_DEFS.yaml[destTool]?.global
      if (srcRootYaml && destRootYaml) {
        // Copy named skill from srcName into destName directory (recursively)
        const srcDir = path.join(srcRootYaml, srcName)
        const destDir = path.join(destRootYaml, destName)
        if (!fs.existsSync(srcDir)) { console.log(`Source skill not found: ${srcDir}`); return }
        ensureDir(destDir)
        function copyDirContents(src, dst) {
          if (!fs.existsSync(src)) return
          ensureDir(dst)
          for (const item of fs.readdirSync(src)) {
            const s = path.join(src, item)
            const d = path.join(dst, item)
            const stat = fs.statSync(s)
            if (stat.isDirectory()) {
              copyDirContents(s, d)
            } else {
              fs.copyFileSync(s, d)
            }
          }
        }
        copyDirContents(srcDir, destDir)
        return
      }
      // Fallback: attempt file-level copy for plain tools
      const srcPlainRoot = TOOL_DEFS.plain[srcTool]?.global
      const destPlainRoot = TOOL_DEFS.plain[destTool]?.global
      if (srcPlainRoot && destPlainRoot) {
        copySkill(srcPlainRoot, destPlainRoot, srcName)
        return
      }
      console.log('Copy not supported for given tool combination.');
      break
    }
    case 'copy-global-to-project': {
      const t = args[1], n = args[2]
      if (!t || !n) { console.log('Usage: copy-global-to-project <tool> <name>'); return }
      // Simple path-based duplicate: copy from global YAML to project YAML if tool exists in YAML
      if (TOOL_DEFS.yaml[t]) {
        copyGlobalToProject(t, n)
        return
      }
      console.log('This operation currently supports YAML-based tools only.');
      break
    }
    case 'prune-unused': {
      let daysThreshold = 180
      let dryRun = false
      let logPath = null
      let force = false
      for (let i = 1; i < args.length; i++) {
        const a = args[i]
        if (a === '--days' || a === '-d') { daysThreshold = parseInt(args[i+1] || '0', 10) || daysThreshold; i++ }
        else if (a === '--dry-run' || a === '-n') { dryRun = true }
        else if (a === '--logfile' || a === '--log' || a === '-l') { logPath = args[i+1]; i++ }
        else if (a === '--force' || a === '-f') { force = true }
      }
      pruneUnusedSkills(daysThreshold, dryRun, logPath, force)
      break
    }
    default:
      console.log(`Unknown command: ${cmd}`)
      printHelp()
  }
}

function toolTitleCase(t) {
  // Normalize for lookup keys like Windsurf -> windsurf
  if (!t) return t
  const low = t.toLowerCase()
  if (low === 'windsurf') return 'windsurf'
  if (low === 'cline') return 'cline'
  if (low === 'continue') return 'cont'
  if (low === 'roo') return 'roo'
  if (low === 'copilot') return 'Copilot'
  if (low === 'codex') return 'Codex'
  if (low === 'aider') return 'Aider'
  if (low === 'augment') return 'Augment'
  // default to original lower-case for unknowns
  return t
}

function ensureExCommands() {
  // Simple self-test help: if script invoked directly with no args, print help
  if (process.argv.length <= 2) printHelp()
}

ensureExCommands()
main()
