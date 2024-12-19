
Migration Scripts

This repository contains scripts for performing diskless migration and lazy migration between virtual machines. Follow the steps below to execute each type of migration.

--------------------------------------------------------------------------------

Diskless Migration

Diskless migration involves transferring memory pages dynamically during the restore process.

Steps:

1. Start the Page Server on the Destination VM
   Run the following script to start the page server on the destination VM:
       ./run_page_server_diskless.sh

2. Migrate from the Source VM
   On the source VM, execute the script to dump the files and transfer them to the destination VM:
       ./migrate_diskless.sh

3. Restore on the Destination VM
   Finally, restore the files and resume the process on the destination VM:
       ./restore_diskless.sh

--------------------------------------------------------------------------------

Lazy Migration

Lazy migration allows the process to start on the destination VM before all memory pages are transferred.

Steps:

1. Migrate from the Source VM
   On the source VM, execute the script to dump the files and transfer them to the destination VM:
       ./migrate_lazy.sh

2. Restore on the Destination VM
   Restore the files and resume the process on the destination VM:
       ./restore_lazy.sh

--------------------------------------------------------------------------------

Notes:
- Ensure that all scripts have the appropriate permissions to execute:
      chmod +x *.sh
- Make sure both the source and destination VMs have the necessary dependencies installed for migration.

Happy migrating!
