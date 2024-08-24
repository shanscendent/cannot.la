+++
title = 'My Own Personal Site'
slug = 'my-own-personal-site'
date = 2024-08-18
draft = false
+++

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

I'm also using it for a bunch of subdomains, like one to point people to other selfhosted stuff from my homelab. It's patched together with a bunch of spit and tape at the moment so I'm going to have to revamp everything before I can do a writeup about it :(

## Todos
### Site
- Configure Chroma highlighting style to match magick.css
  - swapoff looks the best so far!
- Fix hugo server not reloading everything after editing one file
  - There's this weird behaviour where pages don't render properly after I edit the templates and forces me to save everything again.
  - I've since resorted to having a `touch.sh` file which doesn't actually `touch`, but `echo`s a newline to every single file in content/ (including images!) and removes it again, which makes Hugo actually render stuff properly after you do that. It's a bit annoying to run it every update though, but oh well
- Increase the loading speed
  - Maybe do stuff like minification, serve inline css, try TCP fast open, etc?
- Site search (Ctrl + K?)
  - Add tags to posts (LLM?)
### Content
- Developer profile page, with a resume link
- Hobby pages
- Network page
  - Write CSS to add 2 columns on mobile, 3-4 on desktop?
