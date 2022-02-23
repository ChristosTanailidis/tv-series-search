<template>
  <div class="main">
    <div>
      <form class='form searchbox' @focus="redirect()">
        <div class="containerForSearch">
          <span>
            <input
              type='text'
              v-model="searchText"
              placeholder="Search for series..."
              @focus="redirect()"
              @mouseenter="redirect()"
            >
          </span>
        </div>
      </form>
      <div v-if="show">
        <show_detailed :show="show" />
      </div>
      <div v-else>
        Could not retrieve the show ...
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useRoute } from 'vue-router'
import Show from '~~/interfaces/Show'
import show_detailed from '~~/components/show-detailed.vue'

const route = useRoute()

const show = ref<Show>()

const searchText = ref('')

const redirect = () => {
  useRouter().go(-2)
}

onMounted(() => {
  fetch(`/api/idsearch?search=${route.params.id}`)
  .then(response => {
    response.json().then(data => {
      show.value = data
    })
  })
  .catch(e => console.log('err',  e))
})

</script>

<style scoped>
.main {
  display: flex;
  justify-content: center;
  height: 95.4vh;
  background-color: rgb(61, 61, 65);
}
.nuxt-link-active {
  background-color: red;
}
.containerForSearch {
  display: flex;
  justify-content: center;
  width: 100%
}
</style>
