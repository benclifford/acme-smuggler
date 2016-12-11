import Acme.Smuggler
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "prj . inj" $ do
    it "conveys an integer" $ (prj . inj) (7 :: Integer) `shouldBe` Just (7 :: Integer)
    it "gives Nothing when going from an integer to a string" $
      (prj . inj) (7 :: Integer) `shouldBe` (Nothing :: Maybe String)

  describe "prj" $ do
    it "gives Nothing when projecting from a real ()" $
      (prj ()) `shouldBe` (Nothing :: Maybe Integer)

