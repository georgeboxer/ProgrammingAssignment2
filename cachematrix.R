## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Function to create vector with available functions as variables
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get, setinv = setinv, 
       getinv = getinv)
}


## Write a short comment describing this function
## Function to check if inverse previously calculated, if so use cache else calculate 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
      message("getting cached data")
      return(m)
  }
  data <- x$get()
  m <- solve (data, ...)
  x$setinv(m)
  m
}
## Lines to generate results
matvec <- makeCacheMatrix(matrix(5:8, nrow = 2, ncol = 2))
cacheSolve(matvec)
cacheSolve(matvec)
