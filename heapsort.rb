def child_index(arr, parent_index, bounds)
  child_i_one = 2 * parent_index + 1
  child_i_two = 2 * parent_index + 2
  return child_i_one if child_i_one >= bounds || child_i_two >= bounds || arr[child_i_one] > arr[child_i_two]

  child_i_two
end

def swap(arr, index_1, index_2)
  arr[index_1], arr[index_2] = arr[index_2], arr[index_1]
end

def bubble_down(arr, parent_index, bounds)
  child_index = child_index(arr, parent_index, bounds)

  while child_index < bounds && arr[parent_index] < arr[child_index]
      swap(arr, parent_index, child_index)
      parent_index = child_index
      child_index = child_index(arr, parent_index, bounds)
  end
end

def heapsort(arr)
  i = arr.length - 1
  while i >= 0
      bubble_down(arr, i, arr.length)
     i-= 1
  end

  wall = arr.length - 1
  while wall >= 0
      swap(arr, 0, wall)
      bubble_down(arr, 0, wall)
      wall -= 1
  end
  arr
end

# tests:
# puts "expect [-20, -4, 2, 3, 5, 5, 7, 8, 9, 23, 111]"
# p heapsort([9, 5, 2, 3, 7, 23, 5, 8, 111, -4, -20])

# puts "expect [1, 3, 4, 7, 9]"
# p heapsort([3, 9, 1, 4, 7])

