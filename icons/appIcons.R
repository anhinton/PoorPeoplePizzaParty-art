#! /usr/bin/env Rscript

library(whisker)

source = "iosIcon.xcf"

sizes = c(40, 58, 60, 80, 87, 120, 152, 167, 180, 1024)

output = file.path("appIcons", paste0("iosIcon-", sizes, ".png"))

template = "{{source}} -layers merge -scale {{size}} {{output}}"


for (i in seq_along(sizes)) {
    system2(command = "convert",
            args = whisker.render(template = template,
               data = list(source = source,
                           size = sizes[i],
                           output = output[i])))
}
