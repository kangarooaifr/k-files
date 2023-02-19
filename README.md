# Package Specifications

## Purpose

The goal of this package is to provide simple wrapper functions around read.csv() and write.csv()

## Description

The wrappers mainly add basic features as checking if the path or file path exist, and create them if not.

## Installation

devtools::install_github("kangarooaifr/kfiles")

## Main functions

#### Create data

-   create_data() - to create a data.frame from colClasses

#### Read files

-   read_data() - to read a .csv file

#### Write files

-   write_data() - to write a .csv file
