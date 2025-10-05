#!/bin/bash
# A robust, unified script for managing and monitoring the hash files.

# --- Configuration ---
PID_FILE=".reader.pid"
APP_DIR="app"

# --- Data ---
# Using a function to hold the data to keep the script clean.
get_lsof_data() {
cat <<'EOF'
COMMAND     PID       USER   FD      TYPE             DEVICE  SIZE/OFF       NODE NAME
linker     7317    u0_a190  cwd       DIR              252,4       676         58 /
linker     7317    u0_a190  rtd       DIR              252,4       676         58 /
linker     7317    u0_a190  txt       REG               7,56   1301012         14 /apex/com.android.runtime/bin/linker
linker     7317    u0_a190  mem       REG              252,4    485524   26717824 /system/lib/libc++.so
linker     7317    u0_a190  mem       REG              252,4     41480   25372782 /system/lib/liblog.so
linker     7317    u0_a190  mem       REG               7,56    131056         24 /apex/com.android.runtime/lib/bionic/libm.so
linker     7317    u0_a190  mem       REG              252,4    171796   26594304 /system/lib/libbase.so
linker     7317    u0_a190  mem       REG              252,4     61984   26176365 /system/lib/libcutils.so
linker     7317    u0_a190  mem       REG              252,4     25524   26690015 /system/lib/libnetd_client.so
linker     7317    u0_a190  mem       REG               7,56      5340         22 /apex/com.android.runtime/lib/bionic/libdl.so
linker     7317    u0_a190  mem       REG               7,56      5340         22 /apex/com.android.runtime/lib/bionic/libdl.so
linker     7317    u0_a190  mem       REG               7,56      5340         22 /apex/com.android.runtime/lib/bionic/libdl.so
linker     7317    u0_a190  mem       REG               0,16    131072       9580 /dev/__properties__/u:object_r:heapprofd_prop:s0
linker     7317    u0_a190  mem       REG               0,16    131072       9593 /dev/__properties__/u:object_r:libc_debug_prop:s0
linker     7317    u0_a190  mem       REG             252,37    252756     117714 /data/data/com.termux/files/usr/lib/libncursesw.so.6.5
linker     7317    u0_a190  mem       REG               0,16    131072       9575 /dev/__properties__/u:object_r:gwp_asan_prop:s0
linker     7317    u0_a190  mem       REG               0,16    131072       9522 /dev/__properties__/u:object_r:debug_prop:s0
linker     7317    u0_a190  mem       REG               7,56   1111912         21 /apex/com.android.runtime/lib/bionic/libc.so
linker     7317    u0_a190  mem       REG             252,37    205340     119724 /data/data/com.termux/files/usr/lib/libreadline.so.8.3
linker     7317    u0_a190  mem       REG               0,16    131072      10040 /dev/__properties__/properties_serial
linker     7317    u0_a190  mem       REG             252,37      9060     120848 /data/data/com.termux/files/usr/lib/libtermux-exec.so
linker     7317    u0_a190  mem       REG             252,37      9060     120848 /data/data/com.termux/files/usr/lib/libtermux-exec.so
linker     7317    u0_a190  mem       REG             252,37   1031500     117642 /data/data/com.termux/files/usr/lib/libiconv.so
linker     7317    u0_a190  mem       REG               0,16    129032       9450 /dev/__properties__/property_info
linker     7317    u0_a190  mem       REG               0,16    131072       9484 /dev/__properties__/u:object_r:build_vendor_prop:s0
linker     7317    u0_a190  mem       REG               0,16    131072      10020 /dev/__properties__/u:object_r:vendor_socket_hook_prop:s0
linker     7317    u0_a190  mem       REG               0,16    131072      10025 /dev/__properties__/u:object_r:vndk_prop:s0
linker     7317    u0_a190  mem       REG             252,37    592932     121242 /data/data/com.termux/files/usr/bin/bash
linker     7317    u0_a190  mem       REG               0,16    131072       9522 /dev/__properties__/u:object_r:debug_prop:s0
linker     7317    u0_a190  mem       REG               0,16    131072       9483 /dev/__properties__/u:object_r:build_prop:s0
linker     7317    u0_a190  mem       REG               0,16    131072      10040 /dev/__properties__/properties_serial
linker     7317    u0_a190  mem       REG               0,16    129032       9450 /dev/__properties__/property_info
linker     7317    u0_a190  mem       REG               7,56   1301012         14 /apex/com.android.runtime/bin/linker
linker     7317    u0_a190    0u      CHR              136,27       0t0         30 /dev/pts/27
linker     7317    u0_a190    1u      CHR              136,27       0t0         30 /dev/pts/27
linker     7317    u0_a190    2u      CHR              136,27       0t0         30 /dev/pts/27
linker     7317    u0_a190  255u      CHR              136,27       0t0         30 /dev/pts/27
lsof       7342    u0_a190  cwd       DIR               252,4       676         58 /
lsof       7342    u0_a190  rtd       DIR               252,4       676         58 /
lsof       7342    u0_a190  txt       REG               252,4    381972   16533464 /system/bin/toybox
lsof       7342    u0_a190  mem       REG               252,4    381972   16533464 /system/bin/toybox
lsof       7342    u0_a190  mem       REG               252,4     61984   26176365 /system/lib/libcutils.so
lsof       7342    u0_a190  mem       REG               252,4     25524   26690015 /system/lib/libnetd_client.so
lsof       7342    u0_a190  mem       REG               252,4    895832   27067392 /system/lib/libcrypto.so
lsof       7342    u0_a190  mem       REG                7,56    131056         24 /apex/com.android.runtime/lib/bionic/libm.so
lsof       7342    u0_a190  mem       REG                7,56   1111912         21 /apex/com.android.runtime/lib/bionic/libc.so
lsof       7342    u0_a190  mem       REG               252,4      4536   25403248 /system/lib/libpackagelistparser.so
lsof       7342    u0_a190  mem       REG               252,4      4536   25403248 /system/lib/libpackagelistparser.so
lsof       7342    u0_a190  mem       REG               252,4      4536   25403248 /system/lib/libpackagelistparser.so
lsof       7342    u0_a190  mem       REG               252,4     75092   27778770 /system/lib/libselinux.so
lsof       7342    u0_a190  mem       REG               252,4    244316   28156544 /system/lib/libprocessgroup.so
lsof       7342    u0_a190  mem       REG               252,4    294952   25388157 /system/lib/libpcre2.so
lsof       7342    u0_a190  mem       REG               252,4    171796   26594304 /system/lib/libbase.so
lsof       7342    u0_a190  mem       REG                7,56      5340         22 /apex/com.android.runtime/lib/bionic/libdl.so
lsof       7342    u0_a190  mem       REG                7,56      5340         22 /apex/com.android.runtime/lib/bionic/libdl.so
lsof       7342    u0_a190  mem       REG                7,56      5340         22 /apex/com.android.runtime/lib/bionic/libdl.so
lsof       7342    u0_a190  mem       REG               252,4    485524   26717824 /system/lib/libc++.so
lsof       7342    u0_a190  mem       REG               252,4     70448   28461925 /system/lib/libz.so
lsof       7342    u0_a190  mem       REG                0,16    131072       9580 /dev/__properties__/u:object_r:heapprofd_prop:s0
lsof       7342    u0_a190  mem       REG               252,4     41480   25372782 /system/lib/liblog.so
lsof       7342    u0_a190  mem       REG               252,4      8352   25701496 /system/lib/libcgrouprc.so
lsof       7342    u0_a190  mem       REG               252,4      8352   25701496 /system/lib/libcgrouprc.so
lsof       7342    u0_a190  mem       REG                0,16    131072       9593 /dev/__properties__/u:object_r:libc_debug_prop:s0
lsof       7342    u0_a190  mem       REG                0,16    131072       9575 /dev/__properties__/u:object_r:gwp_asan_prop:s0
lsof       7342    u0_a190  mem       REG                0,16    131072       9522 /dev/__properties__/u:object_r:debug_prop:s0
lsof       7342    u0_a190  mem       REG                0,16    131072      10040 /dev/__properties__/properties_serial
lsof       7342    u0_a190  mem       REG                0,16    129032       9450 /dev/__properties__/property_info
lsof       7342    u0_a190  mem       REG                0,16    131072      10020 /dev/__properties__/u:object_r:vendor_socket_hook_prop:s0
lsof       7342    u0_a190  mem       REG                0,16    131072      10025 /dev/__properties__/u:object_r:vndk_prop:s0
lsof       7342    u0_a190  mem       REG                0,16    131072       9522 /dev/__properties__/u:object_r:debug_prop:s0
lsof       7342    u0_a190  mem       REG                0,16    131072       9483 /dev/__properties__/u:object_r:build_prop:s0
lsof       7342    u0_a190  mem       REG                0,16    131072      10040 /dev/__properties__/properties_serial
lsof       7342    u0_a190  mem       REG                0,16    129032       9450 /dev/__properties__/property_info
lsof       7342    u0_a190  mem       REG                7,56   1301012         14 /apex/com.android.runtime/bin/linker
lsof       7342    u0_a190    0u      CHR               136,27       0t0         30 /dev/pts/27
lsof       7342    u0_a190    1u      CHR               136,27       0t0         30 /dev/pts/27
lsof       7342    u0_a190    2u      CHR               136,27       0t0         30 /dev/pts/27
lsof       7342    u0_a190    3r      DIR                0,4         0          1 /proc
lsof       7342    u0_a190    4r      DIR                0,4         0   13254205 /proc/7342/fd
EOF
}

