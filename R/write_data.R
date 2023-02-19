

#' Write Data to CSV File
#'
#' @param data a data.frame of the data to be saved.
#' @param file the name of the file to read. If path argument is not provided, it should contain the path to the file.
#' @param path the path where to read the file. If NULL (default), the file argument will be passed to write.csv().
#' Otherwise, it will be used to build the url (any path within file argument will then be ignored).
#' @param create a logical value (default = TRUE) to indicate whether non existing path should be created or not.
#' @param row.names a logical value (default = FALSE) to indicate whether row names should be written or not.
#' @param fileEncoding a character value (default = "UTF8"), passed to write.csv().
#' @param ... any argument you want to pass to write.csv().
#'
#' @return FALSE if path (either the path argument or dirname of file) does not exist and create is FALSE
#' @export write_data
#'
#' @examples
#' \dontrun{write_data(data.frame(id = 1, comment = "some text"),
#' file = "my_file.csv",
#' path = "./some/folder",
#' create = TRUE,
#' row.names = FALSE,
#' fileEncoding = "UTF-8")}


# -- function definition
write_data <- function(data, file, path = NULL, create = TRUE, row.names = FALSE, fileEncoding = "UTF-8", ...){

  cat("[write_data] Writing data.frame to file \n")

  # -- Build target_url
  if(is.null(path))
    target_url <- file
  else
    target_url <- file.path(path, basename(file))

  # -- Check target_url path
  if(!dir.exists(dirname(target_url))){

    if(create){
      cat("- Creating target path", dirname(target_url), "\n")
      dir.create(dirname(target_url), recursive = TRUE)

    } else {
      cat("[write_data] ERROR - target directory", dirname(target_url), " does not exist! \n")
      return(FALSE)}}

  # -- write file
  utils::write.csv(data,
                   file = target_url,
                   row.names = row.names,
                   fileEncoding = fileEncoding,
                   ...)

}
