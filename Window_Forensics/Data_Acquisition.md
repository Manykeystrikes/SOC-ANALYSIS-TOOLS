When performing forensics, we will either encounter a live system or an image taken of the system. For the sake of accuracy, it is recommended practice to image the system or make a copy of the required data and perform forensics on it. This process is called data acquisition. Below we discuss different ways to acquire registry data from a live system or a disk image:
Though we can view the registry through the registry editor, the forensically correct method is to acquire a copy of this data and perform analysis on that. However, when we go to copy the registry hives from %WINDIR%\System32\Config, we cannot because it is a restricted file. So, what to do now?
For acquiring these files, we can use one of the following tools:
KAPE:
KAPE is a live data acquisition and analysis tool which can be used to acquire registry data. It is primarily a command-line tool but also comes with a GUI. The below screenshot shows what the KAPE GUI looks like. We have already selected all the settings to extract the registry data using KAPE in this screenshot. We will learn more about collecting forensic artifacts using KAPE in a dedicated KAPE room.

Autopsy:
Autopsy gives you the option to acquire data from both live systems or from a disk image. After adding your data source, navigate to the location of the files you want to extract, then right-click and select the Extract File(s) option. It will look similar to what you see in the screenshot below.

FTK Imager:
FTK Imager is similar to Autopsy and allows you to extract files from a disk image or a live system by mounting the said disk image or drive in FTK Imager. Below you can see the option to Export files as highlighted in the screenshot.

Another way you can extract Registry files from FTK Imager is through the Obtain Protected Files option. This option is only available for live systems and is highlighted in the screenshot below. This option allows you to extract all the registry hives to a location of your choosing. However, it will not copy the Amcache.hve file, which is often necessary to investigate evidence of programs that were last executed.

For the purpose of this room, we will not be acquiring data ourselves, but instead, we will work with the attached VM that already has data.

From <https://tryhackme.com/r/room/windowsforensics1> 

