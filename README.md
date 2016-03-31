# middleman-custom-helper
to generate Title &amp; Breadcrumbs from Frontmatter.

## Requirement

Middleman 3.4.1


## Installation

Copy the helpers/custom_helpers.rb and place it in your project root helpers directory.  
Middleman will automatically load it.


## Usage

### get_title(site_name, separator = ' | ')

It can generate Title tag from YAML Frontmatter.

layout.haml

```haml
%head
  %title
    = get_title('Your Site Name', ' : ')
```

page.html.haml

```haml
---
title: "Page Title"
---
    :
```

title tag

```html
<title>Page Title : Your Site Name</title>
```


### get_breadcrumbs(home = 'Home')

It can generate breadcrumbs from YAML Frontmatter.

layout.haml (ex. with [Bootstrap class](http://getbootstrap.com/components/#breadcrumbs))

```haml
    :
%ol.breadcrumb
  = get_breadcrumbs
    :
```

service/outline.html.haml

```haml
---
title: "Outline Page Title"
---
    :
```

breadcrumb tag

```html
<ol class="breadcrumb">
  <li><a href="/">Home</a></li><li><a href="/service/">Service Page Title</a></li><li class="active">Outline Page Title</li>
```


#### Option

Override breadcrumb title from YAML Frontmatter.

Example directory structure

```
./source
├── index.html.haml
└── service
    ├── index.html.haml   <- Frontmatter(title: Service Page Title)
    └── outline.html.haml <- Frontmatter(title: Outline Page Title)
```

outline.html.haml

```
---
title: Outline Page Title
breadcrumbs:
  - Service
  - Outline
---
```

breadcrumb tag

```html
<ol class="breadcrumb">
  <li><a href="/">Home</a></li><li><a href="/service/">Service</a></li><li class="active">Outline</li>
```




## Special Thanks

- [How to get current_page.parent.path from traversal (breadcrumbs) - Middleman Forum](https://forum.middlemanapp.com/t/how-to-get-current-page-parent-path-from-traversal-breadcrumbs/1151)
