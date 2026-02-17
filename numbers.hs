import System.Random

type Key = Int
type Idx = Int

seed = 123
gen = mkStdGen seed

rows :: [[Key]]
rows = [[7,8,9],
        [4,5,6],
        [1,2,3]]

rowsBusy :: [[Key]]
rowsBusy = [[7,8,9],
            [1,2,3]]

cols :: [[Key]]
cols = [[7,4,1],
        [8,5,2],
        [9,6,3]]

colsBusy :: [[Key]]
colsBusy = [[7,1],
            [8,2],
            [9,3]]

------------------
-- ヘルパー関数

-- リストをn個ずつに分割する
chop :: Int -> [a] -> [[a]]
chop _ [] = []
chop n xs = take n xs : chop n (drop n xs)

-- リストのm個目からn個目までを取り出す。
range :: Int -> Int -> [a] -> [a]
range m n xs = drop (m-1) (take n xs)

-- 引数の順序が逆のmod
mod' :: Int -> Int -> Int
mod' n x = x `mod` n

-- 0 から n-1 のランダム値。無限リスト。
rndmIdx :: Int -> [Int]
rndmIdx n = map (mod' n) (randomRs (0,99) gen)

otherlines :: Key -> [[Key]] -> [[Key]]
otherlines k lines = filter (\l -> not (elem k l)) lines

-- 2つのリストの中から交互に一つランダムに選ぶ。無限リスト。
interleave :: [Key] -> [Key] -> [Key]
interleave xs ys = interleave' (xs,ixs) (ys,iys)
                   where
                     ixs = rndmIdx (length xs)
                     iys = rndmIdx (length ys)

interleave' :: ([Key],[Idx]) -> ([Key],[Idx]) -> [Key]
interleave' (xs,(ix:ixs)) (ys,iys) = xs !! ix : interleave' (ys,iys) (xs,ixs)

-- テンキーの縦や横の列を変えながら数字を出すための関数
crossline :: [[Key]] -> [Key]
crossline lines = crossline' 1 lines idxs
                  where
                    n = length (concat (tail lines)) -- 現在のキーがあるラインを除いた合計
                    idxs = rndmIdx n

crossline' :: Key -> [[Key]] -> [Idx] -> [Key]
crossline' _ _  []     = []
crossline' k ls (i:is) = k : crossline' next ls is
                         where
                           keys = concat (otherlines k ls)
                           next = keys !! i

-------------------------------------
-- 数値のリスト(無限リスト）

-- 全てのキーからランダムに
allkeys :: [Key]
allkeys = randomRs (0,9) gen

-- 縦の列を変えながらランダムに。1の次には4や7はこない。
crossCols :: [Key]
crossCols = crossline cols

-- 横の列を変えながらランダムに。1の次には2や3はこない。
crossRows :: [Key]
crossRows = crossline rows

-- 8と9の練習用
exercise89 = interleave [8,9] [0,1,2,3,4,5,6,7]

-- 2桁
pairs :: [Int]
pairs = randomRs (10,99) gen

-- 3桁
trios :: [Int]
trios = randomRs (100,999) gen
