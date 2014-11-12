obj=mmreader('encrypted.avi');
nFrames=obj.NumberOfFrames;
%// Will open an avi file name test.avi in local folder
aviobj = avifile('decrypted.avi');
%// the quality of this video file
aviobj.Quality = 80;
%// compression method. See matlab manual for details.
aviobj.COMPRESSION ='None';%%color image
for k=1:nFrames
    img=read(obj,k);
   % figure(1),imshow(img,[]);
    img_size=size(img);
                    %disp(temp);
                    %image(img);
                    %12X22
                    %pause(4);
                    img1=zeros(img_size(1),img_size(2),3);
                    for a =1:img_size(1)
                        for b=1:img_size(2)
                            for c=1:img_size(3)
                                img1(a,b,c)= img(a,b,c);
                            end;
                        end;
                    end;
   
 
                     for a =1:img_size(1)
                        for b=1:img_size(2)
                            for c=1:img_size(3)
                                    img1(a,b,c)= img1(a,b,c)-200;
                                    if(img1(a,b,c)<0)
                                    img1(a,b,c)=255+img1(a,b,c);
                                    end;
                                    img(a,b,c)=img1(a,b,c);
                            end;

                        end;
                    end;
                    %image(img);
                    imshow(img,[]);
                    aviobj = addframe(aviobj,img);
                    %disp(img1);
                        
end
aviobj = close(aviobj);
disp('video is decrypted sucessfully');
