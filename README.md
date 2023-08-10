# Renovate Configuration

## About

Contains a common renovate configuration setting for all public repositories.

See [Presets](https://docs.renovatebot.com/config-presets/)

This contains basic settings like using conventional commit, limits, and other settings that reduce noise.

## Usage

Basic renovate configuration file, which is `default.json`.

- **_WARNING_**: Automerge is enabled. You should have branch protection on to prevent this, otherwise updates will get pushed without any required reviewer.
- Use `CODEOWNERS` file to simplify this.

### Default

```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["github>DelineaXPM/renovate-config"]
}
```

## Alternative configurations

You can override by stacking these configurations, last config takes precedence in the case of conflicts.

- Only vulnerability alerts: `extends: ["github>DelineaXPM/renovate-config:security"]`
  - This still gives you a Dependency Dashboard for manually creating PRS on demand, but nothing will be automatic.
- Group based on package manager: `extends: ["github>DelineaXPM/renovate-config:group-by-manager"]`
  - Try to seperate major into different groups for clarity.
- Not needed: `common.json` is really used by the other presets to begin deduplication of settings that don't really change (like semantic commit, etc).
