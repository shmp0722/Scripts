function s_correctbvecs

% Correct the bvecs file, in order to match the correct one (NIMS)
% (C) Hiromasa Takemura (C) Stanford VISTA Lab 2014

bvecs_orig = dlmread('/biac4/wandell/biac2/wandell/data/qMRI/LHON1-CV-76M-20141205_8504/raw/dwi1st.bvec');

bvecs_new = bvecs_orig;

% Exchange x and y
bvecs_new(1,:) = -bvecs_orig(2,:);
bvecs_new(2,:) = -bvecs_orig(1,:);
bvecs_new(3,:) = -bvecs_orig(3,:);

% Write it
dlmwrite('/biac4/wandell/biac2/wandell/data/qMRI/LHON1-CV-76M-20141205_8504/raw/dwi1st_xyexchanged_xyzflipped.bvec',bvecs_new);
