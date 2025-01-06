

if(grepl("R version 4.0.5",version$version.string)){
    #.libPaths(c("/path/to/some/lib","/path/to/Intel_oneAPI/mybuild/mkl/latest/lib/intel64"))
    #Sys.setenv(LD_LIBRARY_PATH="/path/to/some/lib")
}else if(grepl("R version 4.1.1",version$version.string)) {
    #### do something
}else if(grepl("R version 4.4.2",version$version.string)) {
    #### do something
}

if (interactive() || isatty(stdout())) {
    options(colorout.verbose = 1)
    if (require("colorout", quietly = FALSE)) {
        # Gruvbox color scheme by @sjlva
	if(F) { 
		colorout::setOutputColors(
		    index    = "\x1b[38;2;215;153;33m",
		    normal   = "\x1b[38;2;235;219;178m",
		    number   = "\x1b[38;2;211;134;155m",
		    negnum   = "\x1b[38;2;104;157;106m",
		    zero     = "\x1b[38;2;69;133;136m",
		    infinite = "\x1b[38;2;250;189;47m",
		    string   = "\x1b[38;2;184;187;38m",
		    date     = "\x1b[38;2;254;128;25m",
		    const    = "\x1b[38;2;250;189;47m",
		    true     = "\x1b[38;2;142;192;124m",
		    false    = "\x1b[38;2;251;73;52m",
		    warn     = "\x1b[38;2;250;189;47m",
		    stderror = "\x1b[38;2;204;36;29m",
		    error    = "\x1b[38;2;204;36;29m",
		    verbose  = TRUE
		)
	}
    }
}

library("magrittr")
options(bitmapType='cairo')
