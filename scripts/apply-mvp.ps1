$ErrorActionPreference = "Stop"

Write-Host "Applying ExpositionHub MVP structure..."

$dirs = @(
    ".\src\pages\guides",
    ".\src\pages\reviews",
    ".\src\pages\compare",
    ".\src\pages\best",
    ".\src\layouts",
    ".\src\components",
    ".\public"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

Set-Content -Encoding UTF8 .\src\consts.ts @(
"export const SITE_TITLE = 'ExpositionHub';"
"export const SITE_DESCRIPTION = 'Practical affiliate marketing guides, reviews, comparisons, and platform roundups for beginners.';"
)

Set-Content -Encoding UTF8 .\src\components\Header.astro @(
"---"
"import { SITE_TITLE } from '../consts';"
"---"
""
"<header class=""site-header"">"
"  <div class=""wrap"">"
"    <a class=""brand"" href=""/"">{SITE_TITLE}</a>"
"    <nav class=""nav"" aria-label=""Main navigation"">"
"      <a href=""/guides/"">Guides</a>"
"      <a href=""/reviews/"">Reviews</a>"
"      <a href=""/compare/"">Compare</a>"
"      <a href=""/best/"">Best Picks</a>"
"      <a href=""/about/"">About</a>"
"    </nav>"
"  </div>"
"</header>"
)

Set-Content -Encoding UTF8 .\src\components\Footer.astro @(
"<footer class=""site-footer"">"
"  <div class=""wrap"">"
"    <p><strong>ExpositionHub</strong> publishes practical guides, reviews, and comparisons for affiliate marketers and digital entrepreneurs.</p>"
"    <p><a href=""/disclosure/"">Affiliate Disclosure</a> · <a href=""/privacy/"">Privacy Policy</a> · <a href=""/about/"">About</a> · <a href=""/contact/"">Contact</a></p>"
"  </div>"
"</footer>"
)

Set-Content -Encoding UTF8 .\src\layouts\SiteLayout.astro @(
"---"
"import BaseHead from '../components/BaseHead.astro';"
"import Header from '../components/Header.astro';"
"import Footer from '../components/Footer.astro';"
"import { SITE_TITLE, SITE_DESCRIPTION } from '../consts';"
""
"interface Props {"
"  title?: string;"
"  description?: string;"
"}"
""
"const { title = SITE_TITLE, description = SITE_DESCRIPTION } = Astro.props;"
"---"
""
"<!doctype html>"
"<html lang=""en"">"
"  <head>"
"    <BaseHead title={title} description={description} />"
"  </head>"
"  <body>"
"    <Header />"
"    <main class=""wrap main-content"">"
"      <slot />"
"    </main>"
"    <Footer />"
"  </body>"
"</html>"
""
"<style is:global>"
"body { margin: 0; font-family: Inter, system-ui, Arial, sans-serif; background: #0f172a; color: #e5e7eb; line-height: 1.6; }"
"a { color: #7dd3fc; text-decoration: none; }"
"a:hover { text-decoration: underline; }"
".wrap { width: min(1100px, calc(100% - 2rem)); margin: 0 auto; }"
".main-content { padding: 2rem 0 4rem; }"
".site-header, .site-footer { border-color: #334155; background: #111827; }"
".site-header .wrap, .site-footer .wrap { display: flex; gap: 1rem; justify-content: space-between; align-items: center; flex-wrap: wrap; padding: 1rem 0; }"
".brand { font-weight: 800; font-size: 1.15rem; }"
".nav { display: flex; gap: 1rem; flex-wrap: wrap; }"
".hero h1 { font-size: clamp(2rem, 4vw, 3.2rem); line-height: 1.1; }"
".lead { color: #cbd5e1; max-width: 800px; }"
".grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(240px, 1fr)); gap: 1rem; margin: 2rem 0; }"
".card { background: #1e293b; border: 1px solid #334155; border-radius: 1rem; padding: 1.25rem; }"
".button { display: inline-block; padding: 0.8rem 1rem; border-radius: 0.75rem; border: 1px solid #334155; background: #1e293b; color: #e5e7eb; font-weight: 700; margin-right: 0.75rem; }"
".button.primary { background: #0369a1; }"
".callout { background: #082f49; border: 1px solid #0ea5e9; border-radius: 1rem; padding: 1rem; margin: 1.5rem 0; }"
".eyebrow { color: #7dd3fc; text-transform: uppercase; font-size: 0.8rem; font-weight: 800; letter-spacing: 0.08em; }"
".article-meta { color: #94a3b8; }"
".list-clean li { margin-bottom: 0.5rem; }"
"</style>"
)

Set-Content -Encoding UTF8 .\src\pages\index.astro @(
"---"
"import SiteLayout from '../layouts/SiteLayout.astro';"
"---"
""
"<SiteLayout title=""ExpositionHub | Affiliate Marketing Guides, Reviews, and Comparisons"" description=""Practical beginner-friendly affiliate marketing guides, network reviews, and platform comparisons."">"
"  <section class=""hero"">"
"    <p class=""eyebrow"">Day 1 MVP Live</p>"
"    <h1>Practical affiliate marketing guidance for beginners who want traction fast.</h1>"
"    <p class=""lead"">ExpositionHub helps new affiliate marketers evaluate networks, compare platforms, and choose tools with less guesswork.</p>"
"    <p><a class=""button primary"" href=""/best/best-affiliate-networks-for-beginners/"">Start with the best networks</a> <a class=""button"" href=""/guides/how-to-choose-your-first-affiliate-network/"">Read the beginner guide</a></p>"
"  </section>"
"  <div class=""grid"">"
"    <article class=""card""><h3><a href=""/guides/how-to-choose-your-first-affiliate-network/"">How to Choose Your First Affiliate Network</a></h3><p>A practical framework for beginners evaluating their first affiliate platform.</p></article>"
"    <article class=""card""><h3><a href=""/reviews/clickbank-review-for-beginners/"">ClickBank Review for Beginners</a></h3><p>A plain-English review of one of the best-known digital affiliate networks.</p></article>"
"    <article class=""card""><h3><a href=""/compare/clickbank-vs-digistore24/"">ClickBank vs Digistore24</a></h3><p>A practical comparison covering ease of entry, offer mix, and fit.</p></article>"
"    <article class=""card""><h3><a href=""/best/best-affiliate-networks-for-beginners/"">Best Affiliate Networks for Beginners</a></h3><p>A quick-start roundup to help new publishers choose the right first platform.</p></article>"
"  </div>"
"  <section class=""callout""><strong>Affiliate disclosure:</strong> Some pages on this site may contain affiliate links. Read the full <a href=""/disclosure/"">affiliate disclosure</a>.</section>"
"</SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\about.astro @(
"---"
"import SiteLayout from '../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""About ExpositionHub"" description=""About ExpositionHub.""><p class=""eyebrow"">About</p><h1>About ExpositionHub</h1><p>ExpositionHub is a practical publishing site focused on affiliate marketing networks, beginner platform selection, and direct product comparisons.</p></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\disclosure.astro @(
"---"
"import SiteLayout from '../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Affiliate Disclosure | ExpositionHub"" description=""Affiliate disclosure for ExpositionHub.""><p class=""eyebrow"">Disclosure</p><h1>Affiliate Disclosure</h1><p>ExpositionHub may participate in affiliate marketing programs and may earn commissions from qualifying actions or purchases.</p></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\privacy.astro @(
"---"
"import SiteLayout from '../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Privacy Policy | ExpositionHub"" description=""Privacy policy for ExpositionHub.""><p class=""eyebrow"">Privacy</p><h1>Privacy Policy</h1><p>ExpositionHub may collect limited technical information such as standard analytics and referral data to improve the website.</p></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\contact.astro @(
"---"
"import SiteLayout from '../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Contact | ExpositionHub"" description=""Contact ExpositionHub.""><p class=""eyebrow"">Contact</p><h1>Contact</h1><p>This placeholder contact page exists as part of the site trust baseline for launch.</p></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\guides\index.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Affiliate Marketing Guides | ExpositionHub"" description=""Beginner-friendly affiliate marketing guides.""><h1>Affiliate Marketing Guides</h1><div class=""grid""><article class=""card""><h3><a href=""/guides/how-to-choose-your-first-affiliate-network/"">How to Choose Your First Affiliate Network</a></h3><p>A practical framework for beginners evaluating their first affiliate platform.</p></article></div></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\guides\how-to-choose-your-first-affiliate-network.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""How to Choose Your First Affiliate Network | ExpositionHub"" description=""A practical beginner guide to selecting your first affiliate network.""><p class=""eyebrow"">Guide</p><h1>How to Choose Your First Affiliate Network</h1><p class=""article-meta"">Published for MVP launch · Beginner-focused</p><p>Beginners should compare access requirements, offer quality, payout mechanics, niche alignment, and content fit before choosing a network.</p><div class=""callout"">Next steps: read the <a href=""/reviews/clickbank-review-for-beginners/"">ClickBank review</a>, compare <a href=""/compare/clickbank-vs-digistore24/"">ClickBank vs Digistore24</a>, or start with <a href=""/best/best-affiliate-networks-for-beginners/"">Best Affiliate Networks for Beginners</a>.</div></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\reviews\index.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Affiliate Platform Reviews | ExpositionHub"" description=""Direct reviews of affiliate networks and related platforms.""><h1>Affiliate Platform Reviews</h1><div class=""grid""><article class=""card""><h3><a href=""/reviews/clickbank-review-for-beginners/"">ClickBank Review for Beginners</a></h3><p>A direct review of ClickBank with a focus on access, usability, and beginner fit.</p></article></div></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\reviews\clickbank-review-for-beginners.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""ClickBank Review for Beginners | ExpositionHub"" description=""A beginner-focused review of ClickBank covering strengths, weaknesses, and fit.""><p class=""eyebrow"">Review</p><h1>ClickBank Review for Beginners</h1><p>ClickBank can be a workable beginner platform if you stay selective and build content around genuine user intent rather than hype.</p></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\compare\index.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Affiliate Platform Comparisons | ExpositionHub"" description=""Head-to-head affiliate network comparisons.""><h1>Affiliate Platform Comparisons</h1><div class=""grid""><article class=""card""><h3><a href=""/compare/clickbank-vs-digistore24/"">ClickBank vs Digistore24</a></h3><p>A side-by-side look at two popular digital affiliate platforms.</p></article></div></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\compare\clickbank-vs-digistore24.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""ClickBank vs Digistore24 | ExpositionHub"" description=""A practical comparison of ClickBank and Digistore24 for beginner affiliate marketers.""><p class=""eyebrow"">Comparison</p><h1>ClickBank vs Digistore24</h1><p>ClickBank may be the simpler first platform to write about; Digistore24 is worth evaluating as a secondary digital-network option.</p></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\best\index.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Best Affiliate Picks | ExpositionHub"" description=""Roundups and best-pick pages for affiliate marketers.""><h1>Best Affiliate Picks</h1><div class=""grid""><article class=""card""><h3><a href=""/best/best-affiliate-networks-for-beginners/"">Best Affiliate Networks for Beginners</a></h3><p>A commercial-intent roundup to help beginners shortlist their first platform.</p></article></div></SiteLayout>"
)

Set-Content -Encoding UTF8 .\src\pages\best\best-affiliate-networks-for-beginners.astro @(
"---"
"import SiteLayout from '../../layouts/SiteLayout.astro';"
"---"
"<SiteLayout title=""Best Affiliate Networks for Beginners | ExpositionHub"" description=""A practical roundup of affiliate networks beginners should evaluate first.""><p class=""eyebrow"">Roundup</p><h1>Best Affiliate Networks for Beginners</h1><ul class=""list-clean""><li>ClickBank</li><li>Digistore24</li><li>Amazon Associates</li></ul></SiteLayout>"
)

Set-Content -Encoding UTF8 .\public\robots.txt @(
"User-agent: *"
"Allow: /"
""
"Sitemap: https://expositionhub.com/sitemap-index.xml"
)

if (-not (Test-Path .\.gitignore)) { New-Item -ItemType File -Path .\.gitignore | Out-Null }
@("node_modules/","dist/",".astro/","*.code-workspace") | ForEach-Object {
    if (-not (Select-String -Path .\.gitignore -Pattern "^$([regex]::Escape($_))$" -Quiet -ErrorAction SilentlyContinue)) {
        Add-Content .\.gitignore $_
    }
}

Write-Host "MVP structure applied successfully."
