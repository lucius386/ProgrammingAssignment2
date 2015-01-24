## The functions in this module will allow for the calculation, 
## caching, and retrieval of the inverse for a numeric matrix


## This function will create a vector list of functions that can bee
## called upon to calculate, cache, and retrieve the inverse
## of an original matrix. 

makeCacheMatrix <- function(myData = matrix()) {
  myinverse <- NULL
  set <- function(setData) {
    myData <<- setData
    myinverse <<- NULL
  }
  get <- function() myData
  setinverse <- function(inverse) myinverse <<- inverse
  getinverse <- function() myinverse
  list(set = set, 
       get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## This function will make calls to the makeCacheMatrix functions to
## calculate and cache the inverse of the input matrix

cacheSolve <- function(funList, ...) {
## Return a matrix that is the inverse of 'x'
  
  myinverse <- funList$getinverse()
  if(!is.null(myinverse)) {
    message("getting cached data")
    return(myinverse)
  }
  data <- funList$get()
  myinverse <- solve(data)
  funList$setinverse(myinverse)
  myinverse
  
}
