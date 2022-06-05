a = [ 1 1; 2 2; 3 3; 4 4; 5 5;
      6 6; 7 7; 8 8; 9 9; 10 10;
      11 11; 12 12; 13 13; 14 14; 15 15;
      16 16; 17 17; 18 18; 19 19; 20 20;
      21 21; 22 22; 23 23; 24 24; 25 25;
      26 26; 27 27; 28 28; 29 29; 30 30];
gap =3; Lf =6;
segmented_contour = {};
i = 1;
tmp_list = []; 
current_gap_index = 1;
length_org_contour = 30;
while ( length_org_contour - current_gap_index >= Lf )
   tmp_list = a( current_gap_index  : (current_gap_index + Lf)-1, :);
   current_gap_index = (current_gap_index + gap);
   segmented_contour{i} = tmp_list;
   i = i + 1;
end 