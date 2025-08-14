Contained within this repository is the entire Storm Hawks Skyrace Game launcher.

14/8/25 UPDATE
Figured out how to get one of the race consoles to spawn, if you try to initiate a race though it will load indefinitely.


26/3/24 UPDATE

Offline mode has been achieved via correctly 'decompyling' and 'recompyling' the BWPersonailty file, video here: https://www.youtube.com/watch?v=Dh4fTCtOTpo by Lu.
Additionally a WPF exe was made to simplify the offline boot process and was posted into the linked discord in the yt video.


2/12/22 UPDATE

After editing the Binary pyc file with the help of H4v0c21 (who located the bits in the hex editor)
We have discovered that the issue lies elsewhere, as the edit still gives the init Account Class error.

Current investigation is into Const.pyc in ./dev/res/entites/client/bitcasters has shown the location of the previously hosted ip and port which also opens up the posibility of running an alt server.
![ip address located](https://cdn.discordapp.com/attachments/993060496557224018/1047799723051991100/SPOILER_image.png)

Further more netinfo.pyc located in ./client directory looks to hold some key data to sniff if an alt server is required.
