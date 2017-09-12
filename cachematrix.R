## Two functions used together can create a matrix and store its inverse in the cache
The inverse is computed with the cacheSolve function, then it is stored. When run again is calls already computed inverse.

## The function makeCacheMatrix creates a matrix in special way, it stores its inverse and has 3 additional function in its body. origin calls the original matrix, getinverse calls the inverse, setinverse stores the inverse.

makeCacheMatrix <- function(x = matrix()) {
    originalm <- function() x
    im <-NULL
    getinverse <- function() im
    setinverse <- function(inverse) im <<- inverse
    list(originalm=originalm,getinverse=getinverse,setinverse=setinverse)
}


## cacheSolve computes an inverse of a matrix and stores its result in the cache

cacheSolve <- function(x, ...) {
    im <- x$getinverse()
    if (!is.null(im)) {
        message("returning cached inverse")
        im
    } 
    originalm <- x$originalm()
    im <- solve(originalm)
    x$setinverse(im)
    im
}
