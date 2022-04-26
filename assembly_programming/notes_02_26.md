# COMP122 Lecture Notes: April 25 & 26, 2022

## Announcements
   1. Three weeks
   1. New assignment

## Today's Agenda
   1. Strings and conversions
   1. Quick review of decimal -> binary -> decimal
   1. Work on new project: conversions.s


## Notes:


```c
fprintf(stdout, "Stored Checksum: %d, Computed Checksum: %d\n", checksum, complement);
  if (checksum != complement ) {
    fprintf(stderr, "Error Detected!\n"); 
    return 1;
  }
  return 0;
```

```mips
            .data
out_str0:   .ascii   "Stored Checksum: "
out_str1:   .ascii   ", Computed Checksum: "
out_str2:   .asciiz  "\n"
err_str:    .asciiz  "Error Detected!\n"
```

