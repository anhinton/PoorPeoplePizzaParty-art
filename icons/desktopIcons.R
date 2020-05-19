#! /usr/bin/env Rscript

library(whisker)

source = "desktopIcon.png"

sizes = c(16, 32, 128)

output = file.path("desktopIcons", paste0("icon_", sizes, ".png"))

template = "{{source}} -scale {{size}} {{output}}"


for (i in seq_along(sizes)) {
    system2(command = "convert",
            args = whisker.render(template = template,
               data = list(source = source,
                           size = sizes[i],
                           output = output[i])))
}
