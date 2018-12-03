function interval = mergeIntervals(i1,i2)
    interval = [min(i1(1),i2(1)),max(i1(2),i2(2))];
end