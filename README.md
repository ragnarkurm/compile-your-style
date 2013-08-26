Compile your Style
====================

This stuff is intended as starting point for CSS theme.
This is just piece of clay to be formed according to your project.
It's biggest function is to have multiple layouts side-by-side in one file.

Example file of one element:

    @import "includes/defs.sass"
    
    @if $LAYOUT == "global"
    
    @if $LAYOUT == "alpha-default"
    
    #logo
        display: block
        background-position: center
        background-repeat: no-repeat
        
    @if $LAYOUT == "alpha-default-narrow"
    
    #logo
        width: $WIDTH_LOGO_NARROW
        height: $HEIGHT_LOGO_NARROW
        background-image: url($IMG + "logo-narrow.png")
        
    @if $LAYOUT == "alpha-default-normal"
    
    #logo
        width: $WIDTH_LOGO_NORMAL
        height: $HEIGHT_LOGO_NORMAL
        background-image: url($IMG + "logo-normal.png")
        
    @if $LAYOUT == "alpha-default-wide"
    #logo
        width: $WIDTH_LOGO_WIDE
        height: $HEIGHT_LOGO_WIDE
        background-image: url($IMG + "logo-wide.png")


Further documentation:
https://github.com/ragnarkurm/compile-your-style/wiki

Principles in slideshow:
http://www.slideshare.net/ragnarkurm/compile-your-style-25500334

Contact
--------------------

Ragnar Kurm
ragnar.kurm@gmail.com
