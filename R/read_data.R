

#' Read Data from CSV File
#'
#' @param file the name of the file to read. If path argument is not provided, it should contain the path to the file.
#' @param path the path where to read the file. If NULL (default), the file argument will be passed to read.csv().
#' Otherwise, it will be used to build the url (any path within file argument will then be ignored).
#' @param colClasses a vector of classes to be passed to read.csv(), or used to create the file and output value.
#' Possible values are (reminder from read.csv()):
#' - NA (the default, when type.convert is used),
#' - "NULL" (when the column is skipped),
#' - one of the atomic vector classes (logical, integer, numeric, complex, character, raw),
#' - or "factor", "Date" or "POSIXct"
#' Otherwise there needs to be an as method (from package methods) for conversion from "character" to the specified formal class.
#' @param create a logical value (default = TRUE) to indicate whether non existing file and/or path should be created or not.
#' check create_data() functions to get details about different behaviors.
#' @param encoding a character value (default = "UTF8"), passed to read.csv().
#' @param ... any argument you want to pass to read.csv() or write_data() if called.
#'
#' @return a data.frame, output of read.csv().
#' @export read_data
#'
#' @examples
#' \dontrun{read_data(file = "my_file.csv",
#' path = "./some/folder",
#' colClasses = c("id" = "numeric", "date" = "Date", "comment" = "character"))}
#'
#' @details
#' If create is TRUE and colClasses is NA, then file creation will be skipped as an empty data.frame (0 obs. of 0 variables)
#' will be received from create_data()


# -- function definition
read_data <- function(file, path = NULL, colClasses = NA, create = TRUE, encoding = "UTF-8", ...){

  # -- Build target_url (check path argument)
  if(!is.null(path))
    # -- Build url with basename: any path in file argument will be ignored!
    target_url <- file.path(path, basename(file))
  else
    target_url <- file

  # -- Check target_url exists
  if(!file.exists(target_url)){

    # -- Log message
    cat("[read_data] Target file ", target_url, "does not exist. \n")

    # -- Init data
    data <- create_data(colClasses)

    # -- Check create.file argument
    if(create){

      # -- Check dim!
      if(dim(data)[2] > 0)
        write_data(data, file = file, path = path, create = create, fileEncoding = encoding, ...)
      else {
        cat("[read_data] Warning: File creation skipped, as it would result in empty file! \n")
        return(data)}}

    else
      # -- Exit and return
      return(data)}

  # -- Log message
  cat("[read_data] Loading data from file ", target_url, "\n")

  # -- Read CSV data
  data <- utils::read.csv(file = target_url,
                          colClasses = colClasses,
                          encoding = encoding,
                          ...)

  # -- Log message & return
  cat("[read_data] Output dim =", dim(data), "\n")
  data

}
