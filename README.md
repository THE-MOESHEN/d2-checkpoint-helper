# Destiny 2 — Checkpoint Queue Helper

Queue on Destiny 2 **checkpoint bots** (D2Checkpoints, LuckBot9, and friends) without babysitting seven Twitch chats.

**Use it here: https://the-moeshen.github.io/d2-checkpoint-helper/**

## What it does
- **Auto mode (default)** — every confirmed-active bot is in play; **Smart Queue** races them all, reads each reply, keeps the quickest line (least wait time, then lowest position) and `!leave`s the rest automatically.
- **Manual mode** — tap Auto off (or tap a bot pill) to hand-pick bots; **Queue** sends to exactly those.
- **Live positions** — a floating panel shows your position, wait and checkpoint per bot, quickest first. Hover a row and click to leave that queue.
- **Live feed** — combined chat view with tabs for the bots you're engaged with, plus a full-screen mode.
- **Activities** — Raids, Dungeons, Campaign and Pantheon with official artwork; checkpoints are one-tap chips (secret chests marked 📦).
- **Shared bot list** — `channels.json` is fetched on every load, so updates reach everyone. Suggest a new bot from inside the app (files a GitHub issue); it goes live for all users once the `approved` label is added.

## Twitch setup (one-time)
1. Get a chat token at [twitchtokengenerator.com](https://twitchtokengenerator.com/) with scopes `chat:read` + `chat:edit`.
2. Enter your Twitch username + the Access Token in the **You** panel, then **Connect**.
3. Everything (name, token, preferences) is stored only in your own browser; Disconnect forgets the token.

## Desktop launcher (optional)
Double-click **`Checkpoint Helper.vbs`** (keep it next to `index.html` + `icon.ico`) to run it as a chromeless desktop app via Edge/Chrome app mode, with its own desktop shortcut.

## Notes
- Command format: `!queue <activity-code> <encounter> <n|m> <BungieName#1234>` — encounter is one word; the chips are quick-picks and free text is available where an activity has no preset list.
- Plain HTML/CSS/JS in one file, no dependencies.

Not affiliated with Bungie or the bot operators.
