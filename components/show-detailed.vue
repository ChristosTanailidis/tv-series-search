<template>
  <div
    class="showDetailed"
    :style="`background-image: url('${show.image ? show.image.original : ''}')`"
  >
    <div class="blurGlass"/>
      <div class="mainContent">
        <div class="row">
          <div v-if="show.image" class="imageWrapper">
            <img class="image" :src="show.image.original"/>
          </div>
          <div v-else class="imageWrapper">
            <img class="image" src="https://i.pinimg.com/originals/b1/a8/79/b1a8794ac23c58931c4b38cf1cf2255f.png"/>
          </div>
          <div class="infoWrapper">
            <div class="name infoItem">
              {{show.name}}
            </div>
            <div v-if="show.genres.length > 0" class="row seperatorBot">
              <div v-for="genre in show.genres" :key="genre" class="genreChip">
                {{ genre }}
              </div>
            </div>
            <div class="row infoItem">
              Language: {{show.language}}
            </div>
            <div class="row infoItem">
              Status:
              <div class="row statusBall">
                <StatusBall :status="show.status"/>
              </div>
              {{show.status}}
            </div>
          </div>
        </div>
        <div v-if="show.rating.average"
          class="score"
        >
          <ScoreBall :rating="show.rating.average"/>
        </div>
      </div>
  </div>
</template>

<script setup lang="ts">
import { PropType } from 'vue';
import Show from '../interfaces/Show'


const props = defineProps({
  show: {
    type: Object as PropType<Show>,
    required: true
  }
})

</script>

<style scoped>
* {
  color: white
}
.infoItem {
  border-radius: 25px;
  background-color:rgba(0, 0, 0, 0.7);
  text-align: center;
  width: 100%;
  padding: 5px;
  margin-bottom: 5px;
}
.statusBall {
  margin-left: 2px;
  margin-right: 2px;
}
.genreChip {
  border-radius: 25px;
  background-color:rgba(0, 0, 0, 0.3);
  text-align: center;
  font-size: medium;
  font-style: italic;
  white-space: nowrap;
  height: 20px;
  padding-left: 10px;
  padding-right: 10px;
  width: 100%;
  margin: 0px 2px 0px 2px;
}
.name {
  font-weight: bold;
  font-size: xx-large;
  width: 100%;
  white-space: nowrap;
}
.blurGlass {
  height: 100%;
  width: 100%;
  z-index: 1;
  top: 0px;
  left: 0px;
  background-color: rgba(255, 255, 255, 0.288);
  backdrop-filter: blur(5px);
  border-radius: 25px;
  position: absolute;
}
.mainContent {
  z-index: 5;
  position: relative;
}
.showDetailed {
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;

  transform: translateY(200px) scale(1.7);

  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 25px;
  background-color:rgba(0, 0, 0, 0.7);
  position: relative;
}
.imageWrapper {
  margin: 10px;
}
.infoWrapper {
  margin: 10px;
  flex-direction: column;
  display: flex;
  align-items: center;
}
.score {
  position: absolute;
  bottom: 5px;
  right: 5px;
  z-index: 10;
}
.row {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  position: relative;
  height: 100%;
}
.image{
  position: relative;
  border-radius: 25px;
  max-height: 295px;
  width: 210px;
}
.seperatorBot{
  margin-bottom: 30px;
}
</style>