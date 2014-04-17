Link for dataset:  https://www.dropbox.com/sh/qyp0o11b4g9mi4c/Prr1bl_NC_

Just make sure that the contents of the following folder are copied ( from the dropbox link) to the same named folder in the code (workspace) which are currently empty:
	1) "DATA"
	2) "HIST"
	3) "STIP"
	4) "HOG"
	5) "Videos"



'DATA': Store the videos in the format as mentioned as:
    Class 1 : Handshake -> holly_hand_1.avi
                           holly_hand_2.avi .....
                           holly__phone_1.avi
                           holly__phone_2.avi ....

'STIP': This directory stores 3-D matrices indicating STIP points for each video
'Videos': This directory stores frames of each video in greyscale format.
'HOG': This directory stores HoG descriptors of each video.
'HIST' : This directory contains the histograms for each of the videos.

Steps:
    1) Run "main.m" to extract the HOG features of :
        20 training file of Handshake class
        8 test files for Handshake Class
        20 training file of Phone Class
        8 test files for Phone Class

        After running the main.m file :
            "STIP" folder would contain the STIP points for each video
            "Videos" folder would contain the frames for each video
            "HOG" folder contains the HOG descriptors for each video
        
        This file uses following files:
            "STIP.m"  -> For collecting the STIP points for a video
            "saving_video.m"    -> For collecting the frames of a video
            "HOG.m"         -> Iterating over the STIP points and frames of video
            "Collectin_HOG.m"  -> Constructing the HOG descriptors of a video
    
    For your simplicity the STIP , Videos frames and HOG descriptora have already been calculated.
    
    2) Run "k_means.m" to construct the cluster centres (k=50). Save the [C,IDX] with the name of clustering_information.mat
       One thing to note is that we would contruct the cluster centres on only 20 of the videos from class 1 and 20 of the videos 
       from class 2 as the rest of the videos are test videos , so they cannot be included in cluster finding.
        
       For your convenience already been constructed.

    3) After running "k_means.m" , run "construct_hist.m" to construct the histogram for each of the videos:
            20 histogram for train class 1
            8 histrogram for test class 1
            20 histogram for train class 2
            8 histogram for test class 2
        
        After this step we obtain the histogram for each of the videos in "HIST" folder.

        For your convenience already been constructed.

    4) Run "svm_train.m" to obtain the predicted classes for each of the test videos.
        This file uses SVM to train the classifier.
    
        Predicted Class -> "var_ans"

       Run "single_clas_hist.m" to obtain the predicted classes for each of the test videos
       using single class histogram technique.

        Predicted class -> "val_final"

       Run "modified_histogram_approach.m" to obtain the predicted classes for each of the test videos
       using modified single class histogram approach.
            
        Predicted class -> "val_final"
    