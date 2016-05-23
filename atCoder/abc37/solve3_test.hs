import Data.List (tails)

main :: IO ()
main = getContents >>= print . solve . fmap (fmap read . words) . lines

solve :: [[Integer]] -> Integer
solve [[n, k], a] = sum . concat
  . take (fromIntegral $ n - k + 1) $ take (fromIntegral k) <$> tails a
