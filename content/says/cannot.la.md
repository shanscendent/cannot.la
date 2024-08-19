+++
title = 'Building and Serving cannot.la'
date = 2024-08-19T10:19:10+08:00
lastmod = 2024-08-19
draft = false
+++

After a full year of owning the cannot.la domain (.la TLDs are quite pricey!) without having a personal site, I finally decided to sit down over the weekend to build a static site for it.

## Building


### Dark mode


For adaptive dark mode, try adding this to styles.css:
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

Found on https://yihui.org/en/2023/09/dark-mode/


## Serving
### Domain Name
If you're using namecheap, try using `COUPONFCNC` to get 20% off. Found it on [reddit](https://www.reddit.com/r/NameCheap/comments/11ygx2r/namecheap_coupon_20_off_permanent_code_couponfcnc/), and it's been working for a few years now, apparently.