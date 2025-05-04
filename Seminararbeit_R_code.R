rm(list=ls())
set.seed(151)
library(benford.analysis)
library(readxl)
library(dplyr)
library(grid)
path_WPP <- "WPP2024_GEN_F01_DEMOGRAPHIC_INDICATORS_FULL.xlsx"
data_WPP <- read_excel(path_WPP, sheet = "Estimates", skip = 16)
data_WPP_clean <- data_WPP[, c("Region, subregion, country or area *", 
                   "Total Population, as of 1 January (thousands)", "Year")]
colnames(data_WPP_clean) <- c("Country", "Population_2022", "Year")
data_WPP_clean <- na.omit(data_WPP_clean)
data_WPP_clean_2022 <- data_WPP_clean[data_WPP_clean$Year == 2022, ]
head(data_WPP_clean_2022)
data_WPP_clean_2022$Population_2022 <- as.numeric(data_WPP_clean_2022$Population_2022)

benford_WPP_result <- benford(data_WPP_clean_2022$Population_2022, number.of.digits = 1)
print(benford_WPP_result)
plot(benford_WPP_result)

output_text_1 <- capture.output(print(benford_WPP_result))
png("benford_first_digit_R_console.png", width = 700, height = 800)
grid::grid.text(
  paste(output_text_1, collapse = "\n"),
  x = 0.01, y = 0.99,
  just = c("left", "top"),
  gp = grid::gpar(fontsize = 12, fontfamily = "Courier")
)
dev.off()

benford_WPP_result_dig2 <- benford(data_WPP_clean_2022$Population_2022)
print(benford_WPP_result_dig2)
plot(benford_WPP_result_dig2)

output_text_2 <- capture.output(print(benford_WPP_result_dig2))
png("benford_second_digit_R_console.png", width = 700, height = 800)
grid::grid.text(
  paste(output_text_2, collapse = "\n"),
  x = 0.01, y = 0.99,
  just = c("left", "top"),
  gp = grid::gpar(fontsize = 12, fontfamily = "Courier")
)
dev.off()

