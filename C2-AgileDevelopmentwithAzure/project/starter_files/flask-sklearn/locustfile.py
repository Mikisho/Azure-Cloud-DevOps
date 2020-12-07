from locust import HttpLocust, task

class AppService(HttpLocust):
    @task
    def get_home_page(self):
        self.client.get("/")
    
    @task
    def post_predict(self):
        self.client.post("/predict")
