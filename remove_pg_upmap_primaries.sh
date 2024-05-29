#!/bin/bash

# Extract pg_upmap_primary entries and remove them
pg_upmap_primary_entries=$(ceph osd dump | grep 'pg_upmap_primary' | awk '{print $2}')

# Iterate over each pg_upmap_primary entry
for pgid in $pg_upmap_primary_entries
do
  ceph osd rm-pg-upmap-primary "$pgid"
done

# Check if any pg_upmap_primary entries remain
remaining_entries=$(ceph osd dump | grep 'pg_upmap_primary')

# Print message based on the existence of remaining entries
if [ -z "$remaining_entries" ]; then
  echo "All pg_upmap_primary entries have been removed."
else
  echo "Some pg_upmap_primary entries remain:"
  echo "$remaining_entries"
fi
