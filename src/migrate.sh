#!/bin/env bash
echo "# Summary" > SUMMARY.md
echo "" >> SUMMARY.md
for dir in `ls  .. -p |grep '/$' |grep -v src|grep -v styles| grep -v 'book/'`; do
  ls ../${dir}README.md 
  mkdir -p ${dir}
  cd ${dir}
  [[ -f '../../${dir}/README.md' ]] && ln -sf ../../${dir}README.md
  [[ -d '../../${dir}/figures' ]] && ln -sf ../../${dir}figures
  cd ..
  echo "- [${dir}](./${dir}README.md)" >> SUMMARY.md
done

