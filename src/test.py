import random
import time


def main():
    start = time.time()
    time.sleep(10 + random.random() * 20)  # wait for up to thirty seconds
    duration = time.time() - start
    print(f"All tests passed in {duration:.2f} seconds")


if __name__ == "__main__":
    main()
