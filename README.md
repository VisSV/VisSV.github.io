
This contains the static files for the vissv.org site. 

## Building

This project uses [fuse](https://github.com/smebberson/fuse) to combine the
header and footer html files with the content files. To build the site run:

```
npm install
make all
```

Any html pages that do not start with an underscore will be run through fuse
and added to the dist directory. Any files in the css, js, and img directories
will be copied as is to the proper directories in the dist directory.


## Running the website locally

```
make
start a server under dist/
```

## Adding folders and new scripts

Make sure add these to the makefile so that it can copy the new staff


## Adding new pages

When adding new pages be sure to include the template commands to include
the `_header.html` and `_footer.html` files. Otherwise the pages won't have
the proper theming and layout when they are built. You can copy the template
below:

```
<!-- @depends _header.html -->

... content goes here ...

<!-- @depends _footer.html -->
```

## Deploying

Any commits to the 
master branch will be automatically deployed via 
[circleci](https://circleci.com/gh/VisSV/static-site). See the `circle.yml`
file for the build/deploy instructions.
If you want to manually deploy the site, that is also possible by running:

```
make deploy
```

## Minor updates to the basic information (e.g., year, chairs, date, etc.)


Change the `config/config.json`. The script to update text accordingly is `js/config.js`. 
To change any descriptions, please update the text manually and try to follow the example entry in the config file.
However, the change to `_header.html` (and `perhaps _footer.html`) need to be made manually.
