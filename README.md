# Claude Code Setup

Get set up with Claude Code in about 10 minutes. You will need:

- A Mac running macOS 13 or later
- Your Claude account (already created and on the team)
- Your Figma account

---

## Step 1: Run the install script

Open **Terminal** (press `Cmd + Space`, type `Terminal`, press `Enter`).

Paste this command and press `Enter`:

```bash
curl -fsSL https://raw.githubusercontent.com/matt99is/claude-code-setup/main/setup.sh -o /tmp/claude-setup.sh && bash /tmp/claude-setup.sh
```

The script will install everything needed. You will see progress messages as it runs. When you see **Setup complete!** you are ready for Step 2.

If you see **"Action required: close this Terminal window and open a new one before continuing"** — do exactly that, then continue with Step 2 in the new window.

If you see an error, copy the message and send it to Matt.

---

## Step 2: Sign in to Claude Code

In Terminal, run:

```bash
claude
```

A browser window will open. Sign in with your work Claude account. Once signed in, return to Terminal and press `Enter` to continue.

---

## Step 3: Download the desktop app

1. Go to [claude.ai/download](https://claude.ai/download)
2. Download **Claude Code for Mac**
3. Open the downloaded file and drag Claude Code to your Applications folder
4. Open Claude Code and sign in with the same account

---

## Step 4: Connect Figma

1. Go to [claude.ai](https://claude.ai) and sign in
2. Click the **Customize** icon in the left sidebar
3. Select **Connectors**
4. Find **Figma** and click to connect it
5. A Figma login window will open — sign in and authorise the connection

---

## Step 5: Verify everything works

1. Open the **Claude Code** desktop app
2. Paste a Figma file URL into the chat (any file you have access to in Figma)
3. Ask: `Can you describe what's in this file?`

If Claude describes the file contents, everything is working correctly.

---

## Troubleshooting

**The script failed** — copy the error message and send it to Matt.

**"Need sudo access" or "needs to be an Administrator"** — your Mac account needs admin rights to install Homebrew. Ask your IT team to either grant you admin access or install Homebrew for you before running this script again.

**`claude` command not found after the script** — close Terminal, open a new Terminal window, and try again.

**Figma is not responding** — check that you selected all scopes when generating the token. You can generate a new token in Figma and update it in claude.ai Connected Apps.
