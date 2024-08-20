+++
title = 'My Own Personal Site'
slug = 'my-own-personal-site'
date = 2024-08-18T10:19:10+08:00
draft = false
+++

After a full year of owning the cannot.la domain (.la TLDs are quite pricey!) without having a personal site, I finally decided to sit down over the weekend to build this static site.

## Building
I settled on using [Hugo](https://gohugo.io/) as the SSG and [magick.css](https://css.winterveil.net/) as the CSS framework because I love how it looks like the notes of a wizard. I grew up reading lots of epic fantasy, so it just feels right.

### Design considerations
- Fast
  - Static site
  - No JS (except for pages that need it) 
- Auto dark mode 
  - if you're using a mostly B&W theme you can add a media query to invert colors in your CSS{{< sidenote />}}, but magick.css has it covered {{< sidenote >}}https://yihui.org/en/2023/09/dark-mode/{{< /sidenote >}}
- Easy to write posts for
  - Use a SSG
  - Classless CSS framework

## Serving
### Domain name
After cycling through a free .fr domain gotten from a sketchy registrar, shanscendent.com and shanlee.cc, over the years, I finally settled on cannot.la{{< sidenote />}}, which I quite like! It's quirky enough and gives you a hint of where I'm from. {{< sidenote >}}If you're using namecheap, try using `COUPONFCNC` to get 20% off. [source](https://www.reddit.com/r/NameCheap/comments/11ygx2r/namecheap_coupon_20_off_permanent_code_couponfcnc/){{< /sidenote >}}

I'm also using it for a bunch of subdomains, like one to point people to other selfhosted stuff from my homelab. It's patched together with a bunch of spit and tape at the moment so I'm going to have to revamp everything before I can do a writeup about it :(

## Todos
### Site
- Fix the font for code blocks
  - The magick.css font doesn't load properly for some reason, it defaults to using a monospace system font that doesn't fit the theme
- Fix font for content formatted in `<pre>` tags
- Properly revamp layout templates
  - this should probably fix the weird behaviour where pages don't render properly after I edit the templates and forces me to save everything again
- Increase the loading speed
  - maybe do stuff like minification, serve inline css, try TCP fast open, etc?
- Add searchable tags to posts
### Content
- Developer profile page, with a resume link
- Hobby pages
