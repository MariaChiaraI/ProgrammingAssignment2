
The two following functions are able to compute the inverse of a matrix assuming that the matrix is always invertible.
For time-consuming reasons, the computed inverse matrix is stored and it is recalled if the same inversion is required.

The makeCacheMatrix function creates a matrix object and is able to cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    set <- function(y){
            x <<- y
            m <<- NULL
    }
    get <- function() x
    setinv <- function(solve) m <<- solve
    getinv <- function() m
    list(set=set, get=get,
         setinv=setinv,
         getinv=getinv)
}


The cacheSolve function computes the inverse of the matrix object created by the previous function. In this way, if the inverse has already been computed, it just calls it from the cahce.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinv()
    if(!is.null(m)){
           message("getting cached data")
           return(m)
    }
    M <- x$get() 
    m <- solve(M, ...)
    x$setinv(m)
    m
}