# --- Functions ---

# Function to show help message
show_help() {
  echo "Usage: $0 {--setup|--start-activity|--monitor|--stop-activity|--help}"
  echo ""
  echo "A robust, unified script for managing and monitoring the hash files."
  echo ""
  echo "Modes:"
  echo "  --setup          Populates hash files with data. Run this first."
  echo "  --start-activity Starts a background reader process to simulate activity."
  echo "  --monitor        Starts the real-time monitor to view the activity."
  echo "  --stop-activity  Stops the background reader process."
  echo "  --help           Shows this help message."
}

# Function to set up the environment
do_setup() {
  echo "--- Setting up environment ---"
  if [ ! -d "$APP_DIR" ]; then
    echo "Error: Directory '$APP_DIR' not found. Please create it first."
    exit 1
  fi

  lsof_data=$(get_lsof_data)

  for file in "$APP_DIR"/*; do
    if [ -f "$file" ] && [ "$(basename "$file")" != "README.md" ]; then
      echo "Populating file: $(basename "$file")"
      echo "$lsof_data" > "$file"
    fi
  done
  echo "--- Setup complete ---"
}

# Function that will run in the background
reader_loop() {
  while true; do
    for file in "$APP_DIR"/*; do
      if [ -f "$file" ]; then
        cat "$file" > /dev/null
        sleep 0.5
      fi
    done
    sleep 2
  done
}

# Function to start the background activity
do_start_activity() {
  if [ -f "$PID_FILE" ]; then
    echo "Activity is already running. Please stop it first with --stop-activity."
    exit 1
  fi
  echo "--- Starting background activity ---"
  # Start the loop in the background
  reader_loop &
  # Save the PID of the background process
  echo $! > "$PID_FILE"
  echo "Activity started with PID $(cat $PID_FILE). Use --monitor to see it."
}

# Function to stop the background activity
do_stop_activity() {
  if [ ! -f "$PID_FILE" ]; then
    echo "No activity is currently running."
    exit 1
  fi

  pid_to_kill=$(cat "$PID_FILE")
  echo "--- Stopping background activity (PID: $pid_to_kill) ---"

  # Kill the process
  if kill "$pid_to_kill" 2>/dev/null; then
    echo "Process stopped successfully."
  else
    echo "Failed to stop process. It might have already been stopped."
  fi

  # Clean up the PID file
  rm "$PID_FILE"
}

# Function to run the monitor
do_monitor() {
  # Trap Ctrl+C to exit gracefully
  trap "echo -e '\n\n--- Monitor stopped by user. ---'; exit 0" SIGINT

  while true; do
    clear
    echo "--- Real-Time Hybrid File Monitor (Press Ctrl+C to stop) ---"
    echo "Last updated: $(date)"
    echo ""

    for file in "$APP_DIR"/*; do
      if [ -f "$file" ]; then
        echo "========================================"
        echo "Checking file: $(basename "$file")"
        echo "----------------------------------------"

        pids=$(lsof -t "$file" 2>/dev/null)

        if [ -n "$pids" ]; then
          for pid in $pids; do
            # Get process name and memory usage (RSS in KB)
            # Using awk, which is standard and avoids 'bc'.
            process_info=$(ps -o comm=,rss= -p "$pid")
            process_name=$(echo "$process_info" | awk '{print $1}')
            mem_usage_kb=$(echo "$process_info" | awk '{print $2}')

            echo "  -> Process: '$process_name' (PID: $pid) is using this file."
            echo "     Memory (RAM): ${mem_usage_kb} KB"
          done
        else
          echo "  No processes are currently interacting with this file."
        fi
        echo "========================================"
        echo ""
      fi
    done

    sleep 5
  done
}

# --- Main Logic ---
if [ "$#" -ne 1 ]; then
  show_help
  exit 1
fi

case "$1" in
  --setup)
    do_setup
    ;;
  --start-activity)
    do_start_activity
    ;;
  --monitor)
    do_monitor
    ;;
  --stop-activity)
    do_stop_activity
    ;;
  --help)
    show_help
    ;;
  *)
    echo "Error: Invalid argument '$1'"
    show_help
    exit 1
    ;;
esac