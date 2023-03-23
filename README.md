
***ImagePaletteR***
**Make Your Own Palette Using an Image**
![logo](/output_images/full_Dunkirk.jpg) 


**Install**

dependencies:
library(scales)
library(imager)
library(data.table)
library(ggplot2)
library(magick)

install_github("trevorjgoiuld/ImagePaletteR")


**Create your Own**
1) get a picture on your computer 
2) mycolors <-hex.image("image.jpg",NumberColorsNeeded) 
3) mycolors is the custom color list

The palettes themselves are created using kmeans clustering of pixels.
where the "NumberColorsNeeded" you request is the number of clusters. 

**Use These Palettes**
mycolors <- ImagePaletteR(BigFish)

All Credit for these photos goes to the fantastic:
 
https://www.facebook.com/cinemapalettes

and of course the movies themselves

Joker1
![image](/output_images/full_Joker1.jpg)

MadMax 
![image](/output_images/full_mad_max.jpeg)

Dunkirk 
![image](/output_images/full_Dunkirk.jpg)

Atonement
![image](/output_images/full_atonement.jpeg)

BigFish
![image](/output_images/full_big_fish.jpeg)

ColorOutofSpace
![image](/output_images/full_Color_Out_of_Space.jpg)

EternalSunshine1
![image](/output_images/full_eternal_sunshine1.jpeg)

Her
![image](/output_images/full_her.jpeg)

Joker3
![image](/output_images/full_joker3.jpeg)

lalaland
![image](/output_images/full_lalaland.jpeg)

MarieAntoinette
![image](/output_images/full_MarieAntoinette.jpeg)

Melancholia
![image](/output_images/full_melancholia.jpeg)

OnceUponaTimeinHollywood
![image](/output_images/full_Once_Upon_a_time_in_hollywood.jpeg)

PromisingYoungWomen
![image](/output_images/full_promising_young_women.jpeg)

RearWindow
![image](/output_images/full_Rear_Window.jpeg)

Suspiria
![image](/output_images/full_suspiria.jpeg)

Vertigo1
![image](/output_images/full_Vertigo1.jpg)

Vertigo2
![image](/output_images/full_vertigo2.jpg)

