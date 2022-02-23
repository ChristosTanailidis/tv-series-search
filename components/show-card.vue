<template>
  <div
    class="showCard"
  >
    <div class="name"> {{show.name}} </div>

    <div v-if="show.image" class="imageWraper">
      <img class="image" :src="show.image.medium"/>
    </div>
    <div v-else class="imageWraper">
      <img class="image" src="https://i.pinimg.com/originals/b1/a8/79/b1a8794ac23c58931c4b38cf1cf2255f.png"/>
    </div>
    <div class="status row" :style="`${
      show.status.toLocaleLowerCase() === 'ended' ?
        'background: rgb(216,103,103); background: linear-gradient(0deg, rgba(216,103,103,0.6194852941176471) 0%, rgba(255,0,0,0) 100%);' :
        show.status.toLocaleLowerCase() === 'running' ?
          'background: rgb(103,216,114); background: linear-gradient(0deg, rgba(103,216,114,0.6194852941176471) 0%, rgba(255,0,0,0) 100%);' :
          'background: rgb(0,0,0); background: linear-gradient(0deg, rgba(0,0,0,0.6194852941176471) 0%, rgba(255,0,0,0) 100%);; color: white'
    }`">
      <StatusBall :status="show.status"/>
      {{show.status}}
    </div>
    <div v-if="show.rating.average"
      class="score"
    >
      <ScoreBall :rating="show.rating.average"/>
    </div>
  </div>
</template>

<script setup lang="ts">
import { PropType } from 'vue';
import Show from '../interfaces/Show'
import ScoreBall from './score-ball.vue';

const props = defineProps({
  show: {
    type: Object as PropType<Show>,
    required: true
  }
})

</script>

<style scoped>
.showCard{
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 25px;
  background-color:rgba(0, 0, 0, 0.4);
  padding: 10px;
  max-height: 400px;
  width: 210px;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-items: center;
  align-items: center;
  padding-bottom: 30px;
}
.statusBall {
  height: 10px;
  width: 10px;
  border-radius: 50%;
  margin: 0px 5px 4px 0px;
}
.row {
  display: flex;
  justify-content: flex-start;
  height: 100%;
}
.name{
  text-align: center;
  background-color: #dedede;
  border-radius: 25px;
  padding: 5px 0px 5px;
  margin-bottom: 10px;
  font-weight: bold;
  font-size: large;
  width: 210px;
}
.image{
  z-index: 5;
  position: relative;
  border-radius: 25px;
  max-height: 295px;
  width: 210px;
}
.imageWraper {
  height: 295px;
  width: 210px;
}

.score {
  position: absolute;
  bottom: 5px;
  right: 5px;
  z-index: 10;
}
.status {
  border-radius: 25px;
  padding-left: 5px;
  padding-bottom: 5px;
  height: 80%;
  width: 98%;
  position: absolute;
  bottom: 0px;
  right: 0px;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  text-align: center;
  font-weight: bold;
  color: white;
  z-index: 1;
}
</style>