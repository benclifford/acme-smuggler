import Acme.Smuggler
import Data.Typeable (Typeable)
import Data.Void (Void)
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "prj . inj via ()" $ do
    it "conveys an integer" $ (prj . injUnit) (7 :: Integer) `shouldBe` Just (7 :: Integer)
    it "gives Nothing when going from an integer to a string" $
      (prj . injUnit) (7 :: Integer) `shouldBe` (Nothing :: Maybe String)

  describe "prj" $ do
    it "gives Nothing when projecting from a real ()" $
      (prj ()) `shouldBe` (Nothing :: Maybe Integer)


  describe "prj . inj via Void" $ do
    it "conveys an integer" $ (prj . injVoid) (7 :: Integer) `shouldBe` Just (7 :: Integer)
    it "gives Nothing when going from an integer to a string" $
      (prj . injVoid) (7 :: Integer) `shouldBe` (Nothing :: Maybe String)

injUnit :: Typeable t => t -> ()
injUnit = inj

injVoid :: Typeable t => t -> Void
injVoid = inj
