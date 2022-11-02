# 3D_reconstruction
## __3D reconstruction-matlab__ : _3D_reconstruction toolkit based on pytorch_
### Introduction
This is a Contour identification and 3D reconstruction - based electronic speckle skeleton line extraction procedures 
The main package and version of the python environment are as follows
```
# Name                    Version         
matlab                    2022a                                
```  
The above environment is successful when running the code of the project. In addition, it is well known that pytorch has very good compatibility (version>=1.0). Thus, __I suggest you try to use the existing matlab environment firstly.__  

---  
## Usage 
### 0) Download Project 

Running```git clone https://github.com/Shuilin123/3D_reconstruction.git```  
The project structure and intention are as follows : 
```
3D_reconstruction			# Source code		
    ├── dfs.m		 	# depth-first algorithm
    ├── input			            # dataset
    │   ├── fai_2_noise_nn10.png
    │   ├── fai_5_noise_nn10.png		        
    │   ├── fai_16_noise_nn10.pngy		        
    │   ├── ...		# 
    ├── getdata.m			        #Transform 2d matrices into 3D coordinates 
    ├── ginput_espi.m			            #Skeleton line parameters are determined 
    ├── main.m			        # main function
    ├── Reconstruct3D.m			        #Three dimensional reconstruction of skeleton line based on logo 
    ├── skeleton_line_repair.m		            # For the broken skeleton line repair after binarizatio
    └── Skeleton_Line_indentify.m		          # Skeleton line identification algorithm
```
### 1) input
Part of the test diagram is shown here
