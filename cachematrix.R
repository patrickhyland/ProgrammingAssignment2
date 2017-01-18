
## This function sets, gets, and defines the matrix that can inversed with the Cache solve

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
    get <- function() x
    setinverse <- function(inverse) s <<- solve
    getinverse <- function() s
    list(set = set, get = get,
        setinverse= setinverse,
        getinverse = getinverse)
  x
}


## this is the actual function that inverses the matrix from the previous function. 
## If first checks to see if there is a matrix to inverse. If it's already been calculated 
##it will give the inverse of the cache

cacheSolve <- function(x, ...) {
        
  s <- x$getinverse()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setinverse(s)
  s
}

a <- matrix(1:4,2,2)
makeCacheMatrix(a)
cacheSolve(solvedmatrix)
solvedmatrix <- makeCacheMatrix(a)

