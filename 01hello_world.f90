PROGRAM hello_world
  !$omp parallel
  PRINT*,'hello'
  !$omp end parallel
END PROGRAM hello_world
