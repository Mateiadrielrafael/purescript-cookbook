module ShapesHalogenHooks.Main where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Halogen as H
import Halogen.Aff as HA
import Halogen.Hooks as Hooks
import Halogen.HTML as HH
import Halogen.VDom.Driver (runUI)
import Halogen.Svg.Elements (svg, circle, line, path, rect, text)
import Halogen.Svg.Attributes (cx, cy, d, dominant_baseline, fill, height, r,
  stroke, strokeWidth, text_anchor, transform, viewBox, width, x, x1, x2, y, y1,
  y2, D(Abs), Command(M, L), Color(RGB), TextAnchor(AnchorMiddle),
  Baseline(Central), Transform(Rotate))
{- We import a lot of functions from Halogen.Svg.Attributes which makes the SVG
   code below cleaner. You may prefer to import with
      `import Halogen.Svg.Attributes as SA`
   and then prefix all calls with `SA.`
-}

main :: Effect Unit
main =
  HA.runHalogenAff do
    body <- HA.awaitBody
    void $ runUI hookComponent Nothing body

hookComponent ::
  forall unusedQuery unusedInput unusedOutput anyMonad.
  H.Component HH.HTML unusedQuery unusedInput unusedOutput anyMonad
hookComponent =
  Hooks.component \_ _ ->
    Hooks.pure
      $ svg
          [ viewBox 0.0 0.0 400.0 400.0
          , width 400.0
          , height 400.0
          ]
          [ circle
              [ cx 50.0
              , cy 50.0
              , r 40.0
              , fill $ Just $ RGB 255 0 0
              , stroke $ Just $ RGB 0 0 0
              ]
          , rect
              [ x 100.0
              , y 10.0
              , width 40.0
              , height 40.0
              , fill $ Just $ RGB 0 120 0
              , stroke $ Just $ RGB 0 0 0
              ]
          , line
              [ x1 20.0
              , y1 200.0
              , x2 200.0
              , y2 20.0
              , stroke $ Just $ RGB 0 0 255
              , strokeWidth 10.0
              ]
          , path
              [ d
                  [ Abs (M 200.0 40.0)
                  , Abs (L 240.0 40.0)
                  , Abs (L 240.0 80.0)
                  , Abs (L 280.0 80.0)
                  , Abs (L 280.0 120.0)
                  , Abs (L 320.0 120.0)
                  , Abs (L 320.0 160.0)
                  ]
              , fill Nothing
              , stroke $ Just $ RGB 255 0 0
              ]
          , text
              [ x 130.0
              , y 130.0
              , fill $ Just $ RGB 0 0 0
              , text_anchor AnchorMiddle
              , dominant_baseline Central
              , transform $ [ Rotate (-45.0) 130.0 130.0 ]
              ]
              [ HH.text "Welcome to Shapes Club"
              ]
          ]
