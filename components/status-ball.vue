<template>
  <div
    class="statusBall"
    :style="`${
      status.toLocaleLowerCase() === 'ended' ?
        'background-color: red' :
        status.toLocaleLowerCase() === 'running' ?
          'background-color: green' :
          'background-color: white'
    }`"

  />
</template>

<script setup lang="ts">

const props = defineProps({
  status: {
    type: String,
    required: true
  }
})

</script>

<style scoped>
.statusBall {
  height: 10px;
  width: 10px;
  border-radius: 50%;
}
</style>