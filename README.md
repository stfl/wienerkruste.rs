# wienerkruste.rs

Vienna's Rust talent collective. Freshly served.

## 🦀 Project Structure

```
wienerkruste.rs/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions deployment
├── content/
│   ├── _index.md               # Homepage content (all copy here!)
│   ├── impressum.md            # Impressum/Legal notice
│   └── datenschutz.md          # Privacy policy (DSGVO/GDPR)
├── sass/
│   └── style.scss              # Main stylesheet
├── static/
│   └── favicon.svg             # Add your schnitzel-ferris icon here
├── templates/
│   ├── base.html               # Base template with navigation
│   ├── index.html              # Homepage template
│   └── page.html               # Legal pages template
├── .envrc                      # Direnv configuration (optional)
├── .gitignore                  # Git ignore rules
├── flake.nix                   # Nix flake for dev environment
├── flake.lock                  # Nix flake lock file (auto-generated)
└── config.toml                 # Zola configuration
```

## 📝 Content Management

### Homepage Copy

All homepage content is now in `content/_index.md` using frontmatter. This makes it easy to update copy without touching HTML:

```toml
[extra]
hero_tagline = "Your tagline here"
hero_subtitle = """
<p>Your subtitle here</p>
"""
# ... and so on
```

**To update copy:**
1. Open `content/_index.md`
2. Edit the text in the `[extra]` section
3. Save and rebuild

**Sections you can edit:**
- Hero tagline and subtitle
- Value proposition title
- Features (icon, title, text)
- Developer section (title, intro, benefits, CTA)
- Company section (title, intro, benefits, CTA)
- Footer tagline

### Legal Pages

Two legal pages are included for GDPR/DSGVO compliance:

1. **Impressum** (`content/impressum.md`) - Required for Austrian/German websites
2. **Datenschutz** (`content/datenschutz.md`) - Privacy policy

**Important: Update these before launch!**

Edit `config.toml` to fill in your legal entity information:

```toml
[extra]
company_name = "Your Legal Entity Name"
street_address = "Your Street Address"
postal_code = "1010"
city = "Vienna"
country = "Austria"
registration_number = "Your FN Number"
vat_id = "ATU12345678"
```

These variables automatically populate both legal pages.

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

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/wienerkruste.rs.git
   cd wienerkruste.rs
   ```

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

4. **Update configuration**
   Edit `config.toml`:
   - Set your actual `base_url`
   - Update `typeform_url` with your form link
   - Update `meetup_url` with the Rust Vienna meetup link
   - **Fill in all legal entity info under `[extra]`**

5. **Update legal pages**
   - Review `content/impressum.md`
   - Review `content/datenschutz.md`
   - Adjust any specific clauses for your situation

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

## 📦 GitHub Pages Deployment

### Initial Setup

1. **Create a new GitHub repository** named `wienerkruste.rs` (or any name)

2. **Push your code**
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Wiener Kruste landing page"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/wienerkruste.rs.git
   git push -u origin main
   ```

3. **Enable GitHub Pages**
   - Go to your repository settings
   - Navigate to "Pages" in the left sidebar
   - Under "Source", select "GitHub Actions"

4. **Configure custom domain (optional)**
   - In GitHub Pages settings, add your custom domain: `wienerkruste.rs`
   - Create a `CNAME` file in the `static/` directory with your domain
   - Configure DNS with your domain registrar:
     ```
     Type: CNAME
     Name: @
     Value: YOUR_USERNAME.github.io
     ```

### Deployment

Once set up, every push to `main` automatically deploys your site:

```bash
git add .
git commit -m "Update copy"
git push
```

Check deployment status in the "Actions" tab of your repository.

## 🎨 Customization Guide

### Quick Copy Changes

Everything is in `content/_index.md`. Change any text in the `[extra]` section:

```toml
[extra]
hero_tagline = "Different tagline here"
```

### Features Array

To modify the three features in the value prop section:

```toml
features = [
    { 
        icon = "🤝", 
        title = "Feature Title", 
        text = "Feature description here." 
    },
    # ... more features
]
```

### Colors

Edit `sass/style.scss` to adjust the color palette:

```scss
$color-crust-dark: #8B4513;    // Deep brown
$color-crust: #CD853F;          // Golden crust
$color-crust-light: #DEB887;    // Light brown
$color-schnitzel: #F4E4C1;      // Warm yellow
$color-flour: #FAF6F0;          // Off-white
$color-lemon: #FFE66D;          // Accent
```

### Logo/Icon

Replace the emoji logo (🦀🍽️) with your custom Schnitzel-Ferris SVG:

