locals {
  list_rc01_to_rc99 = [for i in range(1, 100) : format("rc%02d", i)]
  
  list_rc_filtered = [
    for i in range(1, 97) : 
    "rc${format("%02d", i)}" if !(substr(format("%02d", i), 1, 1) == "0" ||
                                  substr(format("%02d", i), 1, 1) == "7" ||
                                  substr(format("%02d", i), 1, 1) == "8" ||
                                  substr(format("%02d", i), 1, 1) == "9") || format("%02d", i) == "19"
  ]
}

# Output of the first list
output "rc01_to_rc99" {
  value = join(", ", local.list_rc01_to_rc99)
}


# Output of the second list
output "rc_filtered" {
  value = join(", ", local.list_rc_filtered)
}