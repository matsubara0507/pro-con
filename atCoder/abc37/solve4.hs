import qualified Data.Map.Lazy as Map

type Memo = Map.Map (Int, Int) Integer

main :: IO ()
main = do
  ([h, w] : as) <- fmap (fmap read . words) . lines <$> getContents
  let as' = zip [(i,j)| i <- [1..h], j <- [1..w]] (concat as)
  print (solve w h (Map.fromDistinctAscList as') `mod` 1000000007)

solve :: Int -> Int -> Map.Map (Int, Int) Int -> Integer
solve w h as = snd $ Map.foldlWithKey loop (Map.empty, 0) as
  where
    loop :: (Memo, Integer) -> (Int, Int) -> Int -> (Memo, Integer)
    loop (memo, s) k@(y,x) v = maybe (Map.insert k v' memo', s + v')
      (\u -> (memo, s+u)) (Map.lookup k memo)
      where
        arounds = [(y-1,x), (y+1,x), (y,x-1),(y,x+1)]
        (memo', v') = foldl (\m (ij, u) -> loop m ij u) (memo,1)
                    $ filter check $ fmap (\ij -> (ij, as Map.! ij)) arounds
        check ((i,j),u) = and [0 < i, i <= h, 0 < j, j <= w, v < u]
