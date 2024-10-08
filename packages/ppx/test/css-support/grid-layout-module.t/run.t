This test ensures the ppx generates the correct output against styled-ppx.native
If this test fail means that the module is not in sync with the ppx

  $ cat > dune-project << EOF
  > (lang dune 3.10)
  > EOF

  $ cat > dune << EOF
  > (executable
  >  (name input)
  >  (libraries styled-ppx.native)
  >  (preprocess (pps styled-ppx)))
  > EOF

  $ dune build

  $ dune describe pp ./input.re | sed '1,/^];$/d'
  
  CSS.display(`grid);
  CSS.display(`inlineGrid);
  CSS.gridTemplateColumns(`none);
  CSS.gridTemplateColumns(`value([|`auto|]));
  CSS.gridTemplateColumns(`value([|`pxFloat(100.)|]));
  CSS.gridTemplateColumns(`value([|`fr(1.)|]));
  CSS.gridTemplateColumns(`value([|`pxFloat(100.), `fr(1.), `auto|]));
  CSS.gridTemplateColumns(
    `value([|`repeat((`num(2), [|`pxFloat(100.), `fr(1.)|]))|]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `repeat((
        `num(4),
        [|
          `pxFloat(10.),
          `lineNames({js|[col-start]|js}),
          `pxFloat(250.),
          `lineNames({js|[col-end]|js}),
        |],
      )),
      `pxFloat(10.),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `pxFloat(100.),
      `fr(1.),
      `maxContent,
      `minmax((`minContent, `fr(1.))),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|`repeat((`autoFill, [|`minmax((`ch(25.), `fr(1.)))|]))|]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `lineNames({js|[col-end]|js}),
      `pxFloat(10.),
      `lineNames({js|[col-start]|js}),
      `pxFloat(250.),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `lineNames({js|[last]|js}),
      `lineNames({js|[first nav-start]|js}),
      `pxFloat(150.),
      `lineNames({js|[main-start]|js}),
      `fr(1.),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `pxFloat(10.),
      `lineNames({js|[col-start]|js}),
      `pxFloat(250.),
      `lineNames({js|[col-end]|js}),
      `pxFloat(10.),
      `lineNames({js|[col-start]|js}),
      `pxFloat(250.),
      `lineNames({js|[col-end]|js}),
      `pxFloat(10.),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `lineNames({js|[a]|js}),
      `auto,
      `lineNames({js|[b]|js}),
      `minmax((`minContent, `fr(1.))),
      `lineNames({js|[b c d]|js}),
      `repeat((`num(2), [|`lineNames({js|[e]|js}), `pxFloat(40.)|])),
      `repeat((`num(5), [|`auto|])),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `pxFloat(200.),
      `repeat((`autoFill, [|`pxFloat(100.)|])),
      `pxFloat(300.),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `minmax((`pxFloat(100.), `maxContent)),
      `repeat((`autoFill, [|`pxFloat(200.)|])),
      `percent(20.),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `lineNames({js|[linename1]|js}),
      `pxFloat(100.),
      `lineNames({js|[linename2]|js}),
      `repeat((
        `autoFit,
        [|`lineNames({js|[linename3 linename4]|js}), `pxFloat(300.)|],
      )),
      `pxFloat(100.),
    |]),
  );
  
  CSS.gridTemplateColumns(
    `value([|
      `lineNames({js|[linename1 linename2]|js}),
      `pxFloat(100.),
      `repeat((
        `autoFit,
        [|`lineNames({js|[linename1]|js}), `pxFloat(300.)|],
      )),
      `lineNames({js|[linename3]|js}),
    |]),
  );
  let value =
    `value([|
      `repeat((
        `num(4),
        [|
          `pxFloat(10.),
          `lineNames({js|[col-start]|js}),
          `pxFloat(250.),
          `lineNames({js|[col-end]|js}),
        |],
      )),
      `pxFloat(10.),
    |]);
  (CSS.gridTemplateColumns(value): CSS.rule);
  CSS.gridTemplateRows(`none);
  CSS.gridTemplateRows(`value([|`auto|]));
  CSS.gridTemplateRows(`value([|`pxFloat(100.)|]));
  CSS.gridTemplateRows(`value([|`fr(1.)|]));
  CSS.gridTemplateRows(`value([|`pxFloat(100.), `fr(1.), `auto|]));
  CSS.gridTemplateRows(
    `value([|`repeat((`num(2), [|`pxFloat(100.), `fr(1.)|]))|]),
  );
  CSS.gridTemplateRows(
    `value([|
      `pxFloat(100.),
      `fr(1.),
      `maxContent,
      `minmax((`minContent, `fr(1.))),
    |]),
  );
  CSS.gridTemplateRows(
    `value([|
      `lineNames({js|[row-end]|js}),
      `pxFloat(10.),
      `lineNames({js|[row-start]|js}),
      `pxFloat(250.),
    |]),
  );
  CSS.gridTemplateRows(
    `value([|
      `lineNames({js|[last]|js}),
      `lineNames({js|[first header-start]|js}),
      `pxFloat(50.),
      `lineNames({js|[main-start]|js}),
      `fr(1.),
      `lineNames({js|[footer-start]|js}),
      `pxFloat(50.),
    |]),
  );
  CSS.unsafe({js|gridTemplateAreas|js}, {js|none|js});
  CSS.unsafe({js|gridTemplateAreas|js}, {js|'articles'|js});
  CSS.unsafe({js|gridTemplateAreas|js}, {js|'head head'|js});
  CSS.unsafe(
    {js|gridTemplateAreas|js},
    {js|'head head' 'nav main' 'foot ....'|js},
  );
  CSS.unsafe({js|gridTemplate|js}, {js|none|js});
  CSS.unsafe({js|gridTemplate|js}, {js|auto 1fr auto / auto 1fr|js});
  CSS.unsafe(
    {js|gridTemplate|js},
    {js|[header-top] 'a   a   a' [header-bottom] [main-top] 'b   b   b' 1fr [main-bottom] / auto 1fr auto|js},
  );
  CSS.unsafe({js|gridAutoColumns|js}, {js|auto|js});
  CSS.unsafe({js|gridAutoColumns|js}, {js|1fr|js});
  CSS.unsafe({js|gridAutoColumns|js}, {js|100px|js});
  CSS.unsafe({js|gridAutoColumns|js}, {js|max-content|js});
  CSS.unsafe({js|gridAutoColumns|js}, {js|minmax(min-content, 1fr)|js});
  CSS.unsafe({js|gridAutoColumns|js}, {js|min-content max-content auto|js});
  CSS.unsafe({js|gridAutoColumns|js}, {js|100px 150px 390px|js});
  CSS.unsafe(
    {js|gridAutoColumns|js},
    {js|100px minmax(100px, auto) 10% 0.5fr fit-content(400px)|js},
  );
  CSS.unsafe({js|gridAutoRows|js}, {js|auto|js});
  CSS.unsafe({js|gridAutoRows|js}, {js|1fr|js});
  CSS.unsafe({js|gridAutoRows|js}, {js|100px|js});
  CSS.unsafe({js|gridAutoRows|js}, {js|100px 30%|js});
  CSS.unsafe({js|gridAutoRows|js}, {js|100px 30% 1em|js});
  CSS.unsafe({js|gridAutoRows|js}, {js|min-content|js});
  CSS.unsafe({js|gridAutoRows|js}, {js|minmax(min-content, 1fr)|js});
  CSS.unsafe({js|gridAutoRows|js}, {js|min-content max-content auto|js});
  CSS.unsafe(
    {js|gridAutoRows|js},
    {js|100px minmax(100px, auto) 10% 0.5fr fit-content(400px)|js},
  );
  CSS.unsafe({js|gridAutoFlow|js}, {js|row|js});
  CSS.unsafe({js|gridAutoFlow|js}, {js|column|js});
  CSS.unsafe({js|gridAutoFlow|js}, {js|row dense|js});
  CSS.unsafe({js|gridAutoFlow|js}, {js|column dense|js});
  
  CSS.unsafe({js|gridRowStart|js}, {js|auto|js});
  CSS.unsafe({js|gridRowStart|js}, {js|4|js});
  CSS.unsafe({js|gridRowStart|js}, {js|C|js});
  CSS.unsafe({js|gridRowStart|js}, {js|C 2|js});
  
  CSS.unsafe({js|gridColumnStart|js}, {js|auto|js});
  CSS.unsafe({js|gridColumnStart|js}, {js|4|js});
  CSS.unsafe({js|gridColumnStart|js}, {js|C|js});
  CSS.unsafe({js|gridColumnStart|js}, {js|C 2|js});
  
  CSS.unsafe({js|gridRowEnd|js}, {js|auto|js});
  CSS.unsafe({js|gridRowEnd|js}, {js|4|js});
  CSS.unsafe({js|gridRowEnd|js}, {js|C|js});
  CSS.unsafe({js|gridRowEnd|js}, {js|C 2|js});
  
  CSS.unsafe({js|gridColumnEnd|js}, {js|auto|js});
  CSS.unsafe({js|gridColumnEnd|js}, {js|4|js});
  CSS.unsafe({js|gridColumnEnd|js}, {js|C|js});
  CSS.unsafe({js|gridColumnEnd|js}, {js|C 2|js});
  
  CSS.unsafe({js|gridColumn|js}, {js|auto|js});
  CSS.unsafe({js|gridColumn|js}, {js|1|js});
  CSS.unsafe({js|gridColumn|js}, {js|-1|js});
  
  CSS.unsafe({js|gridRow|js}, {js|auto|js});
  CSS.unsafe({js|gridRow|js}, {js|1|js});
  CSS.unsafe({js|gridRow|js}, {js|-1|js});
  
  CSS.gridColumnGap(`zero);
  CSS.gridColumnGap(`em(1.));
  CSS.gridRowGap(`zero);
  CSS.gridRowGap(`em(1.));
  CSS.unsafe({js|gridGap|js}, {js|0 0|js});
  CSS.unsafe({js|gridGap|js}, {js|0 1em|js});
  CSS.gridGap(`em(1.));
  CSS.unsafe({js|gridGap|js}, {js|1em 1em|js});
  
  CSS.gridTemplateColumns(`value([|`subgrid|]));
  CSS.gridTemplateColumns(`value([|`subgrid, `lineNames({js|[sub-a]|js})|]));
  CSS.gridTemplateColumns(
    `value([|
      `subgrid,
      `lineNames({js|[sub-a]|js}),
      `lineNames({js|[sub-b]|js}),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `subgrid,
      `repeat((`num(1), [|`lineNames({js|[sub-a]|js})|])),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `subgrid,
      `repeat((
        `num(2),
        [|`lineNames({js|[sub-a]|js}), `lineNames({js|[sub-b]|js})|],
      )),
      `lineNames({js|[sub-c]|js}),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `subgrid,
      `repeat((
        `autoFill,
        [|`lineNames({js|[sub-a]|js}), `lineNames({js|[sub-b]|js})|],
      )),
    |]),
  );
  CSS.gridTemplateColumns(
    `value([|
      `subgrid,
      `lineNames({js|[sub-a]|js}),
      `repeat((
        `autoFill,
        [|
          `lineNames({js|[sub-b]|js}),
          `lineNames({js|[sub-c]|js}),
          `lineNames({js|[sub-d]|js}),
        |],
      )),
      `lineNames({js|[sub-e]|js}),
      `repeat((`num(1), [|`lineNames({js|[sub-g]|js})|])),
    |]),
  );
  CSS.gridTemplateRows(`value([|`subgrid|]));
  CSS.gridTemplateRows(`value([|`subgrid, `lineNames({js|[sub-a]|js})|]));
  CSS.gridTemplateRows(
    `value([|
      `subgrid,
      `lineNames({js|[sub-a]|js}),
      `lineNames({js|[sub-b]|js}),
    |]),
  );
  CSS.gridTemplateRows(
    `value([|
      `subgrid,
      `repeat((`num(1), [|`lineNames({js|[sub-a]|js})|])),
    |]),
  );
  CSS.gridTemplateRows(
    `value([|
      `subgrid,
      `repeat((
        `num(2),
        [|`lineNames({js|[sub-a]|js}), `lineNames({js|[sub-b]|js})|],
      )),
      `lineNames({js|[sub-c]|js}),
    |]),
  );
  CSS.gridTemplateRows(
    `value([|
      `subgrid,
      `repeat((
        `autoFill,
        [|`lineNames({js|[sub-a]|js}), `lineNames({js|[sub-b]|js})|],
      )),
    |]),
  );
  CSS.gridTemplateRows(
    `value([|
      `subgrid,
      `lineNames({js|[sub-a]|js}),
      `repeat((
        `autoFill,
        [|
          `lineNames({js|[sub-b]|js}),
          `lineNames({js|[sub-c]|js}),
          `lineNames({js|[sub-d]|js}),
        |],
      )),
      `lineNames({js|[sub-e]|js}),
      `repeat((`num(1), [|`lineNames({js|[sub-g]|js})|])),
    |]),
  );