# puts "expect [0, 3, 4, 4, 4, 5, 5, 5, 6, 8, 9, 11, 17, 19, 20, 21, 21, 22, 26, 27, 30, 31, 32, 36, 38, 38, 40, 40, 41, 44, 46, 47, 47, 50, 54, 54, 55, 57, 57, 57, 60, 60, 60, 61, 61, 62, 63, 64, 66, 67, 67, 70, 70, 70, 73, 74, 76, 77, 77, 77, 78, 81, 82, 82, 82, 83, 84, 85, 85, 86, 86, 86, 88, 89, 90, 93, 94, 94, 96, 100, 101, 102, 103, 105, 105, 107, 107, 110, 110, 112, 113, 114, 114, 115, 115, 116, 117, 117, 118, 120, 120, 120, 120, 120, 122, 122, 123, 123, 123, 124, 126, 129, 131, 131, 131, 134, 134, 134, 135, 135, 136, 136, 136, 137, 138, 139, 139, 140, 140, 141, 144, 144, 144, 144, 144, 144, 147, 147, 147, 148, 149, 149, 150, 151, 151, 153, 154, 154, 154, 154, 154, 154, 155, 155, 157, 158, 159, 159, 160, 162, 163, 163, 166, 167, 169, 170, 172, 174, 175, 177, 177, 177, 178, 179, 179, 180, 180, 184, 184, 186, 186, 186, 188, 188, 189, 189, 191, 193, 194, 196, 196, 196, 197, 197, 200, 201, 201, 201, 202, 202, 203, 204, 206, 209, 210, 211, 213, 214, 215, 215, 217, 217, 218, 219, 220, 220, 222, 223, 226, 226, 227, 228, 228, 231, 235, 237, 238, 238, 239, 239, 240, 240, 241, 242, 243, 245, 247, 248, 250, 250, 252, 252, 252, 253, 254, 255, 256, 257, 257, 260, 261, 263, 266, 266, 267, 267, 268, 269, 269, 271, 272, 273, 273, 276, 278, 279, 280, 285, 286, 286, 287, 291, 293, 298, 302, 303, 305, 307, 308, 308, 308, 308, 308, 309, 309, 310, 311, 311, 313, 313, 315, 316, 316, 317, 320, 320, 321, 321, 323, 325, 327, 328, 330, 330, 333, 334, 334, 335, 335, 335, 336, 336, 337, 337, 337, 337, 339, 339, 339, 342, 346, 346, 347, 347, 349, 349, 349, 349, 350, 350, 350, 351, 351, 353, 355, 355, 356, 356, 356, 357, 358, 358, 358, 360, 361, 361, 361, 366, 366, 368, 368, 370, 372, 372, 375, 376, 378, 379, 379, 379, 379, 381, 384, 384, 387, 388, 389, 389, 390, 390, 390, 394, 396, 397, 397, 398, 398, 398, 402, 403, 403, 404, 405, 407, 407, 407, 409, 409, 410, 410, 410, 411, 412, 413, 414, 417, 419, 419, 420, 420, 420, 421, 421, 423, 423, 424, 424, 424, 425, 425, 425, 426, 427, 428, 428, 429, 429, 429, 431, 433, 435, 437, 437, 437, 438, 438, 438, 439, 441, 441, 441, 441, 443, 446, 446, 447, 448, 450, 452, 452, 458, 463, 463, 463, 464, 464, 465, 465, 466, 467, 469, 469, 470, 471, 472, 472, 472, 472, 474, 476, 477, 478, 480, 480, 481, 482, 483, 485, 485, 486, 486, 487, 490, 491, 496, 497, 498, 498, 499, 501, 501, 501, 502, 502, 502, 503, 503, 504, 505, 505, 505, 506, 506, 506, 506, 511, 514, 514, 514, 514, 515, 515, 516, 516, 516, 516, 517, 518, 519, 519, 520, 520, 520, 521, 523, 523, 524, 525, 525, 526, 526, 527, 528, 529, 529, 529, 529, 529, 530, 530, 532, 532, 532, 535, 535, 536, 538, 539, 540, 540, 541, 542, 542, 542, 542, 544, 546, 548, 550, 550, 551, 551, 552, 553, 553, 553, 554, 555, 556, 558, 558, 560, 561, 562, 562, 563, 563, 564, 565, 566, 566, 569, 572, 572, 572, 573, 573, 575, 575, 579, 579, 579, 580, 581, 581, 583, 584, 585, 586, 586, 587, 589, 590, 594, 595, 598, 598, 601, 602, 602, 605, 605, 605, 605, 606, 606, 607, 607, 608, 608, 609, 611, 612, 613, 613, 613, 615, 616, 617, 617, 618, 621, 621, 621, 625, 626, 629, 629, 629, 630, 630, 633, 635, 636, 638, 640, 641, 642, 643, 644, 647, 647, 647, 648, 651, 652, 653, 654, 656, 656, 656, 657, 658, 659, 659, 659, 659, 660, 661, 661, 662, 663, 664, 668, 668, 668, 669, 671, 672, 672, 673, 679, 679, 681, 682, 682, 683, 685, 687, 688, 689, 691, 693, 694, 694, 695, 696, 697, 698, 699, 701, 702, 706, 707, 709, 712, 713, 714, 716, 716, 718, 718, 719, 719, 720, 722, 722, 723, 723, 723, 725, 725, 725, 728, 728, 730, 731, 732, 735, 736, 737, 740, 740, 741, 742, 742, 743, 743, 743, 744, 744, 746, 746, 746, 748, 748, 748, 750, 751, 753, 753, 753, 754, 755, 755, 756, 758, 760, 761, 762, 762, 763, 763, 765, 765, 766, 767, 767, 768, 768, 769, 769, 771, 771, 773, 774, 774, 774, 775, 775, 776, 776, 777, 778, 778, 779, 781, 781, 781, 784, 785, 786, 786, 787, 788, 788, 788, 788, 789, 789, 790, 791, 791, 794, 795, 796, 798, 798, 802, 803, 805, 807, 808, 808, 810, 810, 810, 813, 815, 815, 815, 817, 818, 818, 819, 819, 820, 820, 821, 823, 823, 825, 827, 827, 828, 830, 830, 833, 834, 836, 836, 837, 838, 838, 839, 844, 844, 845, 846, 846, 846, 847, 847, 847, 848, 849, 852, 853, 855, 856, 857, 857, 858, 859, 861, 861, 862, 863, 864, 867, 867, 869, 870, 870, 871, 871, 872, 872, 873, 873, 873, 873, 874, 874, 878, 878, 879, 879, 880, 883, 884, 885, 885, 885, 886, 886, 887, 889, 890, 891, 892, 892, 892, 893, 894, 894, 894, 894, 895, 896, 897, 898, 899, 899, 899, 901, 901, 901, 902, 903, 904, 908, 912, 912, 913, 913, 913, 917, 917, 918, 919, 919, 920, 920, 921, 921, 921, 922, 923, 927, 930, 930, 931, 932, 932, 932, 932, 934, 935, 935, 937, 937, 937, 938, 939, 939, 940, 940, 941, 944, 945, 945, 947, 947, 948, 949, 949, 950, 950, 952, 953, 955, 957, 957, 959, 960, 960, 960, 965, 966, 966, 968, 968, 969, 970, 972, 974, 975, 977, 978, 980, 982, 982, 982, 982, 983, 984, 984, 986, 986, 989, 989, 991, 993, 993, 993, 994, 994, 996, 999]"
# p heapsort([421, 743, 273, 630, 31, 186, 424, 978, 732, 140, 154, 601, 585, 337, 175, 502, 421, 805, 390, 660, 789, 539, 861, 101, 768, 723, 871, 810, 941, 923, 291, 308, 398, 775, 85, 61, 516, 526, 248, 419, 629, 239, 937, 448, 417, 616, 815, 827, 6, 138, 912, 982, 320, 691, 378, 767, 167, 913, 581, 276, 932, 250, 934, 846, 496, 123, 672, 892, 197, 653, 565, 9, 217, 115, 220, 656, 769, 664, 179, 844, 872, 895, 503, 478, 278, 505, 902, 357, 339, 636, 781, 438, 215, 502, 718, 617, 837, 542, 57, 158, 472, 651, 223, 927, 575, 17, 356, 728, 836, 698, 613, 389, 989, 361, 260, 712, 4, 552, 267, 40, 725, 423, 689, 0, 899, 124, 529, 921, 803, 952, 154, 520, 350, 913, 563, 753, 644, 572, 994, 89, 441, 930, 398, 96, 869, 608, 311, 918, 61, 789, 506, 136, 60, 214, 607, 535, 480, 44, 550, 506, 908, 505, 349, 162, 984, 112, 151, 777, 409, 661, 968, 794, 874, 356, 790, 514, 57, 196, 8, 516, 384, 159, 210, 40, 189, 864, 435, 818, 316, 81, 935, 313, 919, 901, 325, 937, 446, 425, 756, 546, 336, 550, 433, 485, 986, 788, 315, 472, 886, 105, 379, 889, 687, 441, 136, 403, 120, 897, 431, 409, 337, 612, 722, 465, 231, 953, 131, 760, 753, 5, 586, 668, 55, 272, 254, 598, 529, 141, 317, 694, 467, 939, 830, 398, 114, 346, 60, 553, 337, 511, 226, 487, 11, 477, 4, 501, 483, 410, 516, 257, 151, 709, 763, 863, 293, 255, 643, 825, 743, 972, 746, 661, 939, 358, 94, 657, 144, 867, 887, 177, 358, 833, 84, 932, 563, 144, 350, 871, 438, 21, 497, 659, 641, 66, 62, 266, 63, 200, 47, 818, 202, 263, 203, 725, 966, 778, 429, 50, 742, 879, 5, 245, 548, 423, 420, 659, 439, 118, 470, 673, 100, 852, 188, 945, 755, 506, 886, 975, 94, 217, 285, 147, 903, 458, 240, 476, 485, 308, 73, 502, 765, 984, 892, 188, 174, 32, 555, 197, 21, 605, 139, 642, 86, 855, 874, 243, 586, 830, 503, 859, 519, 196, 938, 514, 606, 751, 894, 355, 701, 947, 940, 501, 613, 611, 974, 321, 716, 602, 736, 529, 594, 420, 360, 390, 250, 685, 335, 469, 67, 935, 523, 605, 808, 446, 982, 201, 424, 618, 491, 517, 334, 22, 572, 368, 134, 370, 728, 528, 428, 524, 394, 170, 562, 148, 788, 894, 556, 765, 426, 228, 499, 788, 629, 19, 950, 569, 681, 788, 668, 608, 683, 947, 120, 883, 339, 779, 776, 640, 41, 180, 149, 144, 659, 501, 912, 560, 396, 238, 196, 607, 896, 957, 330, 648, 566, 583, 894, 590, 722, 103, 931, 376, 743, 823, 553, 845, 890, 530, 993, 429, 819, 316, 355, 515, 122, 351, 932, 266, 397, 598, 965, 379, 466, 321, 180, 542, 361, 252, 228, 342, 602, 437, 437, 970, 113, 131, 885, 381, 849, 564, 893, 463, 836, 70, 480, 403, 846, 834, 177, 635, 407, 486, 885, 718, 154, 857, 123, 986, 815, 506, 116, 88, 269, 996, 625, 366, 193, 530, 372, 562, 774, 239, 147, 542, 848, 347, 464, 542, 633, 428, 682, 950, 873, 235, 70, 802, 853, 873, 215, 960, 227, 656, 481, 410, 4, 613, 994, 257, 389, 463, 771, 753, 346, 847, 140, 135, 945, 748, 572, 139, 532, 308, 429, 820, 731, 741, 857, 668, 150, 589, 271, 134, 379, 390, 441, 330, 566, 702, 189, 85, 402, 525, 90, 551, 828, 387, 372, 226, 160, 750, 447, 630, 605, 932, 67, 844, 336, 452, 172, 774, 407, 536, 891, 335, 768, 579, 993, 695, 573, 472, 350, 333, 778, 77, 579, 982, 762, 584, 117, 420, 323, 131, 424, 682, 937, 873, 870, 520, 621, 606, 154, 821, 83, 201, 744, 280, 86, 327, 949, 808, 144, 379, 694, 54, 697, 107, 983, 940, 919, 159, 320, 286, 169, 647, 86, 450, 901, 898, 960, 405, 525, 720, 27, 820, 310, 921, 93, 540, 949, 273, 117, 303, 784, 838, 361, 663, 20, 347, 36, 880, 498, 351, 755, 957, 693, 959, 76, 82, 671, 308, 769, 529, 654, 334, 222, 407, 719, 30, 573, 771, 885, 144, 740, 279, 523, 179, 504, 969, 580, 638, 209, 762, 579, 688, 425, 977, 761, 807, 157, 472, 982, 515, 754, 54, 206, 991, 748, 413, 514, 253, 220, 184, 558, 554, 177, 679, 307, 856, 629, 465, 730, 540, 706, 242, 823, 5, 219, 404, 960, 443, 518, 268, 144, 878, 368, 186, 135, 486, 817, 679, 798, 353, 748, 267, 256, 57, 839, 917, 626, 904, 186, 861, 134, 202, 713, 114, 419, 716, 810, 155, 707, 302, 339, 123, 305, 786, 269, 337, 575, 349, 714, 126, 147, 26, 82, 766, 617, 452, 375, 763, 414, 647, 410, 872, 810, 471, 894, 3, 287, 335, 815, 605, 609, 930, 595, 204, 966, 989, 791, 532, 505, 587, 917, 70, 438, 46, 129, 899, 615, 328, 102, 469, 178, 659, 412, 252, 427, 261, 137, 309, 527, 247, 194, 437, 64, 163, 120, 944, 737, 184, 658, 77, 669, 672, 474, 791, 920, 662, 813, 838, 787, 873, 696, 149, 388, 968, 519, 82, 847, 163, 553, 397, 120, 723, 901, 740, 120, 551, 913, 47, 358, 846, 948, 464, 746, 781, 621, 349, 544, 241, 349, 425, 719, 920, 122, 411, 115, 514, 867, 308, 921, 311, 723, 38, 879, 201, 795, 356, 581, 38, 699, 744, 955, 309, 313, 535, 767, 286, 656, 652, 532, 166, 775, 153, 774, 252, 819, 237, 922, 862, 238, 521, 529, 498, 191, 107, 647, 796, 785, 482, 366, 884, 742, 298, 558, 105, 441, 892, 786, 490, 60, 776, 211, 980, 725, 384, 74, 154, 136, 110, 993, 154, 155, 999, 878, 538, 218, 520, 746, 77, 240, 516, 110, 847, 899, 758, 858, 541, 773, 561, 798, 621, 870, 526, 78, 781, 463, 827, 735, 213])

