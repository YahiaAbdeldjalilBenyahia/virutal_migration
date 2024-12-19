Diskless Migration:
First Step: on destination VM: run_page_server_diskless.sh (listen for page server)
Second Step: on source VM: migrate_diskless.sh (dump files and scp)
Third Step: on destination VM: restore_diskless.sh (restore files and resume process)

Lazy Migration:
First Step: on source VM: migrate_lazy.sh (dump files and scp)
Second Step: on destination VM: restore_lazy.sh (restore files and resume process)
