# Elabora releases

Public builds for the [Elabora](https://elabora.studio/) desktop app, available from the Releases page.

The application source is maintained separately. The open core is at [elabora-core](https://github.com/aureliendossantos/elabora-core) and the website is [elabora.studio](https://elabora.studio).

## How the installers are made

The installers are built here, on GitHub-hosted runners, by the **Build and publish** workflow (`.github/workflows/build.yml`). It is started by Elabora's maintainers only, for an exact commit of the application and of the open core, and never by a pull request.

- Windows builds the x64 installer and tests it; one macOS runner builds the Apple Silicon and Intel apps.
- The application's source stays private: the workflow fetches the one commit it builds and keeps its build output out of the public logs.
- The installers wait in a draft release until every platform has finished. Publication then checks the version, the release notes and every updater checksum, and makes the release public with `release.json`, `provenance.json` (the exact sources) and `SHA256SUMS`.
- Builds require pnpm 11.22.0 and committed pnpm lockfiles in both pinned checkouts. Older npm-only source revisions are no longer supported by this workflow. App install and build logs remain private.
- A published release is never replaced: a fix ships as a new version.

## Opening the beta

The beta's installers are not signed yet. Each release page says which builds are unsigned. The first time you open one:

- **Windows:** if SmartScreen stops the installer, choose « More info », then « Run anyway ».
- **macOS 15 and later:** open the app once, then System Settings › Privacy & Security › « Open Anyway ». An unsigned Mac build announces new versions; download them from this page.

En français : sous Windows, « Informations complémentaires » puis « Exécuter quand même » ; sous macOS 15 et ultérieur, Réglages Système › Confidentialité et sécurité › « Ouvrir quand même ».
