export default interface Show {
  id: number
  url: string
  name: string
  language: string
  genres: [string]
  status: string
  rating: { average: number }
  image: {
    medium: string
    original: string
  }
}