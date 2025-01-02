# tests/test_app.py
import unittest
from app import app


class FlaskAppTests(unittest.TestCase):

    def setUp(self):
        """Set up test client before each test."""
        self.app = app.test_client()
        self.app.testing = True

    def test_healthcheck(self):
        """Test the healthcheck endpoint."""
        response = self.app.get('/healthcheck')
        self.assertEqual(response.status_code, 200)
        json_data = response.get_json()
        self.assertEqual(json_data['description'], "Francisco Armijos pre-interview technical test.")
        self.assertEqual(json_data['version'], "1.0")
        self.assertIsInstance(json_data['last_commit_sha'], str)  # it's a string


if __name__ == '__main__':
    unittest.main()