describe heapsort([3, 9, 1, 4, 7]) do
  context "when given an unsorted array" do
    it "should sort the array" do
      expect(heapsort([3, 9, 1, 4, 7])).to eq([1, 3, 4, 7, 9])
    end
  end
end

describe heapsort([9, 5, 2, 3, 7, 23, 5, 8, 111, -4, -20]) do
  context "when given an unsorted array" do
    it "should sort the array" do
      expect(heapsort([9, 5, 2, 3, 7, 23, 5, 8, 111, -4, -20])).to eq([-20, -4, 2, 3, 5, 5, 7, 8, 9, 23, 111])
    end
  end
end

describe heapsort([421, 743, 273, 630, 31, 186, 424, 978, 732, 140, 154, 601, 585, 337, 175, 502, 421, 805, 390, 660, 789, 539, 861, 101, 768, 723, 871, 810, 941, 923, 291, 308, 398, 775, 85, 61, 516, 526, 248, 419, 629, 239, 937, 448, 417, 616, 815, 827, 6, 138, 912, 982, 320, 691, 378, 767, 167, 913, 581, 276, 932, 250, 934, 846, 496, 123, 672, 892, 197, 653, 565, 9, 217, 115, 220, 656, 769, 664, 179, 844, 872, 895, 503, 478, 278, 505, 902, 357, 339, 636, 781, 438, 215, 502, 718, 617, 837, 542, 57, 158, 472, 651, 223, 927, 575, 17, 356, 728, 836, 698, 613, 389, 989, 361, 260, 712, 4, 552, 267, 40, 725, 423, 689, 0, 899, 124, 529, 921, 803, 952, 154, 520, 350, 913, 563, 753, 644, 572, 994, 89, 441, 930, 398, 96, 869, 608, 311, 918, 61, 789, 506, 136, 60, 214, 607, 535, 480, 44, 550, 506, 908, 505, 349, 162, 984, 112, 151, 777, 409, 661, 968, 794, 874, 356, 790, 514, 57, 196, 8, 516, 384, 159, 210, 40, 189, 864, 435, 818, 316, 81, 935, 313, 919, 901, 325, 937, 446, 425, 756, 546, 336, 550, 433, 485, 986, 788, 315, 472, 886, 105, 379, 889, 687, 441, 136, 403, 120, 897, 431, 409, 337, 612, 722, 465, 231, 953, 131, 760, 753, 5, 586, 668, 55, 272, 254, 598, 529, 141, 317, 694, 467, 939, 830, 398, 114, 346, 60, 553, 337, 511, 226, 487, 11, 477, 4, 501, 483, 410, 516, 257, 151, 709, 763, 863, 293, 255, 643, 825, 743, 972, 746, 661, 939, 358, 94, 657, 144, 867, 887, 177, 358, 833, 84, 932, 563, 144, 350, 871, 438, 21, 497, 659, 641, 66, 62, 266, 63, 200, 47, 818, 202, 263, 203, 725, 966, 778, 429, 50, 742, 879, 5, 245, 548, 423, 420, 659, 439, 118, 470, 673, 100, 852, 188, 945, 755, 506, 886, 975, 94, 217, 285, 147, 903, 458, 240, 476, 485, 308, 73, 502, 765, 984, 892, 188, 174, 32, 555, 197, 21, 605, 139, 642, 86, 855, 874, 243, 586, 830, 503, 859, 519, 196, 938, 514, 606, 751, 894, 355, 701, 947, 940, 501, 613, 611, 974, 321, 716, 602, 736, 529, 594, 420, 360, 390, 250, 685, 335, 469, 67, 935, 523, 605, 808, 446, 982, 201, 424, 618, 491, 517, 334, 22, 572, 368, 134, 370, 728, 528, 428, 524, 394, 170, 562, 148, 788, 894, 556, 765, 426, 228, 499, 788, 629, 19, 950, 569, 681, 788, 668, 608, 683, 947, 120, 883, 339, 779, 776, 640, 41, 180, 149, 144, 659, 501, 912, 560, 396, 238, 196, 607, 896, 957, 330, 648, 566, 583, 894, 590, 722, 103, 931, 376, 743, 823, 553, 845, 890, 530, 993, 429, 819, 316, 355, 515, 122, 351, 932, 266, 397, 598, 965, 379, 466, 321, 180, 542, 361, 252, 228, 342, 602, 437, 437, 970, 113, 131, 885, 381, 849, 564, 893, 463, 836, 70, 480, 403, 846, 834, 177, 635, 407, 486, 885, 718, 154, 857, 123, 986, 815, 506, 116, 88, 269, 996, 625, 366, 193, 530, 372, 562, 774, 239, 147, 542, 848, 347, 464, 542, 633, 428, 682, 950, 873, 235, 70, 802, 853, 873, 215, 960, 227, 656, 481, 410, 4, 613, 994, 257, 389, 463, 771, 753, 346, 847, 140, 135, 945, 748, 572, 139, 532, 308, 429, 820, 731, 741, 857, 668, 150, 589, 271, 134, 379, 390, 441, 330, 566, 702, 189, 85, 402, 525, 90, 551, 828, 387, 372, 226, 160, 750, 447, 630, 605, 932, 67, 844, 336, 452, 172, 774, 407, 536, 891, 335, 768, 579, 993, 695, 573, 472, 350, 333, 778, 77, 579, 982, 762, 584, 117, 420, 323, 131, 424, 682, 937, 873, 870, 520, 621, 606, 154, 821, 83, 201, 744, 280, 86, 327, 949, 808, 144, 379, 694, 54, 697, 107, 983, 940, 919, 159, 320, 286, 169, 647, 86, 450, 901, 898, 960, 405, 525, 720, 27, 820, 310, 921, 93, 540, 949, 273, 117, 303, 784, 838, 361, 663, 20, 347, 36, 880, 498, 351, 755, 957, 693, 959, 76, 82, 671, 308, 769, 529, 654, 334, 222, 407, 719, 30, 573, 771, 885, 144, 740, 279, 523, 179, 504, 969, 580, 638, 209, 762, 579, 688, 425, 977, 761, 807, 157, 472, 982, 515, 754, 54, 206, 991, 748, 413, 514, 253, 220, 184, 558, 554, 177, 679, 307, 856, 629, 465, 730, 540, 706, 242, 823, 5, 219, 404, 960, 443, 518, 268, 144, 878, 368, 186, 135, 486, 817, 679, 798, 353, 748, 267, 256, 57, 839, 917, 626, 904, 186, 861, 134, 202, 713, 114, 419, 716, 810, 155, 707, 302, 339, 123, 305, 786, 269, 337, 575, 349, 714, 126, 147, 26, 82, 766, 617, 452, 375, 763, 414, 647, 410, 872, 810, 471, 894, 3, 287, 335, 815, 605, 609, 930, 595, 204, 966, 989, 791, 532, 505, 587, 917, 70, 438, 46, 129, 899, 615, 328, 102, 469, 178, 659, 412, 252, 427, 261, 137, 309, 527, 247, 194, 437, 64, 163, 120, 944, 737, 184, 658, 77, 669, 672, 474, 791, 920, 662, 813, 838, 787, 873, 696, 149, 388, 968, 519, 82, 847, 163, 553, 397, 120, 723, 901, 740, 120, 551, 913, 47, 358, 846, 948, 464, 746, 781, 621, 349, 544, 241, 349, 425, 719, 920, 122, 411, 115, 514, 867, 308, 921, 311, 723, 38, 879, 201, 795, 356, 581, 38, 699, 744, 955, 309, 313, 535, 767, 286, 656, 652, 532, 166, 775, 153, 774, 252, 819, 237, 922, 862, 238, 521, 529, 498, 191, 107, 647, 796, 785, 482, 366, 884, 742, 298, 558, 105, 441, 892, 786, 490, 60, 776, 211, 980, 725, 384, 74, 154, 136, 110, 993, 154, 155, 999, 878, 538, 218, 520, 746, 77, 240, 516, 110, 847, 899, 758, 858, 541, 773, 561, 798, 621, 870, 526, 78, 781, 463, 827, 735, 213]) do
  context "when given an unsorted array" do
    it "should sort the array" do
      expect(heapsort([421, 743, 273, 630, 31, 186, 424, 978, 732, 140, 154, 601, 585, 337, 175, 502, 421, 805, 390, 660, 789, 539, 861, 101, 768, 723, 871, 810, 941, 923, 291, 308, 398, 775, 85, 61, 516, 526, 248, 419, 629, 239, 937, 448, 417, 616, 815, 827, 6, 138, 912, 982, 320, 691, 378, 767, 167, 913, 581, 276, 932, 250, 934, 846, 496, 123, 672, 892, 197, 653, 565, 9, 217, 115, 220, 656, 769, 664, 179, 844, 872, 895, 503, 478, 278, 505, 902, 357, 339, 636, 781, 438, 215, 502, 718, 617, 837, 542, 57, 158, 472, 651, 223, 927, 575, 17, 356, 728, 836, 698, 613, 389, 989, 361, 260, 712, 4, 552, 267, 40, 725, 423, 689, 0, 899, 124, 529, 921, 803, 952, 154, 520, 350, 913, 563, 753, 644, 572, 994, 89, 441, 930, 398, 96, 869, 608, 311, 918, 61, 789, 506, 136, 60, 214, 607, 535, 480, 44, 550, 506, 908, 505, 349, 162, 984, 112, 151, 777, 409, 661, 968, 794, 874, 356, 790, 514, 57, 196, 8, 516, 384, 159, 210, 40, 189, 864, 435, 818, 316, 81, 935, 313, 919, 901, 325, 937, 446, 425, 756, 546, 336, 550, 433, 485, 986, 788, 315, 472, 886, 105, 379, 889, 687, 441, 136, 403, 120, 897, 431, 409, 337, 612, 722, 465, 231, 953, 131, 760, 753, 5, 586, 668, 55, 272, 254, 598, 529, 141, 317, 694, 467, 939, 830, 398, 114, 346, 60, 553, 337, 511, 226, 487, 11, 477, 4, 501, 483, 410, 516, 257, 151, 709, 763, 863, 293, 255, 643, 825, 743, 972, 746, 661, 939, 358, 94, 657, 144, 867, 887, 177, 358, 833, 84, 932, 563, 144, 350, 871, 438, 21, 497, 659, 641, 66, 62, 266, 63, 200, 47, 818, 202, 263, 203, 725, 966, 778, 429, 50, 742, 879, 5, 245, 548, 423, 420, 659, 439, 118, 470, 673, 100, 852, 188, 945, 755, 506, 886, 975, 94, 217, 285, 147, 903, 458, 240, 476, 485, 308, 73, 502, 765, 984, 892, 188, 174, 32, 555, 197, 21, 605, 139, 642, 86, 855, 874, 243, 586, 830, 503, 859, 519, 196, 938, 514, 606, 751, 894, 355, 701, 947, 940, 501, 613, 611, 974, 321, 716, 602, 736, 529, 594, 420, 360, 390, 250, 685, 335, 469, 67, 935, 523, 605, 808, 446, 982, 201, 424, 618, 491, 517, 334, 22, 572, 368, 134, 370, 728, 528, 428, 524, 394, 170, 562, 148, 788, 894, 556, 765, 426, 228, 499, 788, 629, 19, 950, 569, 681, 788, 668, 608, 683, 947, 120, 883, 339, 779, 776, 640, 41, 180, 149, 144, 659, 501, 912, 560, 396, 238, 196, 607, 896, 957, 330, 648, 566, 583, 894, 590, 722, 103, 931, 376, 743, 823, 553, 845, 890, 530, 993, 429, 819, 316, 355, 515, 122, 351, 932, 266, 397, 598, 965, 379, 466, 321, 180, 542, 361, 252, 228, 342, 602, 437, 437, 970, 113, 131, 885, 381, 849, 564, 893, 463, 836, 70, 480, 403, 846, 834, 177, 635, 407, 486, 885, 718, 154, 857, 123, 986, 815, 506, 116, 88, 269, 996, 625, 366, 193, 530, 372, 562, 774, 239, 147, 542, 848, 347, 464, 542, 633, 428, 682, 950, 873, 235, 70, 802, 853, 873, 215, 960, 227, 656, 481, 410, 4, 613, 994, 257, 389, 463, 771, 753, 346, 847, 140, 135, 945, 748, 572, 139, 532, 308, 429, 820, 731, 741, 857, 668, 150, 589, 271, 134, 379, 390, 441, 330, 566, 702, 189, 85, 402, 525, 90, 551, 828, 387, 372, 226, 160, 750, 447, 630, 605, 932, 67, 844, 336, 452, 172, 774, 407, 536, 891, 335, 768, 579, 993, 695, 573, 472, 350, 333, 778, 77, 579, 982, 762, 584, 117, 420, 323, 131, 424, 682, 937, 873, 870, 520, 621, 606, 154, 821, 83, 201, 744, 280, 86, 327, 949, 808, 144, 379, 694, 54, 697, 107, 983, 940, 919, 159, 320, 286, 169, 647, 86, 450, 901, 898, 960, 405, 525, 720, 27, 820, 310, 921, 93, 540, 949, 273, 117, 303, 784, 838, 361, 663, 20, 347, 36, 880, 498, 351, 755, 957, 693, 959, 76, 82, 671, 308, 769, 529, 654, 334, 222, 407, 719, 30, 573, 771, 885, 144, 740, 279, 523, 179, 504, 969, 580, 638, 209, 762, 579, 688, 425, 977, 761, 807, 157, 472, 982, 515, 754, 54, 206, 991, 748, 413, 514, 253, 220, 184, 558, 554, 177, 679, 307, 856, 629, 465, 730, 540, 706, 242, 823, 5, 219, 404, 960, 443, 518, 268, 144, 878, 368, 186, 135, 486, 817, 679, 798, 353, 748, 267, 256, 57, 839, 917, 626, 904, 186, 861, 134, 202, 713, 114, 419, 716, 810, 155, 707, 302, 339, 123, 305, 786, 269, 337, 575, 349, 714, 126, 147, 26, 82, 766, 617, 452, 375, 763, 414, 647, 410, 872, 810, 471, 894, 3, 287, 335, 815, 605, 609, 930, 595, 204, 966, 989, 791, 532, 505, 587, 917, 70, 438, 46, 129, 899, 615, 328, 102, 469, 178, 659, 412, 252, 427, 261, 137, 309, 527, 247, 194, 437, 64, 163, 120, 944, 737, 184, 658, 77, 669, 672, 474, 791, 920, 662, 813, 838, 787, 873, 696, 149, 388, 968, 519, 82, 847, 163, 553, 397, 120, 723, 901, 740, 120, 551, 913, 47, 358, 846, 948, 464, 746, 781, 621, 349, 544, 241, 349, 425, 719, 920, 122, 411, 115, 514, 867, 308, 921, 311, 723, 38, 879, 201, 795, 356, 581, 38, 699, 744, 955, 309, 313, 535, 767, 286, 656, 652, 532, 166, 775, 153, 774, 252, 819, 237, 922, 862, 238, 521, 529, 498, 191, 107, 647, 796, 785, 482, 366, 884, 742, 298, 558, 105, 441, 892, 786, 490, 60, 776, 211, 980, 725, 384, 74, 154, 136, 110, 993, 154, 155, 999, 878, 538, 218, 520, 746, 77, 240, 516, 110, 847, 899, 758, 858, 541, 773, 561, 798, 621, 870, 526, 78, 781, 463, 827, 735, 213])).to eq([0, 3, 4, 4, 4, 5, 5, 5, 6, 8, 9, 11, 17, 19, 20, 21, 21, 22, 26, 27, 30, 31, 32, 36, 38, 38, 40, 40, 41, 44, 46, 47, 47, 50, 54, 54, 55, 57, 57, 57, 60, 60, 60, 61, 61, 62, 63, 64, 66, 67, 67, 70, 70, 70, 73, 74, 76, 77, 77, 77, 78, 81, 82, 82, 82, 83, 84, 85, 85, 86, 86, 86, 88, 89, 90, 93, 94, 94, 96, 100, 101, 102, 103, 105, 105, 107, 107, 110, 110, 112, 113, 114, 114, 115, 115, 116, 117, 117, 118, 120, 120, 120, 120, 120, 122, 122, 123, 123, 123, 124, 126, 129, 131, 131, 131, 134, 134, 134, 135, 135, 136, 136, 136, 137, 138, 139, 139, 140, 140, 141, 144, 144, 144, 144, 144, 144, 147, 147, 147, 148, 149, 149, 150, 151, 151, 153, 154, 154, 154, 154, 154, 154, 155, 155, 157, 158, 159, 159, 160, 162, 163, 163, 166, 167, 169, 170, 172, 174, 175, 177, 177, 177, 178, 179, 179, 180, 180, 184, 184, 186, 186, 186, 188, 188, 189, 189, 191, 193, 194, 196, 196, 196, 197, 197, 200, 201, 201, 201, 202, 202, 203, 204, 206, 209, 210, 211, 213, 214, 215, 215, 217, 217, 218, 219, 220, 220, 222, 223, 226, 226, 227, 228, 228, 231, 235, 237, 238, 238, 239, 239, 240, 240, 241, 242, 243, 245, 247, 248, 250, 250, 252, 252, 252, 253, 254, 255, 256, 257, 257, 260, 261, 263, 266, 266, 267, 267, 268, 269, 269, 271, 272, 273, 273, 276, 278, 279, 280, 285, 286, 286, 287, 291, 293, 298, 302, 303, 305, 307, 308, 308, 308, 308, 308, 309, 309, 310, 311, 311, 313, 313, 315, 316, 316, 317, 320, 320, 321, 321, 323, 325, 327, 328, 330, 330, 333, 334, 334, 335, 335, 335, 336, 336, 337, 337, 337, 337, 339, 339, 339, 342, 346, 346, 347, 347, 349, 349, 349, 349, 350, 350, 350, 351, 351, 353, 355, 355, 356, 356, 356, 357, 358, 358, 358, 360, 361, 361, 361, 366, 366, 368, 368, 370, 372, 372, 375, 376, 378, 379, 379, 379, 379, 381, 384, 384, 387, 388, 389, 389, 390, 390, 390, 394, 396, 397, 397, 398, 398, 398, 402, 403, 403, 404, 405, 407, 407, 407, 409, 409, 410, 410, 410, 411, 412, 413, 414, 417, 419, 419, 420, 420, 420, 421, 421, 423, 423, 424, 424, 424, 425, 425, 425, 426, 427, 428, 428, 429, 429, 429, 431, 433, 435, 437, 437, 437, 438, 438, 438, 439, 441, 441, 441, 441, 443, 446, 446, 447, 448, 450, 452, 452, 458, 463, 463, 463, 464, 464, 465, 465, 466, 467, 469, 469, 470, 471, 472, 472, 472, 472, 474, 476, 477, 478, 480, 480, 481, 482, 483, 485, 485, 486, 486, 487, 490, 491, 496, 497, 498, 498, 499, 501, 501, 501, 502, 502, 502, 503, 503, 504, 505, 505, 505, 506, 506, 506, 506, 511, 514, 514, 514, 514, 515, 515, 516, 516, 516, 516, 517, 518, 519, 519, 520, 520, 520, 521, 523, 523, 524, 525, 525, 526, 526, 527, 528, 529, 529, 529, 529, 529, 530, 530, 532, 532, 532, 535, 535, 536, 538, 539, 540, 540, 541, 542, 542, 542, 542, 544, 546, 548, 550, 550, 551, 551, 552, 553, 553, 553, 554, 555, 556, 558, 558, 560, 561, 562, 562, 563, 563, 564, 565, 566, 566, 569, 572, 572, 572, 573, 573, 575, 575, 579, 579, 579, 580, 581, 581, 583, 584, 585, 586, 586, 587, 589, 590, 594, 595, 598, 598, 601, 602, 602, 605, 605, 605, 605, 606, 606, 607, 607, 608, 608, 609, 611, 612, 613, 613, 613, 615, 616, 617, 617, 618, 621, 621, 621, 625, 626, 629, 629, 629, 630, 630, 633, 635, 636, 638, 640, 641, 642, 643, 644, 647, 647, 647, 648, 651, 652, 653, 654, 656, 656, 656, 657, 658, 659, 659, 659, 659, 660, 661, 661, 662, 663, 664, 668, 668, 668, 669, 671, 672, 672, 673, 679, 679, 681, 682, 682, 683, 685, 687, 688, 689, 691, 693, 694, 694, 695, 696, 697, 698, 699, 701, 702, 706, 707, 709, 712, 713, 714, 716, 716, 718, 718, 719, 719, 720, 722, 722, 723, 723, 723, 725, 725, 725, 728, 728, 730, 731, 732, 735, 736, 737, 740, 740, 741, 742, 742, 743, 743, 743, 744, 744, 746, 746, 746, 748, 748, 748, 750, 751, 753, 753, 753, 754, 755, 755, 756, 758, 760, 761, 762, 762, 763, 763, 765, 765, 766, 767, 767, 768, 768, 769, 769, 771, 771, 773, 774, 774, 774, 775, 775, 776, 776, 777, 778, 778, 779, 781, 781, 781, 784, 785, 786, 786, 787, 788, 788, 788, 788, 789, 789, 790, 791, 791, 794, 795, 796, 798, 798, 802, 803, 805, 807, 808, 808, 810, 810, 810, 813, 815, 815, 815, 817, 818, 818, 819, 819, 820, 820, 821, 823, 823, 825, 827, 827, 828, 830, 830, 833, 834, 836, 836, 837, 838, 838, 839, 844, 844, 845, 846, 846, 846, 847, 847, 847, 848, 849, 852, 853, 855, 856, 857, 857, 858, 859, 861, 861, 862, 863, 864, 867, 867, 869, 870, 870, 871, 871, 872, 872, 873, 873, 873, 873, 874, 874, 878, 878, 879, 879, 880, 883, 884, 885, 885, 885, 886, 886, 887, 889, 890, 891, 892, 892, 892, 893, 894, 894, 894, 894, 895, 896, 897, 898, 899, 899, 899, 901, 901, 901, 902, 903, 904, 908, 912, 912, 913, 913, 913, 917, 917, 918, 919, 919, 920, 920, 921, 921, 921, 922, 923, 927, 930, 930, 931, 932, 932, 932, 932, 934, 935, 935, 937, 937, 937, 938, 939, 939, 940, 940, 941, 944, 945, 945, 947, 947, 948, 949, 949, 950, 950, 952, 953, 955, 957, 957, 959, 960, 960, 960, 965, 966, 966, 968, 968, 969, 970, 972, 974, 975, 977, 978, 980, 982, 982, 982, 982, 983, 984, 984, 986, 986, 989, 989, 991, 993, 993, 993, 994, 994, 996, 999])
    end
  end
end
