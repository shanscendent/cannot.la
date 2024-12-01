---
title: My Own Personal Site
slug: my-own-personal-site
date: 2024-08-18
draft: false
---

After a full year of owning the cannot.la domain (.la TLDs are quite pricey!) without having a personal site, I finally decided to sit down over the weekend to build this static site.

## Building
I settled on using [Hugo](https://gohugo.io/) as the SSG and [magick.css](https://css.winterveil.net/) as the CSS framework because I love how it looks like the notes of a wizard. I grew up reading lots of epic fantasy, so it just feels right.

### Design considerations
- Fast
  - Static site
  - No JS (except for pages that need it, or maybe optional site search in the future)
- Auto dark mode 
  - if you're using a mostly B&W theme you can add a media query to invert colors in your CSS{{< sidenote />}}, but magick.css has it covered {{< sidenote >}}https://yihui.org/en/2023/09/dark-mode/{{< /sidenote >}}
- Easy to write posts for
  - Use a SSG
  - Classless CSS framework

## Serving
### Domain name
After cycling through a free .fr domain gotten from a sketchy registrar, shanscendent.com and shanlee.cc, over the years, I finally settled on cannot.la{{< sidenote />}}, which I quite like! It's quirky enough and gives you a hint of where I'm from. {{< sidenote >}}If you're using namecheap, try using `COUPONFCNC` to get 20% off. [source](https://www.reddit.com/r/NameCheap/comments/11ygx2r/namecheap_coupon_20_off_permanent_code_couponfcnc/){{< /sidenote >}}

I'm also using it for a bunch of subdomains, like one to point people to other selfhosted stuff from my homelab.

### Analytics
After going through an (admittedly) unscientific skim of the available selfhosted options for web analytics{{< sidenote />}} for this site, I settled on [Shynet](https://github.com/milesmcc/shynet). Here's a list of all the options I went through, and why I chose Shynet over them. {{< sidenote >}}[Awesome-Selfhosted](https://github.com/awesome-selfhosted/awesome-selfhosted?tab=readme-ov-file#analytics){{< /sidenote >}}
- [Shynet](https://github.com/milesmcc/shynet) - Lightweight, tracking pixel, sqlite support, looks nice
- [Matomo](https://matomo.org/) - Hey, portainer uses it! Not lightweight though
- [Goatcounter](https://www.goatcounter.com/) - Doesn't officially have Docker support, rough UI
- [Plausible](https://plausible.io/) - Lightweight, but no tracking pixel
- [Umami](https://umami.is/) - No tracking pixel?
- [Fathom Lite](https://github.com/usefathom/fathom) - No tracking pixel

### Caught between a bug and a hard place{{< sidenote />}}
{{< sidenote>}}I'm ashamed to report that I wasted **a lot** of time on this. {{< /sidenote >}}
Right from the start of the project, I ran in to a problem where `hugo serve` would reload pages erratically—sometimes a page would show up in the site, sometimes it wouldn't, especially when I edited the templates—and it drove me crazy. The only solution I could come up with was having a `touch.sh` file which `echo`ed a newline to every single file in `content/` (including the images!) and removed it again, which I'd have to run every single time.

I couldn't figure out what was going on for the longest time, until I found this [post](https://discourse.gohugo.io/t/when-developing-locally-i-have-to-manually-save-each-file-to-see-changes-every-time/39970).

Here's how my content directory was arranged.
```
content
├── index.md
├── does
│   ├── _index.md
│   └── cannot.la.md
```
Turns out, if hugo sees `index.md` and not `_index.md` in a directory, it just stops looking for more subdirectories for content, as the `content/` directory is now a *leaf bundle*!

Usually when I run into bugs, I'm stuck hunting for a missing underscore, but I've never had to look one in a filename before. I'll need to *RTFM* better next time.

## Todos
### Site
- Configure Chroma highlighting style to match magick.css
  - swapoff looks the best so far!
- Increase the loading speed
  - Maybe do stuff like minification, serve inline css, try TCP fast open, etc?
- Site search (Ctrl + K?)
  - Add tags to posts (LLM?)
### Content
- Developer profile page, with a resume link
- Hobby pages
- Network page
  - Write CSS to add 2 columns on mobile, 3-4 on desktop?
