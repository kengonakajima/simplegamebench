package main
import(
	"fmt";
	"rand";
)

func main() {
	var t float64 = 0
	for i :=0; i < 100000000; i++ {
		t += rand.Float64()
	}
	fmt.Printf( "total:%f\n", t )
}