1. Create your logo as `static/logo.svg`
2. Update `templates/index.html` around line 8:
   ```html
   <img src="/logo.svg" alt="wienerkruste.rs" class="logo__icon">
   ```

## 🧪 Testing

### Local Testing Checklist

- [ ] All links work (Typeform, email, meetup)
- [ ] Legal pages display correctly
- [ ] Impressum has correct company info
- [ ] Datenschutz is complete and accurate
- [ ] Mobile responsive (test at 375px, 768px, 1024px)
- [ ] Copy reads well and has no typos
- [ ] Navigation works between pages
- [ ] Footer links to legal pages

### GDPR/DSGVO Compliance Checklist

- [ ] Impressum filled out completely
- [ ] Privacy policy (Datenschutz) reviewed
- [ ] Contact email is monitored
- [ ] Links to legal pages in footer
- [ ] Cookie banner (if you add analytics later)
- [ ] Data processing agreement with Typeform (if used)

### Pre-Launch Checklist

- [ ] Typeform/form is live and collecting responses
- [ ] Email address is active and monitored
- [ ] Custom domain configured (if applicable)
- [ ] Favicon/logo added
- [ ] Open Graph metadata confirmed
- [ ] All legal entity info is accurate
- [ ] Privacy policy matches actual data practices

## 📊 Optional: Add Analytics

If you add analytics, you MUST update the Datenschutz page to reflect this.

**Privacy-friendly option (recommended):**

Add to `templates/base.html` before `</head>`:

```html
<!-- Plausible Analytics (privacy-friendly, no cookies) -->
<script defer data-domain="wienerkruste.rs" 
        src="https://plausible.io/js/script.js"></script>
```

Then add a section to `content/datenschutz.md`:

```markdown
## 6. Analytics

We use Plausible Analytics, a privacy-friendly analytics service that does not use cookies and does not collect personal data. For more information, see: https://plausible.io/privacy
```

## 🇦🇹 Austrian/DACH Specific Notes

### Why Two Legal Pages?

- **Impressum**: Required by Austrian Media Law (§ 25 MedienG) and German Telemedia Act (§ 5 TMG)
- **Datenschutz**: Required by GDPR (DSGVO in German)

### What Must Be in the Impressum?

For Austrian sole proprietors:
- Full name
- Address
- Contact details (email)
- UID (VAT ID) if applicable

For Austrian companies (GmbH):
- Company name and legal form
- Company address
- Company registration number (FN)
- UID (VAT ID)
- Managing directors

### Privacy Policy Requirements

The included Datenschutz page covers:
- Data collection and usage
- Hosting (GitHub Pages)
- Contact forms and email
- External services (Typeform)
- User rights under GDPR
- Contact info for Austrian Data Protection Authority

**Important:** If you add ANY additional services (analytics, tracking, social media embeds), you MUST update the Datenschutz page.

## 🔧 Troubleshooting

### Build fails with template errors
- Check that all variables in `content/_index.md` match what's used in `templates/index.html`
- Ensure TOML syntax is valid (commas, quotes, brackets)

### Legal pages return 404
- Ensure files are named exactly: `impressum.md` and `datenschutz.md`
- Check that `template = "page.html"` is in the frontmatter
- Verify `templates/page.html` exists

### Variables not showing in legal pages
- Ensure all `config.extra.*` variables are defined in `config.toml`
- Check that Zola version supports variable interpolation in markdown

## 📝 Content Strategy Notes

### Founding Member Positioning

The "founding member" framing creates:
- **Exclusivity**: Not open to everyone (yet)
- **FOMO**: Early access advantage
- **Community**: Building something together
- **Low pressure**: No obligations, just interest

This avoids "under construction" vibes while building your network.

### Legal Pages as Trust Signals

Having complete, professional legal pages:
- Shows you're serious and compliant
- Builds trust with German/Austrian clients (they expect this)
- Protects you legally
- Makes you look established, not amateur

### Next Steps After Launch

1. **Developer recruitment**
   - Announce at next Rust Vienna meetup
   - Share in Rust Austria channels
   - Personal outreach to known strong devs

2. **Company outreach**
   - Soft launch to 3-5 companies you know
   - Gather feedback on positioning
   - Refine value prop based on objections

3. **Iterate**
   - Track form submissions
   - A/B test copy (easy with `content/_index.md`)
   - Add testimonials once you place first dev

## 🤝 Contributing

This is a personal project, but feedback welcome! Reach out at contact@wienerkruste.rs

## 📄 License

Proprietary - All rights reserved.

---

Built with Zola. Served with pride. 🦀
# Document Title
