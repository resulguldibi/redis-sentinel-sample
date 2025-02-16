package main

import (
	"context"
	"fmt"
	"time"

	"github.com/redis/go-redis/v9"
)

func main() {
	ctx := context.Background()

	rdb := redis.NewFailoverClient(&redis.FailoverOptions{
		MasterName: "mymaster",
		SentinelAddrs: []string{
			"host.docker.internal:26379",
		},
	})

	_, err := rdb.Set(ctx, "key", "value", time.Duration(time.Minute*5)).Result()
	if err != nil {
		panic(err)
	}

	val, err := rdb.Get(ctx, "key").Result()
	if err != nil {
		panic(err)
	}
	fmt.Println("key : ", val)
}
