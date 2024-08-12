
***ImagePaletteR***
**Make Your Own Palette Using an Image**
![full_Dunkirk](https://github.com/user-attachments/assets/f0d9c382-6531-439f-861e-b9b67b8b2119)

**Install**

dependencies:
library(scales)
library(imager)
library(data.table)
library(ggplot2)
library(magick)

you might need to install quartsx11 as well

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
![full_Joker1](https://github.com/user-attachments/assets/42105f9e-505b-4d87-bc07-46b097416e86)

MadMax 
![full_mad_max](https://github.com/user-attachments/assets/feadbc86-99d9-43c0-bd58-25e01e5c9d22)

Atonement
![full_atonement](https://github.com/user-attachments/assets/133bc569-1c5e-4f25-9ff2-b5d7813ae151)

BigFish
![full_big_fish](https://github.com/user-attachments/assets/daa595f6-715d-4443-963f-edb37a80fbce)

EternalSunshine1
![full_eternal_sunshine1](https://github.com/user-attachments/assets/c1ba2817-3b53-4e34-8992-75424b90ae8e)

Her
![full_her](https://github.com/user-attachments/assets/9f0310c4-a660-41fc-af1a-3bfcf1962264)

Joker3
![full_joker3](https://github.com/user-attachments/assets/6ade7006-cc7e-4b65-9c03-890048036f7f)

lalaland
![full_lalaland](https://github.com/user-attachments/assets/7e09d59e-6dde-44e5-b590-27da1602e7d4)
