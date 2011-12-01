package main
import(	"fmt")
func fff( a int ) int {	return a + 2 }
func main() {
	var t float64 = 0
	for i :=0; i < 100000000; i++ {
		t += float64(fff(i))
	}
	fmt.Printf( "total:%f\n", t )
}