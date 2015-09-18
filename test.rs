fn main() {
  let mut s = 0i64;
  println!("START!");
  for i in 0..100000 {
    s += (1..1001).map(|q| q+10+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+11+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+12+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+13+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+14+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+15+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+16+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+17+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+18+i).collect::<Vec<i64>>()[9];
    s += (1..1001).map(|q| q+19+i).collect::<Vec<i64>>()[9];

    //s += (1..1000).map(|q| q+10+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+11+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+12+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+13+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+14+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+15+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+16+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+17+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+18+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
    //s += (1..1000).map(|q| q+19+i).nth(9).unwrap();//.collect::<Vec<i64>>()[9];
  }
  println!("{}", s);
}
