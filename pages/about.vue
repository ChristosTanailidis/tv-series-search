<template>
  about
</template>

<script setup lang="ts">
import { ref } from 'vue'
const searchText = ref('')
const myData = ref([]) as any

const searchForStuff = async() => {
  const data = await fetch(`/api/search?search=${searchText.value}`)
  const json = await data.json()

  myData.value = json
}
</script>

<style >

</style>