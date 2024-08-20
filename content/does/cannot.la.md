+++
title = 'My Own Personal Site'
date = 2024-08-18T10:19:10+08:00
draft = false
+++

After a full year of owning the cannot.la domain (.la TLDs are quite pricey!) without having a personal site, I finally decided to sit down over the weekend to build this static site.

## Building
I settled on using [Hugo](https://gohugo.io/) as the SSG and [magick.css](https://css.winterveil.net/) as the CSS framework because I like how it looks like the notes of a wizard.

### Design considerations
- No JS 

### Dark mode
For adaptive dark mode, try adding this to styles.css{{< sidenote />}}:{{< sidenote >}}https://yihui.org/en/2023/09/dark-mode/ Probably works better with B&W styles like magick.css{{< /sidenote >}}
```
@media (prefers-color-scheme: dark) {
  html, img, video, iframe {
    filter: invert(1);
  }
  body {
    background-color: white;
  }
}
```



## Serving
### Domain name
If you're using namecheap, try using `COUPONFCNC` to get 20% off{{< sidenote />}}. {{< sidenote >}}Found it on [reddit](https://www.reddit.com/r/NameCheap/comments/11ygx2r/namecheap_coupon_20_off_permanent_code_couponfcnc/), and it's been working for a few years now, apparently.{{< /sidenote >}}

### test