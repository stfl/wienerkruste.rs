# wienerkruste.rs

Vienna's Rust Collective.

### Legal Pages

Two legal pages are included for GDPR/DSGVO compliance:

1. **Impressum** (`content/impressum.md`) - Required for Austrian/German websites
2. **Datenschutz** (`content/datenschutz.md`) - Privacy policy

## 🚀 Quick Start

### Prerequisites

**Option A: Using Nix Flakes (Recommended)**
- [Nix](https://nixos.org/download.html) with flakes enabled
- That's it! Everything else is managed by the flake.

**Option B: Manual Installation**
- [Zola](https://www.getzola.org/documentation/getting-started/installation/) v0.19.2 or higher
- Git

### Local Development

#### With Nix Flakes

2. **Enter the development shell**
   ```bash
   nix develop
   ```
   
   This automatically installs Zola and all dependencies!

3. **Optional: Use direnv for automatic environment loading**
   ```bash
   # If you have direnv installed
   direnv allow
   ```
   
   Now the environment loads automatically when you `cd` into the project!


6. **Run development server**
   ```bash
   zola serve
   ```
   Visit `http://127.0.0.1:1111` to see your site.

7. **Build for production**
   ```bash
   zola build
   ```
   Output will be in the `public/` directory.

### Nix Flake Commands

```bash
# Enter development shell
nix develop

# Run Zola directly through the flake
nix develop -c zola serve

# Update flake dependencies
nix flake update

# Check flake
nix flake check
```
   Edit `config.toml`:
   - Set your actual `base_url`
   - Update `typeform_url` with your form link
   - Update `meetup_url` with the Rust Vienna meetup link
   - **Fill in all legal entity info under `[extra]`**

3. **Update legal pages**
   - Review `content/impressum.md`
   - Review `content/datenschutz.md`
   - Adjust any specific clauses for your situation

4. **Run development server**
   ```bash
   zola serve
   ```
   Visit `http://127.0.0.1:1111` to see your site.

5. **Build for production**
   ```bash
   zola build
   ```
   Output will be in the `public/` directory.

## 📄 License

Proprietary - All rights reserved.
