## Based on the example from Coursera
makeCacheMatrix <- function(x = matrix()) {
  minv <- NULL
  set <- function(y) {
    x <<- y
    minv <<- NULL
  }
  get <- function() x
  setminv <- function(solve) minv <<- solve
  getminv <- function() minv
  list(set = set, get = get, setminv = setminv, getminv = getminv)
}


## Second function calls first to check if inverse is calculated, if not calculates

cacheSolve <- function(x, ...) {
  minv <- x$getminv()
  if(!is.null(minv)) {
    message("getting cached data")
    return(minv)
  }
  data <- x$get()
  minv <- solve(data, ...)
  x$setminv(minv)
  minv
}
