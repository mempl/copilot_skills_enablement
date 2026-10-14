# data/input: your real input

Everything in this folder except this README is ignored by Git. Put the file your skill works on here.

Copilot can only read files on your laptop inside this workspace. It can't open a SharePoint or Teams link. Bring the file here first.

## Getting the file here

| Source | How |
| --- | --- |
| SharePoint or Teams, one file | Open the library, select the file, **Download**. Move it into `data/input/` |
| SharePoint library you use often | **Sync** the library to OneDrive, then **copy** the file into `data/input/`. Don't open the OneDrive folder itself as the workspace: Copilot would see everything in it, and sync conflicts with files Copilot touches |
| Excel | Prefer **File → Save As → CSV (UTF-8)**, one sheet per file. If you keep `.xlsx`: `pip install openpyxl`, so pandas can read it |
| Database or Databricks table | Export a small extract to CSV. No connection strings or tokens in this repo |
| Power BI | Save the report as a Power BI Project (PBIP); `.pbix` is a binary Copilot can't read |
| E-mail attachment | Save it here |

## Keep it small and clean

- **Only the columns the task needs.** Delete the rest before you start.
- **A slice is enough** to build the skill, e.g. one month or a few hundred rows. The finished skill can run on the full file later.
- **Remove personal data** unless your company explicitly allows Copilot to process it.
- **File name:** `<what>_<YYYY-MM>.csv`, e.g. `inventory_2026-09.csv`.

## Before every commit

```bash
git status     # nothing from data/input/ may appear
```
