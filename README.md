Contanizer version of [markitdown](https://github.com/microsoft/markitdown)


## Installation
Install Docker or Podman first.

### Step 1: Install VibeScript

Choose the appropriate installation method for your operating system:

#### Option A: Pre-compiled Binary (Linux only)
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.36.0/vibescript.out -o vibescript.out && chmod +x vibescript.out && sudo mv vibescript.out /usr/local/bin/vibescript
```

#### Option B: Compile from Source (Linux and macOS)
```bash
curl -L https://github.com/OUIsolutions/VibeScript/releases/download/0.36.0/amalgamation.c -o vibescript.c && gcc vibescript.c -o vibescript.out && sudo mv vibescript.out /usr/local/bin/vibescript
```

### Step 2: Install Contanizer Markitdown
```bash
vibescript add_script --file https://github.com/OUIsolutions/Contanizer-Markitdown/releases/download/0.1.0/markitdown.lua  markitdown
```

