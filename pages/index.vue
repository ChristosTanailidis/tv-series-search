<template>
  <div class="main">
    <form class='form searchbox' @submit.prevent='searchForStuff()'>
      <div class="containerForSearch">
        <span>
          <input
            type='text'
            v-model="searchText"
            placeholder="Search for series..."
          />
        </span>
      </div>
    </form>
    <div class="seriesGrid">
      <div
        v-if="myData.length !== 0 && searchText !== '' && !loading"
        class='containerForSeries'
      >
        <div
          v-for='show in myData'
          :key='show.show.id'
        >
          <NuxtLink class="link" :to="`/item-${show.show.id}`">
            <movie_card :show="show.show"/>
          </NuxtLink>
        </div>
      </div>
      <div
        v-else-if="loading"
        class="noResult"
      >
        loading...
      </div>
      <div
        v-else
        class='noResult'
      >
        {{searchText === '' && myData.length === 0 ? '' : 'No result'}}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, onMounted } from 'vue'
import { debounce } from 'ts-debounce'
import movie_card from '~~/components/show-card.vue'
import Show from '~~/interfaces/Show'

const searchText = ref('')
const myData = ref<{show: Show}[]>([])
const loading = ref(false)

watch(searchText, () => {
  if(searchText.value === ''){
    console.log('ime here')
    myData.value = []
    return
  }
  loading.value = true
  searchForStuff()
})

const saveTheSeachText = () => {
  localStorage.setItem('searchText', searchText.value)
}

onMounted(() => {
  const temp = localStorage.getItem('searchText')?.toString()
  searchText.value = temp ? temp : ''
})

const searchForStuff = debounce(() => {
  loading.value = true
  fetch(`/api/search?search=${searchText.value}`)
    .then((response) => {
      loading.value = false
      saveTheSeachText()

      response.json().then(data => {
        myData.value = data
      })
    })
  }, 1000)

</script>

<style >
* {
  font-family: Arial, Helvetica, sans-serif;
}

.main{
  height: 95.4vh;
  background-color: rgb(61, 61, 65)
}

.seriesGrid {
  display: flex;
  justify-content: center;
}

body{
  margin: 0px;
}

.containerForSearch {
  display: flex;
  justify-content: center;
  width: 100%
}

.containerForSearch > span {
  background-color: #c5c5c5;
  margin: 10px;
  padding: 15px;
  text-align: center;
  border-radius: 25px;
}

input[type=text] {
  border: none;
  border-bottom: 2px solid black;
  background-color: #c5c5c5;
  outline: none;
}

.noResult{
  text-align: center;
  color: red;
}

.containerForSeries {
  display: inline-grid;
  grid-template-columns: 20% 20% 20% 20% 20%;
  grid-template-rows: auto auto auto;
  width: 75vw;
  padding: 10px;
}

.containerForSeries > div {
  margin: 10px;
  max-width: 210px;
}

.link{
  text-decoration: none;
  color: black;
}
</style>
