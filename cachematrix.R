## Put comments here that give an overall description of what your
## functions do

## make the matrix into an object in the environment 

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        setter <- function(set_x) {
                x <<- set_x
                inv <<- NULL
        }
        getter <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(setter = setter,
             getter = getter,
             setInverse = setInverse,
             getInverse = getInverse)
}


## inverse function by passing matrix object

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        if (!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mart <- x$getter()
        ## matrix solve function pass matrix self and return inverse matrix
        inv <- solve(matr,...)
        x$setInverse(inv)
        inv
}
