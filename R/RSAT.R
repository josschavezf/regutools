#' @title Call RSAT.
#' @description This function access RSAT via SOAP.
#' @author José Alquicira Hernández
#' @param method Name of the method to be used from RSAT
#' @param parameters List of parameters provided to method
#' @return an R object with results retrieved from RSAT
#' @examples
#' RSAT(method = "supported_organisms",
#'     parameters = list(return = "ID,name",
#'                       source = "NCBI"))
#' @export

RSAT <- function(method, parameters = NULL){

  if(!is.null(parameters)){
    request <- BuildXml(method = method,
                      parameters = parameters)
  }else{
    request <- BuildXml(method = method)
  }

  res <- POST("http://embnet.ccg.unam.mx/rsa-tools//web_services/RSATWS.cgi",
       body = request,
       content_type("text/xml; charset=utf-8"))
  stop_for_status(res)
  res <- content(res)
  return(res)

}

# RSAT(method = "supported_organisms",
#      parameters = list(return = "ID,name",
#                        source = "NCBI"))