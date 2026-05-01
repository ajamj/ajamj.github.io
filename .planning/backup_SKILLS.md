Backup plan for SKILL.md footprints

- Purpose: create a safe rollback / audit trail before disabling/removing duplicates.
- Targets: all SKILL.md footprints discovered so far (per .planning inventory).
- Destination: .planning/backup_skills/YYYYMMDD/ with preserved folder structure.
- Process: copy each SKILL.md to corresponding backup path preserving full path structure.
- Verification: list backup files and compare counts with original footprint count.

Notes:
- This is a planning artifact. Actual backups will be performed before any changes are applied in code.
