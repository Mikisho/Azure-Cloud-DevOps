from locust import HttpUser, TaskSet, task

class AppService(TaskSet):
    @task
    def get_home_page(self):
        self.client.get("/")
    
    @task
    def post_prediction(self):
        self.client.post("/predict")

class AppLocust(HttpUser):
    task_set = AppService

    min_wait = 5000
    max_wait = 9000
