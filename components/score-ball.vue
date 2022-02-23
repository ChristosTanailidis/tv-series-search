<template>
  <div v-if="rating"
    class="score"
    :style="`background-color: ${
    rating <= 2.5 ?
      'rgba(255,0,0,0.5)' :
      rating <= 5 && rating > 2.5?
        'rgba(0,0,0,0.5)' :
        rating <= 7.5 && rating > 5 ?
        'rgba(255, 140, 0, 0.5)' :
        'rgba(0, 255, 0, 0.5)'
    }`"
    >
    {{rating}}
  </div>
</template>

<script setup lang="ts">

const props = defineProps({
  rating: {
    type: Number,
    required: true
  }
})

</script>

<style scoped>
.score {
  height: 70px;
  width: 70px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: x-large;
  font-weight: bold;
  color: white;
  backdrop-filter: blur(5px);
}
</style>