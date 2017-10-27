% researchGate ÏÂÔØµÄ³ÌÐò
function F = extract_Daisy(img,LocX,LocY)
% inputs:
% img   : input image
% LocX  : X location of keypoint
% LocY  : Y location of keypoint
% 
% Output:
% F     : 1*200 descriptor vector for specified keypoint

if size(img,3)> 1
    img_gray = rgb2gray(img);
else
    img_gray = img;
end
% 'DAISY Descriptor'
        ImSz = size(img_gray);
        if min(ImSz) < 17
            disp('Size of Input Image should be greater than 16')
            F = [];
        else
            R  = 15;
            RQ = 3;TQ = 8;HQ = 8;
            SI = 1;LI = 1;NT = 1;
            dzy = init_daisy(img_gray,R,RQ,TQ,HQ,SI,LI,NT);
            ang = 0; % orientation to compute the descriptors
            F  = compute_descriptor(dzy, LocX, LocY,ang,0,0,3);
            F = reshape(F,1,numel(F));
        end