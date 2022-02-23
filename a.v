<template>

</template>

<script setup lang="ts">
import { ref } from 'vue'
const count = ref(0)
const searchText = ref('')
const myData = ref([]) as any

const searchForStuff = async() => {
  const data = await fetch(`/api/hello?search=${searchText.value}`)
  const json await data.json()
  console.log('json', json)
  myData.value = json
}
</script>

<script lang="ts">
// export default {
//   layout: "default"
// }
</script>
