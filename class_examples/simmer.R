library(simmer)
library(simmer.plot)

patient <- trajectory("patient_path") %>% 
  seize("nurse") %>% 
  timeout(function() rnorm(1,15,3)) %>% 
  release("nurse") %>% 
  seize("doctor") %>% 
  timeout(function() rnorm(1,20)) %>% 
  release("doctor") %>% 
  seize("admin") %>% 
  timeout(function() rnorm(1,5)) %>% 
  release("admin")

set.seed(42)

clinic <- simmer("TheSim") %>% 
  add_resource("nurse", 1) %>% 
  add_resource("doctor", 2) %>% 
  add_resource("admin", 1) %>% 
  add_generator("patient", patient, function() rnorm(1, 10, 2))
