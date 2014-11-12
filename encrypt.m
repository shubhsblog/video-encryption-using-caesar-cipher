clc;
        vid = videoinput('winvideo',1,'YUY2_160x120'); 
        set(vid, 'ReturnedColorSpace', 'rgb');
        %vid.LoggingMode = 'disk&memory';
        vid.TriggerRepeat = Inf;    
        set(vid,'FramesPerTrigger', 1);
        start(vid);
        i=0;
        auto_compress_count=0;
        j=0;
        frame=zeros();
        
        %// Will open an avi file name test.avi in local folder
        aviobj = avifile('encrypted.avi');
        %// the quality of this video file
         aviobj.Quality = 80;
        %// compression method. See matlab manual for details.
        aviobj.COMPRESSION ='None';%%color image 
        
        try
        
        % here condition specifies how many frames to encrypt
        while j<200
                     i=i+1;
                    img=getsnapshot(vid);
                    img_size=size(img);
                    %disp(temp);
                    image(img);
                    
                    img1=zeros(img_size(1),img_size(2),3);
                    for a =1:img_size(1)
                        for b=1:img_size(2)
                            for c=1:img_size(3)
                                img1(a,b,c)= img(a,b,c);
                            end;
                        end;
                    end;
                    %disp(img1);



                    %disp(img1);
                    for a =1:img_size(1)
                        for b=1:img_size(2)
                            for c=1:img_size(3)
                                        %disp(img1(a,b,c)+350);
                                    img1(a,b,c)= img1(a,b,c) + 200;

                                    if(img1(a,b,c)>255)
                                    img1(a,b,c)=img1(a,b,c)-255;
                                    end;
                                    img(a,b,c)=img1(a,b,c);

                            end;
                        end;
                    end;
                    %disp(img1);
                    image(img);
                     i=i+1;
                      aviobj = addframe(aviobj,img);



        %managing memory
       % out = imaqmem;
        %mem_left = out.FrameMemoryLimit - out.FrameMemoryUsed;
       % half_of_memlimit=(out.FrameMemoryLimit/2);
        %if mem_left < half_of_memlimit
         %   flushdata(vid,'triggers'); %each flushes only 50 frames
          %  flushdata(vid,'triggers');
        %end
        
        % clear all variables from memory except some variables
        %clearvars -except vid outputFolder i j auto_compress_count
        j=j+1;
        end
        
  catch exception
        delete(vid);
        aviobj = close(aviobj);

  end
delete(vid);
aviobj = close(aviobj);
disp('Video encrypted successfully');
